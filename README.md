# ch12_ex2_userAdmin

This module packages the Murach User Admin servlet application for containerized deployments. The provided Docker workflow builds the WAR with Ant and ships it on top of Tomcat 9 so it can be deployed easily to Docker-compatible platforms such as Render.

## Environment variables

The application expects the following variables at runtime. Copy `.env.example` to `.env` (or export the variables manually) and fill in values appropriate for your database.

| Name          | Description                                                                 |
| ------------- | --------------------------------------------------------------------------- |
| `DB_URL`      | JDBC URL to your MySQL instance (e.g. `jdbc:mysql://HOST:3306/murach?...`). |
| `DB_USERNAME` | Database user with access to the schema.                                    |
| `DB_PASSWORD` | Password for `DB_USERNAME`.                                                 |

Tomcat resolves these variables inside `META-INF/context.xml` using `${env.VAR_NAME}` placeholders, so credentials never need to live in source control.

## Build and run locally

```batch
copy .env.example .env
# edit .env with your credentials

docker build -t user-admin .
docker run --env-file .env -p 8080:8080 user-admin
```

Once the container starts, the app is available at <http://localhost:8080/>.

## Deploying to Render

1. Commit `Dockerfile`, `.dockerignore`, `render.yaml`, and `.env.example` to your repository.
2. Push to a Git provider (GitHub/GitLab/Bitbucket) connected to Render.
3. In the Render dashboard, choose **New > Blueprint** and select the repo. Render will pick up `render.yaml` and create a Docker web service.
4. In the service settings, add environment variables `DB_URL`, `DB_USERNAME`, and `DB_PASSWORD`. Render stores them securely and injects them into the container during deploys.
5. Deploy. The service will build the Ant project inside the Docker image (via `docker-build.xml`, a NetBeans-independent Ant script) and publish the WAR to Tomcat automatically.

## Notes

- The Docker image uses Eclipse Temurin JDK 17 and Tomcat 9. Adjust versions if your stack requires something different.
- The default values baked into the container (`DB_USERNAME=root`, `DB_PASSWORD=change-me`) are placeholders only. Always override them through environment variables before exposing the service.
- If you need schema provisioning, reuse `create_user_table.sql` manually or through your infrastructure pipeline.
