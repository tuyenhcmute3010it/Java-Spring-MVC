<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <!--  -->
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                                    <h1 class="mt-4">Update Order</h1>
                                    <ol class="breadcrumb mb-4">
                                        <li class="breadcrumb-item active"><a href="/admin/order">Order</a></li>
                                        <li class="breadcrumb-item active">Order Update</li>
                                    </ol>
                                    <form:form action="/admin/order/update/${order.id}" modelAttribute="order">

                                        <!-- <div>Order id = ${order.id}</div> -->
                                        <h3>Order Id = ${order.id}</h3>
                                        <h4 style="text-align: left; text-decoration: underline;">Total Cost :
                                            <fmt:formatNumber type="number" value="${order.totalPrice}" />
                                            đ
                                        </h4>
                                        <div>
                                            <form:input type="text" path="user.fullName" disabled="true" />
                                            <form:select class="form-select form-select-lg mb-3 mt-2"
                                                aria-label=".form-select-lg example" path="status">
                                                <form:option value="PENDING">PENDING</form:option>
                                                <form:option value="SHIPPING">SHIPPING</form:option>
                                                <form:option value="COMPLETE">COMPLETE</form:option>
                                                <form:option value="CANCEL">CANCEL</form:option>
                                            </form:select>
                                        </div>
                                        <button type="submit" class="btn btn-primary">Update</button>
                                    </form:form>
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