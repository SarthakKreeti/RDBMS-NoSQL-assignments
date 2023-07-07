# Q1. What are the main features of redis?
Redis (Remote Dictionary Server) is an open-source, in-memory data structure store that provides several key features:

## In-Memory Data Storage:
 Redis stores data primarily in memory, which enables fast data access and retrieval. It is particularly useful for applications that require low latency and high throughput.

## Data Structures:
 Redis supports various data structures such as strings, lists, sets, sorted sets, hashes, and more. These data structures allow you to model complex data types and perform operations on them efficiently. Redis provides a wide range of commands for manipulating and querying these data structures.

## Persistence:
 Redis provides options for persistence, allowing you to save your data to disk. This feature ensures that your data is not lost in case of a system restart or crash. Redis supports two persistence mechanisms: snapshotting (RDB) and append-only file (AOF) persistence.

## Pub/Sub Messaging:
 Redis includes a publish/subscribe messaging system. It allows clients to subscribe to channels and receive messages whenever a message is published to a subscribed channel. This feature enables building real-time applications, chat systems, and event-driven architectures.

## Replication:
 Redis supports replication, allowing you to create copies (replicas) of your Redis database. Replication provides data redundancy, improves availability, and enables scaling by distributing the read workload across multiple replicas.

## High Availability:
 Redis provides mechanisms for achieving high availability, such as Redis Sentinel and Redis Cluster. Redis Sentinel monitors Redis instances and performs automatic failover in case of primary node failures. Redis Cluster allows you to distribute data across multiple Redis nodes, providing both high availability and scalability.

## Lua Scripting:
 Redis supports Lua scripting, allowing you to write custom scripts and execute them on the server-side. Lua scripts provide flexibility and enable complex data manipulations and operations within Redis.

## TTL (Time-To-Live) Expiration:
 Redis allows you to set an expiration time (TTL) for keys. After the TTL expires, Redis automatically removes the key and associated data from the database. This feature is useful for caching and managing data with a limited lifespan.

## Q2. Write down the limitations of redis?

While Redis is a powerful and widely-used data store, it does have certain limitations and considerations to keep in mind:

## Data Size:
 Redis is primarily an in-memory data store, which means the size of your data is limited by the available memory. If your dataset exceeds the available memory, it can lead to performance issues or data eviction.

## Scalability:
 Redis can scale vertically by adding more memory to a single instance, but scaling horizontally across multiple nodes can be more complex. While Redis Cluster provides some support for horizontal scaling, it has certain limitations and may require careful planning and configuration.

## Disk Persistence:
 While Redis offers persistence mechanisms like RDB and AOF, they come with trade-offs. RDB snapshots can result in some data loss in the event of a system crash, while AOF persistence can increase disk space usage and potentially impact performance.

## Complex Queries:
 Redis provides basic querying capabilities, but it doesn't support complex querying like SQL databases. Performing complex queries typically requires retrieving data from Redis and processing it in the client application.

## No Transactions Across Keys:
 Redis transactions (MULTI/EXEC) are atomic within a single key, but they do not span multiple keys. If you need atomicity across multiple keys, you'll need to use Lua scripting or other application-level mechanisms.

## Limited Data Structures:
 Redis offers several data structures, but they are relatively simple compared to other databases. It lacks features like referential integrity, constraints, and relationships found in traditional relational databases.

## No Secondary Indexes:
 Redis does not provide built-in support for secondary indexes. If you need to query data based on attributes other than the primary key, you may need to maintain additional data structures or use external indexing solutions.

## Data Eviction:
 When Redis reaches its memory limit, it employs different eviction policies to make space for new data. This can lead to older or less frequently accessed data being evicted, which may impact application behavior or require careful management of data eviction policies.

## No ACID Transactions:
 Redis sacrifices some ACID properties (Atomicity, Consistency, Isolation, Durability) for performance and scalability. While it supports atomic operations, it does not provide full ACID compliance like traditional relational databases.

## Limited Security:
 Redis initially lacked built-in authentication and access control mechanisms, although recent versions have added improved security features. It is important to properly configure Redis security settings to prevent unauthorized access.

# Q3. Perform a basic CRUD operation using redis.
#### Create (C) -
To create a new data entry in Redis, you can use the SET command to set a key-value pair.
Example:
```SET user:1 "John Doe"```
In this example, we create a new key "user:1" with the value "John Doe".

#### Read (R) -
 To retrieve data from Redis, you can use the GET command to fetch the value associated with a specific key.
Example:
```GET user:1```
This command retrieves the value associated with the key "user:1", which in this case is "John Doe".

#### Update (U) -
 To update existing data in Redis, you can use the SET command again to assign a new value to an existing key.
Example:

```SET user:1 "Jane Smith"```
This command updates the value associated with the key "user:1" to "Jane Smith".

#### Delete (D) -
 To delete data from Redis, you can use the DEL command to remove a specific key and its associated value.

Example:
```DEL user:1```
This command deletes the key "user:1" and its value from Redis.
```sarthak@sarthak:~$ SET user:1 "Sarthak Tiwari"

sarthak@sarthak:~$ redis-cli
127.0.0.1:6379> select 0
OK
127.0.0.1:6379> SET user:1 "Sarthak Tiwari"
OK
127.0.0.1:6379> get user:1
"Sarthak Tiwari"
127.0.0.1:6379> set user:1 "yash barman"
OK
127.0.0.1:6379> del user:1
(integer) 1
127.0.0.1:6379> 
 ```

## Q4. Explain TTL command with an example.
In Redis, the TTL (Time-To-Live) command allows you to set an expiration time for a key. Once the TTL for a key expires, Redis automatically removes the key and its associated value from the database. The TTL command is useful for managing data with a limited lifespan, implementing caching strategies, and ensuring data is automatically cleared after a certain period.

The syntax for setting the TTL of a key in Redis is as follows:
```TTL key```
Here's an example to illustrate the TTL command:
```
SET mykey "Hello, Redis!"
EXPIRE mykey 60
TTL mykey
```
In this example, we set the value of the key "mykey" to "Hello, Redis!" using the SET command. Then, we use the EXPIRE command to set the TTL of "mykey" to 60 seconds, indicating that it should expire and be deleted from the database after 60 seconds. Finally, we use the TTL command to check the remaining time to live for the key "mykey".

If the TTL command returns a positive value, it indicates the number of seconds remaining for the key to expire. If it returns a negative value or -2, it means that the key does not exist or has no associated TTL (i.e., it does not expire). A return value of -1 indicates that the key exists but has no specific TTL set.

By setting a TTL on keys, you can automate the process of key expiration and avoid manual deletion of expired data. This is particularly useful for implementing caching mechanisms, session management, and other scenarios where data needs to be automatically cleared after a certain time.

## Q5. Create a transaction in redis to perform the following operations.
● Create two keys in a single line and one key differently. (one value should be number)
```
sarthak@sarthak:~$ redis-cli
127.0.0.1:6379> select 0
OK
127.0.0.1:6379> mset user:1 "sarthak tiwari" user:2 "yash barman"
OK
127.0.0.1:6379> set number "100"
OK

```
● Read any two value in a single line
```
127.0.0.1:6379> mget user:1 number
1) "sarthak tiwari"
2) "100"
```
● Increment the number value
```
127.0.0.1:6379> incr number
(integer) 101
127.0.0.1:6379> get number
"101"

```
● Expire any two keys after some time
```
127.0.0.1:6379> expire user:2 60
(integer) 1
127.0.0.1:6379> ttl user:2
(integer) 30
127.0.0.1:6379> expire number 75
(integer) 1
127.0.0.1:6379> ttl number
(integer) 69

```



