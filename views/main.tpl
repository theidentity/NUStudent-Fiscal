<!DOCTYPE html>
<html>

<head>
    <title>Questions to User</title>
    <!-- Styles -->
    <link href="/css/reset.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript">
    function preventBack() { window.history.forward(); }
    setTimeout("preventBack()", 0);
    window.onunload = function() { null };
    </script>
</head>

<body>
    <section class="jumbotron text-center bg-info text-white">
        <h3 class="heading">Pocket-Me</h3>
        <h5>Intelligent Rule Based Budget Recommender System</h5>
    </section>
    <section class="container bg-light text-primary" style="min-height:300px;">
        <form method="post" action="/">
            <input type="submit" name="restart" value="Restart" class="btn btn-info pull-right" />
            <div class="row justify-content-center">
                <div class="col-8 question-box">
                    <p class="question">{{!question}}</p>
                    <input type="submit" name="opt1" value="{{opt1}}" class="btn btn-primary {{" hide " if opt1 is None else " "}}"/>
                    <input type="submit" name="opt2" value="{{opt2}}" class="btn btn-primary {{" hide " if opt2 is None else " "}}"/>
                    <input type="submit" name="opt3" value="{{opt3}}" class="btn btn-primary {{" hide " if opt3 is None else " "}}"/>
                </div>
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