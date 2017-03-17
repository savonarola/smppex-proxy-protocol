# ProxyProtocolMc

This is an axample of SMPPEX usage for accepting SMPP connections forwarded from
a HAProxy instance and enhanced with
[Proxy Protocol](http://www.haproxy.org/download/1.8/doc/proxy-protocol.txt)
information.

SMPPEX is built on top of Ranch library, so it is Ranch transport agnostic.
Since there is an implementation of a Ranch transport supporting Proxy Protocol
by Heroku([ranch_proxy](https://github.com/heroku/ranch_proxy_protocol)),
everithing is very straightforward.

To reproduce the demo, do the following.

First, run sample SMPPEX MC:

```
proxy_protocol_mc >iex -S mix
Erlang/OTP 19 [erts-8.2] [source] [64-bit] [smp:4:4] [async-threads:10] [hipe] [kernel-poll:false] [dtrace]

Interactive Elixir (1.4.0) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)>
```

Then, run HAProxy:

```
proxy_protocol_mc >haproxy -f config/haproxy.conf
```

Connect to the MC through HAProxy:

```
proxy_protocol_mc >telnet 127.0.0.1 60500
Trying 127.0.0.1...
Connected to localhost.
Escape character is '^]'.
```

Now, if we look into MC's console, we'll see the successfully extracted proxy
information:

```
Erlang/OTP 19 [erts-8.2] [source] [64-bit] [smp:4:4] [async-threads:10] [hipe] [kernel-poll:false] [dtrace]

Interactive Elixir (1.4.0) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)>
10:34:28.883 [info]  Proxy info: {:ok, {{{127, 0, 0, 1}, 65320}, {{127, 0, 0, 1}, 60500}}}
```

Yay!
