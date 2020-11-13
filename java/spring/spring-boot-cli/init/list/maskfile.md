# Tasks

## spring-init-list

> spring init - Initialize a new project using Spring Initializr (start.spring.io)

```bash
spring init --list
```

### help

```plain
spring init - Initialize a new project using Spring Initializr (start.spring.io)

usage: spring init [options] [location]

Option                       Description                                       
------                       -----------                                       
-a, --artifactId <String>    Project coordinates; infer archive name (for      
                               example 'test')                                 
-b, --boot-version <String>  Spring Boot version (for example '1.2.0.RELEASE') 
--build <String>             Build system to use (for example 'maven' or       
                               'gradle') (default: maven)                      
-d, --dependencies <String>  Comma-separated list of dependency identifiers to 
                               include in the generated project                
--description <String>       Project description                               
-f, --force                  Force overwrite of existing files                 
--format <String>            Format of the generated content (for example      
                               'build' for a build file, 'project' for a       
                               project archive) (default: project)             
-g, --groupId <String>       Project coordinates (for example 'org.test')      
-j, --java-version <String>  Language level (for example '1.8')                
-l, --language <String>      Programming language  (for example 'java')        
--list                       List the capabilities of the service. Use it to   
                               discover the dependencies and the types that are
                               available                                       
-n, --name <String>          Project name; infer application name              
-p, --packaging <String>     Project packaging (for example 'jar')             
--package-name <String>      Package name                                      
-t, --type <String>          Project type. Not normally needed if you use --   
                               build and/or --format. Check the capabilities of
                               the service (--list) for more details           
--target <String>            URL of the service to use (default: https://start.
                               spring.io)                                      
-v, --version <String>       Project version (for example '0.0.1-SNAPSHOT')    
-x, --extract                Extract the project archive. Inferred if a        
                               location is specified without an extension      

examples:

    To list all the capabilities of the service:
        $ spring init --list

    To creates a default project:
        $ spring init

    To create a web my-app.zip:
        $ spring init -d=web my-app.zip

    To create a web/data-jpa gradle project unpacked:
        $ spring init -d=web,jpa --build=gradle my-dir
```

### output


```plain
  .   ____          _            __ _ _
 /\\ / ___'_ __ _ _(_)_ __  __ _ \ \ \ \
( ( )\___ | '_ | '_| | '_ \/ _` | \ \ \ \
 \\/  ___)| |_)| | | | | || (_| |  ) ) ) )
  '  |____| .__|_| |_|_| |_\__, | / / / /
 =========|_|==============|___/=/_/_/_/
:: Service capabilities ::  https://start.spring.io

