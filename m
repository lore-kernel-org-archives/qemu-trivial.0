Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZY1zW-0000u1-SG
	for mharc-qemu-trivial@gnu.org; Fri, 04 Sep 2015 21:10:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49558)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shraddha.6596@gmail.com>) id 1ZXwXc-0000ed-25
	for qemu-trivial@nongnu.org; Fri, 04 Sep 2015 15:20:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shraddha.6596@gmail.com>) id 1ZXwXb-0004uo-9N
	for qemu-trivial@nongnu.org; Fri, 04 Sep 2015 15:20:52 -0400
Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d]:36347)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shraddha.6596@gmail.com>)
	id 1ZXwXW-0004oo-0T; Fri, 04 Sep 2015 15:20:46 -0400
Received: by pacwi10 with SMTP id wi10so32543994pac.3;
	Fri, 04 Sep 2015 12:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=cTNCkyQM7OxqMr+8662Y//YC1OCeNvOLwnWFeOhQIJY=;
	b=YssWX/5bOJSHAw02Ywh1WHBGm8ZDjrRfo0LmoGzAcES9NwjJotDe3RKLz+DOxVJ/Y+
	iB/LiLVo0+nlXgiqnwkBS1v1NmyPtHOaCPUQ3mGcjFZBa04TJ4aP0fJ/aTS0LCzcRR1k
	2MmoliNw06Wxe85RH1YNUhDVmbOXYZe5ghVeYyHv5NyeLQyVHltc/bXLAzcsbiES/+4T
	Le4NPoKfOyHfbyVVja3t4wSB8ve5njTzWC5bEaTBUkOziBZlzSQK38lM0PKGWf9dCXnm
	JECctZ6omphKLRUrWNnW0QLMzUCBZqhUIYCpm1h60fopWLxAC0Tv0nJzr1NuGHwp4vv6
	z+kw==
X-Received: by 10.66.117.200 with SMTP id kg8mr11316072pab.37.1441394444667;
	Fri, 04 Sep 2015 12:20:44 -0700 (PDT)
Received: from shraddha-370R4E-370R4V-370R5E-3570RE-370R5V.bits-goa.ac.in
	([103.225.100.51])
	by smtp.gmail.com with ESMTPSA id i3sm3371885pdp.73.2015.09.04.12.20.40
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 04 Sep 2015 12:20:43 -0700 (PDT)
From: Shraddha Barke <shraddha.6596@gmail.com>
To: Alexander Graf <agraf@suse.de>, qemu-ppc@nongnu.org,
	qemu-trivial@nongnu.org
Date: Sat,  5 Sep 2015 00:50:28 +0530
Message-Id: <1441394428-6910-1-git-send-email-shraddha.6596@gmail.com>
X-Mailer: git-send-email 2.1.4
X-Cyberoam-smtpxy-version: 1.0.6.3
X-Cyberoam-AV-Policy: default
X-CTCH-PVer: 0000001
X-CTCH-Spam: Unknown
X-CTCH-VOD: Unknown
X-CTCH-Flags: 0
X-CTCH-RefID: str=0001.0A150204.55E9EF0B.0068, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0
X-CTCH-Score: 0.000
X-CTCH-ScoreCust: 0.000
X-CTCH-Rules: 
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c03::22d
X-Mailman-Approved-At: Fri, 04 Sep 2015 21:10:01 -0400
Cc: Shraddha Barke <shraddha.6596@gmail.com>
Subject: [Qemu-trivial] [PATCH] Target-ppc: Remove unnecessary variable
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
X-List-Received-Date: Fri, 04 Sep 2015 19:20:53 -0000

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


