
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
