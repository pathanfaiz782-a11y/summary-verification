<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String verifiedName = (String) session.getAttribute("verifiedName");
    String verifiedEmail = (String) session.getAttribute("verifiedEmail");
    String verifiedSummary = (String) session.getAttribute("verifiedSummary");

    if (verifiedName == null || verifiedEmail == null || verifiedSummary == null) {
        response.sendRedirect("Test.html");
        return;
    }

    session.removeAttribute("verifiedName");
    session.removeAttribute("verifiedEmail");
    session.removeAttribute("verifiedSummary");
    request.setAttribute("verifiedName", verifiedName);
    request.setAttribute("verifiedEmail", verifiedEmail);
    request.setAttribute("verifiedSummary", verifiedSummary);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Verified Summary | Summary Verification</title>
    <link rel="stylesheet" href="assets\styles.css">
</head>
<body>
    <main class="page-shell">
        <nav class="topbar" aria-label="Main navigation">
            <a class="brand" href="About.html"><span class="brand-mark">S</span> Summary Verification</a>
            <span class="verified-badge"><span aria-hidden="true">✓</span> Verified</span>
        </nav>

        <section class="result-layout">
            <div class="result-heading">
                <p class="eyebrow">SUBMISSION COMPLETE</p>
                <h1>Thanks, <span><c:out value="${requestScope.verifiedName}"/></span>.</h1>
                <p class="hero-copy">Your details passed verification. Here’s the summary you submitted.</p>
            </div>

            <article class="result-card">
                <div class="result-meta">
                    <div>
                        <span class="field-caption">NAME</span>
                        <p><c:out value="${requestScope.verifiedName}"/></p>
                    </div>
                    <div>
                        <span class="field-caption">EMAIL ID</span>
                        <p><c:out value="${requestScope.verifiedEmail}"/></p>
                    </div>
                </div>
                <div class="summary-block">
                    <span class="field-caption">YOUR SUMMARY</span>
                    <p class="submitted-summary"><c:out value="${requestScope.verifiedSummary}"/></p>
                </div>
            </article>

            <a class="text-link result-link" href="About.html">← Back to about</a>
        </section>
        <footer class="site-footer">
            <span>Summary Verification</span>
            <span>Java · JSP · Apache Tomcat</span>
        </footer>
    </main>
</body>
</html>