Supported dependencies
+--------------------------------------+--------------------------------------------------------------+-------------------------------+
| Id                                   | Description                                                  | Required version              |
+--------------------------------------+--------------------------------------------------------------+-------------------------------+
| activemq                             | Spring JMS support with Apache ActiveMQ 'Classic'.           |                               |
|                                      |                                                              |                               |
| actuator                             | Supports built in (or custom) endpoints that let you monitor |                               |
|                                      | and manage your application - such as application health,    |                               |
|                                      | metrics, sessions, etc.                                      |                               |
|                                      |                                                              |                               |
| alibaba-nacos-config                 | Support for externalized configuration in a distributed      | >=2.2.0.RELEASE and <2.3.0.M1 |
|                                      | system, auto refresh when configuration changes.             |                               |
|                                      |                                                              |                               |
| alibaba-nacos-discovery              | Service discovery with Alibaba Nacos.                        | >=2.2.0.RELEASE and <2.3.0.M1 |
|                                      |                                                              |                               |
| alibaba-sentinel                     | Flow control and circuit breaking with Alibaba Sentinel.     | >=2.2.0.RELEASE and <2.3.0.M1 |
|                                      |                                                              |                               |
| amqp                                 | Gives your applications a common platform to send and        |                               |
|                                      | receive messages, and your messages a safe place to live     |                               |
|                                      | until received.                                              |                               |
|                                      |                                                              |                               |
| artemis                              | Spring JMS support with Apache ActiveMQ Artemis.             |                               |
|                                      |                                                              |                               |
| azure-active-directory               | Spring Security integration with Azure Active Directory for  | >=2.0.0.RELEASE and <2.4.0-M1 |
|                                      | authentication.                                              |                               |
|                                      |                                                              |                               |
| azure-keyvault-secrets               | Manage application secrets and keys.                         | >=2.0.0.RELEASE and <2.4.0-M1 |
|                                      |                                                              |                               |
| azure-storage                        | Azure Storage service integration.                           | >=2.0.0.RELEASE and <2.3.0.M1 |
|                                      |                                                              |                               |
| azure-support                        | Auto-configuration for Azure Services (Service Bus, Storage, | >=2.0.0.RELEASE and <2.4.0-M1 |
|                                      | Active Directory, Cosmos DB, Key Vault, and more).           |                               |
|                                      |                                                              |                               |
| batch                                | Batch applications with transactions, retry/skip and chunk   |                               |
|                                      | based processing.                                            |                               |
|                                      |                                                              |                               |
| cache                                | Provides cache-related operations, such as the ability to    |                               |
|                                      | update the content of the cache, but does not provide the    |                               |
|                                      | actual data store.                                           |                               |
|                                      |                                                              |                               |
| camel                                | Apache Camel is an open source integration framework that    | >=2.0.0.M1 and <2.4.0-M1      |
|                                      | empowers you to quickly and easily integrate various systems |                               |
|                                      | consuming or producing data.                                 |                               |
|                                      |                                                              |                               |
| cloud-aws                            | AWS native services from Spring Cloud for AWS.               | >=2.0.0.RELEASE and <2.4.0-M1 |
|                                      |                                                              |                               |
| cloud-aws-jdbc                       | Relational databases on AWS with RDS and Spring Cloud AWS    | >=2.0.0.RELEASE and <2.4.0-M1 |
|                                      | JDBC.                                                        |                               |
|                                      |                                                              |                               |
| cloud-aws-messaging                  | Messaging on AWS with SQS and Spring Cloud AWS Messaging.    | >=2.0.0.RELEASE and <2.4.0-M1 |
|                                      |                                                              |                               |
| cloud-bus                            | Links nodes of a distributed system with a lightweight       |                               |
|                                      | message broker which can used to broadcast state changes or  |                               |
|                                      | other management instructions (requires a binder, e.g.       |                               |
|                                      | Apache Kafka or RabbitMQ).                                   |                               |
|                                      |                                                              |                               |
| cloud-cloudfoundry-discovery         | Service discovery with Cloud Foundry.                        |                               |
|                                      |                                                              |                               |
| cloud-config-client                  | Client that connects to a Spring Cloud Config Server to      |                               |
|                                      | fetch the application's configuration.                       |                               |
|                                      |                                                              |                               |
| cloud-config-server                  | Central management for configuration via Git, SVN, or        |                               |
|                                      | HashiCorp Vault.                                             |                               |
|                                      |                                                              |                               |
| cloud-connectors                     | Simplifies the process of connecting to services and gaining | >=2.0.0.RELEASE and <2.3.0.M1 |
|                                      | operating environment awareness in cloud platforms such as   |                               |
|                                      | Cloud Foundry and Heroku.                                    |                               |
|                                      |                                                              |                               |
| cloud-contract-stub-runner           | Stub Runner for HTTP/Messaging based communication. Allows   |                               |
|                                      | creating WireMock stubs from RestDocs tests.                 |                               |
|                                      |                                                              |                               |
| cloud-contract-verifier              | Moves TDD to the level of software architecture by enabling  |                               |
|                                      | Consumer Driven Contract (CDC) development.                  |                               |
|                                      |                                                              |                               |
| cloud-eureka                         | a REST based service for locating services for the purpose   |                               |
|                                      | of load balancing and failover of middle-tier servers.       |                               |
|                                      |                                                              |                               |
| cloud-eureka-server                  | spring-cloud-netflix Eureka Server.                          |                               |
|                                      |                                                              |                               |
| cloud-feign                          | Declarative REST Client. OpenFeign creates a dynamic         |                               |
|                                      | implementation of an interface decorated with JAX-RS or      |                               |
|                                      | Spring MVC annotations.                                      |                               |
|                                      |                                                              |                               |
| cloud-function                       | Promotes the implementation of business logic via functions  |                               |
|                                      | and supports a uniform programming model across serverless   |                               |
|                                      | providers, as well as the ability to run standalone (locally |                               |
|                                      | or in a PaaS).                                               |                               |
|                                      |                                                              |                               |
| cloud-gateway                        | Provides a simple, yet effective way to route to APIs and    |                               |
|                                      | provide cross cutting concerns to them such as security,     |                               |
|                                      | monitoring/metrics, and resiliency.                          |                               |
|                                      |                                                              |                               |
| cloud-gcp                            | Contains auto-configuration support for every Spring Cloud   | >=2.0.0.RELEASE and <2.4.0-M1 |
|                                      | GCP integration. Most of the auto-configuration code is only |                               |
|                                      | enabled if other dependencies are added to the classpath.    |                               |
|                                      |                                                              |                               |
| cloud-gcp-pubsub                     | Adds the GCP Support entry and all the required dependencies | >=2.0.0.RELEASE and <2.4.0-M1 |
|                                      | so that the Google Cloud Pub/Sub integration work out of the |                               |
|                                      | box.                                                         |                               |
|                                      |                                                              |                               |
| cloud-gcp-storage                    | Adds the GCP Support entry and all the required dependencies | >=2.0.0.RELEASE and <2.4.0-M1 |
|                                      | so that the Google Cloud Storage integration work out of the |                               |
|                                      | box.                                                         |                               |
|                                      |                                                              |                               |
| cloud-hystrix                        | Circuit breaker with Spring Cloud Netflix Hystrix.           | >=2.0.0.RELEASE and <2.4.0-M1 |
|                                      |                                                              |                               |
| cloud-hystrix-dashboard              | Circuit breaker dashboard with Spring Cloud Netflix Hystrix. | >=2.0.0.RELEASE and <2.4.0-M1 |
|                                      |                                                              |                               |
| cloud-loadbalancer                   | Client-side load-balancing with Spring Cloud LoadBalancer.   | >=2.2.0.M4                    |
|                                      |                                                              |                               |
| cloud-oauth2                         | OAuth2 and distributed application patterns with             |                               |
|                                      | spring-cloud-security.                                       |                               |
|                                      |                                                              |                               |
| cloud-resilience4j                   | Spring Cloud Circuit breaker with Resilience4j as the        | >=2.2.0.RELEASE               |
|                                      | underlying implementation.                                   |                               |
|                                      |                                                              |                               |
| cloud-ribbon                         | Client-side load-balancing with Spring Cloud Netflix and     | >=2.0.0.RELEASE and <2.4.0-M1 |
|                                      | Ribbon.                                                      |                               |
|                                      |                                                              |                               |
| cloud-security                       | A declarative model which can be heavily configured          |                               |
|                                      | externally (or centrally) lends itself to the implementation |                               |
|                                      | of large systems of co-operating, remote components, usually |                               |
|                                      | with a central indentity management service.                 |                               |
|                                      |                                                              |                               |
| cloud-starter                        | Non-specific Spring Cloud features, unrelated to external    |                               |
|                                      | libraries or integrations (e.g. Bootstrap context and        |                               |
|                                      | @RefreshScope).                                              |                               |
|                                      |                                                              |                               |
| cloud-starter-consul-config          | Enable and configure the common patterns inside your         |                               |
|                                      | application and build large distributed systems with         |                               |
|                                      | Hashicorp’s Consul. The patterns provided include Service    |                               |
|                                      | Discovery, Distributed Configuration and Control Bus.        |                               |
|                                      |                                                              |                               |
| cloud-starter-consul-discovery       | Service discovery with Hashicorp Consul.                     |                               |
|                                      |                                                              |                               |
| cloud-starter-sleuth                 | Distributed tracing via logs with Spring Cloud Sleuth.       |                               |
|                                      |                                                              |                               |
| cloud-starter-vault-config           | Provides client-side support for externalized configuration  |                               |
|                                      | in a distributed system. Using HashiCorp's Vault you have a  |                               |
|                                      | central place to manage external secret properties for       |                               |
|                                      | applications across all environments.                        |                               |
|                                      |                                                              |                               |
| cloud-starter-zipkin                 | Distributed tracing with an existing Zipkin installation and |                               |
|                                      | Spring Cloud Sleuth Zipkin.                                  |                               |
|                                      |                                                              |                               |
| cloud-starter-zookeeper-config       | Enable and configure common patterns inside your application |                               |
|                                      | and build large distributed systems with Apache Zookeeper    |                               |
|                                      | based components. The provided patterns include Service      |                               |
|                                      | Discovery and Configuration.                                 |                               |
|                                      |                                                              |                               |
| cloud-starter-zookeeper-discovery    | Service discovery with Apache Zookeeper.                     |                               |
|                                      |                                                              |                               |
| cloud-stream                         | Framework for building highly scalable event-driven          |                               |
|                                      | microservices connected with shared messaging systems        |                               |
|                                      | (requires a binder, e.g. Apache Kafka, RabbitMQ or Solace    |                               |
|                                      | PubSub+).                                                    |                               |
|                                      |                                                              |                               |
| cloud-task                           | Allows a user to develop and run short lived microservices   |                               |
|                                      | using Spring Cloud. Run them locally, in the cloud, and on   |                               |
|                                      | Spring Cloud Data Flow.                                      |                               |
|                                      |                                                              |                               |
| cloud-turbine                        | Circuit breaker metric aggregation using                     | >=2.0.0.RELEASE and <2.4.0-M1 |
|                                      | spring-cloud-netflix with Turbine and server-sent events.    |                               |
|                                      |                                                              |                               |
| cloud-turbine-stream                 | Circuit breaker metric aggregation using                     | >=2.0.0.RELEASE and <2.4.0-M1 |
|                                      | spring-cloud-netflix with Turbine and Spring Cloud Stream    |                               |
|                                      | (requires a binder, e.g. Apache Kafka or RabbitMQ).          |                               |
|                                      |                                                              |                               |
| cloud-zuul                           | Intelligent and programmable routing with Spring Cloud       | >=2.0.0.RELEASE and <2.4.0-M1 |
|                                      | Netflix Zuul.                                                |                               |
|                                      |                                                              |                               |
| codecentric-spring-boot-admin-client | Required for your application to register with a             | >=2.0.0.RELEASE and <2.5.0-M1 |
|                                      | Codecentric's Spring Boot Admin Server instance.             |                               |
|                                      |                                                              |                               |
| codecentric-spring-boot-admin-server | A community project to manage and monitor your Spring Boot   | >=2.0.0.RELEASE and <2.5.0-M1 |
|                                      | applications. Provides a UI on top of the Spring Boot        |                               |
|                                      | Actuator endpoints.                                          |                               |
|                                      |                                                              |                               |
| configuration-processor              | Generate metadata for developers to offer contextual help    |                               |
|                                      | and "code completion" when working with custom configuration |                               |
|                                      | keys (ex.application.properties/.yml files).                 |                               |
|                                      |                                                              |                               |
| data-cassandra                       | A free and open-source, distributed, NoSQL database          |                               |
|                                      | management system that offers high-scalability and           |                               |
|                                      | high-performance.                                            |                               |
|                                      |                                                              |                               |
| data-cassandra-reactive              | Access Cassandra NoSQL Database in a reactive fashion.       |                               |
|                                      |                                                              |                               |
| data-couchbase                       | NoSQL document-oriented database that offers in memory-first |                               |
|                                      | architecture, geo-distributed deployments, and workload      |                               |
|                                      | isolation.                                                   |                               |
|                                      |                                                              |                               |
| data-couchbase-reactive              | Access Couchbase NoSQL database in a reactive fashion with   |                               |
|                                      | Spring Data Couchbase.                                       |                               |
|                                      |                                                              |                               |
| data-elasticsearch                   | A distributed, RESTful search and analytics engine with      |                               |
|                                      | Spring Data Elasticsearch.                                   |                               |
|                                      |                                                              |                               |
| data-jdbc                            | Persist data in SQL stores with plain JDBC using Spring      | >=2.1.0.RELEASE               |
|                                      | Data.                                                        |                               |
|                                      |                                                              |                               |
| data-jpa                             | Persist data in SQL stores with Java Persistence API using   |                               |
|                                      | Spring Data and Hibernate.                                   |                               |
|                                      |                                                              |                               |
| data-ldap                            | Makes it easier to build Spring based applications that use  |                               |
|                                      | the Lightweight Directory Access Protocol.                   |                               |
|                                      |                                                              |                               |
| data-mongodb                         | Store data in flexible, JSON-like documents, meaning fields  |                               |
|                                      | can vary from document to document and data structure can be |                               |
|                                      | changed over time.                                           |                               |
|                                      |                                                              |                               |
| data-mongodb-reactive                | Provides asynchronous stream processing with non-blocking    |                               |
|                                      | back pressure for MongoDB.                                   |                               |
|                                      |                                                              |                               |
| data-neo4j                           | An open source NoSQL database that stores data structured as |                               |
|                                      | graphs consisting of nodes, connected by relationships.      |                               |
|                                      |                                                              |                               |
| data-r2dbc                           | Provides Reactive Relational Database Connectivity to        | >=2.3.0.M3                    |
|                                      | persist data in SQL stores using Spring Data in reactive     |                               |
|                                      | applications.                                                |                               |
|                                      |                                                              |                               |
| data-redis                           | Advanced and thread-safe Java Redis client for synchronous,  |                               |
|                                      | asynchronous, and reactive usage. Supports Cluster,          |                               |
|                                      | Sentinel, Pipelining, Auto-Reconnect, Codecs and much more.  |                               |
|                                      |                                                              |                               |
| data-redis-reactive                  | Access Redis key-value data stores in a reactive fashion     |                               |
|                                      | with Spring Data Redis.                                      |                               |
|                                      |                                                              |                               |
| data-rest                            | Exposing Spring Data repositories over REST via Spring Data  |                               |
|                                      | REST.                                                        |                               |
|                                      |                                                              |                               |
| data-rest-explorer                   | Browsing Spring Data REST repositories in your browser.      | >=2.2.0-M1                    |
|                                      |                                                              |                               |
| data-rest-hal                        | Browsing Spring Data REST repositories in your browser.      | >=2.0.0.RELEASE and <2.2.0-M1 |
|                                      |                                                              |                               |
| data-solr                            | Apache Solr is an open source enterprise search platform     |                               |
|                                      | built on Apache Lucene.                                      |                               |
|                                      |                                                              |                               |
| datadog                              | Datadog is a dimensional time-series SAAS with built-in      |                               |
|                                      | dashboarding and alerting.                                   |                               |
|                                      |                                                              |                               |
| db2                                  | A JDBC driver that provides access to IBM DB2.               | >=2.2.0.M6                    |
|                                      |                                                              |                               |
| derby                                | An open source relational database implemented entirely in   |                               |
|                                      | Java.                                                        |                               |
|                                      |                                                              |                               |
| devtools                             | Provides fast application restarts, LiveReload, and          |                               |
|                                      | configurations for enhanced development experience.          |                               |
|                                      |                                                              |                               |
| flapdoodle-mongo                     | Provides a platform neutral way for running MongoDB in unit  |                               |
|                                      | tests.                                                       |                               |
|                                      |                                                              |                               |
| flyway                               | Version control for your database so you can migrate from    |                               |
|                                      | any version (incl. an empty database) to the latest version  |                               |
|                                      | of the schema.                                               |                               |
|                                      |                                                              |                               |
| freemarker                           | Java library to generate text output (HTML web pages,        |                               |
|                                      | e-mails, configuration files, source code, etc.) based on    |                               |
|                                      | templates and changing data.                                 |                               |
|                                      |                                                              |                               |
| geode                                | Apache Geode is a data management platform that helps users  | >=2.2.0.M5                    |
|                                      | build real-time, highly concurrent, highly performant and    |                               |
|                                      | reliable Spring Boot applications at scale that is           |                               |
|                                      | compatible with Pivotal Cloud Cache.                         |                               |
|                                      |                                                              |                               |
| graphite                             | Hierarchical metrics systems backed by a fixed-size          |                               |
|                                      | database.                                                    |                               |
|                                      |                                                              |                               |
| groovy-templates                     | Groovy templating engine.                                    |                               |
|                                      |                                                              |                               |
| h2                                   | Provides a fast in-memory database that supports JDBC API    |                               |
|                                      | and R2DBC access, with a small (2mb) footprint. Supports     |                               |
|                                      | embedded and server modes as well as a browser based console |                               |
|                                      | application.                                                 |                               |
|                                      |                                                              |                               |
| hateoas                              | Eases the creation of RESTful APIs that follow the HATEOAS   |                               |
|                                      | principle when working with Spring / Spring MVC.             |                               |
|                                      |                                                              |                               |
| hsql                                 | Lightweight 100% Java SQL Database Engine.                   |                               |
|                                      |                                                              |                               |
| influx                               | Support real-time stream processing and storage of           |                               |
|                                      | time-series data.                                            |                               |
|                                      |                                                              |                               |
| integration                          | Adds support for Enterprise Integration Patterns. Enables    |                               |
|                                      | lightweight messaging and supports integration with external |                               |
|                                      | systems via declarative adapters.                            |                               |
|                                      |                                                              |                               |
| jdbc                                 | Database Connectivity API that defines how a client may      |                               |
|                                      | connect and query a database.                                |                               |
|                                      |                                                              |                               |
| jersey                               | Framework for developing RESTful Web Services in Java that   |                               |
|                                      | provides support for JAX-RS APIs.                            |                               |
|                                      |                                                              |                               |
| jooq                                 | Generate Java code from your database and build type safe    |                               |
|                                      | SQL queries through a fluent API.                            |                               |
|                                      |                                                              |                               |
| kafka                                | Publish, subscribe, store, and process streams of records.   |                               |
|                                      |                                                              |                               |
| kafka-streams                        | Building stream processing applications with Apache Kafka    |                               |
|                                      | Streams.                                                     |                               |
|                                      |                                                              |                               |
| liquibase                            | Liquibase database migration and source control library.     |                               |
|                                      |                                                              |                               |
| lombok                               | Java annotation library which helps to reduce boilerplate    |                               |
|                                      | code.                                                        |                               |
|                                      |                                                              |                               |
| mail                                 | Send email using Java Mail and Spring Framework's            |                               |
|                                      | JavaMailSender.                                              |                               |
|                                      |                                                              |                               |
| mustache                             | Logic-less Templates. There are no if statements, else       |                               |
|                                      | clauses, or for loops. Instead there are only tags.          |                               |
|                                      |                                                              |                               |
| mybatis                              | Persistence framework with support for custom SQL, stored    | >=2.0.0.RELEASE and <2.4.0-M1 |
|                                      | procedures and advanced mappings. MyBatis couples objects    |                               |
|                                      | with stored procedures or SQL statements using a XML         |                               |
|                                      | descriptor or annotations.                                   |                               |
|                                      |                                                              |                               |
| mysql                                | MySQL JDBC and R2DBC driver.                                 |                               |
|                                      |                                                              |                               |
| new-relic                            | SaaS offering with a full UI and a query language called     |                               |
|                                      | NRQL.                                                        |                               |
|                                      |                                                              |                               |
| oauth2-client                        | Spring Boot integration for Spring Security's OAuth2/OpenID  |                               |
|                                      | Connect client features.                                     |                               |
|                                      |                                                              |                               |
| oauth2-resource-server               | Spring Boot integration for Spring Security's OAuth2         | >=2.1.0.M2                    |
|                                      | resource server features.                                    |                               |
|                                      |                                                              |                               |
| okta                                 | Okta specific configuration for Spring Security/Spring Boot  | >=2.1.2.RELEASE and <2.4.0-M1 |
|                                      | OAuth2 features. Enable your Spring Boot application to work |                               |
|                                      | with Okta via OAuth 2.0/OIDC.                                |                               |
|                                      |                                                              |                               |
| open-service-broker                  | Framework for building Spring Boot apps that implement the   | >=2.0.0.RELEASE and <2.4.0-M1 |
|                                      | Open Service Broker API, which can deliver services to       |                               |
|                                      | applications running within cloud native platforms such as   |                               |
|                                      | Cloud Foundry, Kubernetes and OpenShift.                     |                               |
|                                      |                                                              |                               |
| oracle                               | A JDBC driver that provides access to Oracle.                | >=2.2.0.RC1                   |
|                                      |                                                              |                               |
| postgresql                           | A JDBC and R2DBC driver that allows Java programs to connect |                               |
|                                      | to a PostgreSQL database using standard, database            |                               |
|                                      | independent Java code.                                       |                               |
|                                      |                                                              |                               |
| prometheus                           | An in-memory dimensional time series database with a simple  |                               |
|                                      | built-in UI, a custom query language, and math operations.   |                               |
|                                      |                                                              |                               |
| quartz                               | Schedule jobs using Quartz.                                  |                               |
|                                      |                                                              |                               |
| reactive-cloud-stream                | Reactive messaging microservices with Spring Cloud Stream    | >=2.0.0.RELEASE and <2.2.0.M1 |
|                                      | (requires a binder, e.g. Apache Kafka or RabbitMQ).          |                               |
|                                      |                                                              |                               |
| restdocs                             | Document RESTful services by combining hand-written with     |                               |
|                                      | Asciidoctor and auto-generated snippets produced with Spring |                               |
|                                      | MVC Test.                                                    |                               |
|                                      |                                                              |                               |
| rsocket                              | RSocket.io applications with Spring Messaging and Netty.     | >=2.2.0.M2                    |
|                                      |                                                              |                               |
| scs-circuit-breaker                  | Hystrix circuit breaker client on Pivotal Cloud Foundry.     | >=2.0.0.RELEASE and <2.4.0-M1 |
|                                      |                                                              |                               |
| scs-config-client                    | Config client on Pivotal Cloud Foundry.                      | >=2.0.0.RELEASE and <2.4.0-M1 |
|                                      |                                                              |                               |
| scs-service-registry                 | Eureka service discovery client on Pivotal Cloud Foundry.    | >=2.0.0.RELEASE and <2.4.0-M1 |
|                                      |                                                              |                               |
| security                             | Highly customizable authentication and access-control        |                               |
|                                      | framework for Spring applications.                           |                               |
|                                      |                                                              |                               |
| session                              | Provides an API and implementations for managing user        |                               |
|                                      | session information.                                         |                               |
|                                      |                                                              |                               |
| solace                               | Connect to a Solace PubSub+ Advanced Event Broker to         | >=2.2.0.RELEASE and <2.4.0-M1 |
|                                      | publish, subscribe, request/reply and store/replay messages  |                               |
|                                      |                                                              |                               |
| sqlserver                            | A JDBC and R2DBC driver that provides access to Microsoft    |                               |
|                                      | SQL Server and Azure SQL Database from any Java application. |                               |
|                                      |                                                              |                               |
| testcontainers                       | Provide lightweight, throwaway instances of common           |                               |
|                                      | databases, Selenium web browsers, or anything else that can  |                               |
|                                      | run in a Docker container.                                   |                               |
|                                      |                                                              |                               |
| thymeleaf                            | A modern server-side Java template engine for both web and   |                               |
|                                      | standalone environments. Allows HTML to be correctly         |                               |
|                                      | displayed in browsers and as static prototypes.              |                               |
|                                      |                                                              |                               |
| unboundid-ldap                       | Provides a platform neutral way for running a LDAP server in |                               |
|                                      | unit tests.                                                  |                               |
|                                      |                                                              |                               |
| vaadin                               | Java framework for building rich client apps based on Web    | >=2.0.0.RELEASE and <2.4.0-M1 |
|                                      | components.                                                  |                               |
|                                      |                                                              |                               |
| validation                           | JSR-303 validation with Hibernate validator.                 |                               |
|                                      |                                                              |                               |
| wavefront                            | Tanzu Observability by Wavefront is a SaaS-based metrics     | >=2.1.0.RELEASE               |
|                                      | monitoring and analytics platform that lets you visualize,   |                               |
|                                      | query, and alert over data from across your entire stack     |                               |
|                                      | (infrastructure, network, custom app metrics, business KPIs, |                               |
|                                      | etc.)                                                        |                               |
|                                      |                                                              |                               |
| web                                  | Build web, including RESTful, applications using Spring MVC. |                               |
|                                      | Uses Apache Tomcat as the default embedded container.        |                               |
|                                      |                                                              |                               |
| web-services                         | Facilitates contract-first SOAP development. Allows for the  |                               |
|                                      | creation of flexible web services using one of the many ways |                               |
|                                      | to manipulate XML payloads.                                  |                               |
|                                      |                                                              |                               |
| webflux                              | Build reactive web applications with Spring WebFlux and      |                               |
|                                      | Netty.                                                       |                               |
|                                      |                                                              |                               |
| websocket                            | Build WebSocket applications with SockJS and STOMP.          |                               |
+--------------------------------------+--------------------------------------------------------------+-------------------------------+


