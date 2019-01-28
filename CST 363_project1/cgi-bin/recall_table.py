# Brian Sheridan Samuel Pearce
# Assignment part 2
# Recall.py
# this file must be in the /cgi-bin/ directory of the server
import cgitb , cgi
import mysql.connector

cgitb.enable()
form = cgi.FieldStorage()
# retrieve input values
print("Content-Type: text/html")    # HTML is following
print()                             # blank line required, end of headers

row_format = '<tr><td>{0}</td><td>{1}</td><td>{2}</td><td>{3}</td><td>{4}</td></tr>'
page_template = '''
<html>
<title>Recall Notices</title>
<body>
<table border = "1">
<tr><th>Notice ID</th><th>Product ID</th><th>Affected Start Date</th><th>Affected End Date</th><th>Issue Description</th>
</tr>
{0}
</table>
</body>
</html>
'''
select_sql = "SELECT notice_id, product_id, affected_start_date, affected_end_date, issue_description FROM recall_notices"
page_contents = ""

cnx = None

try:
    cnx = mysql.connector.connect(user='root',
                                  password='sesame',
                                  database='mrs_project1',
                                  host='127.0.0.1')
    cursor = cnx.cursor()
    cursor.execute(select_sql)
    rows = cursor.fetchall()
    for row in rows:
        page_contents += row_format.format(row[0], row[1], row[2], row[3], row[4])
    print(page_template.format(page_contents))
    print('<a href="/recall.html">Back to Creating another Recall</a><br/>')
    print('<a href="/homepage.html">Home Page</a>')
except mysql.connector.Error as err:
    print("ERROR", err)
finally:
    if(cnx):
        cnx.close()
