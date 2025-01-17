<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <!--  -->
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!--  -->
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="" />
                <meta name="author" content="" />
                <title>Dashboard - SB Admin</title>
                <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <script>
                    $(document).ready(() => {
                        const avatarFile = $("#avatarFile");
                        avatarFile.change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#avatarPreview").attr("src", imgURL);
                            $("#avatarPreview").css({ "display": "block" });
                        });
                    });
                </script>
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
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
                                <h1 class="mt-4">Manage Order</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item active"><a href="/admin">Dashboard</a></li>
                                    <li class="breadcrumb-item active">Order</li>
                                </ol>
                                <div class="container mt-5">
                                    <div class="row">
                                        <div class="col-md-10 col-12 mx-auto">
                                            <h3>Create User</h3>
                                            <form:form method="post" action="/admin/product/create"
                                                modelAttribute="newProduct" enctype="multipart/form-data">
                                                <div class="row g-3">
                                                    <div class="col-12 col-md-6">
                                                        <div class="mb-3">
                                                            <label for="name" class="form-label">Name
                                                            </label>
                                                            <c:set var="errorName">
                                                                <form:errors path="name" cssClass="invalid-feedback" />
                                                            </c:set>
                                                            <form:input type="text"
                                                                class="form-control ${not empty errorName ? 'is-invalid' : ''}"
                                                                id="name" aria-describedby="emailHelp" path="name" />
                                                            ${errorName}
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-md-6">
                                                        <div class="mb-3">
                                                            <label for="price" class="form-label">Price</label>
                                                            <c:set var="errorPrice">
                                                                <form:errors path="price" cssClass="invalid-feedback" />
                                                            </c:set>
                                                            <form:input type="number"
                                                                class="form-control ${not empty errorPrice ? 'is-invalid' : ''}"
                                                                id="price" path="price" />
                                                            ${errorPrice}
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row g-3">
                                                    <div class="col-12 ">
                                                        <div class="mb-3">
                                                            <label for="detailDesc" class="form-label">
                                                                Detail description</label>
                                                            <form:textarea name="" class="form-control" id="detailDesc"
                                                                path="detailDesc"></form:textarea>
                                                        </div>
                                                    </div>

                                                </div>

                                                <div class="row g-3">
                                                    <div class="col-12 col-md-6">
                                                        <div class="mb-3">
                                                            <label for="shortDesc" class="form-label">Short
                                                                description</label>
                                                            <form:input type="text" class="form-control" id="shortDesc"
                                                                path="shortDesc" />
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-md-6">
                                                        <div class="mb-3">
                                                            <label for="quantity" class="form-label">Quantity
                                                            </label>
                                                            <form:input type="number" class="form-control" id="quantity"
                                                                path="quantity" />
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row g-3">
                                                    <div class="col-12 col-md-6">
                                                        <label class="form-label">Factory</label>
                                                        <form:select class="form-select form-select-lg mb-3"
                                                            aria-label=".form-select-lg example" path="factory">
                                                            <form:option value="APPLE">Apple (MacBook)</form:option>
                                                            <form:option value="ASUS">Asus</form:option>
                                                            <form:option value="LENOVO">Lenovo</form:option>
                                                            <form:option value="DELL">Dell</form:option>
                                                            <form:option value="LG">LG</form:option>
                                                            <form:option value="ACER">Acer</form:option>
                                                        </form:select>
                                                    </div>
                                                    <div class="col-12 col-md-6">
                                                        <label class="form-label">Target</label>
                                                        <form:select class="form-select form-select-lg mb-3"
                                                            aria-label=".form-select-lg example" path="target">
                                                            <form:select class="form-select" path="target">
                                                                <form:option value="GAMING">Gaming</form:option>
                                                                <form:option value="SINHVIEN-VANPHONG">Sinh viên - Văn
                                                                    phòng
                                                                </form:option>
                                                                <form:option value="THIET-KE-DO-HOA">Thiết kế đồ họa
                                                                </form:option>
                                                                <form:option value="MONG-NHE">Mỏng nhẹ</form:option>
                                                                <form:option value="DOANH-NHAN">Doanh nhân</form:option>
                                                            </form:select>
                                                        </form:select>
                                                    </div>
                                                </div>
                                                <div class="row g-3">
                                                    <div class="col-12 col-md-6">
                                                        <div class="mb-3">
                                                            <label for="avatarFile" class="form-label">Image</label>
                                                            <input class="form-control" type="file" id="avatarFile"
                                                                accept=".png, .jpg , .jpeg" name="thumbProduct" />
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-md-6  mb-3">
                                                        <img src="" style="max-height: 250px; display: none;"
                                                            alt="avatar preview" id="avatarPreview" />
                                                    </div>
                                                </div>
                                                <button type="submit" class="btn btn-primary">Submit</button>
                                            </form:form>
                                        </div>
                                    </div>
                                </div>

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