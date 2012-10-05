Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TKBOk-000741-6K
	for mharc-qemu-trivial@gnu.org; Fri, 05 Oct 2012 13:09:14 -0400
Received: from eggs.gnu.org ([208.118.235.92]:39340)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1TKBOi-00070p-B1
	for qemu-trivial@nongnu.org; Fri, 05 Oct 2012 13:09:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1TKBOh-0006GK-DO
	for qemu-trivial@nongnu.org; Fri, 05 Oct 2012 13:09:12 -0400
Received: from 38.0.169.217.in-addr.arpa ([217.169.0.38]:40740
	helo=mnementh.archaic.org.uk) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1TKBOc-0006FC-DA; Fri, 05 Oct 2012 13:09:06 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.72)
	(envelope-from <pm215@archaic.org.uk>)
	id 1TKBOY-0008Hv-C0; Fri, 05 Oct 2012 18:09:02 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri,  5 Oct 2012 18:09:02 +0100
Message-Id: <1349456942-31836-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 217.169.0.38
Cc: qemu-trivial@nongnu.org, Alexander Graf <agraf@suse.de>,
	Avi Kivity <avi@redhat.com>, patches@linaro.org
Subject: [Qemu-trivial] [PATCH] Remove TARGET_PHYS_ADDR_BITS define
	completely
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
X-List-Received-Date: Fri, 05 Oct 2012 17:09:13 -0000

Following commit 4be403c81 TARGET_PHYS_ADDR_BITS is always 64,
and it's only used in one place (that commit removed all the
other uses). Remove it completely, to avoid confusion with
the genuinely useful TARGET_PHYS_ADDR_SPACE_BITS.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target-ppc/mmu_helper.c |    2 --
 targphys.h              |    1 -
 2 files changed, 3 deletions(-)

diff --git a/target-ppc/mmu_helper.c b/target-ppc/mmu_helper.c
index 532b114..a549c4d 100644
--- a/target-ppc/mmu_helper.c
+++ b/target-ppc/mmu_helper.c
@@ -1509,10 +1509,8 @@ static void mmubooke_dump_mmu(FILE *f, fprintf_function cpu_fprintf,
         mask = ~(entry->size - 1);
         ea = entry->EPN & mask;
         pa = entry->RPN & mask;
-#if (TARGET_PHYS_ADDR_BITS >= 36)
         /* Extend the physical address to 36 bits */
         pa |= (target_phys_addr_t)(entry->RPN & 0xF) << 32;
-#endif
         size /= 1024;
         if (size >= 1024) {
             snprintf(size_buf, sizeof(size_buf), "%3" PRId64 "M", size / 1024);
diff --git a/targphys.h b/targphys.h
index 08cade9..f37c0c9 100644
--- a/targphys.h
+++ b/targphys.h
@@ -3,7 +3,6 @@
 #ifndef TARGPHYS_H
 #define TARGPHYS_H
 
-#define TARGET_PHYS_ADDR_BITS 64
 /* target_phys_addr_t is the type of a physical address (its size can
    be different from 'target_ulong').  */
 
-- 
1.7.9.5


