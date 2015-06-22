Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z6zyt-0005SF-RK
	for mharc-qemu-trivial@gnu.org; Mon, 22 Jun 2015 07:33:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55145)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z6zym-0005EG-Es
	for qemu-trivial@nongnu.org; Mon, 22 Jun 2015 07:33:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z6zyl-0008At-8p
	for qemu-trivial@nongnu.org; Mon, 22 Jun 2015 07:33:32 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:56064)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Z6zyf-00088I-8l; Mon, 22 Jun 2015 07:33:25 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 399A541E48;
	Mon, 22 Jun 2015 14:33:24 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 764B1A8B;
	Mon, 22 Jun 2015 14:17:31 +0300 (MSK)
Received: (nullmailer pid 9300 invoked by uid 1000);
	Mon, 22 Jun 2015 11:17:30 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 22 Jun 2015 14:16:28 +0300
Message-Id: <43ce995c79c09595e6fbdcabecd1c8b43cf9e4a4.1434971627.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1434971627.git.mjt@msgid.tls.msk.ru>
References: <cover.1434971627.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Wolfgang Bumiller <w.bumiller@proxmox.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 21/21] util/qemu-sockets: improve ai_flag
	hints for ipv6 hosts
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Jun 2015 11:33:33 -0000

From: Wolfgang Bumiller <w.bumiller@proxmox.com>

*) Do not use AI_ADDRCONFIG on listening sockets, because this flag
makes it impossible to explicitly listen on '127.0.0.1' if no global
ipv4 address is configured additionally, making this a very
uncomfortable option.
*) Add AI_V4MAPPED hint for connecting sockets.

If your system is globally only connected via ipv6 you often still want
to be able to use '127.0.0.1' and 'localhost' (even if localhost doesn't
also have an ipv6 entry).
For example, PVE - unless explicitly asking for insecure mode - uses
ipv4 loopback addresses with QEMU for live migrations tunneled over SSH.
These fail to start because AI_ADDRCONFIG makes getaddrinfo refuse to
work with '127.0.0.1'.

As for the AI_V4MAPPED flag: glibc uses it by default, and providing
non-0 flags removes it. I think it makes sense to use it.

I also want to point out that glibc explicitly sidesteps POSIX standards
when passing 0 as hints by then assuming both AI_V4MAPPED and
AI_ADDRCONFIG (the latter being a rather weird choice IMO), while
according to POSIX.1-2001 it should be assumed 0. (glibc considers its
choice an improvement.)
Since either AI_CANONNAME or AI_PASSIVE are passed in our cases, glibc's
default flags in turn are disabled again unless explicitly added, which
I do with this patch.

Signed-off-by: Wolfgang Bumiller <w.bumiller@proxmox.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 util/qemu-sockets.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index 4026314..64b6a06 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -118,7 +118,7 @@ int inet_listen_opts(QemuOpts *opts, int port_offset, Error **errp)
     int slisten, rc, to, port_min, port_max, p;
 
     memset(&ai,0, sizeof(ai));
-    ai.ai_flags = AI_PASSIVE | AI_ADDRCONFIG;
+    ai.ai_flags = AI_PASSIVE;
     ai.ai_family = PF_UNSPEC;
     ai.ai_socktype = SOCK_STREAM;
 
@@ -335,7 +335,7 @@ static struct addrinfo *inet_parse_connect_opts(QemuOpts *opts, Error **errp)
 
     memset(&ai, 0, sizeof(ai));
 
-    ai.ai_flags = AI_CANONNAME | AI_ADDRCONFIG;
+    ai.ai_flags = AI_CANONNAME | AI_V4MAPPED | AI_ADDRCONFIG;
     ai.ai_family = PF_UNSPEC;
     ai.ai_socktype = SOCK_STREAM;
 
@@ -435,7 +435,7 @@ int inet_dgram_opts(QemuOpts *opts, Error **errp)
 
     /* lookup peer addr */
     memset(&ai,0, sizeof(ai));
-    ai.ai_flags = AI_CANONNAME | AI_ADDRCONFIG;
+    ai.ai_flags = AI_CANONNAME | AI_V4MAPPED | AI_ADDRCONFIG;
     ai.ai_family = PF_UNSPEC;
     ai.ai_socktype = SOCK_DGRAM;
 
-- 
2.1.4


