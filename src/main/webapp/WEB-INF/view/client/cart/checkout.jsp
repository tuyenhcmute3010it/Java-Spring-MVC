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
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="cartDetail" items="${cartDetails}">
                                                <tr>
                                                    <th scope="row">
                                                        <div class="d-flex align-items-center">
                                                            <img src="/images/product/${cartDetail.product.image}"
                                                                class="img-fluid me-5 rounded-circle"
                                                                style="width: 80px; height: 80px;" alt="">
                                                        </div>
                                                    </th>
                                                    <td>
                                                        <p class="mb-0 mt-4">
                                                            <a target="_blank"
                                                                href="/product/${cartDetail.product.id}">${cartDetail.product.name}</a>
                                                        </p>
                                                    </td>
                                                    <td>
                                                        <p class="mb-0 mt-4">
                                                            <fmt:formatNumber type="number"
                                                                value="${cartDetail.price}" /> đ
                                                        </p>
                                                    </td>
                                                    <td>
                                                        <div class="input-group quantity mt-4" style="width: 100px;">
                                                            <input type="text" disabled
                                                                class="form-control form-control-sm text-center border-0"
                                                                value="${cartDetail.quantity}">

                                                        </div>
                                                    </td>
                                                    <td>
                                                        <p class="mb-0 mt-4" data-cart-detail-id="${cartDetail.id}">
                                                            <fmt:formatNumber type="number"
                                                                value="${cartDetail.price * cartDetail.quantity}" />
                                                            đ
                                                        </p>
                                                    </td>


                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <form:form action="/place-order" method="post" modelAttribute="cart">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                <div class="row g-5 mt-5">
                                    <div class="col-md-12 col-lg-12 col-xl-6">
                                        <div class="row">
                                            <h3>Information Buyer</h3>
                                            <div class="col-md-12">
                                                <div class="form-item w-100">
                                                    <label class="form-label my-3">Name<sup>*</sup></label>
                                                    <input type="text" class="form-control" name="receiverName">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-item">
                                            <label class="form-label my-3">Address <sup>*</sup></label>
                                            <input type="text" class="form-control"
                                                placeholder="House Number Street Name" name="receiverAddress">
                                        </div>
                                        <div class="form-item">
                                            <label class="form-label my-3">Phone<sup>*</sup></label>
                                            <input type="phone" class="form-control" name="receiverPhone">
                                        </div>


                                    </div>
                                    <div class="col-md-12 col-lg-12 col-xl-6">
                                        <div class="row g-4 justify-content-end">
                                            <div class="col-md-12 col-lg-6 col-xl-12">
                                                <div class="bg-light rounded">
                                                    <div class="p-4">
                                                        <h1 class="display-9 mb-4">Information Payment
                                                        </h1>
                                                        <div class="d-flex justify-content-between mb-4">
                                                            <h5 class="mb-0 me-4">Subtotal:</h5>
                                                            <p class="mb-0" data-cart-total-price="${sum}">
                                                                <fmt:formatNumber type="number" value="${sum}" />
                                                                đ
                                                            </p>
                                                        </div>
                                                        <div class="d-flex justify-content-between">
                                                            <h5 class="mb-0 me-4">Shipping Method</h5>
                                                            <div class="">
                                                                <p class="mb-0">COD</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div
                                                        class="py-4 mb-4 border-top border-bottom d-flex justify-content-between">
                                                        <h5 class="mb-0 ps-4 me-4">Total</h5>
                                                        <p class="mb-0 pe-4" data-cart-total-price="${sum}">
                                                            <fmt:formatNumber type="number" value="${sum}" />
                                                            đ
                                                        </p>
                                                    </div>
                                                    <button type="submit"
                                                        class="btn border-secondary rounded-pill px-4 py-3 text-primary text-uppercase mb-4 ms-4">Xác
                                                        nhận thanh toán
                                                    </button>

                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </form:form>

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