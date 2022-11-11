# Objective - Dockerized MLFlow Tracking UI and Artifact storage with external Database

MLFLOW UI (Container)------> Database (LocalHost)
||**\_\_\_**
|**\_\_\_\_**>>>>> Artifact Storage (Localhost/UI)

1. MLFlow UI to be hosted on container
2. Backend URI Database to be connected to localhost Database (PostgreSQL/MySQL)
3. Artifact URI to be connected to Artifact Store (Local/Containerized)

# Building Dockerized MLFlow UI

1. Created Dockerfile.mlflow and run the commented commands mentioned below the docker script to create dockerized mlflow image and container

# Steps for building MultiLayer Application

Step 1: docker compose up

# Useful Links

1. https://stackoverflow.com/questions/24319662/from-inside-of-a-docker-container-how-do-i-connect-to-the-localhost-of-the-mach
2. https://stackoverflow.com/questions/57816617/not-able-to-dockerize-mlflow
3. https://github.com/artinmajdi/mlflow_workflow
4. https://github.com/aganse/docker_mlflow_db
5. https://github.com/clemens33/mlflow
6. https://towardsdatascience.com/deploy-mlflow-with-docker-compose-8059f16b6039
