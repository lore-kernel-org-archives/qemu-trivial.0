Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1a4kJZ-0006Qk-0X
	for mharc-qemu-trivial@gnu.org; Fri, 04 Dec 2015 01:57:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33962)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1a4kJT-0006Cx-BE
	for qemu-trivial@nongnu.org; Fri, 04 Dec 2015 01:57:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1a4kJR-0000KR-Td
	for qemu-trivial@nongnu.org; Fri, 04 Dec 2015 01:57:51 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:46509)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1a4kJO-0000JY-4c; Fri, 04 Dec 2015 01:57:46 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 4F0BC4068A;
	Fri,  4 Dec 2015 09:57:43 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 3C280AAF;
	Fri,  4 Dec 2015 09:57:43 +0300 (MSK)
Received: (nullmailer pid 7965 invoked by uid 1000);
	Fri, 04 Dec 2015 06:57:42 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri,  4 Dec 2015 09:57:37 +0300
Message-Id: <63fc7375d6b0a083aef56950119af3d1d2a96e51.1449211229.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1449211229.git.mjt@msgid.tls.msk.ru>
References: <cover.1449211229.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 6/9] gt64xxx: fix decoding of ISD register
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
X-List-Received-Date: Fri, 04 Dec 2015 06:57:52 -0000

From: Paolo Bonzini <pbonzini@redhat.com>

The GT64xxx's internal registers can be placed above the first 4 GiB
in the address space, but not above the first 64 GiB.  Correctly cast
the register to a 64-bit integer, and mask away bits above bit 35.

Datasheet at http://pdf.datasheetarchive.com/datasheetsmain/Datasheets-33/DSA-655889.pdf
(bug reported by Coverity).

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
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
2.1.4


