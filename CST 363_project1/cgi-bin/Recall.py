# Brian Sheridan Samuel Pearce
# Assignment part 2
# Recall.py
# this file must be in the /cgi-bin/ directory of the server
import cgitb , cgi
import mysql.connector

cgitb.enable()
form = cgi.FieldStorage()
# retrieve input values
product_id = form["product_id"].value
affected_start_date = form["affected_start_date"].value
affected_end_date = form["affected_end_date"].value
issue_description = form["issue_description"].value
submit = False

if "submit" in form:
    submit=True

print("Content-Type: text/html")    # HTML is following
print()                             # blank line required, end of headers
print('<TITLE>Recall Notices</TITLE>')
get_recall_sql = 'select notice_id from recall_notices where product_id = %s and affected_start_date = %s and affected_end_date = %s and issue_description = %s'
product_id_sql = 'select product_id from product_type where product_id = %s'
insert_sql = 'insert into recall_notices (notice_id, product_id, affected_start_date, affected_end_date, issue_description) values (DEFAULT, %s, %s, %s, %s)'

# connect to database
try:
    cnx = mysql.connector.connect(user='root',
                                password='sesame',
                                database='mrs_project1',
                                host='127.0.0.1')
    cursor = cnx.cursor()
    cursor.execute(get_recall_sql,(product_id,affected_start_date,affected_end_date,issue_description))
    row = cursor.fetchone()
    if row is None:
        cursora = cnx.cursor()
        cursora.execute(product_id_sql,[product_id])
        row = cursora.fetchone()    
        if row[0] == int(product_id) and submit is True:
            cursorb = cnx.cursor()
            cursorb.execute(insert_sql, (product_id, affected_start_date, affected_end_date, issue_description))
            cnx.commit()
            print('Thank you for submitting the recall')
    elif row is not None and submit is True:
            print('That Recall Already Exists!')
       
except mysql.connector.Error as err:
    print ("ERROR", err)
cnx.close()  # close the connection 
