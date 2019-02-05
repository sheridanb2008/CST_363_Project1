/* This SQL script allows the user to see what products are
   having the most recalls to decided if they want to discontinue
   the product
*/
SELECT p.product_name, COUNT(a.notice_id) AS total_recalls
FROM affected_recalls a, products p
WHERE a.serial_number = p.serial_number
GROUP BY p.product_name
ORDER BY total_recalls DESC;

/* This SQL script allows the user to see what states are
   having the most recalls. See if there is an issue
   in a manufacturing plant
*/
SELECT c.state, COUNT(a.notice_id) AS total_recalls
FROM customer_info c, affected_recalls a
WHERE c.customer_id = a.customer_id
GROUP BY c.state
ORDER BY total_recalls DESC;

/* This SQL script allows the user to see which customers have been 
   most effected by recalls. Allows for the company to reach out 
   to them.
*/
SELECT c.customer_name, c.address,c.city,c.state,c.zip, COUNT(a.notice_id) AS total_recalls
FROM customer_info c, affected_recalls a
WHERE c.customer_id = a.customer_id
GROUP BY c.customer_name
ORDER BY total_recalls DESC;

/* This SQL script allows the user to see which area of their product
   is having the most issues. Allows the company to focus an area they
   are having problem or find new parts that might be better suited.
*/
SELECT r.issue_description, COUNT(a.notice_id) AS total_recalls
FROM recall_notices r, affected_recalls a
WHERE r.notice_id = a.notice_id
GROUP BY r.issue_description
ORDER BY total_recalls DESC;

/* This SQL script allows the user to see what product class is 
   Having the most issues. Could help to find a correlation to 
   fix future products
*/
SELECT p.product_description, COUNT(a.notice_id) AS total_recalls
FROM affected_recalls a, products p
WHERE a.serial_number = p.serial_number
GROUP BY p.product_description
ORDER BY total_recalls DESC;