from console import Console

service Test {
    embed Console as console
    main {
        println@console("hello world")()
    }
}