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
    <section class="container mx-auto">
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
        <h6>  {{misc}}<     </h6>
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