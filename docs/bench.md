go gin with jsoniter

➜  arevel git:(master) ✗ artillery quick --count 100 -n 100 http://localhost:8080/_health
Started phase 0, duration: 2s @ 23:11:33(-0500) 2019-05-25
Report @ 23:11:38(-0500) 2019-05-25
Elapsed time: 5 seconds
  Scenarios launched:  100
  Scenarios completed: 100
  Requests completed:  10000
  RPS sent: 1964.64
  Request latency:
    min: 0.2
    max: 71.4
    median: 13.8
    p95: 19
    p99: 24
  Codes:
    404: 10000

All virtual users finished
Summary report @ 23:11:38(-0500) 2019-05-25
  Scenarios launched:  100
  Scenarios completed: 100
  Requests completed:  10000
  RPS sent: 1945.53
  Request latency:
    min: 0.2
    max: 71.4
    median: 13.8
    p95: 19
    p99: 24
  Scenario counts:
    0: 100 (100%)
  Codes:
    404: 10000

➜  arevel git:(master) ✗ curl http://localhost:8080/_health
{"Status":"OK"}



go gin
largely about the same

Started phase 0, duration: 2s @ 23:08:29(-0500) 2019-05-25
Report @ 23:08:34(-0500) 2019-05-25
Elapsed time: 5 seconds
  Scenarios launched:  100
  Scenarios completed: 100
  Requests completed:  10000
  RPS sent: 1972.39
  Request latency:
    min: 0.3
    max: 70.3
    median: 14.8
    p95: 19.1
    p99: 24.8
  Codes:
    404: 10000

All virtual users finished
Summary report @ 23:08:34(-0500) 2019-05-25
  Scenarios launched:  100
  Scenarios completed: 100
  Requests completed:  10000
  RPS sent: 1953.13
  Request latency:
    min: 0.3
    max: 70.3
    median: 14.8
    p95: 19.1
    p99: 24.8
  Scenario counts:
    0: 100 (100%)
  Codes:
    404: 10000


elixir
Started phase 0, duration: 2s @ 23:02:29(-0500) 2019-05-25
Report @ 23:02:34(-0500) 2019-05-25
Elapsed time: 5 seconds
  Scenarios launched:  100
  Scenarios completed: 100
  Requests completed:  10000
  RPS sent: 1976.28
  Request latency:
    min: 0.3
    max: 69.2
    median: 14.9
    p95: 19.8
    p99: 25.3
  Codes:
    200: 10000

All virtual users finished
Summary report @ 23:02:34(-0500) 2019-05-25
  Scenarios launched:  100
  Scenarios completed: 100
  Requests completed:  10000
  RPS sent: 1960.78
  Request latency:
    min: 0.3
    max: 69.2
    median: 14.9
    p95: 19.8
    p99: 25.3
  Scenario counts:
    0: 100 (100%)
  Codes:
    200: 10000


go

Started phase 0, duration: 2s @ 23:01:42(-0500) 2019-05-25
Report @ 23:01:47(-0500) 2019-05-25
Elapsed time: 5 seconds
  Scenarios launched:  100
  Scenarios completed: 100
  Requests completed:  10000
  RPS sent: 1960.78
  Request latency:
    min: 0.2
    max: 69.8
    median: 15.1
    p95: 20.3
    p99: 33.2
  Codes:
    404: 10000

All virtual users finished
Summary report @ 23:01:48(-0500) 2019-05-25
  Scenarios launched:  100
  Scenarios completed: 100
  Requests completed:  10000
  RPS sent: 1941.75
  Request latency:
    min: 0.2
    max: 69.8
    median: 15.1
    p95: 20.3
    p99: 33.2
  Scenario counts:
    0: 100 (100%)
  Codes:
    404: 10000



Go again

artillery quick --count 100 -n 100 http://localhost:8080/_health
Started phase 0, duration: 2s @ 22:56:59(-0500) 2019-05-25
Report @ 22:57:04(-0500) 2019-05-25
Elapsed time: 5 seconds
  Scenarios launched:  100
  Scenarios completed: 100
  Requests completed:  10000
  RPS sent: 1968.5
  Request latency:
    min: 0.2
    max: 69.7
    median: 14.9
    p95: 19.6
    p99: 23.4
  Codes:
    404: 10000

