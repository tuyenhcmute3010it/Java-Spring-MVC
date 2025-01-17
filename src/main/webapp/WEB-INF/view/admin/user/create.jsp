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
                      <form:form method="post" action="/admin/user/create1" modelAttribute="newUser"
                        enctype="multipart/form-data">
                        <div class="row g-3">
                          <div class="col-12 col-md-6">
                            <div class="mb-3">
                              <label for="exampleInputEmail1" class="form-label">Email address</label>
                              <c:set var="errorEmail">
                                <form:errors path="email" cssClass="invalid-feedback" />
                              </c:set>
                              <form:input type="email" class="form-control ${not empty errorEmail ? 'is-invalid' : ''}"
                                id="exampleInputEmail1" aria-describedby="emailHelp" path="email" />
                              ${errorEmail}
                            </div>
                          </div>
                          <div class="col-12 col-md-6">
                            <div class="mb-3">
                              <label for="exampleInputPassword1" class="form-label">Password</label>
                              <c:set var="errorPassword">
                                <form:errors path="password" cssClass="invalid-feedback" />
                              </c:set>
                              <form:input type="password"
                                class="form-control ${not empty errorPassword ? 'is-invalid' : ''}"
                                id="exampleInputPassword1" path="password" />
                              ${errorPassword}

                            </div>
                          </div>
                        </div>
                        <div class="row g-3">
                          <div class="col-12 col-md-6">
                            <div class="mb-3">
                              <label for="exampleInputPassword1" class="form-label">Phone number</label>
                              <form:input type="phone" class="form-control" id="exampleInputPassword1" path="phone" />
                            </div>
                          </div>
                          <div class="col-12 col-md-6">
                            <div class="mb-3">
                              <label for="exampleInputPassword1" class="form-label">Full name</label>
                              <c:set var="errorFullName">
                                <form:errors path="fullName" cssClass="invalid-feedback" />
                              </c:set>
                              <form:input type="text"
                                class="form-control ${not empty errorFullName ? 'is-invalid' : ''}"
                                id="exampleInputPassword1" path="fullName" />
                              ${errorFullName}
                            </div>
                          </div>
                        </div>

                        <div class="row g-3">
                          <div class="col-12 col-md-6">
                            <div class="mb-3">
                              <label for="exampleInputPassword1" class="form-label">Address</label>
                              <form:input type="text" class="form-control" id="exampleInputPassword1" path="address" />
                            </div>
                          </div>
                          <div class="col-12 col-md-6">
                            <label class="form-label">Role</label>
                            <form:select class="form-select form-select-lg mb-3" aria-label=".form-select-lg example"
                              path="role.name">
                              <form:option value="ADMIN">Admin</form:option>
                              <form:option value="USER">User</form:option>
                            </form:select>
                          </div>
                        </div>
                        <div class="row g-3">
                          <div class="col-12 col-md-6">
                            <div class="mb-3">
                              <label for="avatarFile" class="form-label">Avatar</label>
                              <input class="form-control" type="file" id="avatarFile" accept=".png, .jpg , .jpeg"
                                name="mimiFile" />
                            </div>
                          </div>
                          <div class="col-12 col-md-6  mb-3">
                            <img src="" style="max-height: 250px; display: none;" alt="avatar preview"
                              id="avatarPreview" />
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