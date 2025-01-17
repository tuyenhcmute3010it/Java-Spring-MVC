<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
                <html lang="en">

                <head>
                    <meta charset="UTF-8" />
                    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                    <title>LaptopShop</title>
                    <link rel="preconnect" href="https://fonts.googleapis.com">
                    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                    <link
                        href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
                        rel="stylesheet">

                    <!-- Icon Font Stylesheet -->
                    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
                        rel="stylesheet">

                    <!-- Libraries Stylesheet -->
                    <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
                    <link href="/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


                    <!-- Customized Bootstrap Stylesheet -->
                    <link href="/client/css/bootstrap.min.css" rel="stylesheet">

                    <!-- Template Stylesheet -->
                    <link href="/client/css/style.css" rel="stylesheet">
                </head>

                <body class="bg-primary">
                    <div id="layoutAuthentication">
                        <div id="layoutAuthentication_content">
                            <main>
                                <div class="container">
                                    <div class="row justify-content-center">
                                        <div class="col-lg-7">
                                            <div class="card shadow-lg border-0 rounded-lg mt-5">
                                                <div class="card-header">
                                                    <h3 class="text-center font-weight-light my-4">Create Account</h3>
                                                </div>
                                                <div class="card-body">
                                                    <form:form action="/register" method="post"
                                                        modelAttribute="registerUser">
                                                        <c:set var="errorPassword">
                                                            <form:errors path="confirmPassword"
                                                                cssClass="invalid-feedback" />
                                                        </c:set>
                                                        <c:set var="errorEmail">
                                                            <form:errors path="email" cssClass="invalid-feedback" />
                                                        </c:set>
                                                        <c:set var="errorFirstName">
                                                            <form:errors path="firstName" cssClass="invalid-feedback" />
                                                        </c:set>
                                                        <div class="row mb-3">
                                                            <div class="col-md-6">
                                                                <div class="form-floating mb-3 mb-md-0">
                                                                    <form:input
                                                                        class="form-control ${not empty errorFirstName ? 'is-invalid' : ''}"
                                                                        id="inputFirstName" type="text"
                                                                        placeholder="Enter your first name"
                                                                        path="firstName" />
                                                                    ${errorFirstName}
                                                                    <label for="inputFirstName">First name</label>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="form-floating">
                                                                    <form:input class="form-control" id="inputLastName"
                                                                        type="text" placeholder="Enter your last name"
                                                                        path="lastName" />
                                                                    <label for="inputLastName">Last name</label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-floating mb-3">
                                                            <form:input
                                                                class="form-control  ${not empty errorEmail ? 'is-invalid' : ''}"
                                                                id="inputEmail" type="email"
                                                                placeholder="name@example.com" path="email" />
                                                            ${errorEmail}
                                                            <label for="inputEmail">Email address</label>
                                                        </div>
                                                        <div class="row mb-3">
                                                            <div class="col-md-6">
                                                                <div class="form-floating mb-3 mb-md-0">
                                                                    <form:input
                                                                        class="form-control  ${not empty errorPassword ? 'is-invalid' : ''}"
                                                                        id="inputPassword" type="password"
                                                                        path="password"
                                                                        placeholder="Create a password" />
                                                                    ${errorPassword}
                                                                    <label for="inputPassword">Password</label>

                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="form-floating mb-3 mb-md-0">
                                                                    <form:input class="form-control"
                                                                        id="inputPasswordConfirm" path="confirmPassword"
                                                                        type="password"
                                                                        placeholder="Confirm password" />
                                                                    <label for="inputPasswordConfirm">Confirm
                                                                        Password</label>
                                                                    <!-- <form:errors path="confirmPassword" /> -->
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="mt-4 mb-0">
                                                            <button type="submit"
                                                                class="d-grid btn btn-primary btn-block"
                                                                style="width: 100%;">Create
                                                                Account</button>
                                                        </div>
                                                    </form:form>
                                                </div>
                                                <div class="card-footer text-center py-3">
                                                    <div class="small"><a href="/login">Have an account? Go to
                                                            login</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </main>
                        </div>

                    </div>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                        crossorigin="anonymous"></script>
                    <script src="js/scripts.js"></script>
                </body>

                </html>