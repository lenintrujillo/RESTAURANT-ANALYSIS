# RESTAURANT-ANALYSIS
The project analyzes "Sabores del Mundo" restaurant data to identify popular and unpopular menu items. It involves database creation, exploring menu_items and order_details tables, and performing a LEFT JOIN. The goal is to derive five key insights for optimizing the new menu.

## OVERVIEW 

This SQL exercise is based on a fictional restaurant called "Sabores del Mundo", which launched a new menu and collected data on customer orders. The goal is to analyze this data using SQL to find out which menu items are most and least popular. The tasks include exploring two tables (menu_items and order_details), answering specific questions about prices and orders, joining the tables to combine insights, and finally creating custom queries to identify five useful recommendations for improving the menu.

## DATASET DESCRIPTION


**Column Name**	      |**Description**

### **1. menu_items Table**
Contains information about the items available on the restaurant's menu.

  **menu_item_id**  | Unique ID for each menu item.

  **item_name**     | Name of the dish.

  **category**      | Type of dish (e.g., American, Italian, etc.).

  **price**         | Cost of the item.

### **2. order_details Table**
Stores records of customer orders, showing which items were ordered and when.

  **order_details_id**    | Unique ID for an item in an order.

  **order_id**            | Unique ID for each customer order.

  **item_id**             | Refers to the menu_item_id in the menu_items table.

  **order_date**          | Date when the order was placed.

  **order_time**          | Time when the order was placed.

## RESULTS
1. Top 5 most ordered products

![image](https://github.com/user-attachments/assets/11eb9510-2bc9-4f82-a47a-44b3a7684bdb)

2. Menu products

![image](https://github.com/user-attachments/assets/3c8f8dc4-ab43-4ce6-9904-565dbcfaa96f)

3. Most economic product on the menu

![image](https://github.com/user-attachments/assets/44c23696-1ced-4ca2-9a6e-a644181e5336)

4. Most expensive product on the menu

![image](https://github.com/user-attachments/assets/7b3d4598-db16-4654-af03-32cd4e369009)




