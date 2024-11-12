from console import Console

service Main {
  embed Console as console
  
  main {
    println@console("Hello world!")()
  }
}