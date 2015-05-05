package ru.gbuz.ao.privolgie.app.site

import ru.gbuz.ao.privolgie.app.entity.LPU
import ru.gbuz.ao.privolgie.app.entity.District
import ru.gbuz.ao.privolgie.app.entity.Department
import ru.gbuz.ao.privolgie.app.entity.DepartmentUnit
import grails.converters.JSON
import geoscript.geom.Geometry
import com.vividsolutions.jts.geom.GeometryFactory
import com.vividsolutions.jts.geom.Coordinate
import com.vividsolutions.jts.geom.*

class StructureLPUController {

    def index() {

        def district_1 = District.findById(3)
        def district_2 = District.findById(4)
        def lpu = new LPU()
        def lpuall = LPU.list()
        //println lpuall
        def lpus = [lpuall.toList()] ? [lpuall].flatten() : null
        lpus.collect {
            lpu = LPU.get(it.id);
        }
        [lpu: lpu, d1: district_1, d2: district_2]
    }

    def AddToMap = {

        def lpumap = []
        def d = []
        def u = []

        def departments = Department.list()
        def units = DepartmentUnit.list()

        def deps = [departments.toList()] ? [departments].flatten() : null
        deps.each { depart ->
            d.add([depart.longitude, depart.latitude, depart.title])
            //d.add("title": depart.title,"longitude": depart.longitude,"latitude": depart.latitude)
        }

        HashMap unitmap = new HashMap()
        def unts = [units.toList()] ? [units].flatten() : null
        unts.each { unit ->
            u.add([unit.longitude, unit.latitude, unit.title])
            //u.add("title": unit.title,"longitude": unit.longitude,"latitude": unit.latitude)
        }
        lpumap = d + u
        //println points
        render lpumap
    }
}
