Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VN4Bl-0005FJ-Pz
	for mharc-qemu-trivial@gnu.org; Fri, 20 Sep 2013 13:08:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52486)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VN4Bd-0004zD-SL
	for qemu-trivial@nongnu.org; Fri, 20 Sep 2013 13:08:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VN4BZ-0003HK-87
	for qemu-trivial@nongnu.org; Fri, 20 Sep 2013 13:08:09 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:44787)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VN4BJ-0003DV-Ak; Fri, 20 Sep 2013 13:07:49 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 2C9B1419CC;
	Fri, 20 Sep 2013 21:07:47 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 5D10A4E1;
	Fri, 20 Sep 2013 20:58:21 +0400 (MSK)
Received: (nullmailer pid 32180 invoked by uid 1000);
	Fri, 20 Sep 2013 16:58:20 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@us.ibm.com
Date: Fri, 20 Sep 2013 20:58:08 +0400
Message-Id: <1379696296-32105-10-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1379696296-32105-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1379696296-32105-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 09/17] trace-events: Clean up with
	scripts/cleanup-trace-events.pl again
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
X-List-Received-Date: Fri, 20 Sep 2013 17:08:14 -0000

From: Markus Armbruster <armbru@redhat.com>

Event qxl_render_blit_guest_primary_initialized is unused since commit
c58c7b9, drop it.

Commit 42e5b4c moved hw/ppc/xics.c to hw/intc/xics.c without updating
the comment in trace-events.

"scripts/cleanup-trace-events.pl trace-events | diff trace-events" is
now clean again.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 trace-events |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/trace-events b/trace-events
index d4dba24..9a1347b 100644
--- a/trace-events
+++ b/trace-events
@@ -1109,7 +1109,6 @@ qemu_spice_wakeup(uint32_t qid) "%d"
 qemu_spice_create_update(uint32_t left, uint32_t right, uint32_t top, uint32_t bottom) "lr %d -> %d,  tb -> %d -> %d"
 
 # hw/display/qxl-render.c
-qxl_render_blit_guest_primary_initialized(void) ""
 qxl_render_blit(int32_t stride, int32_t left, int32_t right, int32_t top, int32_t bottom) "stride=%d [%d, %d, %d, %d]"
 qxl_render_guest_primary_resized(int32_t width, int32_t height, int32_t stride, int32_t bytes_pp, int32_t bits_pp) "%dx%d, stride %d, bpp %d, depth %d"
 qxl_render_update_area_done(void *cookie) "%p"
@@ -1122,7 +1121,7 @@ spapr_pci_rtas_ibm_query_interrupt_source_number(unsigned ioa, unsigned intr) "q
 spapr_pci_msi_write(uint64_t addr, uint64_t data, uint32_t dt_irq) "@%"PRIx64"<=%"PRIx64" IRQ %u"
 spapr_pci_lsi_set(const char *busname, int pin, uint32_t irq) "%s PIN%d IRQ %u"
 
-# hw/ppc/xics.c
+# hw/intc/xics.c
 xics_icp_check_ipi(int server, uint8_t mfrr) "CPU %d can take IPI mfrr=%#x"
 xics_icp_accept(uint32_t old_xirr, uint32_t new_xirr) "icp_accept: XIRR %#"PRIx32"->%#"PRIx32
 xics_icp_eoi(int server, uint32_t xirr, uint32_t new_xirr) "icp_eoi: server %d given XIRR %#"PRIx32" new XIRR %#"PRIx32
-- 
1.7.10.4


