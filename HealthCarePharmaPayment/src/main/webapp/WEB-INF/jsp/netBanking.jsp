<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment Page</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">

<style>
body {
    background: #f5f5f5
}

.rounded {
    border-radius: 1rem
}

.nav-pills .nav-link {
    color: #555
}

.nav-pills .nav-link.active {
    color: white
}

input[type="radio"] {
    margin-right: 5px
}

.bold {
    font-weight: bold
}
</style>
</head>
<body>


<header>
		<nav class="site-nav">
			<ul class="nav justify-content-center navbar-nav navbar-right">
				
				<ul class="nav nav-tabs justify-content-end space" style="padding-right:10em">

					<li class="nav-item"><a class="nav-link"
						href="/home">Logout</a></li>

				</ul>
			</ul>
		</nav>
	</header>




<div style="background-color:lavender" class="container py-5">
    <!-- For demo purpose -->
    <h4>The amount is Rs.${amount}.</h4>
    <div class="row mb-4">
        <div class="col-lg-8 mx-auto text-center">
        </div>
    </div> <!-- End -->
    <div class="row">
        <div class="col-lg-6 mx-auto">
            <div class="card ">
                <div class="card-header">
                    <div class="bg-white shadow-sm pt-4 pl-2 pr-2 pb-2">
                        <!-- Credit card form tabs -->
                        <ul role="tablist" class="nav bg-light nav-pills rounded nav-fill mb-3">
                            <li class="nav-item"> <a data-toggle="pill" href="/debitCard?amount=${amount}" class="nav-link"> <i class="fas fa-credit-card mr-2"></i> Debit Card </a> </li>
                            <li class="nav-item"> <a data-toggle="pill" href="/netBanking?amount=${amount}" class="nav-link active"> <i class="fas fa-mobile-alt mr-2"></i> Net Banking </a> </li>
                        </ul>
                    </div> <!-- End -->
                    <!-- Credit card form content -->
                    
               
                    
                    <div id="net-banking" class="tab-pane fade show active pt-3">
                        <div class="form-group "> <label for="Select Your Bank">
                                <h6>Select your Bank</h6>
                            </label> <select class="form-control" id="ccmonth">
                                <option value="" selected disabled>--Please select your Bank--</option>
                                <option>State Bank of India</option>
                            </select> </div>
                        <div class="form-group">
                            <p><a href="https://retail.onlinesbi.com/retail/login.htm"><button type="button" class="btn btn-primary "><i class="fas fa-mobile-alt mr-2"></i> Proceed Payment</button></a> </p>
                        </div>
                        <p class="text-muted">Note: After clicking on the button, you will be directed to a secure gateway for payment. After completing the payment process, you will be redirected back to the website to view details of your order. </p>
                    </div> <!-- End -->
                    <!-- End -->
                </div>
            </div>
        </div>
    </div>
    
    <script>
    $(function() {
    	$('[data-toggle="tooltip"]').tooltip()
    })
    </script>
    
    <script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>
    <script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    
    
</body>
</html>