---
title: "Use Getflix or Unblock-Us servers selectively with Dnsmasq"
description: "How to use DNSMASQ to specify DNS servers according to the URL"
date: "2014-05-16"
categories: 
  - "technology"
code: true
---

I subscribe to [Getflix](//www.getflix.com.au/ "Getflix"), which is quite similar to [Unblock-Us](//www.unblock-us.com/ "Unblock-Us") in that it allows users to access geo-blocked content. The basic method to use these services is to set one's device to use their provided DNS servers, but this sends all DNS requests their way. I wanted only to use their DNS servers to resolve specific geo-blocked URLs.

There are a couple of reasons you might want to do this - you may be concerned about yet another party being privy to your site visits, and in my case I wanted to retain the faster, closer DNS servers provided by my ISP for the majority of my web requests.

[Dnsmasq](//www.thekelleys.org.uk/dnsmasq/doc.html "Dnsmasq - network services for small networks") is present in several flavours of custom firmware available for many consumer routers, but since that was unavailable to me I have set it up on my [NAS](/2013/03/the-n40l-nas-with-the-icy-dock-duoswap "The N40L NAS with the Icy Dock DuoSwap"), which runs the Ubuntu-server linux distro. There are many guides for setting up Dnsmasq on many systems (for me it was as easy as "sudo apt-get install dnsmasq"), so I'll just stick to explaining why I've configured it as I have.

Here is my Dnsmasq configuration file. Much of this isn't necessary for this goal but I've kept it intact for context. I'll go through why I've made certain decisions and it may help someone else.

```ini
# /etc/dnsmasq.conf
 
# regular dns servers (IPs redacted)
server=x.x.x.x
server=x.x.x.x
server=x.x.x.x
server=x.x.x.x
 
# getflix primary dns
server=/getflix.com.au/54.252.183.4
server=/netflix.com/54.252.183.4
server=/watchafl.afl.com.au/rightster.com/54.252.183.4
server=/hulu.com/a248.e.akamai.net/54.252.183.4
server=/pbs.org/54.252.183.4
server=/bbc.co.uk/cp143012-i.akamaihd.net/54.252.183.4
server=/itv.com/54.252.183.4
server=/channel4.com/54.252.183.4
 
# getflix secondary dns
server=/getflix.com.au/54.252.183.5
server=/netflix.com/54.252.183.5
server=/watchafl.afl.com.au/rightster.com/54.252.183.5
server=/hulu.com/a248.e.akamai.net/54.252.183.5
server=/pbs.org/54.252.183.5
server=/bbc.co.uk/cp143012-i.akamaihd.net/54.252.183.5
server=/itv.com/54.252.183.5
server=/channel4.com/54.252.183.5
 
# settings
interface=em1       # accept requests from the em1 interface
bogus-priv          # don't forward non-routable (local) addresses
domain-needed       # don't forward incomplete hostnames (names without dots)
no-resolv           # don't read /etc/resolv.conf to get upstream servers
all-servers         # use all servers, use the first returned
#strict-order       # query servers in the order they appear
domain=local        # set the domain name of this network
local=/local/       # set selected domains to only resolve locally
expand-hosts        # add our domain name to our local hostnames
cache-size=10000    # increase the cache to 10k records
no-hosts            # don't use the regular hosts file
addn-hosts=/etc/dnsmasq.hosts   # use alternate hosts file
 
# dhcp: set range, netmask and lease time for unidentified clients
dhcp-range=192.168.1.100,192.168.1.199,255.255.255.0,168h
read-ethers                     # read the /etc/ethers file for static assignment
dhcp-option=3,192.168.1.1       # set the gateway (router)
 
# logging
log-facility=/var/log/dnsmasq   # log file
#log-queries                    # log dns queries
#log-dhcp                       # log dhcp activity
 
# disable a bunch of windows stuff
filterwin2k                     # block certain unnecessary windows requests
dhcp-option=19,0                # set ip-forwarding off
dhcp-option=44,0.0.0.0          # set netbios-over-TCP/IP (WINS) nameserver(s)
dhcp-option=45,0.0.0.0          # netbios datagram distribution server
dhcp-option=46,8                # netbios node type
dhcp-option=252,"\n"            # tell windows not to ask for proxy info
dhcp-option=vendor:MSFT,2,1i    # tell windows to release lease on shutdown
```

While troubleshooting my setup I was logging DHCP and DNS activity on top of the standard Dnsmasq reporting, but I've turned both off now. The final block of the config turns off a bunch of stuff related to Windows clients, which I do have, but my network is so small that they are pointless overheads.

That's about it! Let me know if you have any questions about my configuration, or if you can help me improve upon it. My thanks to these articles, which pointed me in the right direction:

- [Setting up dnsmasq with Ubuntu 10.04 for home networking](//www.dickson.me.uk/2012/03/26/setting-up-dnsmasq-with-ubuntu-10-04-for-home-networking/ "Setting up dnsmasq with Ubuntu 10.04 for home networking")
- [Dnsmasq For Easy LAN Name Services](//www.linux.com/learn/tutorials/516220-dnsmasq-for-easy-lan-name-services "Dnsmasq For Easy LAN Name Services")
- [HowTo/dnsmasq](//wiki.debian.org/HowTo/dnsmasq "HowTo/dnsmasq")

## Updates

**17 May 2014:** Since posting this I've changed router, and the new one doesn't support DHCP relaying. So I'm now doing DHCP on the router itself and am simply using Dnsmasq for DNS. I have commented out all of the DHCP lines in ```/etc/dnsmasq.conf``` and therefore no longer use ```/etc/ethers```, but everything still works as before.