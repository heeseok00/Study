/* 
This file defines a simple service offering a single operation for generating personalised greeting messages and a few services to test it (locally). Try
 - jolie -s SerialTest greeter.ol
 - jolie -s ParallelTest greeter.ol
This provides the examples of
 - interfaces
 - input ports
 - service execution modality
 - input statements
 - parallel statement composition 
*/

/** API offered by the service  */
interface GreeterAPI { 
  requestResponse: 
    /** takes a name and returns a greeting */ 
    greet( string )( string )
}

/** A service for generating personalised greeting messages */
service Greeter {
  /* The execution modality specifies how the service behaviour is be executed
     It can take three values: 
      - `single`: the service behaviour (main block) is executed once and then
        the service is disposed. This is the default.
      - `sequential`: when the service behaviour terminates, it is restarted. 
        The service behaviour must start with an input statement.
        This allows to serve multiple requests sequentially and can be useful to guarantee single access to resources managed by the service.
      - `concurrent`: similarly to `sequential`, the service behaviour can be 
        executed multiple times. Executions may happen concurrently and start 
        whenever its first input statement can receive a message. 
     Each execution of the service behaviour has a dedicated scope providing a 
     private scope and isolation between runs of the main block. (Jolie 
     supports a global scope shared across concurrent/sequential runs which 
     will be covered later in the course.) */ 
  execution: concurrent
  
  /* An input port defines an access point for the service specifying which 
     operations can be invoked (`interfaces`) and how (`location` and 
     `protocol`). We will explore interfaces, locations, and protocols as we 
     make progress during the course. For these first examples of services meant to be embedded and accessed locally via in-memory channels (within the same Jolie program) like e.g. `Console`, we set location to "local" leaving to Jolie to setup an appropriate channel and protocol. */
  inputPort greeterInput {
    location: "local"
    interfaces: GreeterAPI
  }

  /* service behaviour */
  main {
    /* with the following input statement, the execution is suspended waiting 
       for an invocation of the operation `greet`. When an invocation is 
       received, 
        - the request is stored in the first variable (here, `request`);
        - the block is executed to populate the second variable (here, 
          `response`); 
        - when the block is completed, the value stored under `response`
          is attached to the reply and sent to the invoker. */
    greet( request )( response ) { 
      response = "Hello, " + request + "!"
    }
  } 
}

/* A few services to test Greeter */

from console import Console

/** This service embeds Greeter and tests it by performing sequential 
    invocations of its operation */
service SerialTest {
  
  execution: single // default

  embed Console as console
  embed Greeter as greeter

  main {
      greet@greeter("Alice")( response )
      println@console( response )()
      greet@greeter("Bob")( response )
      println@console( response )()
      greet@greeter("Charlie")( response )
      println@console( response )()
  }
}

/** This service embeds Greeter and tests it by performing concurrent 
    invocations of its operation */
service ParallelTest {
  
  execution: single // default

  embed Console as console
  embed Greeter as greeter

  main {
      println@console( greet@greeter("Alice") )()
      |
      println@console( greet@greeter("Bob") )()
      |
      println@console( greet@greeter("Charlie") )()
  }
}