# Installation of the MV-Tool

The installation of the MV-Tool is done via Docker. You can use the `docker-compose.yml` file from this repository. First, install Docker on your system. Docker can be downloaded from the following link: [Docker](https://www.docker.com/products/docker-desktop)

## Starting the MV-Tool

Run the following command in the root directory of the repository:

- General: `docker compose up app -d`
- On Windows: `.\make.bat up`
- On Linux/Mac: `make up`

After starting the MV-Tool, you can access the application at the following address: [http://localhost:8000](http://localhost:8000)

You can log in using the following credentials:

- User `user01` with password `passwd01`

## Stopping the MV-Tool

Run the following command in the root directory of the repository:

- General: `docker compose down`
- On Windows: `.\make.bat down`
- On Linux/Mac: `make down`

## Connecting to JIRA

To establish a connection to JIRA, enter the URL of your JIRA instance in the `config.yml` file. Once a connection to JIRA has been established, JIRA users can log in to the MV-Tool using their JIRA credentials.

It may be necessary to append `/jira` to the end of the URL. If issues arise during the initial connection attempt, try appending `/jira` to the URL.

If your JIRA instance uses a self-signed certificate and you want to use an HTTPS connection to JIRA, you must add the `verify_ssl` option to the `config.yml` file in addition to the URL. This option must be added in the JIRA section of the file and set to `false`.

If the MV-Tool is connected to a JIRA instance, authentication via the LDAP server can be omitted. In this case, the corresponding LDAP section in the `config.yml` file should be removed.