All virtual users finished
Summary report @ 22:57:04(-0500) 2019-05-25
  Scenarios launched:  100
  Scenarios completed: 100
  Requests completed:  10000
  RPS sent: 1949.32
  Request latency:
    min: 0.2
    max: 69.7
    median: 14.9
    p95: 19.6
    p99: 23.4
  Scenario counts:
    0: 100 (100%)
  Codes:
    404: 10000



-----------

May 25 with elixir

➜  hello artillery quick --count 10000 -n 20 http://localhost:4000/_health
Started phase 0, duration: 200s @ 22:44:09(-0500) 2019-05-25
Report @ 22:44:19(-0500) 2019-05-25
Elapsed time: 10 seconds
  Scenarios launched:  499
  Scenarios completed: 392
  Requests completed:  7859
  RPS sent: 799
  Request latency:
    min: 0.6
    max: 58.8
    median: 5.8
    p95: 14.3
    p99: 21.8
  Codes:
    200: 3788
    500: 4071
  Errors:
    ECONNRESET: 107

Warning: 
CPU usage of Artillery seems to be very high (pids: 35903)
which may severely affect its performance.
See https://artillery.io/docs/faq/#high-cpu-warnings for details.

Report @ 22:44:29(-0500) 2019-05-25
Elapsed time: 20 seconds
  Scenarios launched:  500
  Scenarios completed: 392
  Requests completed:  7840
  RPS sent: 797.19
  Request latency:
    min: 0.6
    max: 5.8
    median: 0.8
    p95: 1.8
    p99: 2.7
  Codes:
    500: 7840
  Errors:
    ECONNRESET: 108

Report @ 22:44:39(-0500) 2019-05-25
Elapsed time: 30 seconds
  Scenarios launched:  500
  Scenarios completed: 392
  Requests completed:  7840
  RPS sent: 796.39
  Request latency:
    min: 0.6
    max: 6.9
    median: 0.9
    p95: 1.9
    p99: 2.9
  Codes:
    500: 7840
  Errors:
    ECONNRESET: 108

Warning: High CPU usage warning (pids: 35903).
See https://artillery.io/docs/faq/#high-cpu-warnings for details.

Report @ 22:44:49(-0500) 2019-05-25
Elapsed time: 40 seconds
  Scenarios launched:  500
  Scenarios completed: 392
  Requests completed:  7840
  RPS sent: 795.6
  Request latency:
    min: 0.6
    max: 4.9
    median: 0.8
    p95: 1.7
    p99: 2.6
  Codes:
    500: 7840
  Errors:
    ECONNRESET: 108


------------------

Basic go server

atillery quick --count 10000 -n 20 http://localhost:8080/_health

Started phase 0, duration: 200s @ 22:53:30(-0500) 2019-05-25
Report @ 22:53:40(-0500) 2019-05-25
Elapsed time: 10 seconds
  Scenarios launched:  499
  Scenarios completed: 247
  Requests completed:  4975
  RPS sent: 524.8
  Request latency:
    min: 0.1
    max: 4290.3
    median: 0.2
    p95: 1.6
    p99: 3
  Codes:
    404: 4940
    500: 35
  Errors:
    ECONNRESET: 9
    EPIPE: 1

Warning: 
CPU usage of Artillery seems to be very high (pids: 36749)
which may severely affect its performance.
See https://artillery.io/docs/faq/#high-cpu-warnings for details.

Report @ 22:53:50(-0500) 2019-05-25
Elapsed time: 20 seconds
  Scenarios launched:  500
  Scenarios completed: 0
  Requests completed:  18
  RPS sent: 52.01
  Request latency:
    min: 4806.9
    max: 13774.6
    median: 9275
    p95: 13564.3
    p99: 13774.6
  Codes:
    500: 18
  Errors:
    ECONNRESET: 19
    EPIPE: 2

Report @ 22:54:00(-0500) 2019-05-25
Elapsed time: 30 seconds
  Scenarios launched:  500
  Scenarios completed: 0
  Requests completed:  18
  RPS sent: 51.85
  Request latency:
    min: 14296.2
    max: 23214.8
    median: 18765
    p95: 23004.6
    p99: 23214.8
  Codes:
    500: 18
  Errors:
    ECONNRESET: 21
    EPIPE: 3



------
Woot. Works now. I think. Needed to ssh in and verify why it wasn't running - seemed to be just cloudsql path, which kinda sucks that its a startup error. 
I can't verify the https version yet, but let's run the same benchmark against the http version

