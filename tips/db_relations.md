# DB Relations explain easy

## One-to-Many Relationship

This is the most common type of relationship used.

In this type of relationship, a row in table A can have many matching rows in table B, but a row in table B can have only one matching row in table A.

## Many-to-Many Relationship

Row in table A can have many matching rows in table B and vice versa, one can also maintain such a relationship by defining a third table, called a junction table, whose primary key consists of the foreign keys from both table A and table B. (this might not be really required).

## One-to-One Relationship

Row in table A can have no more than one matching row in table B and vice versa. A one-to-one relationship is created if both of the related columns are primary keys or have unique constraints.
