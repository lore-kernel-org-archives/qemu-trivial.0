Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SwZ5u-0006uY-2e
	for mharc-qemu-trivial@gnu.org; Wed, 01 Aug 2012 09:36:10 -0400
Received: from eggs.gnu.org ([208.118.235.92]:56649)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1SwZ5r-0006mi-GH
	for qemu-trivial@nongnu.org; Wed, 01 Aug 2012 09:36:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1SwZ5q-0004aw-26
	for qemu-trivial@nongnu.org; Wed, 01 Aug 2012 09:36:07 -0400
Received: from mnementh.archaic.org.uk ([81.2.115.146]:47175)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1SwZ5h-0004T0-5R; Wed, 01 Aug 2012 09:35:57 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.72)
	(envelope-from <pm215@archaic.org.uk>)
	id 1SwZ5X-0002Sp-Rw; Wed, 01 Aug 2012 14:35:47 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  1 Aug 2012 14:35:47 +0100
Message-Id: <1343828147-9446-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 81.2.115.146
Cc: qemu-trivial@nongnu.org, Avi Kivity <avi@redhat.com>, patches@linaro.org
Subject: [Qemu-trivial] [PATCH] exec.c: Remove out of date comment
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
X-List-Received-Date: Wed, 01 Aug 2012 13:36:08 -0000

Remove an out of date comment: this comment used to be attached to
cpu_register_physical_memory_log(), before commit 0f0cb164 accidentally
inserted a couple of other functions between the comment and its function.
It is in any case obsolete since (a) the function arguments it refers
to have been replaced with a single MemoryRegionSection* argument and
(b) the inability to handle regions whose offset_within_address_space
and offset_within_region aren't equally aligned was fixed as part of
the rewrite of this code.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Pretty sure my analysis is right and this comment is out of date --
Avi, could you confirm that please?

 exec.c |    8 --------
 1 file changed, 8 deletions(-)

diff --git a/exec.c b/exec.c
index feb4795..22dff17 100644
--- a/exec.c
+++ b/exec.c
@@ -2240,14 +2240,6 @@ static void phys_sections_clear(void)
     phys_sections_nb = 0;
 }
 
-/* register physical memory.
-   For RAM, 'size' must be a multiple of the target page size.
-   If (phys_offset & ~TARGET_PAGE_MASK) != 0, then it is an
-   io memory page.  The address used when calling the IO function is
-   the offset from the start of the region, plus region_offset.  Both
-   start_addr and region_offset are rounded down to a page boundary
-   before calculating this offset.  This should not be a problem unless
-   the low bits of start_addr and region_offset differ.  */
 static void register_subpage(MemoryRegionSection *section)
 {
     subpage_t *subpage;
-- 
1.7.9.5


