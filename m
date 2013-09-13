Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VKP54-0007or-IY
	for mharc-qemu-trivial@gnu.org; Fri, 13 Sep 2013 04:50:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37521)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1VKP4y-0007gE-8o
	for qemu-trivial@nongnu.org; Fri, 13 Sep 2013 04:50:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1VKP4s-0002Lf-Ni
	for qemu-trivial@nongnu.org; Fri, 13 Sep 2013 04:50:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:19965)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1VKP4e-00024B-Cy; Fri, 13 Sep 2013 04:49:56 -0400
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r8D8ntH8010257
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 13 Sep 2013 04:49:55 -0400
Received: from blackfin.pond.sub.org (ovpn-116-22.ams2.redhat.com
	[10.36.116.22])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r8D8nqbo018843
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 13 Sep 2013 04:49:54 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 0F450200BC; Fri, 13 Sep 2013 10:49:52 +0200 (CEST)
From: armbru@redhat.com
To: qemu-devel@nongnu.org
Date: Fri, 13 Sep 2013 10:49:51 +0200
Message-Id: <1379062191-7475-1-git-send-email-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] trace-events: Clean up with
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
X-List-Received-Date: Fri, 13 Sep 2013 08:50:21 -0000

From: Markus Armbruster <armbru@redhat.com>

Event qxl_render_blit_guest_primary_initialized is unused since commit
c58c7b9, drop it.

Commit 42e5b4c moved hw/ppc/xics.c to hw/intc/xics.c without updating
the comment in trace-events.

"scripts/cleanup-trace-events.pl trace-events | diff trace-events" is
now clean again.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 trace-events | 3 +--
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
1.8.1.4


