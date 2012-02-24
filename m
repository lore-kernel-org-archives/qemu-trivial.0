Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S0tQE-0004VO-BK
	for mharc-qemu-trivial@gnu.org; Fri, 24 Feb 2012 06:34:46 -0500
Received: from eggs.gnu.org ([140.186.70.92]:43025)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alevy@redhat.com>) id 1S0tQ3-0004FM-B1
	for qemu-trivial@nongnu.org; Fri, 24 Feb 2012 06:34:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alevy@redhat.com>) id 1S0tPt-0006a6-LE
	for qemu-trivial@nongnu.org; Fri, 24 Feb 2012 06:34:29 -0500
Received: from mx1.redhat.com ([209.132.183.28]:10881)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alevy@redhat.com>) id 1S0tPt-0006Zm-6U
	for qemu-trivial@nongnu.org; Fri, 24 Feb 2012 06:34:25 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q1OBYLE5028938
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 24 Feb 2012 06:34:21 -0500
Received: from garlic.redhat.com (vpn-200-50.tlv.redhat.com [10.35.200.50])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q1OBXwjB030215; Fri, 24 Feb 2012 06:34:08 -0500
From: Alon Levy <alevy@redhat.com>
To: qemu-trivial@nongnu.org
Date: Fri, 24 Feb 2012 13:33:49 +0200
Message-Id: <1330083229-9011-1-git-send-email-alevy@redhat.com>
In-Reply-To: <20120224082954.GA26938@stefanha-thinkpad.localdomain>
References: <20120224082954.GA26938@stefanha-thinkpad.localdomain>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] slirp/misc: fix gcc __warn_memset_zero_len
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
X-List-Received-Date: Fri, 24 Feb 2012 11:34:43 -0000

By removing memset altogether (Patch from Stefan Hajnoczi, tested
compile only by me).

Signed-off-by: Alon Levy <alevy@redhat.com>
---
 slirp/misc.c |   21 +++++++--------------
 1 files changed, 7 insertions(+), 14 deletions(-)

diff --git a/slirp/misc.c b/slirp/misc.c
index 3432fbf..0308a62 100644
--- a/slirp/misc.c
+++ b/slirp/misc.c
@@ -333,7 +333,6 @@ void slirp_connection_info(Slirp *slirp, Monitor *mon)
     struct socket *so;
     const char *state;
     char buf[20];
-    int n;
 
     monitor_printf(mon, "  Protocol[State]    FD  Source Address  Port   "
                         "Dest. Address  Port RecvQ SendQ\n");
@@ -357,10 +356,8 @@ void slirp_connection_info(Slirp *slirp, Monitor *mon)
             dst_addr = so->so_faddr;
             dst_port = so->so_fport;
         }
-        n = snprintf(buf, sizeof(buf), "  TCP[%s]", state);
-        memset(&buf[n], ' ', 19 - n);
-        buf[19] = 0;
-        monitor_printf(mon, "%s %3d %15s %5d ", buf, so->s,
+        snprintf(buf, sizeof(buf), "  TCP[%s]", state);
+        monitor_printf(mon, "%-19s %3d %15s %5d ", buf, so->s,
                        src.sin_addr.s_addr ? inet_ntoa(src.sin_addr) : "*",
                        ntohs(src.sin_port));
         monitor_printf(mon, "%15s %5d %5d %5d\n",
@@ -370,22 +367,20 @@ void slirp_connection_info(Slirp *slirp, Monitor *mon)
 
     for (so = slirp->udb.so_next; so != &slirp->udb; so = so->so_next) {
         if (so->so_state & SS_HOSTFWD) {
-            n = snprintf(buf, sizeof(buf), "  UDP[HOST_FORWARD]");
+            snprintf(buf, sizeof(buf), "  UDP[HOST_FORWARD]");
             src_len = sizeof(src);
             getsockname(so->s, (struct sockaddr *)&src, &src_len);
             dst_addr = so->so_laddr;
             dst_port = so->so_lport;
         } else {
-            n = snprintf(buf, sizeof(buf), "  UDP[%d sec]",
+            snprintf(buf, sizeof(buf), "  UDP[%d sec]",
                          (so->so_expire - curtime) / 1000);
             src.sin_addr = so->so_laddr;
             src.sin_port = so->so_lport;
             dst_addr = so->so_faddr;
             dst_port = so->so_fport;
         }
-        memset(&buf[n], ' ', 19 - n);
-        buf[19] = 0;
-        monitor_printf(mon, "%s %3d %15s %5d ", buf, so->s,
+        monitor_printf(mon, "%-19s %3d %15s %5d ", buf, so->s,
                        src.sin_addr.s_addr ? inet_ntoa(src.sin_addr) : "*",
                        ntohs(src.sin_port));
         monitor_printf(mon, "%15s %5d %5d %5d\n",
@@ -394,13 +389,11 @@ void slirp_connection_info(Slirp *slirp, Monitor *mon)
     }
 
     for (so = slirp->icmp.so_next; so != &slirp->icmp; so = so->so_next) {
-        n = snprintf(buf, sizeof(buf), "  ICMP[%d sec]",
+        snprintf(buf, sizeof(buf), "  ICMP[%d sec]",
                      (so->so_expire - curtime) / 1000);
         src.sin_addr = so->so_laddr;
         dst_addr = so->so_faddr;
-        memset(&buf[n], ' ', 19 - n);
-        buf[19] = 0;
-        monitor_printf(mon, "%s %3d %15s  -    ", buf, so->s,
+        monitor_printf(mon, "%-19s %3d %15s  -    ", buf, so->s,
                        src.sin_addr.s_addr ? inet_ntoa(src.sin_addr) : "*");
         monitor_printf(mon, "%15s  -    %5d %5d\n", inet_ntoa(dst_addr),
                        so->so_rcv.sb_cc, so->so_snd.sb_cc);
-- 
1.7.9.1


