Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XoCpL-0000kM-Dt
	for mharc-qemu-trivial@gnu.org; Tue, 11 Nov 2014 09:53:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34542)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XoCpF-0000Yc-2e
	for qemu-trivial@nongnu.org; Tue, 11 Nov 2014 09:53:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XoCpA-000292-Gt
	for qemu-trivial@nongnu.org; Tue, 11 Nov 2014 09:53:44 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:54351)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XoCp0-00026i-EV; Tue, 11 Nov 2014 09:53:30 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 6647C41DFA;
	Tue, 11 Nov 2014 17:53:29 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 98A64711;
	Tue, 11 Nov 2014 17:46:35 +0300 (MSK)
Received: (nullmailer pid 14579 invoked by uid 1000);
	Tue, 11 Nov 2014 14:46:34 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 11 Nov 2014 17:46:32 +0300
Message-Id: <00c2275c95edb3c355fce7e1128bdef845b9fe34.1415716845.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1415716845.git.mjt@msgid.tls.msk.ru>
References: <cover.1415716845.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 10/11] sysbus: Correct SYSTEM_BUS(obj) defines
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
X-List-Received-Date: Tue, 11 Nov 2014 14:53:49 -0000

From: Gonglei <arei.gonglei@huawei.com>

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 include/hw/sysbus.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/sysbus.h b/include/hw/sysbus.h
index 9fb1782..9bddfde 100644
--- a/include/hw/sysbus.h
+++ b/include/hw/sysbus.h
@@ -10,7 +10,7 @@
 #define QDEV_MAX_PIO 32
 
 #define TYPE_SYSTEM_BUS "System"
-#define SYSTEM_BUS(obj) OBJECT_CHECK(IDEBus, (obj), TYPE_IDE_BUS)
+#define SYSTEM_BUS(obj) OBJECT_CHECK(BusState, (obj), TYPE_SYSTEM_BUS)
 
 typedef struct SysBusDevice SysBusDevice;
 
-- 
1.7.10.4


