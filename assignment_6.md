### Q1. Determine the highest normal form of this relation scheme.
The relation scheme student Performance (StudentName, CourseNo, EnrollmentNo, Grade) has
the following functional dependencies:
StudentName, courseNo → grade
EnrollmentNo, courseNo → grade
StudentName →EnrollmentNo
EnrollmentNo →StudentName

##### solution
lets take shortforms of these attributes StudentName, CourseNo, EnrollmentNo, Grade as S,C,E,G respectively 
for solving the question .

we have the relation R(S,C,E,G)
we have the Functional dependencies as  
{SC->G,EC->G,S->E,E->S}

##### 1.finding the candidate keys using closure method 

SC +={S,C,G,E} 
S +={S,E}
C +={C}  
so 
{SC} is a candidate key
S is determined by E, so checking for 
{EC} +={E,C,G,S};
E +={E,S}
so {SC} and {EC} are candidate keys
 ##### prime attributes- 
 S,C,E
##### non prime attributes -
G
##### checking for normal forms by putting the conditions -

##### for BCNF
left hand side of all functional dependencies should be candidate key or super key.
##### for 3NF
left hand side should be candidate key or right hand side should be prime attribute .
##### for 2NF
when left hand side is a proper subset of any candidate key and right hand side is a non prime attribute , this is called partial dependency.
there should be no pertial dependency

##### for 1NF
all the fields should have atomic values (if values are not mentioned, the relation is assumed to be in 1NF)

| Normal form | SC->G | EC->G | S->E | E->S |
|-------------|-------|-------|------|------|
| BCNF        | yes   | Yes   | No   | No   |
| 3NF         | Yes   | Yes   | Yes  | Yes  |

since, the relation is already in **3NF** , we don't need to check for 
conditions of 2NF and 1NF.  

### Q2. Suppose you are given a relation R= (A, B, C, D, E ) with the  following functional dependencies:{CE →D, D→B, C →A}

### a. Find all candidate keys.
Given R=(A,B,C,D,E)
F.D : {CE->D,D->B,C->A}
CE += {C,E,D,B,A}
C += {C,A}
A += {A}
so {CE} is a candidate key
D += {D,B}
B += {B}
E += {E}
so CD={C,A,D,B}
hence {C,A} and {C,D} are candidate keys.

### b. Identify the best normal form that R satisfies (1NF, 2NF, 3NF, or BCNF).
since ,
prime attributes - C,E,D
non prime attributes -A,B

we can make the following normalization table (with the help of constraints provided above) :

| Normal form | CE->D | D->B  | C->A | 
|-------------|-------|-------|------|
| BCNF        | yes   | No    | No   | 
| 3NF         | Yes   | No    | No   | 
| 2NF         | Yes   | No    | No   | 

So , the relation is in **1NF**

### c. If the relation is not in BCNF, decompose it until it becomes BCNF. At each step, identify a new relation, decompose and re-compute the keys and the normal forms they satisfy

The above relation can be decomposed into three relations
R1(CE->D)
R2(D->B)
R3(C->A)

since CE,D & C are candidate keys the the above relations , these relations are already in BCNF and there is no need of further decomposition.
 
### Q3. You are given the following set F of functional dependencies for relation R(A, B, C, D, E, F):
### F={ABC →D, ABD→E,CD→F,CDF →B,BF →D}
### a. Find all keys of R based on these functional dependencies.

after computing all the keys , the final candidate keys are :
ABC =+= {A,B,C,D,F,E}
A +={A}
B+={B}
C+={C}
AB+={A,B}
BC+={B.C}
since no subset of ABC is a cadidate key , ABC is a candidate key.
similary , after computing , the other candidate keys are:
{A,B,C} ,{A,C,D,F} ,{A,C,D,E}

prime attributes : {A,B,C,D,E,F}
non prime attributes : There are no non prime attributes .

### b. Is this relation in Boyce-Codd Normal Form? Is it 3NF? Explain your answers.
based upon the above data we can make the following normalization table:

| Normal form | ABC->D | ABD->E | CD->F | CDF->B | BF->D|
|-------------|--------|--------|-------|--------|------|
| BCNF        | yes    | No     | No    | No     | No   |
| 3NF         | Yes    | Yes    | Yes   | Yes    | Yes  |

The relation is in **3NF** because , D,E,F,B,B,D all the attributes on the right hand side meet this condition :
*left hand side should be candidate key or right hand side should be prime attribute .*
which means that there are no transitive dependencies.

### Q4.Write the advantages and disadvantages of normalization**
##### Advantages of Normalization:

**1.Data Integrity:** Normalization helps in maintaining data integrity by eliminating data redundancy and inconsistencies. Each piece of data is stored in only one place, reducing the chances of data inconsistencies and update anomalies.

**2.Efficient Data Storage:** Normalization reduces data redundancy by organizing data into separate tables and using relationships. This results in efficient data storage as each piece of data is stored only once, leading to optimized disk space usage.

**3.Improved Query Performance:** Normalization allows for more efficient querying of data. With properly designed tables and relationships, queries can be written to retrieve specific data without scanning unnecessary data, resulting in improved query performance.

**4.Flexibility and Adaptability:** Normalized databases are more flexible and adaptable to changes. When modifications or updates are required, changes can be made in one place without affecting other parts of the database. This makes it easier to maintain and modify the database structure over time.

**5.Scalability:** Normalization provides a solid foundation for scalability. As data grows and new records are added, the database can handle the growth more efficiently due to the elimination of data redundancy and improved organization.

##### Disadvantages of Normalization:

**1.Increased Complexity:** Normalization can introduce increased complexity in designing and managing the database. Splitting data into multiple tables and establishing relationships requires careful planning and may involve more complex queries to retrieve information.

**2.Performance Impact:** In some cases, normalization can have a performance impact. Splitting data across multiple tables and establishing relationships can result in more joins during query execution, which can potentially impact performance, especially for large-scale databases.

**3.Increased Storage Requirements:** Normalization can lead to increased storage requirements, particularly if there are many relationships and frequent joins between tables. The need to maintain relationships and store foreign keys can result in additional storage overhead.

**4.Query Complexity:** Querying data from normalized tables can be more complex compared to denormalized structures. Retrieving data often requires joining multiple tables, which can lead to complex queries that may be difficult to understand and maintain.

**5.Trade-off with Redundancy:** Normalization aims to eliminate data redundancy, but in some cases, a certain level of redundancy can improve query performance. Denormalized structures can provide faster access to data by duplicating some information, but at the cost of potential data inconsistencies.

### Q.5 Determine the decomposition.
**Consider the schema R = (S T U V) and the dependencies S → T, T → U, U → V, and V → S.
Let R = (R1 and R2) be a decomposition such that R1 ∩ R2 ≠ ∅ .**
*finding the candidate keys by closure method*
{S}+={S,T,U,V}
{T}+={T,U,V,S}
{U}+={U,V,S,T}
{V}+={V,S,T,U}
so the candidate keys are {S},{T},{U},{V}

based upon the above data we can make the following normalization table:

| Normal form | S->T   | T->U    | U->V   | V->S | 
|-------------|--------|---------|--------|------|
| BCNF        | yes    | yes     | yes    | yes  |

since all the attributes on the left hand side are candidate keys , it means this relation dosen't have any transitive dependencies and hence
the relation is already in **BCNF** form and **further decompostion is not possible.**
Still if we want to do a lossless decomposition , then 
R1=(STU)
R2=(UV)





