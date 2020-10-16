package com.google.shinyay

import javax.ws.rs.GET
import javax.ws.rs.Path
import javax.ws.rs.Produces
import javax.ws.rs.core.MediaType

@Path("/hello")
class QuarkusApplication {

    @GET
    @Produces(MediaType.TEXT_PLAIN)
    fun hello(): String {
        println("[" + Thread.currentThread().name + "[Start]")
        Thread.sleep(20000L)
        println("[" + Thread.currentThread().name + "[End]")
        return "hello"
    }
}