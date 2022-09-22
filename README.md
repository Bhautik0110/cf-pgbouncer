
### PG Bouncer
PG bouncer manage the connection pool.

#### Installation

```shell
# Image Build
docker build -t cf-pgbouncer .
```

#### Authentication
PG Bouncer supports the three types of authentication.

##### Simple
- In the SASL authentication you need to specify the DATABASE_USERNAME, DATABASE_PASSWORD. It's use specified query string and connect to the postgresql.
- Cons: You can connect to pgbouncer with any username, and password (PGBouncer does not verify authentication).

#### Authentication file
- Postgresql use the authentication file to connect with postgresql, as well as authenticate with pgbouncer.
- You need to read the user, and password from `pg_shadow` table.
- Cons: If you supply change username/password frequently it will increase your work.

#### Quering the database
- In this method pgbouncer query the database for credential verification.
- To implement this method you first need to create the pgbouncer user with passport, and function that it will get postgresql user, password from `pg_shadow` table and verify.

### Host Based Authentication
- PG bouncer read the HBA and accept/reject the connection. It also provide extra security above methods.

#### Helpful resources
- https://www.pgbouncer.org/config.html
- https://blog.cloudflare.com/open-sourcing-our-fork-of-pgbouncer/
- https://www.cybertec-postgresql.com/en/pgbouncer-authentication-made-easy/
- https://github.com/cloudflare/cf-pgbouncer
- https://github.com/cloudflare/cf-pgbouncer
