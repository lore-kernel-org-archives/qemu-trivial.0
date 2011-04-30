Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QGH6d-0005TO-M8
	for mharc-qemu-trivial@gnu.org; Sat, 30 Apr 2011 16:49:35 -0400
Received: from eggs.gnu.org ([140.186.70.92]:43181)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1QGH6b-0005Od-FU
	for qemu-trivial@nongnu.org; Sat, 30 Apr 2011 16:49:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1QGH6a-0001tu-CI
	for qemu-trivial@nongnu.org; Sat, 30 Apr 2011 16:49:33 -0400
Received: from moutng.kundenserver.de ([212.227.17.8]:58040)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1QGH6X-0001td-Oe; Sat, 30 Apr 2011 16:49:30 -0400
Received: from flocke.fritz.box (p5086FEF5.dip.t-dialin.net [80.134.254.245])
	by mrelayeu.kundenserver.de (node=mrbap2) with ESMTP (Nemesis)
	id 0Lf0KF-1PRUgh2Gy7-00q6Dk; Sat, 30 Apr 2011 22:49:28 +0200
Received: from stefan by flocke.fritz.box with local (Exim 4.72)
	(envelope-from <stefan@weilnetz.de>)
	id 1QGH6V-0003sz-Nu; Sat, 30 Apr 2011 22:49:27 +0200
From: Stefan Weil <weil@mail.berlios.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Date: Sat, 30 Apr 2011 22:49:26 +0200
Message-Id: <1304196566-14909-1-git-send-email-weil@mail.berlios.de>
X-Mailer: git-send-email 1.7.2.5
X-Provags-ID: V02:K0:nGEgRtj7I3IT+bvYEvYDFZtiEmm+0j0E3+sgVBD7w+n
	9INPLnocg4U124nvKygtCRIfq7ee/2rQjnfvJSVveuWpuAaFw5
	ICx/K6BwrkhkLaa5TRef2WGE6aZfzJrxFfS7r6F2IUxT+ynmFh
	RXyq8bmu9Ul/eEgDZC7L8WfwtgwrpJsqPirmrv4sv1deRO9m6G
	RZ0YeYPaQdYUCjjEI+53y83f7yPC96gRXCXJVyUnoTFKsD/qxh RpSkdU6iayaHY
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 212.227.17.8
Cc: qemu-trivial@nongnu.org, Stefan Weil <weil@mail.berlios.de>
Subject: [Qemu-trivial] [PATCH] Fix typos in comments (chek -> check)
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
X-List-Received-Date: Sat, 30 Apr 2011 20:49:34 -0000

Signed-off-by: Stefan Weil <weil@mail.berlios.de>
---
 exec.c            |    2 +-
 target-ppc/STATUS |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/exec.c b/exec.c
index c3dc68a..ed7cffa 100644
--- a/exec.c
+++ b/exec.c
@@ -2041,7 +2041,7 @@ void cpu_physical_memory_reset_dirty(ram_addr_t start, ram_addr_t end,
     /* we modify the TLB cache so that the dirty bit will be set again
        when accessing the range */
     start1 = (unsigned long)qemu_safe_ram_ptr(start);
-    /* Chek that we don't span multiple blocks - this breaks the
+    /* Check that we don't span multiple blocks - this breaks the
        address comparisons below.  */
     if ((unsigned long)qemu_safe_ram_ptr(end - 1) - start1
             != (end - 1) - start) {
diff --git a/target-ppc/STATUS b/target-ppc/STATUS
index 32e7ffa..c8e9018 100644
--- a/target-ppc/STATUS
+++ b/target-ppc/STATUS
@@ -11,7 +11,7 @@ INSN: instruction set.
 SPR:  special purpose registers set
       OK => all SPR registered (but some may be fake)
       KO => some SPR are missing or should be removed
-      ?  => uncheked
+      ?  => unchecked
 MSR:  MSR bits definitions
       OK => all MSR bits properly defined
       KO => MSR definition is incorrect
-- 
1.7.2.5


