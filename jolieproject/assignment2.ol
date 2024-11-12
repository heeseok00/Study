include "time.iol"
from console import Console

service API_Monitor {
    embed Console as console

    init {
        totalInvocations = 0;
        totalFailures = 0;
        totalResponseTime = 0;
    }

    operation recordInvocation( startTime: long, endTime: long )( result ) {
        totalInvocations = totalInvocations + 1;
        totalResponseTime = totalResponseTime + (endTime - startTime);
        result = "Invocation recorded";
    }

    operation recordFailure()( result ) {
        totalFailures = totalFailures + 1;
        result = "Failure recorded";
    }

    operation getStatistics()( stats ) {
        var averageResponseTime = 0;
        var failureRate = 0;
        
        if( totalInvocations > 0 ) {
            averageResponseTime = totalResponseTime / totalInvocations;
            failureRate = (totalFailures * 100) / totalInvocations;
        }

        stats = {
            "average_response_time": averageResponseTime,
            "invocation_rate": totalInvocations,
            "failure_rate": failureRate
        };
    }
}

main {
    embed API_Monitor as monitor

    startTime = time.now();
    endTime = startTime + 200;
    monitor.recordInvocation( startTime, endTime )();

    stats = monitor.getStatistics()();
    println@console( "Current Stats: " + stats );
}
