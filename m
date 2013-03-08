Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UDwLy-00034o-5m
	for mharc-qemu-trivial@gnu.org; Fri, 08 Mar 2013 07:24:50 -0500
Received: from eggs.gnu.org ([208.118.235.92]:35791)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <maethor@subiron.org>) id 1UDwLq-0002rZ-9l
	for qemu-trivial@nongnu.org; Fri, 08 Mar 2013 07:24:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <maethor@subiron.org>) id 1UDwLk-0004Xg-W7
	for qemu-trivial@nongnu.org; Fri, 08 Mar 2013 07:24:42 -0500
Received: from galactus.lahouze.org ([88.191.120.158]:37810)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <maethor@subiron.org>) id 1UDwLk-0004XK-P1
	for qemu-trivial@nongnu.org; Fri, 08 Mar 2013 07:24:36 -0500
Received: from rhodes.subiron.org (unknown [10.33.33.22])
	by galactus.lahouze.org (Postfix) with ESMTP id 988812006A;
	Fri,  8 Mar 2013 13:24:34 +0100 (CET)
From: Guillaume Subiron <maethor@subiron.org>
To: qemu-trivial@nongnu.org
Date: Fri,  8 Mar 2013 13:24:20 +0100
Message-Id: <1362745460-27944-1-git-send-email-maethor@subiron.org>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 88.191.120.158
Cc: jan.kiszka@siemens.com, ped@listes.subiron.org,
	Guillaume Subiron <maethor@subiron.org>
Subject: [Qemu-trivial] [PATCH] slirp: Warn about failing to parse
	/etc/resolv.conf
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
X-List-Received-Date: Fri, 08 Mar 2013 12:24:49 -0000

Some users may have only a link-local IPv6 in their resolv.conf. In slirp mode, DNS resolution fails with timeout.

This adds two messages to alert the user that no DNS have been found instead of just exiting without explanation.
They are kept printed until the user fixes the issue in /etc/resolv.conf.

Signed-off-by: Guillaume Subiron <maethor@subiron.org>
---
 slirp/slirp.c |    8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/slirp/slirp.c b/slirp/slirp.c
index 0e6e232..1683639 100644
--- a/slirp/slirp.c
+++ b/slirp/slirp.c
@@ -135,8 +135,10 @@ int get_dns_addr(struct in_addr *pdns_addr)
     }
 
     f = fopen("/etc/resolv.conf", "r");
-    if (!f)
+    if (!f) {
+        fprintf(stderr, "Unable to open /etc/resolv.conf\n");
         return -1;
+    }
 
 #ifdef DEBUG
     lprint("IP address of your DNS(s): ");
@@ -168,8 +170,10 @@ int get_dns_addr(struct in_addr *pdns_addr)
         }
     }
     fclose(f);
-    if (!found)
+    if (!found) {
+        fprintf(stderr, "No IPv4 found in /etc/resolv.conf\n");
         return -1;
+    }
     return 0;
 }
 
-- 
Guillaume


