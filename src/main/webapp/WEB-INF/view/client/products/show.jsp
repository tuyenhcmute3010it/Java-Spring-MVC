<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
                <html lang="en">

                <head>
                    <meta charset="UTF-8" />
                    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                    <title>Laptop Shop</title>
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
                    <style>
                        .page-item .disabled {
                            pointer-events: none !important;
                            background-color: #ccc !important;
                        }
                    </style>
                </head>

                <body>

                    <!-- Spinner Start -->

                    <!-- Spinner End -->


                    <!-- Navbar start -->

                    <!-- Navbar End -->
                    <jsp:include page="../layout/header.jsp" />

                    <!-- Modal Search Start -->
                    <div class="modal fade" id="searchModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                        aria-hidden="true">
                        <div class="modal-dialog modal-fullscreen">
                            <div class="modal-content rounded-0">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Search by keyword</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                                </div>
                                <div class="modal-body d-flex align-items-center">
                                    <div class="input-group w-75 mx-auto d-flex">
                                        <input type="search" class="form-control p-3" placeholder="keywords"
                                            aria-describedby="search-icon-1">
                                        <span id="search-icon-1" class="input-group-text p-3"><i
                                                class="fa fa-search"></i></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Single Product Start -->
                    <div class="container-fluid py-5 mt-5">
                        <div class="container py-5">
                            <div class="row g-4 mb-5">
                                <div class="col-lg-4 col-xl-4">
                                    <div class="row g-4">
                                        <div class="col-12" id="factoryFilter">
                                            <div class="mb-2"><b>Hãng sản xuất</b></div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="checkbox" id="factory-1"
                                                    value="APPLE">
                                                <label class="form-check-label" for="factory-1">Apple</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="checkbox" id="factory-2"
                                                    value="ASUS">
                                                <label class="form-check-label" for="factory-2">Asus</label>
                                            </div>

                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="checkbox" id="factory-3"
                                                    value="LENOVO">
                                                <label class="form-check-label" for="factory-3">Lenovo</label>
                                            </div>

                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="checkbox" id="factory-4"
                                                    value="DELL">
                                                <label class="form-check-label" for="factory-4">Dell</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="checkbox" id="factory-5"
                                                    value="LG">
                                                <label class="form-check-label" for="factory-5">LG</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="checkbox" id="factory-6"
                                                    value="ACER">
                                                <label class="form-check-label" for="factory-6">Acer</label>
                                            </div>

                                        </div>
                                        <div class="col-12" id="targetFilter">
                                            <div class="mb-2"><b>Mục đích sử dụng</b></div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="checkbox" id="target-1"
                                                    value="GAMING">
                                                <label class="form-check-label" for="target-1">Gaming</label>
                                            </div>

                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="checkbox" id="target-2"
                                                    value="SINHVIEN-VANPHONG">
                                                <label class="form-check-label" for="target-2">Sinh viên - văn
                                                    phòng</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="checkbox" id="target-3"
                                                    value="THIET-KE-DO-HOA">
                                                <label class="form-check-label" for="target-3">Thiết kế đồ
                                                    họa</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="checkbox" id="target-4"
                                                    value="MONG-NHE">
                                                <label class="form-check-label" for="target-4">Mỏng nhẹ</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="checkbox" id="target-5"
                                                    value="DOANH-NHAN">
                                                <label class="form-check-label" for="target-5">Doanh nhân</label>
                                            </div>


                                        </div>
                                        <div class="col-12" id="priceFilter">
                                            <div class="mb-2"><b>Mức giá</b></div>

                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="checkbox" id="price-2"
                                                    value="duoi-10-trieu">
                                                <label class="form-check-label" for="price-2">Dưới 10 triệu</label>
                                            </div>

                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="checkbox" id="price-3"
                                                    value="10-15-trieu">
                                                <label class="form-check-label" for="price-3">Từ 10 - 15
                                                    triệu</label>
                                            </div>

                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="checkbox" id="price-4"
                                                    value="15-20-trieu">
                                                <label class="form-check-label" for="price-4">Từ 15 - 20
                                                    triệu</label>
                                            </div>

                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="checkbox" id="price-5"
                                                    value="tren-20-trieu">
                                                <label class="form-check-label" for="price-5">Trên 20 triệu</label>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="mb-2"><b>Sắp xếp</b></div>

                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" id="sort-1"
                                                    value="gia-tang-dan" name="radio-sort">
                                                <label class="form-check-label" for="sort-1">Giá tăng dần</label>
                                            </div>

                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" id="sort-2"
                                                    value="gia-giam-dan" name="radio-sort">
                                                <label class="form-check-label" for="sort-2">Giá giảm dần</label>
                                            </div>

                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" id="sort-3" checked
                                                    value="gia-nothing" name="radio-sort">
                                                <label class="form-check-label" for="sort-3">Không sắp xếp</label>
                                            </div>

                                        </div>
                                        <div class="col-12">
                                            <button
                                                class="btn border-secondary rounded-pill px-4 py-3 text-primary text-uppercase mb-4"
                                                id="btnFilter">
                                                Lọc Sản Phẩm
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-8 col-xl-8">
                                    <div class="tab-content">
                                        <div id="tab-1" class="tab-pane fade show p-0 active">
                                            <div class="row g-4">
                                                <div class="col-lg-12">
                                                    <div class="row g-4">
                                                        <c:if test="${totalPages == 0}">
                                                            <div style="text-align: center;">No found product</div>
                                                        </c:if>
                                                        <c:forEach var="product" items="${products}">
                                                            <div class="col-md-12 col-lg-6 col-xl-4">
                                                                <div class="rounded position-relative fruite-item">
                                                                    <div class="fruite-img">
                                                                        <img src="/images/product/${product.image}"
                                                                            class="img-fluid w-100 rounded-top" alt="">
                                                                    </div>
                                                                    <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                                                        style="top: 10px; left: 10px;">laptop</div>
                                                                    <div
                                                                        class="p-4 border border-secondary border-top-0 rounded-bottom">

                                                                        <h4 style="word-wrap: break-word;"> <a
                                                                                href="/product/${product.id}">${product.name}</a>
                                                                        </h4>
                                                                        <p>${product.shortDesc}</p>
                                                                        <div
                                                                            class="d-flex justify-content-center flex-lg-wrap">
                                                                            <p style="text-align: center; width: 100%"
                                                                                class="text-dark fs-5 fw-bold mb-0">
                                                                                <fmt:formatNumber type="number"
                                                                                    value="${product.price}" />
                                                                                đ
                                                                            </p>
                                                                            <form
                                                                                action="/add-product-to-cart/${product.id}"
                                                                                method="post">
                                                                                <input type="hidden"
                                                                                    name="${_csrf.parameterName}"
                                                                                    value="${_csrf.token}" />
                                                                                <button
                                                                                    class="mx-auto btn border border-secondary rounded-pill px-3 text-primary mt-2"><i
                                                                                        class="fa fa-shopping-bag me-2 text-primary"></i>
                                                                                    Add to cart</button>
                                                                            </form>

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </c:forEach>
                                                        <c:if test="${totalPages > 0}">
                                                            <div class="row g-4">
                                                                <nav aria-label="Page navigation example">
                                                                    <ul class="pagination justify-content-center"
                                                                        style="display: flex;">
                                                                        <li class="page-item">
                                                                            <a class="${1 eq currentPage ? 'disabled page-link' : 'page-link' }"
                                                                                href="/products?page=${currentPage - 1}${queryString}"
                                                                                aria-label="Previous">
                                                                                <span aria-hidden="true">&laquo;</span>
                                                                            </a>
                                                                        </li>
                                                                        <c:forEach begin="0" end="${totalPages - 1}"
                                                                            varStatus="loop">
                                                                            <li class="page-item"><a
                                                                                    class="${(loop.index +1) eq currentPage ? 'active page-link' : 'page-link' }"
                                                                                    href="/products?page=${loop.index +1}${queryString}">${loop.index
                                                                                    +1}</a>
                                                                            </li>
                                                                        </c:forEach>
                                                                        <li class="page-item">
                                                                            <a class="${(totalPages) eq currentPage ? 'disabled page-link' : 'page-link' }"
                                                                                href="/products?page=${currentPage + 1}${queryString}"
                                                                                aria-label="Next"
                                                                                style="border-radius: 0 10px 10px 0;">
                                                                                <span aria-hidden="true">&raquo;</span>
                                                                            </a>
                                                                        </li>
                                                                        </li>
                                                                    </ul>
                                                                </nav>
                                                            </div>
                                                        </c:if>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                        <div id="tab-2" class="tab-pane fade show p-0">
                                            <div class="row g-4">
                                                <div class="col-lg-12">
                                                    <div class="row g-4">
                                                        <div class="col-md-6 col-lg-4 col-xl-3">
                                                            <div class="rounded position-relative fruite-item">
                                                                <div class="fruite-img">
                                                                    <img src="/client/img/fruite-item-5.jpg"
                                                                        class="img-fluid w-100 rounded-top" alt="">
                                                                </div>
                                                                <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                                                    style="top: 10px; left: 10px;">Fruits</div>
                                                                <div
                                                                    class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                                    <h4>Grapes</h4>
                                                                    <p>Lorem ipsum dolor sit amet consectetur
                                                                        adipisicing elit
                                                                        sed
                                                                        do eiusmod te incididunt</p>
                                                                    <div
                                                                        class="d-flex justify-content-between flex-lg-wrap">
                                                                        <p class="text-dark fs-5 fw-bold mb-0">$4.99 /
                                                                            kg</p>
                                                                        <a href="#"
                                                                            class="btn border border-secondary rounded-pill px-3 text-primary"><i
                                                                                class="fa fa-shopping-bag me-2 text-primary"></i>
                                                                            Add to cart</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6 col-lg-4 col-xl-3">
                                                            <div class="rounded position-relative fruite-item">
                                                                <div class="fruite-img">
                                                                    <img src="/client/img/fruite-item-2.jpg"
                                                                        class="img-fluid w-100 rounded-top" alt="">
                                                                </div>
                                                                <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                                                    style="top: 10px; left: 10px;">Fruits</div>
                                                                <div
                                                                    class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                                    <h4>Raspberries</h4>
                                                                    <p>Lorem ipsum dolor sit amet consectetur
                                                                        adipisicing elit
                                                                        sed
                                                                        do eiusmod te incididunt</p>
                                                                    <div
                                                                        class="d-flex justify-content-between flex-lg-wrap">
                                                                        <p class="text-dark fs-5 fw-bold mb-0">$4.99 /
                                                                            kg</p>
                                                                        <a href="#"
                                                                            class="btn border border-secondary rounded-pill px-3 text-primary"><i
                                                                                class="fa fa-shopping-bag me-2 text-primary"></i>
                                                                            Add to cart</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div id="tab-3" class="tab-pane fade show p-0">
                                            <div class="row g-4">
                                                <div class="col-lg-12">
                                                    <div class="row g-4">
                                                        <div class="col-md-6 col-lg-4 col-xl-3">
                                                            <div class="rounded position-relative fruite-item">
                                                                <div class="fruite-img">
                                                                    <img src="/client/img/fruite-item-1.jpg"
                                                                        class="img-fluid w-100 rounded-top" alt="">
                                                                </div>
                                                                <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                                                    style="top: 10px; left: 10px;">Fruits</div>
                                                                <div
                                                                    class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                                    <h4>Oranges</h4>
                                                                    <p>Lorem ipsum dolor sit amet consectetur
                                                                        adipisicing elit
                                                                        sed
                                                                        do eiusmod te incididunt</p>
                                                                    <div
                                                                        class="d-flex justify-content-between flex-lg-wrap">
                                                                        <p class="text-dark fs-5 fw-bold mb-0">$4.99 /
                                                                            kg</p>
                                                                        <a href="#"
                                                                            class="btn border border-secondary rounded-pill px-3 text-primary"><i
                                                                                class="fa fa-shopping-bag me-2 text-primary"></i>
                                                                            Add to cart</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6 col-lg-4 col-xl-3">
                                                            <div class="rounded position-relative fruite-item">
                                                                <div class="fruite-img">
                                                                    <img src="/client/img/fruite-item-6.jpg"
                                                                        class="img-fluid w-100 rounded-top" alt="">
                                                                </div>
                                                                <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                                                    style="top: 10px; left: 10px;">Fruits</div>
                                                                <div
                                                                    class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                                    <h4>Apple</h4>
                                                                    <p>Lorem ipsum dolor sit amet consectetur
                                                                        adipisicing elit
                                                                        sed
                                                                        do eiusmod te incididunt</p>
                                                                    <div
                                                                        class="d-flex justify-content-between flex-lg-wrap">
                                                                        <p class="text-dark fs-5 fw-bold mb-0">$4.99 /
                                                                            kg</p>
                                                                        <a href="#"
                                                                            class="btn border border-secondary rounded-pill px-3 text-primary"><i
                                                                                class="fa fa-shopping-bag me-2 text-primary"></i>
                                                                            Add to cart</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div id="tab-4" class="tab-pane fade show p-0">
                                            <div class="row g-4">
                                                <div class="col-lg-12">
                                                    <div class="row g-4">
                                                        <div class="col-md-6 col-lg-4 col-xl-3">
                                                            <div class="rounded position-relative fruite-item">
                                                                <div class="fruite-img">
                                                                    <img src="/client/img/fruite-item-5.jpg"
                                                                        class="img-fluid w-100 rounded-top" alt="">
                                                                </div>
                                                                <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                                                    style="top: 10px; left: 10px;">Fruits</div>
                                                                <div
                                                                    class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                                    <h4>Grapes</h4>
                                                                    <p>Lorem ipsum dolor sit amet consectetur
                                                                        adipisicing elit
                                                                        sed
                                                                        do eiusmod te incididunt</p>
                                                                    <div
                                                                        class="d-flex justify-content-between flex-lg-wrap">
                                                                        <p class="text-dark fs-5 fw-bold mb-0">$4.99 /
                                                                            kg</p>
                                                                        <a href="#"
                                                                            class="btn border border-secondary rounded-pill px-3 text-primary"><i
                                                                                class="fa fa-shopping-bag me-2 text-primary"></i>
                                                                            Add to cart</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6 col-lg-4 col-xl-3">
                                                            <div class="rounded position-relative fruite-item">
                                                                <div class="fruite-img">
                                                                    <img src="/client/img/fruite-item-4.jpg"
                                                                        class="img-fluid w-100 rounded-top" alt="">
                                                                </div>
                                                                <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                                                    style="top: 10px; left: 10px;">Fruits</div>
                                                                <div
                                                                    class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                                    <h4>Apricots</h4>
                                                                    <p>Lorem ipsum dolor sit amet consectetur
                                                                        adipisicing elit
                                                                        sed
                                                                        do eiusmod te incididunt</p>
                                                                    <div
                                                                        class="d-flex justify-content-between flex-lg-wrap">
                                                                        <p class="text-dark fs-5 fw-bold mb-0">$4.99 /
                                                                            kg</p>
                                                                        <a href="#"
                                                                            class="btn border border-secondary rounded-pill px-3 text-primary"><i
                                                                                class="fa fa-shopping-bag me-2 text-primary"></i>
                                                                            Add to cart</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div id="tab-5" class="tab-pane fade show p-0">
                                            <div class="row g-4">
                                                <div class="col-lg-12">
                                                    <div class="row g-4">
                                                        <div class="col-md-6 col-lg-4 col-xl-3">
                                                            <div class="rounded position-relative fruite-item">
                                                                <div class="fruite-img">
                                                                    <img src="/client/img/fruite-item-3.jpg"
                                                                        class="img-fluid w-100 rounded-top" alt="">
                                                                </div>
                                                                <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                                                    style="top: 10px; left: 10px;">Fruits</div>
                                                                <div
                                                                    class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                                    <h4>Banana</h4>
                                                                    <p>Lorem ipsum dolor sit amet consectetur
                                                                        adipisicing elit
                                                                        sed
                                                                        do eiusmod te incididunt</p>
                                                                    <div
                                                                        class="d-flex justify-content-between flex-lg-wrap">
                                                                        <p class="text-dark fs-5 fw-bold mb-0">$4.99 /
                                                                            kg</p>
                                                                        <a href="#"
                                                                            class="btn border border-secondary rounded-pill px-3 text-primary"><i
                                                                                class="fa fa-shopping-bag me-2 text-primary"></i>
                                                                            Add to cart</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6 col-lg-4 col-xl-3">
                                                            <div class="rounded position-relative fruite-item">
                                                                <div class="fruite-img">
                                                                    <img src="/client/img/fruite-item-2.jpg"
                                                                        class="img-fluid w-100 rounded-top" alt="">
                                                                </div>
                                                                <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                                                    style="top: 10px; left: 10px;">Fruits</div>
                                                                <div
                                                                    class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                                    <h4>Raspberries</h4>
                                                                    <p>Lorem ipsum dolor sit amet consectetur
                                                                        adipisicing elit
                                                                        sed
                                                                        do eiusmod te incididunt</p>
                                                                    <div
                                                                        class="d-flex justify-content-between flex-lg-wrap">
                                                                        <p class="text-dark fs-5 fw-bold mb-0">$4.99 /
                                                                            kg</p>
                                                                        <a href="#"
                                                                            class="btn border border-secondary rounded-pill px-3 text-primary"><i
                                                                                class="fa fa-shopping-bag me-2 text-primary"></i>
                                                                            Add to cart</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6 col-lg-4 col-xl-3">
                                                            <div class="rounded position-relative fruite-item">
                                                                <div class="fruite-img">
                                                                    <img src="/client/img/fruite-item-1.jpg"
                                                                        class="img-fluid w-100 rounded-top" alt="">
                                                                </div>
                                                                <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                                                    style="top: 10px; left: 10px;">Fruits</div>
                                                                <div
                                                                    class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                                    <h4>Oranges</h4>
                                                                    <p>Lorem ipsum dolor sit amet consectetur
                                                                        adipisicing elit
                                                                        sed
                                                                        do eiusmod te incididunt</p>
                                                                    <div
                                                                        class="d-flex justify-content-between flex-lg-wrap">
                                                                        <p class="text-dark fs-5 fw-bold mb-0">$4.99 /
                                                                            kg</p>
                                                                        <a href="#"
                                                                            class="btn border border-secondary rounded-pill px-3 text-primary"><i
                                                                                class="fa fa-shopping-bag me-2 text-primary"></i>
                                                                            Add to cart</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <!-- Single Product End -->


                    <!-- Footer Start -->

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