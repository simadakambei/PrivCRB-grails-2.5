dataSource {
    pooled = true
    username = "rus"
    password = "doctor"
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
//    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory' // Hibernate 3
    cache.region.factory_class = 'org.hibernate.cache.ehcache.EhCacheRegionFactory' // Hibernate 4
    singleSession = true // configure OSIV singleSession mode
    flush.mode = 'manual' // OSIV session flush mode outside of transactional context
}

// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "update" // one of 'create', 'create-drop','update'
            url = "jdbc:postgresql://192.168.33.152:5432/privcrb_dev"
        }
    }
    test {
        dataSource {
            dbCreate = "update"
            url = "jdbc:postgresql://192.168.33.152:5432/privcrb_test"
        }
    }
    production {
        dataSource {
            dbCreate = "update"
            url = "jdbc:postgresql://192.168.33.152:5432/privcrb_dev"
//            url = "jdbc:postgresql://ec2-54-235-155-40.compute-1.amazonaws.com:5432/d1h174evoj0vlr"

        }
    }
}

dataSource {
    driverClassName = "org.postgresql.Driver"
    dialect = org.hibernatespatial.postgis.PostgisDialect
//    driverClassName = "org.postgresql.Driver"
//    dialect = org.hibernate.dialect.PostgreSQLDialect
}