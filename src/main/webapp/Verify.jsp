<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");

    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String summary = request.getParameter("summary");

    boolean validName = name != null
            && !name.isEmpty()
            && name.length() < 10
            && Character.isUpperCase(name.charAt(0));
    boolean validEmail = email != null && email.endsWith("@gmail.com");

    if (validName && validEmail && summary != null && !summary.trim().isEmpty()) {
        request.setAttribute("verifiedName", name);
        request.setAttribute("verifiedEmail", email);
        request.setAttribute("verifiedSummary", summary);
        request.getRequestDispatcher("/Display.jsp").forward(request, response);
        return;
    }

    response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Could Not Verify | Summary Verification</title>
    <link rel="stylesheet" href="assets\styles.css">
</head>
<body>
    <main class="page-shell">
        <nav class="topbar" aria-label="Main navigation">
            <a class="brand" href="About.html"><span class="brand-mark">S</span> Summary Verification</a>
            <a class="text-link" href="About.html">← About</a>
        </nav>
        <section class="message-card error-card" role="alert">
            <span class="message-icon" aria-hidden="true">!</span>
            <p class="eyebrow">VERIFICATION UNSUCCESSFUL</p>
            <h1>Please check your details.</h1>
            <p class="hero-copy">Your name must start with a capital letter and contain fewer than 10 characters. Your email must end with <code>@gmail.com</code>, and your summary cannot be blank.</p>
            <a class="button button-primary" href="Test.html">Return to the form <span aria-hidden="true">→</span></a>
        </section>
    </main>
</body>
</html>
