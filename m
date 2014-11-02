Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xku6L-0005EQ-Kv
	for mharc-qemu-trivial@gnu.org; Sun, 02 Nov 2014 07:17:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54469)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xku6E-00050m-FZ
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 07:17:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xku6A-0007L0-2m
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 07:17:38 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:40562)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Xku60-0007E6-JX; Sun, 02 Nov 2014 07:17:24 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 35C72402C1;
	Sun,  2 Nov 2014 15:17:23 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 78A3D719;
	Sun,  2 Nov 2014 14:58:49 +0300 (MSK)
Received: (nullmailer pid 14995 invoked by uid 1000);
	Sun, 02 Nov 2014 11:58:47 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sun,  2 Nov 2014 14:57:34 +0300
Message-Id: <84f8f3dace8c6e88b1afa828f9abe1e9a57fac1a.1414929285.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
References: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
References: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 22/23] tap: fix possible fd leak in
	net_init_tap
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
X-List-Received-Date: Sun, 02 Nov 2014 12:17:43 -0000

From: Gonglei <arei.gonglei@huawei.com>

In hotplugging scenario, taking those true branch, the file
handler do not be closed. Let's close them before return.

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 net/tap.c |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/tap.c b/net/tap.c
index 7bcd4c7..bde6b58 100644
--- a/net/tap.c
+++ b/net/tap.c
@@ -796,6 +796,7 @@ int net_init_tap(const NetClientOptions *opts, const char *name,
         if (net_init_tap_one(tap, peer, "bridge", name, ifname,
                              script, downscript, vhostfdname,
                              vnet_hdr, fd)) {
+            close(fd);
             return -1;
         }
     } else {
@@ -823,6 +824,7 @@ int net_init_tap(const NetClientOptions *opts, const char *name,
             if (queues > 1 && i == 0 && !tap->has_ifname) {
                 if (tap_fd_get_ifname(fd, ifname)) {
                     error_report("Fail to get ifname");
+                    close(fd);
                     return -1;
                 }
             }
@@ -831,6 +833,7 @@ int net_init_tap(const NetClientOptions *opts, const char *name,
                                  i >= 1 ? "no" : script,
                                  i >= 1 ? "no" : downscript,
                                  vhostfdname, vnet_hdr, fd)) {
+                close(fd);
                 return -1;
             }
         }
-- 
1.7.10.4


