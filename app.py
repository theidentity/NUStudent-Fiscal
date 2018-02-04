
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
	return dict(title='Questions to User',user='Balu',amount=100)
# -------------------VIEW END------------------------------

# -------------------DATA START----------------------------
@route('/',method="POST")
def recFacts():
	ans1 =request.forms.get('q1')
	ans2 =request.forms.get('q2')
	ans3 =request.forms.get('q3')
	facts = {'ans1':ans1,
	'ans2':ans2,
	'ans3':ans3
	}
	clips_connector.receiveFacts(facts)
	# return "This is our recommendation"
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
	port = int(os.environ.get("PORT", 5001))
	run(
	host='localhost',
	port=port,
	debug=True,
	reloader = True
	)
# -------------------MAIN END----------------------------