http://35.225.79.66:9080/


Started phase 0, duration: 1s @ 00:45:35(-0500) 2019-04-15
Report @ 00:45:37(-0500) 2019-04-15
Elapsed time: 2 seconds
  Scenarios launched:  10
  Scenarios completed: 10
  Requests completed:  200
  RPS sent: 106.95
  Request latency:
    min: 34.2
    max: 95.3
    median: 37.8
    p95: 70.3
    p99: 79.8
  Codes:
    200: 200

All virtual users finished
Summary report @ 00:45:37(-0500) 2019-04-15
  Scenarios launched:  10
  Scenarios completed: 10
  Requests completed:  200
  RPS sent: 106.38
  Request latency:
    min: 34.2
    max: 95.3
    median: 37.8
    p95: 70.3
    p99: 79.8
  Scenario counts:
    0: 10 (100%)
  Codes:
    200: 200

---------
p99 is better, requests per second is better, min is slightly better (2ms). In the browser as well, this matches up with what I see - and it's about as good as you can expect with network latency. I am happy with this (vs the 50ms, which frankly is horribly slwo and unacceptable :P. Nah, I just like this config more. I have the freedom to own and manage the system any way I want). Builds and deploys are faster as well vs the flex environment setup. It's not that much more complex either after some initial work. 


With the better instance type and kernel tweaks;

Started phase 0, duration: 1s @ 00:52:04(-0500) 2019-04-16
Report @ 00:52:06(-0500) 2019-04-16
Elapsed time: 2 seconds
  Scenarios launched:  10
  Scenarios completed: 10
  Requests completed:  200
  RPS sent: 108.11
  Request latency:
    min: 32.9
    max: 72.9
    median: 36
    p95: 66.6
    p99: 70.2
  Codes:
    200: 200

All virtual users finished
Summary report @ 00:52:06(-0500) 2019-04-16
  Scenarios launched:  10
  Scenarios completed: 10
  Requests completed:  200
  RPS sent: 107.53
  Request latency:
    min: 32.9
    max: 72.9
    median: 36
    p95: 66.6
    p99: 70.2
  Scenario counts:
    0: 10 (100%)
  Codes:
    200: 200

with the logging changes

Started phase 0, duration: 1s @ 01:04:47(-0500) 2019-04-16
Report @ 01:04:49(-0500) 2019-04-16
Elapsed time: 2 seconds
  Scenarios launched:  10
  Scenarios completed: 10
  Requests completed:  200
  RPS sent: 107.53
  Request latency:
    min: 32.9
    max: 74.4
    median: 36.1
    p95: 68.7
    p99: 71.7
  Codes:
    200: 200

All virtual users finished
Summary report @ 01:04:49(-0500) 2019-04-16
  Scenarios launched:  10
  Scenarios completed: 10
  Requests completed:  200
  RPS sent: 107.53
  Request latency:
    min: 32.9
    max: 74.4
    median: 36.1
    p95: 68.7
    p99: 71.7
  Scenario counts:
    0: 10 (100%)
  Codes:
    200: 200




Doing an actual test was very disapointing
➜  arevel git:(master) ✗ wrk -t4 -c4 -d15s --latency "http://34.66.97.108:9080" 
Running 15s test @ http://34.66.97.108:9080
  4 threads and 4 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    41.38ms   35.92ms 408.24ms   97.80%
    Req/Sec    26.86      4.74    38.00     78.82%
  Latency Distribution
     50%   35.41ms
     75%   35.67ms
     90%   36.88ms
     99%  258.11ms
  1604 requests in 15.05s, 692.35KB read
Requests/sec:    106.57
Transfer/sec:     46.00KB


I think this is as low as I can get it. 
ping 34.66.97.108      
64 bytes from 34.66.97.108: icmp_seq=0 ttl=53 time=37.794 ms

So it's basically all network delay at this point. The server itself is performing fine. 
I don't know why the requests per second wasn't that high, but it'll do. 


Server setup
ulimit -n 200000
Set min heap space to be a bit larger. Maybe between 1 and 6kb? 6 kb sounds nice and appropriate to me. Increases memory usage for concurrency, but limits cpu time spent on gc as it's pre-allocated to a larger size. Maybe let's compromize and set at 2/3 kb and let it grow. 
