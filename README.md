![Directus Logo](http://getdirectus.com/assets/imgs/directus.png)

Official Directus Container
====================

#### Learn more at [GetDirectus.com](http://getdirectus.com) and follow us on Twitter: [@directus](https://twitter.com/directus)
[![](https://images.microbadger.com/badges/image/getdirectus/directus.svg)](https://microbadger.com/images/getdirectus/directus "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/getdirectus/directus.svg)](https://microbadger.com/images/getdirectus/directus "Get your own version badge on microbadger.com")


## Available versions

* 6.3 (Lapis Lepus) [(directus/6.3/Dockerfile)](https://github.com/directus/directus-docker/blob/master/directus/6.3/Dockerfile)

## Quick Start
```bash
# Start mysql
docker run -e MYSQL_ROOT_PASSWORD=password -e MYSQL_DATABASE=directus -e MYSQL_USER=directus \
          -e MYSQL_PASSWORD=directus --name mysql -d mysql:5.5

# Start directus
docker run --link mysql:mysql -p 8080:80 --name directus -d getdirectus/directus:6.3
```

