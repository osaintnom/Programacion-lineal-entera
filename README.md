# Practical Work Assignment: Lot Sizing Model for Production Planning

The objective of this practical work is to propose a lot sizing model to plan production in a factory. The planning is monthly, aiming to determine the quantity to manufacture for each product in each month over the next 24 months. There are five products, and an estimation of the demand per product and month is provided (specified in Table 1). We assume that the quantities demanded for all products are in the same units. The planning is subject to the following constraints:

1. Each product has a maximum production capacity of 120 units per month.
2. Products must be manufactured in batches of 10 units each. Thus, the production of each product in each month must be a number belonging to the set {0, 10, 20, ..., 120}.
3. The warehouse has a total capacity of 900 units, among all products. Manufactured stock from one month can be stored to cover the demand for subsequent months.
4. At the start of the planning, there is no initial stock of any product.
5. The production cost per unit for each product is $370.

The objective of the planning is to determine the quantity to manufacture for each product in each month to meet demand while minimizing production costs. We assume there are no stock storage costs. Based on this description, the practical work consists of the following points:

1. Formulate and solve a mixed integer linear programming model for this problem with the objective of minimizing total production costs.
2. Suppose there is a production limit of 300 units per month (i.e., the total production across all products must not exceed 300 units monthly). How does the model change in this case? Can the total demand be met?
3. Additionally, suppose that in addition to the 300 units per month, we can outsource manufacturing up to 200 units per month at a cost of $540 per unit. How does the model change in this case? (Assuming we must meet all monthly demand).
4. Further suppose that we cannot outsource the manufacturing of any amount of each product arbitrarily. Instead, if the manufacturing of a product is outsourced in a month, at least 20 units of that product must be ordered in that month. How does the total cost change in this case?
5. The limit of 900 units in stock in the warehouse is too costly, and we need to reduce the available space in the warehouse. What is the minimum capacity of the warehouse that makes the problem feasible? Can this value be found without manually performing binary search?

Please refer to the practical work for further details and instructions on completing each task.


