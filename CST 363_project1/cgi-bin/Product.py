# Brian Sheridan
#Assignment part 2
# Product.py
# this file must be in the /cgi-bin/ directory of the server
import cgitb , cgi
import mysql.connector
cgitb.enable()
form = cgi.FieldStorage()
#
# retrieve input values
product_name = form["product_name"].value
product_description = form["product_description"].value
submit = False

if "submit" in form:
    submit=True

#

print("Content-Type: text/html")    # HTML is following
print()                             # blank line required, end of headers
print("<html><body>")


product_name_sql = 'select product_name from product_type where product_name = %s'
insert_sql = 'insert into product_type (product_id, product_name, product_description) values (DEFAULT, %s, %s)'


# connect to database
cnx = mysql.connector.connect(user='root',
                                password='sesame',
                                database='mrs_project1',
                                host='127.0.0.1')

 
#  code to do SQL goes here

cursor = cnx.cursor()
cursor.execute(product_name_sql,[product_name])
row = cursor.fetchone()
if row is None and submit is True:
    cursorb = cnx.cursor()
    cursorb.execute(insert_sql, (product_name, product_description))
    cnx.commit()
elif row is not None and submit is True:
    # retrieve visits value from table and increment
    print('Duplicate Entry')

print("</body></html>")
cnx.commit()
cnx.close()  # close the connection 
