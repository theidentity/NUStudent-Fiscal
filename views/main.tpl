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
    <!-- 	<h1>Hello {{user}}</h1>
	<div class="amount">
		<p>The amount you have to pay is {{amount}}</p>
	</div> -->
    <section class="jumbotron text-center bg-info text-white">
        <h1 class="heading">Pocket-Me</h1>
        <h5>Intelligent Rule Based Budget Recommender System</h5>
    </section>
    <section class="container bg-light text-primary">
        <p class="text-center">Please answer our questions to estimate your budget</p>
        <form>
            <div class="row justify-content-center">
                <div class="col-6">
                    <div class="form-group">
                        <label for="q1">Qn 1</label>
                        <input type="text" class="form-control" id="q1" placeholder="Question">
                    </div>
                    <div class="form-group">
                        <label for="q2">Qn 2</label>
                        <input type="text" class="form-control" id="q2" placeholder="Question">
                    </div>
                    <div class="form-group">
                        <label for="inputState">Drop Down</label>
                        <select id="inputState" class="form-control">
                            <option selected>Choose...</option>
                            <option>Option</option>
                            <option>Option</option>
                            <option>Option</option>
                            <option>Option</option>
                        </select>
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
</body>

</html>