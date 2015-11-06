Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zuj1u-00046O-L2
	for mharc-qemu-trivial@gnu.org; Fri, 06 Nov 2015 10:34:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56089)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1Zuj1r-0003zW-BX
	for qemu-trivial@nongnu.org; Fri, 06 Nov 2015 10:34:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1Zuj1q-0002Bs-Da
	for qemu-trivial@nongnu.org; Fri, 06 Nov 2015 10:34:15 -0500
Received: from mx1.redhat.com ([209.132.183.28]:42755)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1Zuj1m-00025O-4g; Fri, 06 Nov 2015 10:34:10 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 3993BC0AEE20;
	Fri,  6 Nov 2015 15:34:09 +0000 (UTC)
Received: from donizetti.redhat.com (ovpn-112-18.ams2.redhat.com
	[10.36.112.18])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tA6FY76S001594; Fri, 6 Nov 2015 10:34:08 -0500
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  6 Nov 2015 16:34:06 +0100
Message-Id: <1446824046-4478-1-git-send-email-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] gt64xxx: fix decoding of ISD register
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
X-List-Received-Date: Fri, 06 Nov 2015 15:34:16 -0000

The GT64xxx's internal registers can be placed above the first 4 GiB
in the address space, but not above the first 64 GiB.  Correctly cast
the register to a 64-bit integer, and mask away bits above bit 35.

Datasheet at http://pdf.datasheetarchive.com/datasheetsmain/Datasheets-33/DSA-655889.pdf
(bug reported by Coverity).

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/mips/gt64xxx_pci.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c
index 10fcca3..f76a9fd 100644
--- a/hw/mips/gt64xxx_pci.c
+++ b/hw/mips/gt64xxx_pci.c
@@ -275,7 +275,8 @@ static void check_reserved_space (hwaddr *start,
 
 static void gt64120_isd_mapping(GT64120State *s)
 {
-    hwaddr start = s->regs[GT_ISD] << 21;
+    /* Bits 14:0 of ISD map to bits 35:21 of the start address.  */
+    hwaddr start = ((hwaddr)s->regs[GT_ISD] << 21) & 0xFFFE00000ull;
     hwaddr length = 0x1000;
 
     if (s->ISD_length) {
-- 
2.5.0


