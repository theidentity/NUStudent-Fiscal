
#!/usr/bin/env python

import os
from bottle import route, run, static_file, template, view


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


if __name__ == "__main__":
	port = int(os.environ.get("PORT", 5000))
	run(
	host='localhost',
	port=port,
	debug=True,
	reloader = True
	)
