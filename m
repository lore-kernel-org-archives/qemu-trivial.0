Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1egSLQ-0007Ho-Ql
	for mharc-qemu-trivial@gnu.org; Tue, 30 Jan 2018 04:36:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48161)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1egSLK-0007Bs-S0
	for qemu-trivial@nongnu.org; Tue, 30 Jan 2018 04:36:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1egSLA-0005vX-Gm
	for qemu-trivial@nongnu.org; Tue, 30 Jan 2018 04:36:42 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53132)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1egSL3-0005ic-8c; Tue, 30 Jan 2018 04:36:25 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AD6D2690A;
	Tue, 30 Jan 2018 09:36:23 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-136.ams2.redhat.com
	[10.36.116.136])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 69D6F5C3FA;
	Tue, 30 Jan 2018 09:36:22 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>
Date: Tue, 30 Jan 2018 10:36:21 +0100
Message-Id: <1517304981-28254-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 30 Jan 2018 09:36:23 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] qemu-options.hx: Remove confusing spaces in
 parameter listings
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 30 Jan 2018 09:36:48 -0000

The spaces between the parameters in the chardev and tpmdev sections
are rather confusing than helpful, and prevent that the lists can be
copy-n-pasted easily for real usage. We also don't use such spaces
in other sections in the documentation, e.g. with the -netdev option,
so let's be consistent and remove the spaces in the chardev and tpmdev
sections, too.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 qemu-options.hx | 48 ++++++++++++++++++++++++------------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 8ce427d..08a73fa 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2522,7 +2522,7 @@ STEXI
 
 The general form of a character device option is:
 @table @option
-@item -chardev @var{backend} ,id=@var{id} [,mux=on|off] [,@var{options}]
+@item -chardev @var{backend},id=@var{id}[,mux=on|off][,@var{options}]
 @findex -chardev
 Backend is one of:
 @option{null},
@@ -2541,7 +2541,7 @@ Backend is one of:
 @option{tty},
 @option{parallel},
 @option{parport},
-@option{spicevmc}.
+@option{spicevmc},
 @option{spiceport}.
 The specific backend will determine the applicable options.
 
@@ -2605,11 +2605,11 @@ opened.
 The available backends are:
 
 @table @option
-@item -chardev null ,id=@var{id}
+@item -chardev null,id=@var{id}
 A void device. This device will not emit any data, and will drop any data it
 receives. The null backend does not take any options.
 
-@item -chardev socket ,id=@var{id} [@var{TCP options} or @var{unix options}] [,server] [,nowait] [,telnet] [,reconnect=@var{seconds}] [,tls-creds=@var{id}]
+@item -chardev socket,id=@var{id}[,@var{TCP options} or @var{unix options}][,server][,nowait][,telnet][,reconnect=@var{seconds}][,tls-creds=@var{id}]
 
 Create a two-way stream socket, which can be either a TCP or a unix socket. A
 unix socket will be created if @option{path} is specified. Behaviour is
@@ -2636,7 +2636,7 @@ TCP and unix socket options are given below:
 
 @table @option
 
-@item TCP options: port=@var{port} [,host=@var{host}] [,to=@var{to}] [,ipv4] [,ipv6] [,nodelay]
+@item TCP options: port=@var{port}[,host=@var{host}][,to=@var{to}][,ipv4][,ipv6][,nodelay]
 
 @option{host} for a listening socket specifies the local address to be bound.
 For a connecting socket species the remote host to connect to. @option{host} is
@@ -2664,7 +2664,7 @@ required.
 
 @end table
 
-@item -chardev udp ,id=@var{id} [,host=@var{host}] ,port=@var{port} [,localaddr=@var{localaddr}] [,localport=@var{localport}] [,ipv4] [,ipv6]
+@item -chardev udp,id=@var{id}[,host=@var{host}],port=@var{port}[,localaddr=@var{localaddr}][,localport=@var{localport}][,ipv4][,ipv6]
 
 Sends all traffic from the guest to a remote host over UDP.
 
@@ -2683,12 +2683,12 @@ available local port will be used.
 @option{ipv4} and @option{ipv6} specify that either IPv4 or IPv6 must be used.
 If neither is specified the device may use either protocol.
 
-@item -chardev msmouse ,id=@var{id}
+@item -chardev msmouse,id=@var{id}
 
 Forward QEMU's emulated msmouse events to the guest. @option{msmouse} does not
 take any options.
 
-@item -chardev vc ,id=@var{id} [[,width=@var{width}] [,height=@var{height}]] [[,cols=@var{cols}] [,rows=@var{rows}]]
+@item -chardev vc,id=@var{id}[[,width=@var{width}][,height=@var{height}]][[,cols=@var{cols}][,rows=@var{rows}]]
 
 Connect to a QEMU text console. @option{vc} may optionally be given a specific
 size.
@@ -2699,12 +2699,12 @@ the console, in pixels.
 @option{cols} and @option{rows} specify that the console be sized to fit a text
 console with the given dimensions.
 
