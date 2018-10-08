## Run in docker
Build images:

```
docker build -f Dockerfile-base -t project/currency_exchange .
docker-compose build
```

Run containers:

```
docker-compose up
```

Create, migrate and seed the database:

```
docker exec -it currency_exchange_web_1 rake db:create db:migrate
```

## Run on localhost

Change environments to:

```
application.yml
REDIS_HOST: 'localhost'
DATABASE_HOST: 'localhost'
```
