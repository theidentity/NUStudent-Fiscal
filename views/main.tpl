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
    <!--    <h1>Hello {{user}}</h1>
    <div class="amount">
        <p>The amount you have to pay is {{amount}}</p>
    </div> -->
    <section class="jumbotron text-center bg-info text-white">
        <h1 class="heading">Pocket-Me</h1>
        <h5>Intelligent Rule Based Budget Recommender System</h5>
    </section>
    <section class="container bg-light text-primary">
        <p class="text-center">Hi {{user}}, please answer our questions to estimate your budget</p>
        <form method="post" action="/">
            <div class="row justify-content-center">
                <div class="col-6">
                    <div class="form-group">
                        <label for="q1">Qn 1</label>
                        <input type="text" class="form-control" id="q1" placeholder="Question" name='q1'>
                    </div>
                    <div class="form-group">
                        <label for="q2">Qn 2</label>
                        <input type="text" class="form-control" id="q2" placeholder="Question" name='q2'>
                    </div>
                    <div class="form-group">
                        <label for="inputState">Drop Down</label>
                        <select id="inputState" class="form-control" name='q3'>
                            <option selected>Choose...</option>
                            <option>Option A</option>
                            <option>Option B</option>
                            <option>Option C</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="q4">Budget to Convenience</label>
                        <div class="slidecontainer">
                            <input type="range" min="1" max="3" class="slider" id="q4" name='q4'>
                            <h2 id="disp"></h2>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary">Submit Details</button>
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