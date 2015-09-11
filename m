Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZaMFO-0004uz-MJ
	for mharc-qemu-trivial@gnu.org; Fri, 11 Sep 2015 07:12:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59481)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZaMFE-0004ap-N3
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 07:11:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZaMFD-0005ME-PC
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 07:11:52 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:51825)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZaMF8-0005Jb-Fu; Fri, 11 Sep 2015 07:11:46 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 829D54143C;
	Fri, 11 Sep 2015 14:11:45 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id A3ECBA85;
	Fri, 11 Sep 2015 14:03:54 +0300 (MSK)
Received: (nullmailer pid 22787 invoked by uid 1000);
	Fri, 11 Sep 2015 11:03:51 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri, 11 Sep 2015 14:03:41 +0300
Message-Id: <74c373e42f3dccae3b3b1e91a82ab8f748a39a6f.1441969369.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1441969369.git.mjt@msgid.tls.msk.ru>
References: <cover.1441969369.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Shraddha Barke <shraddha.6596@gmail.com>
Subject: [Qemu-trivial] [PULL 17/26] Target-ppc: Remove unnecessary variable
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
X-List-Received-Date: Fri, 11 Sep 2015 11:11:53 -0000

From: Shraddha Barke <shraddha.6596@gmail.com>

Compress lines and remove the variable ret.

Change made using Coccinelle script

@@
expression ret;
@@
- if (ret) return ret;
- return 0;
+ return ret;
@@
local idexpression ret;
expression e;
@@
- ret = e;
- return ret;
+ return e;
@@
type T; identifier i;
@@
- T i;
... when != i

Signed-off-by: Shraddha Barke <shraddha.6596@gmail.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 target-ppc/translate_init.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/target-ppc/translate_init.c b/target-ppc/translate_init.c
index 16d7b16..b541473 100644
--- a/target-ppc/translate_init.c
+++ b/target-ppc/translate_init.c
@@ -8577,11 +8577,7 @@ static int register_ind_insn (opc_handler_t **ppc_opcodes,
                               unsigned char idx1, unsigned char idx2,
                               opc_handler_t *handler)
 {
-    int ret;
-
-    ret = register_ind_in_table(ppc_opcodes, idx1, idx2, handler);
-
-    return ret;
+    return register_ind_in_table(ppc_opcodes, idx1, idx2, handler);
 }
 
 static int register_dblind_insn (opc_handler_t **ppc_opcodes,
@@ -9350,8 +9346,7 @@ static ObjectClass *ppc_cpu_class_by_name(const char *name)
                 break;
         }
         if (i == 8) {
-            ret = OBJECT_CLASS(ppc_cpu_class_by_pvr(strtoul(name, NULL, 16)));
-            return ret;
+            return OBJECT_CLASS(ppc_cpu_class_by_pvr(strtoul(name, NULL, 16)));
         }
     }
 
-- 
2.1.4


