Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SCpD1-0005DE-VX
	for mharc-qemu-trivial@gnu.org; Wed, 28 Mar 2012 05:30:27 -0400
Received: from eggs.gnu.org ([208.118.235.92]:57400)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alevy@redhat.com>) id 1SCpCy-0005CV-NH
	for qemu-trivial@nongnu.org; Wed, 28 Mar 2012 05:30:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alevy@redhat.com>) id 1SCpCp-0000XX-ST
	for qemu-trivial@nongnu.org; Wed, 28 Mar 2012 05:30:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:10923)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alevy@redhat.com>) id 1SCpCp-0000WP-KU
	for qemu-trivial@nongnu.org; Wed, 28 Mar 2012 05:30:15 -0400
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q2S9UDZA009025
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <qemu-trivial@nongnu.org>; Wed, 28 Mar 2012 05:30:13 -0400
Received: from garlic.tlv.redhat.com (spice-ovirt.tlv.redhat.com [10.35.4.71])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id q2S9UA1W018073; Wed, 28 Mar 2012 05:30:11 -0400
From: Alon Levy <alevy@redhat.com>
To: qemu-trivial@nongnu.org
Date: Wed, 28 Mar 2012 11:30:08 +0200
Message-Id: <1332927008-559-1-git-send-email-alevy@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: kraxel@redhat.com
Subject: [Qemu-trivial] [PATCH] trace-events: remove unused
	qxl_vga_ioport_while_not_in_vga_mode
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
X-List-Received-Date: Wed, 28 Mar 2012 09:30:26 -0000

The resulting stp file fails to load because of an unresolvable probe.

Signed-off-by: Alon Levy <alevy@redhat.com>
---
 trace-events |    1 -
 1 file changed, 1 deletion(-)

diff --git a/trace-events b/trace-events
index 0924666..322662b 100644
--- a/trace-events
+++ b/trace-events
@@ -781,7 +781,6 @@ qxl_spice_reset_memslots(int qid) "%d"
 qxl_spice_update_area(int qid, uint32_t surface_id, uint32_t left, uint32_t right, uint32_t top, uint32_t bottom) "%d sid=%d [%d,%d,%d,%d]"
 qxl_spice_update_area_rest(int qid, uint32_t num_dirty_rects, uint32_t clear_dirty_region) "%d #d=%d clear=%d"
 qxl_surfaces_dirty(int qid, int surface, int offset, int size) "%d surface=%d offset=%d size=%d"
-qxl_vga_ioport_while_not_in_vga_mode(int qid) "%d (int qid, reset to VGA mode because of VGA io)"
 
 # hw/qxl-render.c
 qxl_render_blit_guest_primary_initialized(void) ""
-- 
1.7.9.3


