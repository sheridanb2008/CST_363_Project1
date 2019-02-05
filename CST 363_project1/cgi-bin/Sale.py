# Brian Sheridan Samuel Pearce
#Assignment part 2
# Sale.py
# this file must be in the /cgi-bin/ directory of the server
import cgitb , cgi
import mysql.connector
import datetime
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
email_address = form["email"].value
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
get_customer_id = 'select customer_id from customer_info where first_name = %s and last_name = %s and email = %s'
insert_product_sql = 'insert into products values (%s, %s, %s)'
insert_customer_sql = 'insert into customer_info values (DEFAULT, %s, %s, %s, %s, %s, %s, %s, %s)'
insert_purchase_sql = 'insert into customer_purchases values (DEFAULT,%s,%s,%s)'
return_Serial_used =  '''select p.serial_number, pt.product_name, (select  ci.first_name  
		                from customer_info ci, customer_purchases cp 
                        where ci.customer_id = cp.customer_id and cp.serial_number = %s ),  (select  ci.last_name  
		                from customer_info ci, customer_purchases cp 
                        where ci.customer_id = cp.customer_id and cp.serial_number = %s )
                        from products p, product_type pt 
                        where p.product_id = pt.product_id and serial_number = %s'''

# connect to database
cnx = mysql.connector.connect(user='root',
                                password='sesame',
                                database='mrs_project1',
                                host='127.0.0.1')

 
#  code to do SQL goes her
cursor = cnx.cursor()
cursor.execute(product_serial_sql,[serial])
row = cursor.fetchone()
if row is None and submit is True:
    cursorb = cnx.cursor()
    cursorb.execute(product_type_sql, [product_type])
    row = cursorb.fetchone()
    if int(product_type) == row[0]:
        # insert product info into database
        cursorc = cnx.cursor()
        cursorc.execute(insert_product_sql, (serial,product_type,manufacture_date))
        cnx.commit()
        # insert customer info into database
        cursord = cnx.cursor()
        cursord.execute(insert_customer_sql, (first_name,last_name,street_address,city,state,zip_code,phone_number,email_address))
        cnx.commit()
        # get customer_id from database database
        cursore = cnx.cursor()
        cursore.execute(get_customer_id, (first_name,last_name,email_address))
        id = cursore.fetchone()
        #customer_id = 4
        cnx.rollback()
        # insert invoice into database
        today = datetime.datetime.today().strftime('%Y-%m-%d')
        cursori = cnx.cursor()
        cursori.execute(insert_purchase_sql, (today,id[0],serial))
        cnx.commit()
        print('Your invoice has been added')
    else:
        print('Incorrect product type. Enter a different product type or add product type to the system ')
else:
    # retrieve visits value from table and increment
    cursore = cnx.cursor()
    cursore.execute(return_Serial_used, (serial,serial,serial))
    id = cursore.fetchone()
    print('The serial number ',id[0],' you enter has already been used and registered to: ',id[2],' ', id[3],'for a ',id[1])

print("</body></html>")
cnx.close()  # close the connection 
