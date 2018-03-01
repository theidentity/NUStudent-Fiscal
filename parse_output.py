import re


def get_dictionary(content):
	items = re.findall(r'\{.*?\}',content)
	items = [item[2:-2] for item in items]

	table = {}
	for item in items:
		line = item.split(':')
		left = line[0][:-1]
		right = line[-1]
		table[left] = str(right)
	
	print table
	return table

# content = open('content').read()
# get_table(content)