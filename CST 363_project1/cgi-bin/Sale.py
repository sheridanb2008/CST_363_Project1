# Brian Sheridan Samuel Pearce
#Assignment part 2
# Sale.py
# this file must be in the /cgi-bin/ directory of the server
import cgitb , cgi
import mysql.connector
cgitb.enable()
form = cgi.FieldStorage()
#
# retrieve input values
first_name = form["first"].value
last_name = form["last"].value
street_address = form["street"].value
city = form["city"].value
state = form["state"].value
zip_code = form["zip"].value
phone_number = form["phone"].value
email_adress = form["email"].value
serial = form["serial"].value
product_type = form["product"].value
manufacture_date = form["mdate"].value
submit = False

if "submit" in form:
    submit=True

#

print("Content-Type: text/html")    # HTML is following
print()                             # blank line required, end of headers
print("<html><body>")


product_serial_sql = 'select serial_number from products where serial_number = %s'
product_type_sql = 'select product_id from product_type where product_id = %s'
insert_product_sql = 'insert into products values (%s, %s, %s)'
insert_customer_sql = 'insert into customer_info values (DEFAULT, %s, %s, %s, %s, %s, %s, %s, %s)'

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
