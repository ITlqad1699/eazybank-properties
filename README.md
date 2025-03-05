# A. Container action:
### 1. Allow permission
    ```bash
    chomod +x $FILENAME
    ```
### 2. Docker build images
    ```bash
    ./build-images
    ```
### 3. Docker compose:
    ```bash 
    # To create and start containers based on given docker compose file
    $ ./build-compose up default
    # To stop and remove containers
    $ ./build-compose down default
    # To start containers based on given docker compose file
    $ ./build-compose start default
    # To restart containers based on given docker compose file
    $ ./build-compose restart default
    # To stop the running containers
    $ ./build-compose stop default

    $ ./build-compose $COMMAND $PROFILE
    ```	
### 4. Delete unusage images: 
    ```bash
    $ docker images -q --filter "dangling=true" | xargs docker rmi
    ```
