# 🛒 Neo4j E-Commerce Recommendation System

This project demonstrates a simple **recommendation system** built with Neo4j.  
It models **Users**, **Products**, and their **Purchases** as a graph.  
Cypher queries are used to recommend products and find buying patterns.  

---

## 📌 Data Model
- **User** → shopper
- **Product** → item in the store
- **Relationships**: 
  - `(:User)-[:PURCHASED]->(:Product)`

---

## 🛠️ Sample Data

```cypher
// Users
CREATE (:User {name:"Alice"}), (:User {name:"Bob"});

// Products
CREATE (:Product {name:"Laptop"}), (:Product {name:"Mouse"}), (:Product {name:"Headphones"});

// Purchases
MATCH (a:User {name:"Alice"}), (l:Product {name:"Laptop"})
CREATE (a)-[:PURCHASED]->(l);

MATCH (b:User {name:"Bob"}), (h:Product {name:"Headphones"})
CREATE (b)-[:PURCHASED]->(h);
