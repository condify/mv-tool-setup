# Installation of the MV-Tool

The installation of the MV-Tool is done via Docker. You can use the `docker-compose.yml` file from this repository. First, install Docker on your system. Docker can be downloaded from the following link: [Docker](https://www.docker.com/products/docker-desktop)

## Starting the MV-Tool

Run the following command in the root directory of the repository:

- General: `docker compose up app -d`
- On Windows: `.\make.bat up`
- On Linux/Mac: `make up`

After starting the MV-Tool, you can access the application at the following address: [http://localhost:8000](http://localhost:8000)

> **Note:** No default test users are available in this setup.  
> All users must be created manually via the LDAP User Manager (see section below).

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

## Temporary LDAP User Manager Integration (Branch: `ldap-user-manager`)

Until the MV-Tool includes its own internal user management, you can use a temporary LDAP-based solution with a web UI powered by the open-source project [wheelybird/ldap-user-manager](https://github.com/wheelybird/ldap-user-manager).

This setup allows you to easily create and manage LDAP users via a browser interface.

> ⚠️ **Note:** This setup is only available in the `ldap-user-manager` branch:  
> https://github.com/condify/mv-tool-setup/tree/ldap-user-manager

### Setup Instructions

1. **Use the correct branch**

   Make sure you are working on the `ldap-user-manager` branch and using its `docker-compose.yml` file.

   ```bash
   git clone -b ldap-user-manager https://github.com/condify/mv-tool-setup.git
   cd mv-tool-setup
   ```

2. **Start the services**

   ```bash
   docker compose up app -d
   ```

3. **Open the setup interface**

   Open your browser and go to:
   http://localhost:8080/setup

   Enter the LDAP admin password, which is defined in the `docker-compose.yml` under `LDAP_ADMIN_PASSWORD` or `LDAP_ADMIN_BIND_PWD`.

   **Note:** If the password is changed, it must be updated in both the `ldap` and `ldap-user-manager` services.

4. **Initialize the LDAP directory structure**

   The interface will detect missing entries and offer to create them. Leave the checkboxes selected and click “Next” to apply the changes.

5. **Create an admin user**
   Again, leave the checkbox selected and click “Next”. In the next step, fill out the following fields:

   - First Name
   - Last Name
   - System Username
   - Password

   All other fields may remain empty.

   **Important:** This is not the system’s LDAP admin. It’s a regular LDAP user with permissions to manage other users.

6. **Manage additional users**
   Once the admin user is created:

   - Go to http://localhost:8080
   - Log in as the admin user
   - Use the “Account Manager” section to create or modify additional users

   Regular users can log in and change their passwords through the same interface.
