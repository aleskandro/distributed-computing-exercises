from flask import Flask
import redis

app = Flask(__name__)
redis = redis.Redis(host="redis")

@app.route("/")
def count():
    redis.incr('counter')
    return "Count is %s" % redis.get('counter').decode("utf-8")

if __name__ == "__main__":
    app.run(host="0.0.0.0")

