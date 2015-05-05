package ru.gbuz.ao.privolgie.apps.site

/**
 * Created by rus on 23.09.14.
 */
import org.apache.commons.lang.builder.HashCodeBuilder

class Crumb {
    String name
    String href

    boolean equals(other) {
        if (!(other instanceof Crumb)) {
            return false
        }

        return other.name == name && other.href == href
    }

    int hashCode() {
        return new HashCodeBuilder().append(name).append(href).toHashCode()
    }
}