-@item -chardev ringbuf ,id=@var{id} [,size=@var{size}]
+@item -chardev ringbuf,id=@var{id}[,size=@var{size}]
 
 Create a ring buffer with fixed size @option{size}.
 @var{size} must be a power of two and defaults to @code{64K}.
 
-@item -chardev file ,id=@var{id} ,path=@var{path}
+@item -chardev file,id=@var{id},path=@var{path}
 
 Log all traffic received from the guest to a file.
 
@@ -2712,7 +2712,7 @@ Log all traffic received from the guest to a file.
 created if it does not already exist, and overwritten if it does. @option{path}
 is required.
 
-@item -chardev pipe ,id=@var{id} ,path=@var{path}
+@item -chardev pipe,id=@var{id},path=@var{path}
 
 Create a two-way connection to the guest. The behaviour differs slightly between
 Windows hosts and other hosts:
@@ -2729,14 +2729,14 @@ be present.
 @option{path} forms part of the pipe path as described above. @option{path} is
 required.
 
-@item -chardev console ,id=@var{id}
+@item -chardev console,id=@var{id}
 
 Send traffic from the guest to QEMU's standard output. @option{console} does not
 take any options.
 
 @option{console} is only available on Windows hosts.
 
-@item -chardev serial ,id=@var{id} ,path=@option{path}
+@item -chardev serial,id=@var{id},path=@option{path}
 
 Send traffic from the guest to a serial device on the host.
 
@@ -2745,33 +2745,33 @@ not only serial lines.
 
 @option{path} specifies the name of the serial device to open.
 
-@item -chardev pty ,id=@var{id}
+@item -chardev pty,id=@var{id}
 
 Create a new pseudo-terminal on the host and connect to it. @option{pty} does
 not take any options.
 
 @option{pty} is not available on Windows hosts.
 
-@item -chardev stdio ,id=@var{id} [,signal=on|off]
+@item -chardev stdio,id=@var{id}[,signal=on|off]
 Connect to standard input and standard output of the QEMU process.
 
 @option{signal} controls if signals are enabled on the terminal, that includes
 exiting QEMU with the key sequence @key{Control-c}. This option is enabled by
 default, use @option{signal=off} to disable it.
 
-@item -chardev braille ,id=@var{id}
+@item -chardev braille,id=@var{id}
 
 Connect to a local BrlAPI server. @option{braille} does not take any options.
 
-@item -chardev tty ,id=@var{id} ,path=@var{path}
+@item -chardev tty,id=@var{id},path=@var{path}
 
 @option{tty} is only available on Linux, Sun, FreeBSD, NetBSD, OpenBSD and
 DragonFlyBSD hosts.  It is an alias for @option{serial}.
 
 @option{path} specifies the path to the tty. @option{path} is required.
 
-@item -chardev parallel ,id=@var{id} ,path=@var{path}
-@itemx -chardev parport ,id=@var{id} ,path=@var{path}
+@item -chardev parallel,id=@var{id},path=@var{path}
+@itemx -chardev parport,id=@var{id},path=@var{path}
 
 @option{parallel} is only available on Linux, FreeBSD and DragonFlyBSD hosts.
 
@@ -2780,7 +2780,7 @@ Connect to a local parallel port.
 @option{path} specifies the path to the parallel port device. @option{path} is
 required.
 
-@item -chardev spicevmc ,id=@var{id} ,debug=@var{debug}, name=@var{name}
+@item -chardev spicevmc,id=@var{id},debug=@var{debug},name=@var{name}
 
 @option{spicevmc} is only available when spice support is built in.
 
@@ -2790,7 +2790,7 @@ required.
 
 Connect to a spice virtual machine channel, such as vdiport.
 
-@item -chardev spiceport ,id=@var{id} ,debug=@var{debug}, name=@var{name}
+@item -chardev spiceport,id=@var{id},debug=@var{debug},name=@var{name}
 
 @option{spiceport} is only available when spice support is built in.
 
@@ -2898,7 +2898,7 @@ STEXI
 The general form of a TPM device option is:
 @table @option
 
-@item -tpmdev @var{backend} ,id=@var{id} [,@var{options}]
+@item -tpmdev @var{backend},id=@var{id}[,@var{options}]
 @findex -tpmdev
 
 The specific backend type will determine the applicable options.
@@ -2913,7 +2913,7 @@ The available backends are:
 
 @table @option
 
-@item -tpmdev passthrough, id=@var{id}, path=@var{path}, cancel-path=@var{cancel-path}
+@item -tpmdev passthrough,id=@var{id},path=@var{path},cancel-path=@var{cancel-path}
 
 (Linux-host only) Enable access to the host's TPM using the passthrough
 driver.
@@ -2950,7 +2950,7 @@ To create a passthrough TPM use the following two options:
 Note that the @code{-tpmdev} id is @code{tpm0} and is referenced by
 @code{tpmdev=tpm0} in the device option.
 
-@item -tpmdev emulator, id=@var{id}, chardev=@var{dev}
+@item -tpmdev emulator,id=@var{id},chardev=@var{dev}
 
 (Linux-host only) Enable access to a TPM emulator using Unix domain socket based
 chardev backend.
-- 
1.8.3.1


