Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RMQih-0004zI-9n
	for mharc-qemu-trivial@gnu.org; Fri, 04 Nov 2011 16:50:35 -0400
Received: from eggs.gnu.org ([140.186.70.92]:36267)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcd@tribudubois.net>) id 1RMQie-0004nT-1S
	for qemu-trivial@nongnu.org; Fri, 04 Nov 2011 16:50:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jcd@tribudubois.net>) id 1RMQic-0003wk-NV
	for qemu-trivial@nongnu.org; Fri, 04 Nov 2011 16:50:32 -0400
Received: from mx1.w4a.fr ([178.33.204.49]:56935 helo=zose-store12.web4all.fr)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcd@tribudubois.net>)
	id 1RMQia-0003wE-5n; Fri, 04 Nov 2011 16:50:28 -0400
Received: from localhost (localhost [127.0.0.1])
	by zose-store12.web4all.fr (Postfix) with ESMTP id B47F45E019;
	Fri,  4 Nov 2011 21:51:13 +0100 (CET)
X-Virus-Scanned: amavisd-new at zose-store12.web4all.fr
Received: from zose-store12.web4all.fr ([127.0.0.1])
	by localhost (zose-store12.web4all.fr [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id otMk5Bi3qp7w; Fri,  4 Nov 2011 21:51:13 +0100 (CET)
Received: from [192.168.1.102] (smm49-1-78-235-240-156.fbx.proxad.net
	[78.235.240.156])
	by zose-store12.web4all.fr (Postfix) with ESMTPA id C47E25E00E;
	Fri,  4 Nov 2011 21:51:12 +0100 (CET)
Message-ID: <4EB45011.6070609@tribudubois.net>
Date: Fri, 04 Nov 2011 21:50:25 +0100
From: Jean-Christophe DUBOIS <jcd@tribudubois.net>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 178.33.204.49
Cc: qemu-trivial@nongnu.org, paul@codesourcery.com
Subject: [Qemu-trivial] [PATCH] arm: Fix CP15 FSR (C5) domain setting
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
X-List-Received-Date: Fri, 04 Nov 2011 20:50:32 -0000

During Xvisor development, it was noted that qemu did not return
the correct domain value in the Cp15 [Data] FSR register (C5).

This patch is a proposal to fix it.

Signed-off-by: Jean-Christophe DUBOIS <jcd@tribudubois.net>
---

--- qemu-0.15.1.org/target-arm/helper.c    2011-10-12 18:41:43.000000000 
+0200
+++ qemu-0.15.1/target-arm/helper.c    2011-11-04 00:49:03.247062518 +0100
@@ -924,12 +924,12 @@
  /* Check section/page access permissions.
     Returns the page protection flags, or zero if the access is not
     permitted.  */
-static inline int check_ap(CPUState *env, int ap, int domain, int 
access_type,
+static inline int check_ap(CPUState *env, int ap, int domain_prot, int 
access_type,
                             int is_user)
  {
    int prot_ro;

-  if (domain == 3)
+  if (domain_prot == 3)
      return PAGE_READ | PAGE_WRITE;

    if (access_type == 1)
@@ -996,6 +996,7 @@
      int type;
      int ap;
      int domain;
+    int domain_prot;
      uint32_t phys_addr;

      /* Pagetable walk.  */
@@ -1003,13 +1004,14 @@
      table = get_level1_table_address(env, address);
      desc = ldl_phys(table);
      type = (desc & 3);
-    domain = (env->cp15.c3 >> ((desc >> 4) & 0x1e)) & 3;
+    domain = (desc >> 5) & 0x0f;
+    domain_prot = (env->cp15.c3 >> (domain * 2)) & 3;
      if (type == 0) {
          /* Section translation fault.  */
          code = 5;
          goto do_fault;
      }
-    if (domain == 0 || domain == 2) {
+    if (domain_prot == 0 || domain_prot == 2) {
          if (type == 2)
              code = 9; /* Section domain fault.  */
          else
@@ -1067,7 +1069,7 @@
          }
          code = 15;
      }
-    *prot = check_ap(env, ap, domain, access_type, is_user);
+    *prot = check_ap(env, ap, domain_prot, access_type, is_user);
      if (!*prot) {
          /* Access permission fault.  */
          goto do_fault;
@@ -1090,6 +1092,7 @@
      int type;
      int ap;
      int domain;
+    int domain_prot;
      uint32_t phys_addr;

      /* Pagetable walk.  */
@@ -1107,10 +1110,10 @@
          domain = 0;
      } else {
          /* Section or page.  */
-        domain = (desc >> 4) & 0x1e;
+        domain = (desc >> 5) & 0x0f;
      }
-    domain = (env->cp15.c3 >> domain) & 3;
-    if (domain == 0 || domain == 2) {
+    domain_prot = (env->cp15.c3 >> (domain * 2)) & 3;
+    if (domain_prot == 0 || domain_prot == 2) {
          if (type == 2)
              code = 9; /* Section domain fault.  */
          else
@@ -1155,7 +1158,7 @@
          }
          code = 15;
      }
-    if (domain == 3) {
+    if (domain_prot == 3) {
          *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
      } else {
          if (xn && access_type == 2)
@@ -1167,7 +1170,7 @@
              code = (code == 15) ? 6 : 3;
              goto do_fault;
          }
-        *prot = check_ap(env, ap, domain, access_type, is_user);
+        *prot = check_ap(env, ap, domain_prot, access_type, is_user);
          if (!*prot) {
              /* Access permission fault.  */
              goto do_fault;


