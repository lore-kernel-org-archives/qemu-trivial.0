Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YvQad-0004yj-4j
	for mharc-qemu-trivial@gnu.org; Thu, 21 May 2015 09:32:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59263)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <w.bumiller@proxmox.com>) id 1YvPpo-0001mU-GV
	for qemu-trivial@nongnu.org; Thu, 21 May 2015 08:44:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <w.bumiller@proxmox.com>) id 1YvPph-0000c2-N3
	for qemu-trivial@nongnu.org; Thu, 21 May 2015 08:44:24 -0400
Received: from proxmox.maurer-it.com ([94.136.31.133]:34997)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <w.bumiller@proxmox.com>) id 1YvPph-0000bd-Fx
	for qemu-trivial@nongnu.org; Thu, 21 May 2015 08:44:17 -0400
Received: from proxmox.maurer-it.com (localhost.localdomain [127.0.0.1])
	by proxmox.maurer-it.com (Proxmox) with ESMTP id DEC48AD096D
	for <qemu-trivial@nongnu.org>; Thu, 21 May 2015 14:33:43 +0200 (CEST)
From: Wolfgang Bumiller <w.bumiller@proxmox.com>
To: qemu-trivial@nongnu.org
Date: Thu, 21 May 2015 14:33:29 +0200
Message-Id: <1432211609-13466-1-git-send-email-w.bumiller@proxmox.com>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 94.136.31.133
X-Mailman-Approved-At: Thu, 21 May 2015 09:32:46 -0400
Subject: [Qemu-trivial] [PATCH] util/qemu-sockets: improve ai_flag hints for
	ipv6 hosts
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
X-List-Received-Date: Thu, 21 May 2015 12:44:25 -0000

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
---
 util/qemu-sockets.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index 6b97dc1..f99b013 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -114,7 +114,7 @@ int inet_listen_opts(QemuOpts *opts, int port_offset, Error **errp)
     int slisten, rc, to, port_min, port_max, p;
 
     memset(&ai,0, sizeof(ai));
-    ai.ai_flags = AI_PASSIVE | AI_ADDRCONFIG;
+    ai.ai_flags = AI_PASSIVE;
     ai.ai_family = PF_UNSPEC;
     ai.ai_socktype = SOCK_STREAM;
 
@@ -308,7 +308,7 @@ static struct addrinfo *inet_parse_connect_opts(QemuOpts *opts, Error **errp)
 
     memset(&ai, 0, sizeof(ai));
 
-    ai.ai_flags = AI_CANONNAME | AI_ADDRCONFIG;
+    ai.ai_flags = AI_CANONNAME | AI_V4MAPPED | AI_ADDRCONFIG;
     ai.ai_family = PF_UNSPEC;
     ai.ai_socktype = SOCK_STREAM;
 
@@ -404,7 +404,7 @@ int inet_dgram_opts(QemuOpts *opts, Error **errp)
 
     /* lookup peer addr */
     memset(&ai,0, sizeof(ai));
-    ai.ai_flags = AI_CANONNAME | AI_ADDRCONFIG;
+    ai.ai_flags = AI_CANONNAME | AI_V4MAPPED | AI_ADDRCONFIG;
     ai.ai_family = PF_UNSPEC;
     ai.ai_socktype = SOCK_DGRAM;
 
-- 
2.1.4



