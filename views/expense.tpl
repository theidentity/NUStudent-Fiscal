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
    <section class="jumbotron text-center bg-info text-white">
        <h1 class="display-2">Pocket-Me</h1>
        <h5 class="display-4">Intelligent Rule Based Budget Recommender System</h5>
    </section>
<!--     <section class="container mx-auto">
        <h6>  {{total}}     </h6>
        <h6>  {{sharing}}     </h6>
        <h6>  {{house_type}}     </h6>
        <h6>  {{location}}     </h6>
        <h6>  {{monthly_housing}}     </h6>
        <h6>  {{rent}}     </h6>
        <h6>  {{pub}}     </h6>
        <h6>  {{food_type}}     </h6>
        <h6>  {{cooking_type}}     </h6>
        <h6>  {{cooking_exp}}     </h6>
        <h6>  {{mode}}     </h6>
        <h6>  {{total_travel}}     </h6>
        <h6>  {{fare_2_nus}}     </h6>
        <h6>  {{fare_2_others}}     </h6>
        <h6>  {{misc}} </h6>
        <h6> {{content}} </h6>
    </section> -->
    <section class="container mx-auto">
        <div class="row mx-auto bg-light pad">
            <div class="col-12 text-center pad">
                <h2>Your Monthly Expenses are : {{total}}</h2>
            </div>
        </div>
        <div class="row vertical-space">
            <div class="col-3">
                <div class="card text-center text-center">
                    <div class="card-header bg-dark text-white font-weight-bold text-uppercase">
                        Housing
                    </div>
                    <div class="card-block">
                        <div>Location : {{location}}</div>
                        <div>Sharing : {{sharing}}</div>
                        <div>House Type : {{house_type}}</div>
                        <div>Rent : {{rent}}</div>
                        <div>Public Utility Bills : {{pub}}</div>
                    </div>
                </div>
                <div class="card-footer text-muted text-center">
                    Monthly Housing Expenses : {{monthly_housing}}
                </div>
            </div>
            <div class="col-3">
                <div class="card text-center text-center">
                    <div class="card-header bg-dark text-white font-weight-bold text-uppercase">
                        Food
                    </div>
                    <div class="card-block">
                        <div>Food Type : {{food_type}}</div>
                        <div>Cooking type : {{cooking_type}}</div>
                    </div>
                </div>
                <div class="card-footer text-muted text-center">
                    Monthly Food Expenses : {{cooking_exp}}
                </div>
            </div>
            <div class="col-3">
                <div class="card text-center text-center">
                    <div class="card-header bg-dark text-white font-weight-bold text-uppercase">
                        Travel
                    </div>
                    <div class="card-block">
                        <div>Mode : {{mode}}</div>
                        <div>Fare to NUS : {{fare_2_nus}}</div>
                        <div>General Fare : {{fare_2_others}}</div>
                    </div>
                </div>
                <div class="card-footer text-muted text-center">
                    Monthly Travel Expenses : {{total_travel}}
                </div>
            </div>
            <div class="col-3">
                <div class="card text-center text-center">
                    <div class="card-header bg-dark text-white font-weight-bold text-uppercase">
                        Miscellaneous
                    </div>
                    <div class="card-block">
                        <div>Phone : {{misc}}</div>
                    </div>
                </div>
                <div class="card-footer text-muted text-center">
                    Monthly Misc. Expenses : {{misc}}
                </div>
            </div>
        </div>
    </section>
    <section class="text-primary container mx-auto">
        <form method="post" action="/">
            <div class="row container mx-auto vertical-space">
                <div>{{content}}</div>
                <div class="col-5 mx-auto">
                    <input type="submit" name="restart" value="Restart" class="btn btn-lg bg-warning btn-block" />
                </div>
            </div>
        </form>
    </section>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/jquery-3.2.1.slim.min.js"></script>
    <script src="/js/popper.min.js"></script>
    <script src="/js/slider.js"></script>
</body>

</html>