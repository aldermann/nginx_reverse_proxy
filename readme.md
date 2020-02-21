# Korama Server

## Stuffs:

- SSL certificate issue script
- All in docker

## How to run?

### Issue SSL:

- Run [issue.sh](script/issue.sh)

### In development environment (Local)

*You need to start the other services first*

Run
```shell
docker-compose -f docker-compose.dev.yml up
```

What's just happened is, docker-compose connect this nginx container to an external network called
`rudias`. The other services (in other repos) are also config to connect to this network. Nginx will
start serving at port 80 and start reverse-proxying requests to / to a `frontend` container, and requests to /admin
and /api to `keystone` container. 

### In staging and production (Server)

*You also need to start the other services first*
Run 
```shel
docker-compose up
```

Same thing as above happened, except for the `frontend` container will be now merged into `keystone` to make an
`app` container.