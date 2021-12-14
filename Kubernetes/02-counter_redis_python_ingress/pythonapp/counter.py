from flask import Flask
import redis
from fix_nginx import ReverseProxied
from netifaces import interfaces, ifaddresses, AF_INET

app = Flask(__name__)
app.wsgi_app = ReverseProxied(app.wsgi_app)

redis = redis.Redis(host="pycounter-redis")

healthy = True

def get_addresses():
    strret = ""
    for ifaceName in interfaces():
        addresses = [i['addr'] for i in ifaddresses(ifaceName).setdefault(AF_INET, [{'addr':'No IP addr'}] )]
        strret += '%s: %s\n' % (ifaceName, ', '.join(addresses))
    return strret

@app.route("/ping")
def ping():
    if healthy:
        return "pong"
    else:
        return "not healthy", 500


@app.route("/break")
def set_not_healthy():
    global healthy
    healthy = False
    return f"{get_addresses()} This ms is now set to be not healthy"

@app.route("/")
def count():
    redis.incr('counter')
    strret = get_addresses()
    strret += "Count is %s" % redis.get('counter').decode("utf-8")
    return strret

if __name__ == "__main__":
    app.run(host="0.0.0.0")

