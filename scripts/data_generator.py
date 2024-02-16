import pandas as pd
from faker import Faker
import random
import datetime

# Initialize Faker
fake = Faker()

# Data generation functions 
def generate_order_id():
    return random.randint(10000, 99999)


def generate_item_data(categories, subcategories, product_names, unit_prices, vendors, vendor_details):

    category = random.choice(categories)
    subcategory = random.choice(subcategories[category])
    product_name = random.choice(product_names[subcategory])
    unit_price = unit_prices[product_name]
    vendor = vendors[subcategory]
    vendor_phone = vendor_details[vendor]['phone']
    vendor_rating = vendor_details[vendor]['rating']

    return (category, subcategory, product_name, unit_price, vendor, vendor_phone, vendor_rating)



categories = ['Fruits', 'Vegetable', 'Groceries']
subcategories = {
    'Fruits': ['Citrus', 'Nuts', 'Berries'],
    'Vegetable': ['Root', 'Leafy', 'Stem', 'Allium'],
    'Groceries': ['Salt', 'Soap', 'Toothpaste', 'Biscuits']
}
product_names = {
    'Salt': ['Great Table Salt', 'Yummy Rock Salt', 'Free Flow Pizza', 'Iodized for Health'],
    'Soap': ['Dove', 'Pears', 'Lux', 'Cinthol'],
    'Toothpaste': ['Colgate', 'Pepsudent', 'Crest', 'DaburLal'],
    'Biscuits': ['ParleG', 'HidenSeek', 'Horlics', '50-50'],
    'Root': ['Potato', 'Onion'],
    'Leafy': ['Spinech', 'Methi'],
    'Stem': ['Celery', 'Asparagus'],
    'Allium': ['garlic', 'shallot'],
    'Citrus': ['Orange', 'Mandarin', 'lime'],
    'Nuts': ['Apricot', 'Almond', 'Cashew'],
    'Berries': ['BlueBerries', 'RaspBerries', 'StrawBerries']
}
unit_prices = {
    'Great Table Salt': 12,
    'Yummy Rock Salt': 9,
    'Free Flow Pizza': 15,
    'Iodized for Health': 6,
    'Dove': 9,
    'Pears': 8,
    'Lux': 5,
    'Cinthol': 6,
    'Colgate': 22,
    'Pepsudent': 33,
    'Crest': 58,
    'DaburLal': 42,
    'ParleG': 3,
    'HidenSeek': 19,
    'Horlics': 11,
    '50-50': 7,
    'Potato': 4,
    'Onion': 7,
    'Spinech': 3,
    'Methi': 4,
    'Celery': 5,
    'Asparagus': 3,
    'garlic': 14,
    'shallot': 13,
    'Orange': 42,
    'Mandarin': 43,
    'lime': 11,
    'Apricot': 120,
    'Almond': 136,
    'Cashew': 165,
    'BlueBerries' : 123,
    'RaspBerries': 321,
    'StrawBerries': 111
}
vendors = {
    'Salt': 'Salt Company X',
    'Soap': 'United Soap company',
    'Toothpaste': 'Best Toothpaste pvt ltd',
    'Biscuits': 'Yummy Biscuits Co',
    'Root': 'Ground Corporations',
    'Leafy': 'Green World',
    'Stem': 'Solid Stem inc',
    'Allium': 'Allium helium pte ltd',
    'Citrus': 'Health fruits',
    'Nuts': 'Hard Nut Unlimited',
    'Berries': 'Mr Berry Straw'
}

vendor_details = {
    'Salt Company X': {'phone': '123.456.7890', 'rating': '4.9'},
    'United Soap company': {'phone': '234.456.1234', 'rating': '3.9'},
    'Best Toothpaste pvt ltd': {'phone': '333.456.7890', 'rating': '3.4'},
    'Yummy Biscuits Co': {'phone': '444.456.7890', 'rating': '4.3'},
    'Ground Corporations': {'phone': '555.456.7890', 'rating': '4.1'},
    'Green World': {'phone': '123.111.7890', 'rating': '1.1'},
    'Solid Stem inc': {'phone': '123.000.8888', 'rating': '2.1'},
    'Allium helium pte ltd': {'phone': '123.456.6666', 'rating': '3.6'},
    'Health fruits': {'phone': '123.456.3333', 'rating': '4.6'},
    'Hard Nut Unlimited': {'phone': '123.456.3333', 'rating': '4.5'},
    'Mr Berry Straw': {'phone': '123.555.3333', 'rating': '3.5'},
}


