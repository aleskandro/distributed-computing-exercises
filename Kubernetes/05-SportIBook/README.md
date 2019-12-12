# SportIBook

## Dev environment

```
    cd docker/
    docker-compose up --build
```

in /etc/hosts

```
    127.0.0.1 api.isportbook.localhost isportbook.localhost
```

### Services

    api.isportbook.localhost:8000 --> Django dev server
    isportbook.localhost:4200  --> Angular dev server
    api.isportbook.localhost:8080 --> Nginx proxy on django
    isportbook.localhost:8080 --> Nginx proxy on angular


## Staging

In /etc/hosts

```
127.0.0.1 api.staging.sportibook.localhost staging.sportibook.localhost

```

### Services

http://api.staging.sportibook.localhost:8080 --> Django Admin
http://staging.sportibook.localhost:8080 --> Frontend

## Production

See k8s/production/README.md

## Restore DB dump

```mysql -u root -h $(docker inspect isportbook-psd_db_1 | grep IPAddress | tail -1 | sed 's/.*"\([0-9]*\.[0-9]*\.[0-9]*\.[0-9]*\).*/\1/') isportbook_testing < mysql-dump/dump.sql```

Use other db names given the environment you're using.


### Credentials for django admin by the dump.sql in vcs

```
    root:toor
    TestIstruttore:toortoor
```

