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

                <body>

                    <!-- Spinner Start -->
                    <div id="spinner"
                        class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
                        <div class="spinner-grow text-primary" role="status"></div>
                    </div>
                    <!-- Spinner End -->


                    <!-- Navbar start -->

                    <!-- Navbar End -->
                    <jsp:include page="../layout/header.jsp" />

                    <!-- Modal Search Start -->

                    </div>
                    <!-- Modal Search End -->
                    <!-- Featurs Section Start -->
                    <!-- Featurs Section End -->
                    <div class="container-fluid py-5">
                        <div class="container py-5">
                            <div class="row">
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th scope="col">Products</th>
                                                <th scope="col">Name</th>
                                                <th scope="col">Price</th>
                                                <th scope="col">Quantity</th>
                                                <th scope="col">Total</th>
                                                <th scope="col">Status</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="order" items="${orders}">

                                                <tr style="background-color: palegreen;">
                                                    <td>Order id = ${order.id}</td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                    <td>
                                                        <fmt:formatNumber type="number" value="${order.totalPrice}" />
                                                        đ
                                                    </td>
                                                    <td>${order.status}</td>
                                                </tr>
                                                <c:forEach var="orderDetail" items="${order.orderDetails}">
                                                    <tr>
                                                        <th scope="row">
                                                            <div class="d-flex align-items-center">
                                                                <img src="/images/product/${orderDetail.product.image}"
                                                                    class="img-fluid me-5 rounded-circle"
                                                                    style="width: 80px; height: 80px;" alt="">
                                                            </div>
                                                        </th>
                                                        <td>
                                                            <p class="mb-0 mt-4">
                                                                <a target="_blank"
                                                                    href="/product/${orderDetail.product.id}">${orderDetail.product.name}</a>
                                                            </p>
                                                        </td>
                                                        <td>
                                                            <p class="mb-0 mt-4">
                                                                <fmt:formatNumber type="number"
                                                                    value="${orderDetail.price}" /> đ
                                                            </p>
                                                        </td>
                                                        <td>
                                                            <div class="input-group quantity mt-4"
                                                                style="width: 100px;">
                                                                <input type="text" disabled
                                                                    class="form-control form-control-sm text-center border-0"
                                                                    value="${orderDetail.quantity}">

                                                            </div>
                                                        </td>
                                                        <td>
                                                            <p class="mb-0 mt-4" data-cart-detail-id="${cartDetail.id}">
                                                                <fmt:formatNumber type="number"
                                                                    value="${orderDetail.price * orderDetail.quantity}" />
                                                                đ
                                                            </p>
                                                        </td>


                                                    </tr>

                                                </c:forEach>

                                            </c:forEach>

                                        </tbody>
                                    </table>
                                </div>
                            </div>


                        </div>
                    </div>

                    <!-- Fruits Shop Start-->

                    <!-- Fruits Shop End-->
                    <jsp:include page="../layout/footer.jsp" />


                    <!-- JavaScript Libraries -->
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                    <script src="/client/lib/easing/easing.min.js"></script>
                    <script src="/client/lib/waypoints/waypoints.min.js"></script>
                    <script src="/client/lib/lightbox/js/lightbox.min.js"></script>
                    <script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>

                    <!-- Template Javascript -->
                    <script src="/client/js/main.js"></script>
                </body>

                </html>