-- 1. View Menu Item List Admin (TYUC001)-
-- a. Frame insert scripts to add data into menu_item table. Refer View Menu
-- Item List Admin screen below for sample data.

	CREATE TABLE menu_items(Names varchar(20),
					Price varchar(20),
					Active varchar(3),
					DateofLaunch varchar(20),
					Category varchar(20),
					FreeDelivery varchar(20),
					Actions varchar(20),
					id int NOT NULL AUTO_INCREMENT,
					Primary key (id));


-- Insert table

	insert into menu_item(Names,Price,Active,DateofLaunch,Category,FreeDelivery,Actions) 
			values("Sandwich","Rs.99.00","Yes","15/03/2017","Main Course","Yes","Edit"),
				  ("Burger","Rs.129.00","Yes","23/12/2017","Main Course","No","Edit"),
				  ("Pizza","Rs.149.00","Yes","21/08/2017","Main Course","No","Edit"),
				  ("French Fries","Rs.57.00","No","02/07/2017","Starters","Yes","Edit"),
				  ("Chocolate Brownie","Rs.32.00","Yes","02/11/2022","Dessert","Yes","Edit");

-- b. Frame SQL query to get all menu items

	select * from menu_item;



-- 2 View Menu Item List Customer (TYUC002)

	create table customer(cust_name varchar(20),cust_id int, cust_phone varchar(20));
	insert into customer(cust_name,cust_id,cust_phone) values("Spidy",1,9546367896),("Ram",2,5647894555),("Prashant",3,2222222222);

-- 	a. Frame SQL query to get all menu items which after launch date and is
-- 	active.

	select * from menu_items
		where Active="Yes" AND DateofLaunch >= "15/03/2017";


-- 	3. Edit Menu Item (TYUC003)
-- 	a. Frame SQL query to get a menu items based on Menu Item Id
		select menu_items.Names from menu_items where id > 2;

-- 	b. Frame update SQL menu_items table to update all the columns values
-- 	based on Menu Item Id
		update menu_items 
		set Names="Sanwich+",Price="Rs.720.00",Active="Yes",DateofLaunch="18/12/2020",Category="Delight Starters",FreeDelivery="No"
		where id=1;


-- 4. Add to Cart (TYUC004)
	create table cart(Item varchar(20),Quantity int,Price varchar(20),Total varchar(20),menu_id int,customer_id int,
 	FOREIGN KEY (menu_id) REFERENCES menu_items (id)
	);
-- 	a. Frame insert scripts for adding data into user and cart tables.In user table
-- 	create two users. Once user will not have any entries in cart, while the
-- 	other will have at least 3 items in the cart.

		insert into customer(cust_name,cust_id,cust_phone) values("Rohan",4,"9546487856"),("Mosh",5,"9548764545");
		insert into cart(Item,Quantity,Price,Total,menu_id,customer_id)
 		values("Sandwich+",5,"Rs.99.00","Rs.495.00",1,5),
		("Burger",2,"Rs.129.00","Rs.258.00",2,5),
		("Pizza",1,"Rs.149.00","Rs.149.00",3,5);
		
-- 5. View Cart (TYUC005)
-- 	a. Frame SQL query to get all menu items in a particular user’s cart

		select * from menu_items join cart on menu_items.id = cart.menu_id;

-- 	b. Frame SQL query to get the total price of all menu items in a particular
-- 	user’s cart

		select sum(menu_items.price) from menu_items join cart on menu_items.id=cart.menu_id;

-- 6. Remove Item from Cart (TYUC006)
-- 	a. Frame SQL query to remove a menu items from Cart based on User Id
-- 	and Menu Item Id
        delete from cart where menu_id=1;
		delete from cart where menu_id=1; 
