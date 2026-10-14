# Summary Verification

A small web application that introduces a Java developer, accepts a name, Gmail address, and summary, and displays the submission after checking the details.

## Open directly in a browser

No server is needed for the browser-only flow. Open `src\main\webapp\About.html` in a browser, choose **Take the test**, and submit the form. The browser validates the form and redirects to the result page. Submission data is kept in the current tab's session storage and cleared after display.

This mode performs validation in the browser only; it does not send or store submissions on a server.

## Requirements

- Java 8 or newer
- Maven 3.6 or newer
- Apache Tomcat 9

## Optional: deploy the JSP application

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

The JSP submission flow requires Tomcat. The server checks submitted values regardless of browser-side form validation. Verified content is HTML-escaped when displayed.
