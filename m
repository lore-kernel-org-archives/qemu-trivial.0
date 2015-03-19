Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YYWP0-0004kc-9t
	for mharc-qemu-trivial@gnu.org; Thu, 19 Mar 2015 05:06:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55604)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YYWOx-0004e1-93
	for qemu-trivial@nongnu.org; Thu, 19 Mar 2015 05:06:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YYWOw-0004op-Hk
	for qemu-trivial@nongnu.org; Thu, 19 Mar 2015 05:06:03 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:41933)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YYWOh-0004kM-G6; Thu, 19 Mar 2015 05:05:47 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id ADD7741E43;
	Thu, 19 Mar 2015 12:05:44 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 7BC5B91D;
	Thu, 19 Mar 2015 12:05:44 +0300 (MSK)
Received: (nullmailer pid 355 invoked by uid 1000);
	Thu, 19 Mar 2015 09:05:44 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 19 Mar 2015 12:05:34 +0300
Message-Id: <bdd09778a0649639130aff21a361732a715a0a4f.1426755483.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1426755483.git.mjt@msgid.tls.msk.ru>
References: <cover.1426755483.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Paulo Vital <paulo.vital@profitbricks.com>
Subject: [Qemu-trivial] [PULL 16/24] pc-dimm: Add description for device
	list.
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
X-List-Received-Date: Thu, 19 Mar 2015 09:06:04 -0000

From: Paulo Vital <paulo.vital@profitbricks.com>

The pc-dimm option presented on device list (by argument "-device \?")
is the unique option that don't have any information about it. This
patch adds a description for the pc-dimm device to help users to
identify it.

Signed-off-by: Paulo Vital <paulo.vital@profitbricks.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/mem/pc-dimm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/mem/pc-dimm.c b/hw/mem/pc-dimm.c
index de81b9c..39f0c97 100644
--- a/hw/mem/pc-dimm.c
+++ b/hw/mem/pc-dimm.c
@@ -351,6 +351,7 @@ static void pc_dimm_class_init(ObjectClass *oc, void *data)
 
     dc->realize = pc_dimm_realize;
     dc->props = pc_dimm_properties;
+    dc->desc = "DIMM memory module";
 
     ddc->get_memory_region = pc_dimm_get_memory_region;
 }
-- 
2.1.4


