<!DOCTYPE html>
<html>

<head>
    <title>Questions to User</title>
    <!-- Styles -->
    <link href="/css/reset.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <script src="/js/noback.js"></script>
</head>

<body>
    <section class="jumbotron text-center bg-info text-white">
        <h1 class="heading">Pocket-Me</h1>
        <h5>Intelligent Rule Based Budget Recommender System</h5>
    </section>
    <section class="text-primary container mx-auto">
        <form method="post" action="/">
            <div class="container row bg-light">
                <div class="col-9">
                    <div class="question-box text-justify">
                        <p class="question text-info">{{!question}}</p>
                    </div>
                    <div class="answer-box text-justify">
                        <input type="submit" name="opt1" value="{{opt1}}" class="btn btn-lg btn-info {{" hide " if opt1 is None else " "}}"/>
                        <input type="submit" name="opt2" value="{{opt2}}" class="btn btn-lg btn-info {{" hide " if opt2 is None else " "}}"/>
                        <input type="submit" name="opt3" value="{{opt3}}" class="btn btn-lg btn-info {{" hide " if opt3 is None else " "}}"/>
                    </div>
                </div>
            </div>
            <div class="row container mx-auto vertical-space">
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