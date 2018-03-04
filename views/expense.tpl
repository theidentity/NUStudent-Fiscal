<!DOCTYPE html>
<html>

<head>
    <title>Expenses</title>
    <!-- Styles -->
    <link href="/css/reset.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <script src="/js/noback.js"></script>
</head>

<body>
    <div class="navbar-fixed-left"></div>
    <section class="mx-auto text-center bg-info heading-bar">
        <h2 class="display-2 font-weight-bold text-white">NU$tudent Fiscal</h2>
        <h6 class="dispaly-4 font-weight-normal text-white">An Intelligent Budget Recommendation System for NUS Students</h6>
    </section>
    <section class="container mx-auto">
        <div class="row mx-auto pad">
            <div class="col-12 text-center pad">
                <h2 class="text-secondary">Your estimated monthly budget is <span class="text-info">S${{total}}</span></h2>
            </div>
        </div>
        <h5>Our Comments, Recommendations & Estimations</h5>
        <div class="row container mx-auto vertical-space"></div>
        <div class="row">
            <div class="col-3">
                <div class="card text-center text-center card-min-height">
                    <div class="card-header bg-dark text-white font-weight-bold text-uppercase">
                        Housing
                    </div>
                    <div class="card-block text-left inner-pad">
                        {{!HousingRecommendation}}
                    </div>
                </div>
                <div class="card-footer text-muted text-right card-footer-min-height">
                    <h3 class="text-info">S${{monthlyhousing}}<small class="text-secondary"> per month</small></h3>
                    <h6 class="text-info"><small class="text-secondary">Rent</small> S${{rent}}</h6>
                    <h6 class="text-info"><small class="text-secondary">Public Utility Bills</small> S${{pub}}</h6>
                </div>
            </div>
            <div class="col-3">
                <div class="card text-center text-center card-min-height">
                    <div class="card-header bg-dark text-white font-weight-bold text-uppercase">
                        Food
                    </div>
                    <div class="card-block text-justify inner-pad">
                        {{!FoodRecommendation}} Even though self-cooking is good, we have a number of healthy and cheap eatery options available inside NUS.
                    </div>
                </div>
                <div class="card-footer text-muted text-right card-footer-min-height">
                    <h3 class="text-info">S${{cookingexp}}<small class="text-secondary"> per month</small></h3>
                </div>
            </div>
            <div class="col-3">
                <div class="card text-center text-right card-min-height">
                    <div class="card-header bg-dark text-white font-weight-bold text-uppercase">
                        Travel
                    </div>
                    <div class="card-block text-justify inner-pad">
                        Singapore is well connected using MRT and buses. Taxis are not very cheap. For short distance travels we recommend to just take a walk or use a bicycle.
                    </div>
                </div>
                <div class="card-footer text-muted text-right card-footer-min-height">
                    <h3 class="text-info">S${{totaltravel}}<small class="text-secondary"> per month</small></h3>
                    <h6 class="text-info"><small class="text-secondary">{{travelmode}} between {{location}} and NUS</small> S${{fare2nus}}</h6>
                    <h6 class="text-info"><small class="text-secondary">Other travel expenses</small> S${{fare2others}}<sup>*</sup></h6>
                </div>
            </div>
            <div class="col-3">
                <div class="card text-center text-center card-min-height">
                    <div class="card-header bg-dark text-white font-weight-bold text-uppercase">
                        Miscellaneous
                    </div>
                    <div class="card-block  text-justify inner-pad">
                        Miscellaneous costs accounts average phone and internet costs per month.
                    </div>
                </div>
                <div class="card-footer text-muted text-right card-footer-min-height">
                    <h3 class="text-info">S${{misc}}<sup>*</sup><small class="text-secondary"> per month</small></h3>
                </div>
            </div>
        </div>
        <div class="row container mx-auto vertical-space"></div>
        <div class="row container">
            <p>*based on users with a similar preference to you</p>
        </div>
    </section>
    <form method="post" action="/">
        <input type="submit" name="restart" value="Restart" class="btn btn-lg bg-warning btn-block" style="position:fixed; bottom: 15px; right:15px; width:120px;" />
    </form>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/jquery-3.2.1.slim.min.js"></script>
    <script src="/js/popper.min.js"></script>
    <script src="/js/slider.js"></script>
</body>

</html>