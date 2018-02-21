
#!/usr/bin/env python

import os
from bottle import route, run, static_file, template, view
from bottle import get, post, request
import clips_connector

# -------------------STATIC START----------------------------
@route('/css/<filename>')
def img_static(filename):
	return static_file(filename, root='./static/css')

@route('/img/<filename>')
def img_static(filename):
	return static_file(filename, root='./static/img')

@route('/js/<filename>')
def js_static(filename):
	return static_file(filename, root='./static/js')
# -------------------STATIC END----------------------------

# -------------------VIEW START----------------------------
@route("/")
@view("main")
def hello():
	question = clips_connector.getQuestion()
	return dict(title='Questions to User',user='Balu',amount=100,question=question)
# -------------------VIEW END------------------------------

# -------------------DATA START----------------------------
@route('/',method="POST")
def recFacts():
	facts = {}
	for name in request.forms:
		print(name)
		facts[name] = request.forms.get(name)
	clips_connector.receiveFacts(facts)
	return giveRecc()

# -------------------DATA END------------------------------

# -------------------REC START----------------------------
@route("/suggest")
@view("suggestions")
def giveRecc():
	amount = clips_connector.getEstimateAmount()
	return dict(title='Recommendations to User',user='Balu',amount=amount)

# -------------------REC END------------------------------


# -------------------MAIN START----------------------------
if __name__ == "__main__":
	port = int(os.environ.get("PORT", 5002))
	run(
	host='localhost',
	port=port,
	debug=True,
	reloader = True
	)
# -------------------MAIN END----------------------------
