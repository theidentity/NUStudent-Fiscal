<!DOCTYPE html>
<html>

<head>
    <title>{{title}}</title>
    <!-- Styles -->
    <link href="/css/reset.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">
    <link href="/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
    <section class="jumbotron text-center bg-info text-white">
        <h1 class="heading">Pocket-Me</h1>
        <h5>Intelligent Rule Based Budget Recommender System</h5>
    </section>
    <section class="container bg-light">
        <h5 class="text-center text-primary">Hi {{user}}, based on your preferences, these are the recommendations we have are</h5>
        <ul>
        	<li>Recommendation 1</li>
        	<li>Recommendation 2</li>
        	<li>Recommendation 3</li>
        </ul>
        <h2>The estimated budget amount is <span class='amt'>{{amount}}</span> SGD</h2>
        
    </section>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/jquery-3.2.1.slim.min.js"></script>
    <script src="/js/popper.min.js"></script>
</body>

</html>