Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b9TwK-0004Fc-2y
	for mharc-qemu-trivial@gnu.org; Sun, 05 Jun 2016 05:01:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41144)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9TwE-00046H-Lu
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 05:01:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9TwC-0004oI-Mu
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 05:01:41 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:37383)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1b9Tw5-0004lD-P4; Sun, 05 Jun 2016 05:01:33 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id D3B1F408D7;
	Sun,  5 Jun 2016 12:01:26 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 09155AFF;
	Sun,  5 Jun 2016 10:43:38 +0300 (MSK)
Received: (nullmailer pid 1132 invoked by uid 1000);
	Sun, 05 Jun 2016 07:43:32 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Cao jin <caoj.fnst@cn.fujitsu.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  5 Jun 2016 10:42:58 +0300
Message-Id: <e4f336615bbb8ee90ad2b9ed1efa739b8d5c3927.1465112552.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
References: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 21/52] fw_cfg: follow CODING_STYLE
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 05 Jun 2016 09:01:46 -0000

From: Cao jin <caoj.fnst@cn.fujitsu.com>

Replace tab with 4 spaces; brace the indented statement.

Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
Acked-by: Corey Minyard <cminyard@mvista.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/nvram/fw_cfg.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index cdbdfb5..74a0079 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -729,15 +729,20 @@ static int get_fw_cfg_order(FWCfgState *s, const char *name)
 {
     int i;
 
-    if (s->fw_cfg_order_override > 0)
-	return s->fw_cfg_order_override;
+    if (s->fw_cfg_order_override > 0) {
+        return s->fw_cfg_order_override;
+    }
 
     for (i = 0; i < ARRAY_SIZE(fw_cfg_order); i++) {
-	if (fw_cfg_order[i].name == NULL)
-	    continue;
-	if (strcmp(name, fw_cfg_order[i].name) == 0)
-	    return fw_cfg_order[i].order;
+        if (fw_cfg_order[i].name == NULL) {
+            continue;
+        }
+
+        if (strcmp(name, fw_cfg_order[i].name) == 0) {
+            return fw_cfg_order[i].order;
+        }
     }
+
     /* Stick unknown stuff at the end. */
     error_report("warning: Unknown firmware file in legacy mode: %s\n", name);
     return FW_CFG_ORDER_OVERRIDE_LAST;
-- 
2.1.4


