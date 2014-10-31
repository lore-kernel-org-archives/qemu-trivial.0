Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XkDvo-0002yn-EJ
	for mharc-qemu-trivial@gnu.org; Fri, 31 Oct 2014 11:16:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50967)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XkDui-0005x1-60
	for qemu-trivial@nongnu.org; Fri, 31 Oct 2014 11:16:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Xk5Qx-0005J8-4S
	for qemu-trivial@nongnu.org; Fri, 31 Oct 2014 02:11:43 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:38531)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1Xk5Qp-00052R-82; Fri, 31 Oct 2014 02:11:31 -0400
Received: from 172.24.2.119 (EHLO szxeml450-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CBQ05846; Fri, 31 Oct 2014 14:11:22 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml450-hub.china.huawei.com
	(10.82.67.193) with Microsoft SMTP Server id 14.3.158.1;
	Fri, 31 Oct 2014 14:11:14 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 31 Oct 2014 14:11:01 +0800
Message-ID: <1414735861-1232-3-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
In-Reply-To: <1414735861-1232-1-git-send-email-arei.gonglei@huawei.com>
References: <1414735861-1232-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	peter.huangpeng@huawei.com, stefanha@redhat.com
Subject: [Qemu-trivial] [PATCH 2/2] tap: fix possible fd leak
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
X-List-Received-Date: Fri, 31 Oct 2014 15:16:03 -0000

From: Gonglei <arei.gonglei@huawei.com>

In hotplugging scenario, taking those true branch, the file
handler do not be closed. Adding cleanup logic for them.

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 net/tap.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/net/tap.c b/net/tap.c
index 7bcd4c7..3cfbee8 100644
--- a/net/tap.c
+++ b/net/tap.c
@@ -796,7 +796,7 @@ int net_init_tap(const NetClientOptions *opts, const char *name,
         if (net_init_tap_one(tap, peer, "bridge", name, ifname,
                              script, downscript, vhostfdname,
                              vnet_hdr, fd)) {
-            return -1;
+            goto fail;
         }
     } else {
         if (tap->has_vhostfds) {
@@ -823,7 +823,7 @@ int net_init_tap(const NetClientOptions *opts, const char *name,
             if (queues > 1 && i == 0 && !tap->has_ifname) {
                 if (tap_fd_get_ifname(fd, ifname)) {
                     error_report("Fail to get ifname");
-                    return -1;
+                    goto fail;
                 }
             }
 
@@ -831,12 +831,18 @@ int net_init_tap(const NetClientOptions *opts, const char *name,
                                  i >= 1 ? "no" : script,
                                  i >= 1 ? "no" : downscript,
                                  vhostfdname, vnet_hdr, fd)) {
-                return -1;
+                goto fail;
             }
         }
     }
 
     return 0;
+
+fail:
+    if (fd != -1) {
+        close(fd);
+    }
+    return -1;
 }
 
 VHostNetState *tap_get_vhost_net(NetClientState *nc)
-- 
1.7.12.4



