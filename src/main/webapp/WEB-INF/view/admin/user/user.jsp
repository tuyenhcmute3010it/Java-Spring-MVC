<%@page contentType="text/html" pageEncoding="UTF-8" %>

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

            <html lang="en">

            <head>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>Document</title>
                <!-- Latest compiled and minified CSS -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
                <!-- Latest compiled JavaScript -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <!-- <link rel="stylesheet" href="/css/demo.css" /> -->
            </head>

            <body>

                <div class="container mt-5">
                    <div class="row">
                        <div class="col mx-auto col-md-10 col-12">
                            <div class="d-flex justify-content-between">
                                <h3>Table Users</h3>
                                <a href="/admin/user/create" type="button" class="btn btn-primary">Create a user</a>
                            </div>
                            <hr>
                            <table class="table table-hover  table-bordered">
                                <thead>
                                    <tr>
                                        <th scope="col">ID</th>
                                        <th scope="col">Email</th>
                                        <th scope="col">FullName</th>
                                        <th scope="col">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="user" items="${users}">
                                        <tr>
                                            <td>${user.id}</td>
                                            <td>${user.email}</td>
                                            <td>${user.fullName}</td>
                                            <td><a href="/admin/user/${user.id}" type="button"
                                                    class="btn btn-success">View</a>
                                                <a href="/admin/user/update/${user.id}" type="button"
                                                    class="btn btn-warning">Update</a>

                                                <a href="/admin/user/delete/${user.id}" type="button"
                                                    class="btn btn-danger">Delete</a>
                                            </td>

                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </body>

            </html>