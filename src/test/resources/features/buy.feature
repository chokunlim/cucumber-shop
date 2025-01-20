Feature: Buy products
    As a customer
    I want to buy products

Background:
    Given the store is ready to service customers
    And a product "Bread" with price 20.50 and stock of 5 exists
    And a product "Jam" with price 80.00 and stock of 10 exists
    And a product "Milk" with price 30.00 and stock of 6 exists

Scenario: Buy one product
    When I buy <product> with quantity <quantity>
        Then total should be <total>
        Examples:
            | product  | quantity |  total  |
            | "Bread"  |     1    |   20.50 |
            | "Jam"    |     2    |  160.00 |
            | "Milk"   |     1    |   30.00 |

Scenario: Buy multiple products (2)
    When I buy "Bread" with quantity 2
    And I buy "Jam" with quantity 1
    Then total should be 121.00

Scenario: Buy multiple products (3)
    When I buy "Bread" with quantity 1
    And I buy "Jam" with quantity 1
    And I buy "Milk" with quantity 1
    Then total should be 130.50

Scenario: The quantity exceeds the available stock
    When I buy "Bread" with quantity 10
    Then an exception should be thrown

