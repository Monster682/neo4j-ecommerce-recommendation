
// Create Users
CREATE (:User {name:"Vaibhav"}),
       (:User {name:"Akash"});

// Create Products
CREATE (:Product {name:"Laptop"}),
       (:Product {name:"Mouse"}),
       (:Product {name:"Headphones"});

// Create Purchases
MATCH (a:User {name:"Vaibhav"}), (l:Product {name:"Laptop"})
CREATE (a)-[:PURCHASED]->(l);

MATCH (b:User {name:"Akash"}), (h:Product {name:"Headphones"})
CREATE (b)-[:PURCHASED]->(h);

// Queries

// Query 1: Products purchased by Vaibhav
MATCH (u:User {name:"Vaibhav"})-[:PURCHASED]->(p:Product)
RETURN u.name, p.name;

// Query 2: Recommend products based on other users' purchases
MATCH (u1:User {name:"Vaibhav"})-[:PURCHASED]->(p:Product)<-[:PURCHASED]-(u2:User)-[:PURCHASED]->(rec:Product)
WHERE u1 <> u2
RETURN DISTINCT rec.name AS RecommendedProduct;

// Query 3: Products frequently bought together
MATCH (p1:Product)<-[:PURCHASED]-(u:User)-[:PURCHASED]->(p2:Product)
WHERE p1 <> p2
RETURN p1.name, p2.name, COUNT(*) AS frequency
ORDER BY frequency DESC;