def generate_sale_date():
    start_date = datetime.date(2022, 1, 1)
    end_date = datetime.date(2023, 12, 31)
    return fake.date_between_dates(start_date, end_date)


def generate_rand_date():
    start_date = datetime.date(2022, 1, 1)
    end_date = datetime.date(2023, 12, 31)
    return fake.date_between_dates(start_date, end_date)

def generate_returned_date (order_status, sale_date):
    end_date = datetime.date(2023, 12, 31)
    if order_status == 'returned':
        return fake.date_between_dates(sale_date, end_date)
    else:
        return None

def generate_customer():
    customers = [
        {'name': 'Jane Doe',        'email': 'jane.doe@email.com',               'shippingaddress': '123 Main St. Anytown',                                     'billingaddress': '123 Main St. Anytown'},                                               
        {'name': 'Bob Smith',       'email': 'bob.smith@email.com',              'shippingaddress': '45 Oak Ave. Somecity',                                     'billingaddress': '45 Oak Ave. Somecity'},                                              
        {'name': 'Jane Doe',        'email': 'jane.doe@email.com',               'shippingaddress': '123 Main St. Anytown',                                     'billingaddress': '123 Main St. Anytown'},                                               
        {'name': 'David Spencer',   'email': 'jonathan76@santos.com',            'shippingaddress': '631 Hines Drive Kirstenburgh ND 19567',                    'billingaddress': '631 Hines Drive Kirstenburgh ND 19567'},                          
        {'name': 'Brandon Bell',    'email': 'hunter88@hotmail.com',             'shippingaddress': '437 Lauren Falls Suite 112 Rodriguezport AK 56234',        'billingaddress': '437 Lauren Falls Suite 112 Rodriguezport AK 56234'},      
        {'name': 'Jamie Martinez',  'email': 'scottchristina@hotmail.com',       'shippingaddress': '7115 Smith Plains Apt. 692 West Danielchester FL 1234',    'billingaddress': '7115 Smith Plains Apt. 692 West Danielchester FL 1234'}, 
        {'name': 'James Knight',    'email': 'dbrown@hotmail.com',               'shippingaddress': '91572 Joyce Fort New Ryan AR 18441',                       'billingaddress': '91572 Joyce Fort New Ryan AR 18441'},                        
        {'name': 'Gerald Brown',    'email': 'hudsonmadison@yahoo.com',          'shippingaddress': '59013 Gutierrez Lake Jenniferport NE 28083',               'billingaddress': '59013 Gutierrez Lake Jenniferport NE 28083'},                      
    ]

    return random.choice(customers)

# Generate Data
num_rows = 500  # Customize the number of rows
data = []
for _ in range(num_rows):
    (category, subcategory, product_name, unit_price, vendor, vendor_phone, vendor_rating) = generate_item_data(categories, subcategories, product_names, unit_prices, vendors, vendor_details)
    sale_date = generate_sale_date()
    order_status = random.choice(['shipped', 'placed', 'returned'])
    returned_date = generate_returned_date(order_status, sale_date)
    customer = generate_customer()
    quantity_sold = random.randint(1, 10)

    row = [
        generate_order_id(),
        random.randint(1, 20),  # Product ID
        random.randint(100, 500),  # Customer ID
        random.randint(1, 15),  # Vendor ID
        sale_date, # Sale Date
        # Quantity Sold
        unit_price, # Product Selling Price
        quantity_sold,
        unit_price * quantity_sold,
        order_status, # Order Status
        returned_date, # Returned Date,
        product_name,
        category,
        subcategory,
        customer['name'], 
        customer['email'], 
        customer['shippingaddress'], 
        customer['billingaddress'],
        vendor,
        vendor_phone,
        vendor_rating

    ]
    data.append(row)


#Create DataFrame
df = pd.DataFrame(data, columns=[ 
    'orderid', 
    'productid',   
    'customerid',  
    'vendorid',    
    'sale_date',   
    'quantitysold',  
    'productsellingprice', 
    'totalsale',
    'orderstatus', 
    'returndate',  
    'productname', 
    'category',    
    'subcategory', 
    'customername',    
    'customeremail',   
    'shippingaddress', 
    'billingaddress',  
    'vendorname',  
    'vendorphone', 
    'vendorrating'
])

# Optional: Save to CSV
df.to_csv('hypothetical_sales_data.csv', index=False) 



