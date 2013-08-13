Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V9GGI-0004Vr-Gy
	for mharc-qemu-trivial@gnu.org; Tue, 13 Aug 2013 11:11:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47926)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>) id 1V9Bz1-0005Af-2W
	for qemu-trivial@nongnu.org; Tue, 13 Aug 2013 06:37:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>) id 1V9Byv-0006xb-HF
	for qemu-trivial@nongnu.org; Tue, 13 Aug 2013 06:37:47 -0400
Received: from smtp4-g21.free.fr ([2a01:e0c:1:1599::13]:55491)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>)
	id 1V9Byj-0006s7-Od; Tue, 13 Aug 2013 06:37:30 -0400
Received: from localhost.localdomain (unknown [82.227.227.196])
	by smtp4-g21.free.fr (Postfix) with ESMTP id E27C24C803D;
	Tue, 13 Aug 2013 12:37:16 +0200 (CEST)
From: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
To: qemu-devel@nongnu.org
Date: Tue, 13 Aug 2013 12:38:34 +0200
Message-Id: <1376390314-17544-1-git-send-email-hpoussin@reactos.org>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a01:e0c:1:1599::13
X-Mailman-Approved-At: Tue, 13 Aug 2013 11:11:53 -0400
Cc: qemu-trivial@nongnu.org,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
Subject: [Qemu-trivial] [PATCH for-1.6] isa: fix documentation of
	isa_register_portio_list
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
X-List-Received-Date: Tue, 13 Aug 2013 10:37:52 -0000


Signed-off-by: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
---
 include/hw/isa/isa.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/isa/isa.h b/include/hw/isa/isa.h
index 495bcf3..fa45a5b 100644
--- a/include/hw/isa/isa.h
+++ b/include/hw/isa/isa.h
@@ -78,7 +78,7 @@ void isa_register_ioport(ISADevice *dev, MemoryRegion *=
io, uint16_t start);
  * @dev: the ISADevice against which these are registered; may be NULL.
  * @start: the base I/O port against which the portio->offset is applied=
.
  * @portio: the ports, sorted by offset.
- * @opaque: passed into the old_portio callbacks.
+ * @opaque: passed into the portio callbacks.
  * @name: passed into memory_region_init_io.
  */
 void isa_register_portio_list(ISADevice *dev, uint16_t start,
--=20
1.7.10.4


