Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b2z8W-0000jt-As
	for mharc-qemu-trivial@gnu.org; Wed, 18 May 2016 06:55:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42384)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1b2z8T-0000iF-QA
	for qemu-trivial@nongnu.org; Wed, 18 May 2016 06:55:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1b2z8S-0001HQ-Sp
	for qemu-trivial@nongnu.org; Wed, 18 May 2016 06:55:29 -0400
Received: from [59.151.112.132] (port=9311 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1b2z8M-0001E0-Sp; Wed, 18 May 2016 06:55:23 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="6666503"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 May 2016 18:55:10 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 5B5D6489F961;
	Wed, 18 May 2016 18:55:06 +0800 (CST)
Received: from G08FNSTD140223.g08.fujitsu.local (10.167.226.69) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Wed, 18 May 2016 18:55:05 +0800
From: Cao jin <caoj.fnst@cn.fujitsu.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-trivial@nongnu.org>, <kraxel@redhat.com>, <mst@redhat.com>,
	<cminyard@mvista.com>
Date: Wed, 18 May 2016 18:59:36 +0800
Message-ID: <1463569176-32122-1-git-send-email-caoj.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.226.69]
X-yoursite-MailScanner-ID: 5B5D6489F961.AA8D3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: [Qemu-trivial] [PATCH] fw_cfg: follow CODING_STYLE
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
X-List-Received-Date: Wed, 18 May 2016 10:55:30 -0000

Replace tab with 4 spaces; brace the indented statement.

Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
---
 hw/nvram/fw_cfg.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index 999f480..826181a 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -728,15 +728,20 @@ static int get_fw_cfg_order(FWCfgState *s, const char *name)
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
2.1.0




