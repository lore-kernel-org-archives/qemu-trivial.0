Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WXQ6A-0008Qs-Bn
	for mharc-qemu-trivial@gnu.org; Tue, 08 Apr 2014 03:05:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47447)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WXQ5l-0007iw-Oh
	for qemu-trivial@nongnu.org; Tue, 08 Apr 2014 03:05:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WXQ5h-0001fN-8v
	for qemu-trivial@nongnu.org; Tue, 08 Apr 2014 03:05:09 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:47007)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WXQ5N-0001M3-4s; Tue, 08 Apr 2014 03:04:45 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 009AB40E2F;
	Tue,  8 Apr 2014 11:04:44 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 207986AC;
	Tue,  8 Apr 2014 11:04:13 +0400 (MSK)
Received: (nullmailer pid 10572 invoked by uid 1000);
	Tue, 08 Apr 2014 07:04:12 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue,  8 Apr 2014 11:04:04 +0400
Message-Id: <1396940651-10513-5-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1396940651-10513-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1396940651-10513-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Hani Benhabiles <hani@linux.com>,
	Michael Tokarev <mjt@tls.msk.ru>, Hani Benhabiles <kroosec@gmail.com>
Subject: [Qemu-trivial] [PULL 04/11] net: Report error when device / hub
	combo is not found.
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
X-List-Received-Date: Tue, 08 Apr 2014 07:05:30 -0000

From: Hani Benhabiles <kroosec@gmail.com>

Also convert nearby monitor_printf() call to error_report().

Signed-off-by: Hani Benhabiles <hani@linux.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 net/net.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/net.c b/net/net.c
index e3ef1e4..a4aadff 100644
--- a/net/net.c
+++ b/net/net.c
@@ -952,10 +952,12 @@ void net_host_device_remove(Monitor *mon, const QDict *qdict)
 
     nc = net_hub_find_client_by_name(vlan_id, device);
     if (!nc) {
+        error_report("Host network device '%s' on hub '%d' not found",
+                     device, vlan_id);
         return;
     }
     if (!net_host_check_device(nc->model)) {
-        monitor_printf(mon, "invalid host network device %s\n", device);
+        error_report("invalid host network device '%s'", device);
         return;
     }
     qemu_del_net_client(nc);
-- 
1.7.10.4


