# Summary Verification

A small JSP web application for Apache Tomcat. It introduces a Java developer, accepts a name, Gmail address, and summary, validates the submitted details on the server, and displays verified submissions.

## Requirements

- Java 8 or newer
- Maven 3.6 or newer
- Apache Tomcat 9

## Build and run

From the project directory, create the deployable WAR:

```powershell
mvn clean package
```

Copy `target\summary-verification.war` into Tomcat 9's `webapps` directory and start Tomcat. Open:

```text
http://localhost:8080/summary-verification/
```

The app is packaged as a WAR and uses the `javax.servlet` JSP stack provided by Tomcat 9.

## Verification rules

- The name must begin with an uppercase letter and contain fewer than 10 characters.
- The email address must end with `@gmail.com`.
- A summary is required.

The server checks the submitted values regardless of browser-side form validation. Verified content is HTML-escaped when displayed.
