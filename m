Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YTGC3-0002Fh-FU
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2015 15:46:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55145)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTGBw-00021I-HZ
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 15:46:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTGBv-0001fB-Ms
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 15:46:52 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:56708)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YTGBc-0001Zh-Cz; Wed, 04 Mar 2015 15:46:32 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 5863540927;
	Wed,  4 Mar 2015 23:46:31 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id C6D85954;
	Wed,  4 Mar 2015 20:07:08 +0300 (MSK)
Received: (nullmailer pid 17550 invoked by uid 1000);
	Wed, 04 Mar 2015 17:07:05 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  4 Mar 2015 20:06:50 +0300
Message-Id: <070c7d0ea04be5cd8c95377f6f09d655cb914334.1425488753.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
References: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 33/47] sysbus: fix memory leak
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
X-List-Received-Date: Wed, 04 Mar 2015 20:46:53 -0000

From: Gonglei <arei.gonglei@huawei.com>

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/core/sysbus.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
index 84af593..b53c351 100644
--- a/hw/core/sysbus.c
+++ b/hw/core/sysbus.c
@@ -91,6 +91,8 @@ bool sysbus_has_irq(SysBusDevice *dev, int n)
     ObjectProperty *r;
 
     r = object_property_find(OBJECT(dev), prop, NULL);
+    g_free(prop);
+
     return (r != NULL);
 }
 
-- 
2.1.4