Project types (* denotes the default)
+-----------------+------------------------------------------+-----------------------------+
| Id              | Description                              | Tags                        |
+-----------------+------------------------------------------+-----------------------------+
| gradle-build    | Generate a Gradle build file.            | build:gradle,format:build   |
| gradle-project  | Generate a Gradle based project archive. | build:gradle,format:project |
| maven-build     | Generate a Maven pom.xml.                | build:maven,format:build    |
| maven-project * | Generate a Maven based project archive.  | build:maven,format:project  |
+-----------------+------------------------------------------+-----------------------------+


Parameters
+-------------+------------------------------------------+------------------------------+
| Id          | Description                              | Default value                |
+-------------+------------------------------------------+------------------------------+
| artifactId  | project coordinates (infer archive name) | demo                         |
| bootVersion | spring boot version                      | 2.4.0                        |
| description | project description                      | Demo project for Spring Boot |
| groupId     | project coordinates                      | com.example                  |
| javaVersion | language level                           | 11                           |
| language    | programming language                     | java                         |
| name        | project name (infer application name)    | demo                         |
| packageName | root package                             | com.example.demo             |
| packaging   | project packaging                        | jar                          |
| type        | project type                             | maven-project                |
| version     | project version                          | 0.0.1-SNAPSHOT               |
+-------------+------------------------------------------+------------------------------+
```