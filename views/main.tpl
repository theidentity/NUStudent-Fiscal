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

<body >
<div class="navbar-fixed-left" style="background:#f46524;width: 5px;position: fixed;border-radius: 0;height: 100%;"></div>
         <div class="text-center">
	<h1 class="text-warning"><br/><span style="color:#f46524">NU$</span><span class="text-info">tudent</span> Fiscal</h1><h5><small class="text-secondary">An Intelligent Budget Recommendation System for NUS Students</small></h5>
	</div>
            <div class="row container mx-auto vertical-space">
</div>
    <section class="text-primary container mx-auto">
        <form method="post" action="/">
            <div class="container row bg-light">
		<div class="col-12">
                    <div class="question-box" style="margin-left:35%">
			<div class="text-justify">
                        <p class="question text-info">{{!question}}</p>
			</div>
                    </div>
		</div>
		<div class="answer-box" style="width:100%; margin-left:40%;">
                        <input type="submit" name="opt1" value="{{opt1}}" class="btn btn-md btn-info {{" hide " if opt1 is None else " "}}"/>
                        <input type="submit" name="opt2" value="{{opt2}}" class="btn btn-md btn-info {{" hide " if opt2 is None else " "}}"/>
                        <input type="submit" name="opt3" value="{{opt3}}" class="btn btn-md btn-info {{" hide " if opt3 is None else " "}}"/>
		</div>
            </div>
                    <input type="submit" name="restart" value="Restart" class="btn btn-lg bg-warning btn-block" style="position:fixed; bottom: 15px; right:15px; width:100px;" />
        </form>
    </section>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/jquery-3.2.1.slim.min.js"></script>
    <script src="/js/popper.min.js"></script>
    <script src="/js/slider.js"></script>
</body>

</html>
