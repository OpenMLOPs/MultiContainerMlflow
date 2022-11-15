# Objective - Dockerized MLFlow Tracking UI and Artifact storage with external Database

1. MLFlow UI to be hosted on container
2. Backend URI Database to be connected to localhost Database (PostgreSQL/MySQL)
3. Artifact URI to be connected to Artifact Store (Local/Containerized)

# Step 1: Create a 3 container application with mlflow tracking server, mysql and phpmyadmin containers

1. ISSUE: Initially we used adminer as a client for interacting with mysql but we were unable to connect mlflow tracking service with mysql using it.
2. ERROR - We were unable to login using the credentials provided while creating the container.
3. SOLUTION - Shifted to phpmyadmin as mysql client. Ref. 9.
4. TO DO: Understand why adminer image is not working with the credentials

# Step 2: Deploy mlflow tracking server application on openshift sandbox

# Step 3: Log models and details on deployed mlflowtracking server on docker-desktop/openshift sandbox using MlFlow projects pipeline running on my local system

# Step 4: Log models and details on deployed mlflowtracking server on docker-desktop/openshift sandbox using MlFlow projects pipeline running on dockerdesktop/openshift

# Step 5: Shift mysql to localhost and connect with it using phpmyadmin container

# Useful Links

1. https://stackoverflow.com/questions/24319662/from-inside-of-a-docker-container-how-do-i-connect-to-the-localhost-of-the-mach
2. https://stackoverflow.com/questions/57816617/not-able-to-dockerize-mlflow
3. https://github.com/artinmajdi/mlflow_workflow
4. https://github.com/aganse/docker_mlflow_db
5. https://github.com/clemens33/mlflow
6. https://towardsdatascience.com/deploy-mlflow-with-docker-compose-8059f16b6039
7. https://dev.mysql.com/doc/refman/8.0/en/docker-mysql-getting-started.html
8. https://github.com/mlflow/mlflow/issues/5450
9. https://stackoverflow.com/questions/53078135/php-network-getaddresses-getaddrinfo-failed-error-in-dockers-adminer
