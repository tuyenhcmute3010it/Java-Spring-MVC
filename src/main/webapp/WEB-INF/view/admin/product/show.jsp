<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <!--  -->
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!--  -->
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
                <html lang="en">

                <head>
                    <meta charset="utf-8" />
                    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                    <meta name="description" content="" />
                    <meta name="author" content="" />
                    <title>Dashboard - SB Admin</title>
                    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
                        rel="stylesheet" />
                    <link href="/css/styles.css" rel="stylesheet" />
                    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
                        crossorigin="anonymous"></script>
                </head>

                <body class="sb-nav-fixed">
                    <!--  -->
                    <jsp:include page="../layout/header.jsp" />
                    <!--  -->
                    <div id="layoutSidenav">
                        <jsp:include page="../layout/sidebar.jsp" />
                        <div id="layoutSidenav_content">
                            <main>
                                <div class="container-fluid px-4">
                                    <h1 class="mt-4">Manage Product</h1>
                                    <ol class="breadcrumb mb-4">
                                        <li class="breadcrumb-item active"><a href="/admin">Dashboard</a></li>
                                        <li class="breadcrumb-item active">Product</li>
                                    </ol>
                                    <main>
                                        <div class="container mt-5">
                                            <div class="row">
                                                <div class="col mx-auto col-md-12 col-12">
                                                    <div class="d-flex justify-content-between">
                                                        <h3>Table Products</h3>
                                                        <a href="/admin/product/create" type="button"
                                                            class="btn btn-primary">Create a product</a>
                                                    </div>
                                                    <hr>
                                                    <table class="table table-hover  table-bordered">
                                                        <thead>
                                                            <tr>
                                                                <th scope="col">ID</th>
                                                                <th scope="col">Name</th>
                                                                <th scope="col">Price</th>
                                                                <th scope="col">Factory</th>
                                                                <th scope="col">Action</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <c:forEach var="product" items="${products}">
                                                                <tr>
                                                                    <td>${product.id}</td>
                                                                    <td>${product.name}</td>
                                                                    <td>
                                                                        <fmt:formatNumber type="number"
                                                                            value="${product.price}" />
                                                                        đ
                                                                    </td>
                                                                    <td>${product.factory}</td>
                                                                    <td><a href="/admin/product/${product.id}"
                                                                            type="button"
                                                                            class="btn btn-success">View</a>
                                                                        <a href="/admin/product/update/${product.id}"
                                                                            type="button"
                                                                            class="btn btn-warning">Update</a>

                                                                        <a href="/admin/product/delete/${product.id}"
                                                                            type="button"
                                                                            class="btn btn-danger">Delete</a>
                                                                    </td>

                                                                </tr>
                                                            </c:forEach>
                                                        </tbody>
                                                    </table>
                                                    <nav aria-label="Page navigation example">
                                                        <ul class="pagination justify-content-center">
                                                            <li class="page-item">
                                                                <a class="${1 eq currentPage ? 'disabled page-link' : 'page-link' }"
                                                                    href="/admin/product?page=${currentPage - 1}"
                                                                    aria-label="Previous">
                                                                    <span aria-hidden="true">&laquo;</span>
                                                                </a>
                                                            </li>
                                                            <c:forEach begin="0" end="${totalPages - 1}"
                                                                varStatus="loop">
                                                                <li class="page-item"><a
                                                                        class="${(loop.index +1) eq currentPage ? 'active page-link' : 'page-link' }"
                                                                        href="/admin/product?page=${loop.index +1}">${loop.index
                                                                        +1}</a>
                                                                </li>
                                                            </c:forEach>
                                                            <a class="${(totalPages) eq currentPage ? 'disabled page-link' : 'page-link' }"
                                                                href="/admin/product?page=${currentPage + 1}"
                                                                aria-label="Next">
                                                                <span aria-hidden="true">&raquo;</span>
                                                            </a>
                                                            </li>
                                                        </ul>
                                                    </nav>
                                                </div>
                                            </div>
                                        </div>

                                    </main>

                                </div>
                            </main>
                            <jsp:include page="../layout/footer.jsp" />
                        </div>
                    </div>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                        crossorigin="anonymous"></script>
                    <script src="/js/scripts.js"></script>
                    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
                        crossorigin="anonymous"></script>
                    <script src="/js/chart-area-demo.js"></script>
                    <script src="/js/chart-bar-demo.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
                        crossorigin="anonymous"></script>
                    <script src="/js/datatables-simple-demo.js"></script>
                </body>

                </html>