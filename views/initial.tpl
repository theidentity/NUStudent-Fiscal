<!DOCTYPE html>
<html>

<head>
    <title>Questions to User</title>
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
    <section class="container bg-light text-primary">
        <p class="text-center">Hi {{user}},
            <br/> Please answer our questions to estimate your budget</p>
        <form method="post" action="/">
            <div class="row justify-content-center">
                <div class="col-6">
                    <h3>{{question}}</h3>
                    <div>
                        <label class="radio-inline">
                            <input type="radio" name="ques" value="{{opt1}}">{{opt1}}
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="ques" value="{{opt2}}">{{opt2}}
                        </label>
                        <label class="radio-inline {{"hide" if opt3 is None else ""}}">
                            <input type="radio" name="ques" value="{{opt3 if opt3 is not None else ""}}">{{opt3 if opt3 is not None else ""}}
                        </label>
                    </div>
                    <div>
                        <button type="submit" class="btn btn-primary">Submit Details</button>
                    </div>
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