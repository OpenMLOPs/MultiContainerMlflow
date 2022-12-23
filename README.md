# Objective - Dockerized MLFlow Tracking UI and Artifact storage with external Database

1. MLFlow UI to be hosted on container
2. Backend URI Database to be connected to localhost Database (PostgreSQL/MySQL)
3. Artifact URI to be connected to Artifact Store (Local/Containerized)

# Step 1: Create a 3 container application with mlflow tracking server, mysql and phpmyadmin containers

1. ISSUE1: Initially we used adminer as a client for interacting with mysql but we were unable to connect mlflow tracking service with mysql using it.
   a. ERROR - We were unable to login using the credentials provided while creating the container.
   b. SOLUTION - Shifted to phpmyadmin as mysql client. Ref. 9.
   c. TO DO: Understand why adminer image is not working with the credentials

# Step 2: Deploy mlflow tracking server application on openshift sandbox

1. ISSUE1: Converting docker-compose.yml to kubernetes yaml. (EXPLAINATION - docker-compose only works with docker-enginer and not with other kubernetes deployments)
   a. While trying to install podman found that specification of local desktop does not meet the requirement. It requires Hyper-V which local desktop does not have so we skipped.
   b. Kompose is one solution for installing it we need choco. Installation process (Ref 11)
   SUBISSUE -1: FATA version 0.1 of Docker Compose is not supported. Please use version 1, 2 or 3
   SOLUTION -1: Issue was due to version: "0.1" defined inside docker-compose. Changed it to "2.0"
   SUBISSUE -2: Service 'ui' has neither an image nor a build context specified. At least one must be provided.
   SOLUTION -2: Added context and assigned folder for mlflow dockerfile and renamed Dockerfile.mlflow as Dockerfile
   c. For converting into kubernetes compliant yaml's kompose convert -f ./docker-compose.yml -o ./deploy/ --provider=openshift
   kompose convert -f ./docker-compose.yml -o ./openshift/
   d. Deploy to Red hat Openshift
   SUBISSUE -1: Cannot create image from local image file
   SOLUTION -1: push image to dockerhub (Ref 12)

2. ISSUE 2 - Deployment to Redhat openshift
   SUBISSUE -1: Image has been created but cannot see url to connect to
   SOLUTION -1: Expose the route (Ref 14)
   SUBISSUE -2: Create persistant volume for artifact storage
   SOLUTION -2 Did it using UI (Ref 18)
   SUBISSUE -3 mlruns was not found
   SOLUTION -3 Added persistent volume to pod and created mount path to be referred by mlflow server

# Useful Links

1.  https://stackoverflow.com/questions/24319662/from-inside-of-a-docker-container-how-do-i-connect-to-the-localhost-of-the-mach
2.  https://stackoverflow.com/questions/57816617/not-able-to-dockerize-mlflow
3.  https://github.com/artinmajdi/mlflow_workflow
4.  https://github.com/aganse/docker_mlflow_db
5.  https://github.com/clemens33/mlflow
6.  https://towardsdatascience.com/deploy-mlflow-with-docker-compose-8059f16b6039
7.  https://dev.mysql.com/doc/refman/8.0/en/docker-mysql-getting-started.html
8.  https://github.com/mlflow/mlflow/issues/5450
9.  https://stackoverflow.com/questions/53078135/php-network-getaddresses-getaddrinfo-failed-error-in-dockers-adminer
10. https://www.redhat.com/sysadmin/compose-kubernetes-podman
11. https://stackoverflow.com/questions/47861537/choco-command-not-recognized-when-run-as-administrator-on-windows
12. https://hub.docker.com/repository/create?namespace=shivgupta121
13. https://github.com/AICoE/mlflow-tracking-operator/tree/master/examples
14. https://docs.openshift.com/container-platform/3.11/dev_guide/expose_service/expose_internal_ip_service.html
15. https://stackoverflow.com/questions/52331254/how-to-store-artifacts-on-a-server-running-mlflow
16. https://kubernetes.io/docs/tasks/configure-pod-container/configure-persistent-volume-storage/
17. https://www.kubeflow.org/docs/distributions/openshift/install-kubeflow/
18. https://www.howtogeek.com/devops/how-to-add-persistent-storage-to-kubernetes-pods/
19. https://docs.docker.com/storage/volumes/
