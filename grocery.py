product_names    = ["Rice", "Wheat Flour", "Milk", "Cheese", "Apple", "Banana", "Soap", "Shampoo"]
product_category = ["Grains", "Grains", "Dairy", "Dairy", "Fruits", "Fruits", "Personal Care", "Personal Care"]
product_price    = [60, 40, 25, 120, 150, 50, 35, 180]
product_stock    = [100, 100, 50, 30, 40, 60, 80, 25]

total_revenue = 0
sold_quantity = [0, 0, 0, 0, 0, 0, 0, 0]

category_list = ["Grains", "Dairy", "Fruits", "Personal Care"]
category_sales = [0, 0, 0, 0]


def show_catalog():
    print("\n--- PRODUCT CATALOG ---")
    print("Name", "\t", "Category", "\t", "Price", "\t", "Stock")
    for i in range(len(product_names)):
        print(product_names[i], "\t", product_category[i], "\t", product_price[i], "\t", product_stock[i])


def find_product_index(name):
    for i in range(len(product_names)):
        if product_names[i] == name:
            return i
    return -1


def process_order(customer_name, order_items, order_qty):
    global total_revenue

    print("\n--- Processing order for", customer_name, "---")

    subtotal = 0
    billed_items = []
    billed_qty = []
    billed_line_total = []

    for i in range(len(order_items)):
        item_name = order_items[i]
        qty = order_qty[i]

        index = find_product_index(item_name)

        if index == -1:
            print("  Skipped:", item_name, "- not found in catalog")
            continue

        if qty <= 0:
            print("  Skipped:", item_name, "- invalid quantity")
            continue

        if qty > product_stock[index]:
            print("  Skipped:", item_name, "- not enough stock (have", product_stock[index], ")")
            continue

        price = product_price[index]
        line_total = price * qty

        if qty > 10:
            line_total = line_total * 0.95

        subtotal = subtotal + line_total

        billed_items.append(item_name)
        billed_qty.append(qty)
        billed_line_total.append(line_total)

    if len(billed_items) == 0:
        print("  No valid items in this order.")
        return

    discount = 0
    if subtotal > 1000:
        discount = subtotal * 0.10
        subtotal = subtotal - discount

    gst = subtotal * 0.05
    final_total = subtotal + gst

    for i in range(len(billed_items)):
        item_name = billed_items[i]
        qty = billed_qty[i]
        index = find_product_index(item_name)

        product_stock[index] = product_stock[index] - qty
        sold_quantity[index] = sold_quantity[index] + qty

        item_category = product_category[index]
        cat_index = category_list.index(item_category)
        category_sales[cat_index] = category_sales[cat_index] + billed_line_total[i]

    total_revenue = total_revenue + final_total

    print("\n  BILL for", customer_name)
    for i in range(len(billed_items)):
        print("   ", billed_items[i], "x", billed_qty[i], "=", round(billed_line_total[i], 2))
    print("  Discount (if bill > 1000):", round(discount, 2))
    print("  GST (5%):", round(gst, 2))
    print("  FINAL TOTAL:", round(final_total, 2))


def generate_insights():
    print("\n=== SALES INSIGHTS ===")
    print("Total Revenue:", round(total_revenue, 2))

    max_index = 0
    for i in range(len(sold_quantity)):
        if sold_quantity[i] > sold_quantity[max_index]:
            max_index = i

    if sold_quantity[max_index] > 0:
        print("Most Sold Product:", product_names[max_index], "(", sold_quantity[max_index], "units )")
    else:
        print("Most Sold Product: None sold yet")

    print("\nCategory-wise Sales:")
    for i in range(len(category_list)):
        print(" ", category_list[i], ":", round(category_sales[i], 2))

    print("\nRemaining Stock:")
    for i in range(len(product_names)):
        print(" ", product_names[i], ":", product_stock[i])


show_catalog()

process_order("Amit", ["Rice", "Milk", "Soap"], [12, 4, 2])
process_order("Priya", ["Cheese", "Apple", "Shampoo"], [5, 6, 1])
process_order("Ravi", ["Banana", "Wheat Flour", "Rice"], [15, 3, 200])

generate_insights()
