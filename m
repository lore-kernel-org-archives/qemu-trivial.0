Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S0fIU-00053h-La
	for mharc-qemu-trivial@gnu.org; Thu, 23 Feb 2012 15:29:50 -0500
Received: from eggs.gnu.org ([140.186.70.92]:59448)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alevy@redhat.com>) id 1S0fIR-00052y-Pt
	for qemu-trivial@nongnu.org; Thu, 23 Feb 2012 15:29:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alevy@redhat.com>) id 1S0fIQ-0001Ga-QQ
	for qemu-trivial@nongnu.org; Thu, 23 Feb 2012 15:29:47 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43716)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alevy@redhat.com>) id 1S0fIQ-0001GW-I3
	for qemu-trivial@nongnu.org; Thu, 23 Feb 2012 15:29:46 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q1NKTjMh031931
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <qemu-trivial@nongnu.org>; Thu, 23 Feb 2012 15:29:45 -0500
Received: from garlic.redhat.com (vpn-200-33.tlv.redhat.com [10.35.200.33])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q1NKTgSU030796
	for <qemu-trivial@nongnu.org>; Thu, 23 Feb 2012 15:29:43 -0500
From: Alon Levy <alevy@redhat.com>
To: qemu-trivial@nongnu.org
Date: Thu, 23 Feb 2012 22:29:42 +0200
Message-Id: <1330028982-13973-1-git-send-email-alevy@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] slirp: workaround gcc __warn_memset_zero_len
	warnings
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
X-List-Received-Date: Thu, 23 Feb 2012 20:29:48 -0000

Fixes __warn_memset_zero_len warnings with gcc --version
gcc (GCC) 4.7.0 20120208 (Red Hat 4.7.0-0.12)

Caused by an overly protective memset check to avoid transposition of
the fill value and length parameters.

Signed-off-by: Alon Levy <alevy@redhat.com>
---
 slirp/misc.c |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/slirp/misc.c b/slirp/misc.c
index 3432fbf..17c21e2 100644
--- a/slirp/misc.c
+++ b/slirp/misc.c
@@ -358,7 +358,9 @@ void slirp_connection_info(Slirp *slirp, Monitor *mon)
             dst_port = so->so_fport;
         }
         n = snprintf(buf, sizeof(buf), "  TCP[%s]", state);
-        memset(&buf[n], ' ', 19 - n);
+        if (n < 19) {
+            memset(&buf[n], ' ', 19 - n);
+        }
         buf[19] = 0;
         monitor_printf(mon, "%s %3d %15s %5d ", buf, so->s,
                        src.sin_addr.s_addr ? inet_ntoa(src.sin_addr) : "*",
@@ -383,7 +385,9 @@ void slirp_connection_info(Slirp *slirp, Monitor *mon)
             dst_addr = so->so_faddr;
             dst_port = so->so_fport;
         }
-        memset(&buf[n], ' ', 19 - n);
+        if (n < 19) {
+            memset(&buf[n], ' ', 19 - n);
+        }
         buf[19] = 0;
         monitor_printf(mon, "%s %3d %15s %5d ", buf, so->s,
                        src.sin_addr.s_addr ? inet_ntoa(src.sin_addr) : "*",
-- 
1.7.9.1


