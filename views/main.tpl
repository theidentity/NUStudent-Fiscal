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
    <form method="post" action="/">
        <div class="navbar-fixed-left"></div>
        <section class="mx-auto text-center heading-bar">
            <div class="heading display-2">
                <span class="text-danger no-margin">NU$</span>
                <span class="text-info no-margin">tudent</span>
                <span class="text-warning">&nbsp;Fiscal</span>
            </div>
            <h6 class="font-weight-normal text-muted">An Intelligent Budget Recommendation System for NUS Students</h6>
            <div class="container">
                <hr/>
            </div>
        </section>
        <section class="container mx-auto bg-light qn-ans-box">
            <div class="row container">
                <div class="question-box text-left align-self-start margin-left">
                    <div class="text-justify text-left">
                        <p class="font-weight-bold text-info question">{{!question}}</p>
                    </div>
                </div>
                <div class="row container">
                    <div class="answer-box text-left align-self-start margin-left">
                        <input type="submit" name="opt1" value="{{opt1}}" class="btn btn-lg btn-info {{" hide " if opt1 is None else " "}}"/>
                        <input type="submit" name="opt2" value="{{opt2}}" class="btn btn-lg btn-info {{" hide " if opt2 is None else " "}}"/>
                        <input type="submit" name="opt3" value="{{opt3}}" class="btn btn-lg btn-info {{" hide " if opt3 is None else " "}}"/>
                    </div>
                </div>
        </section>
        <input type="submit" name="restart" value="Restart" class="btn btn-lg bg-warning btn-block" style="position:fixed; bottom: 15px; right:15px; width:100px;" />
    </form>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/jquery-3.2.1.slim.min.js"></script>
    <script src="/js/popper.min.js"></script>
    <script src="/js/slider.js"></script>
</body>

</html>