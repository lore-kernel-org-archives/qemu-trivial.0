Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xknri-0003Gk-0K
	for mharc-qemu-trivial@gnu.org; Sun, 02 Nov 2014 01:38:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39019)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Xknrc-00039l-5n
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 01:38:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XknrX-0007oX-BY
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 01:38:08 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:64122)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1XknrN-0007o8-0G; Sun, 02 Nov 2014 01:37:53 -0400
Received: from 172.24.2.119 (EHLO szxeml420-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id AWM77708; Sun, 02 Nov 2014 13:37:46 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml420-hub.china.huawei.com
	(10.82.67.159) with Microsoft SMTP Server id 14.3.158.1; Sun, 2 Nov 2014
	13:37:38 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Sun, 2 Nov 2014 13:37:17 +0800
Message-ID: <1414906637-11048-1-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020209.5455C32B.003E, ss=1, re=0.001, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: d8ec1d18735675ed0414d5a1b2dc4bc6
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>, mjt@tls.msk.ru,
	peter.huangpeng@huawei.com, stefanha@redhat.com
Subject: [Qemu-trivial] [PATCH v2] tap: fix possible fd leak in net_init_tap
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
X-List-Received-Date: Sun, 02 Nov 2014 05:38:13 -0000

From: Gonglei <arei.gonglei@huawei.com>

In hotplugging scenario, taking those true branch, the file
handler do not be closed. Let's close them before return.

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 v1: [PATCH 2/2] tap: fix possible fd leak
 v2: add explicit close(fd) and change subject. (Thanks to /mjt)
---
 net/tap.c | 3 +++
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
1.7.12.4



