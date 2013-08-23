Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VCuA1-0006A6-0o
	for mharc-qemu-trivial@gnu.org; Fri, 23 Aug 2013 12:24:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35391)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1VCu9x-00062v-6V
	for qemu-trivial@nongnu.org; Fri, 23 Aug 2013 12:24:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1VCu9u-0001Rd-Op
	for qemu-trivial@nongnu.org; Fri, 23 Aug 2013 12:24:25 -0400
Received: from
	1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.d.1.0.0.b.8.0.1.0.0.2.ip6.arpa
	([2001:8b0:1d0::1]:59452 helo=mnementh.archaic.org.uk)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1VCu9o-0001OY-8v; Fri, 23 Aug 2013 12:24:16 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1VCu2L-0002IT-PX; Fri, 23 Aug 2013 17:16:33 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 23 Aug 2013 17:16:33 +0100
Message-Id: <1377274593-8797-3-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1377274593-8797-1-git-send-email-peter.maydell@linaro.org>
References: <1377274593-8797-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	patches@linaro.org
Subject: [Qemu-trivial] [PATCH 2/2] hw/scsi/lsi53c895a: Use deposit32 rather
	than handcoded shift/mask
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
X-List-Received-Date: Fri, 23 Aug 2013 16:24:27 -0000

Use deposit32() rather than handcoded shifts/masks to update the
scratch registers. This is cleaner and incidentally avoids a clang
sanitizer complaint ("runtime error: left shift of 255 by 24 places
cannot be represented in type 'int'").

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/scsi/lsi53c895a.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
index 333c62f..9c64e7c 100644
--- a/hw/scsi/lsi53c895a.c
+++ b/hw/scsi/lsi53c895a.c
@@ -1870,8 +1870,7 @@ static void lsi_reg_writeb(LSIState *s, int offset, uint8_t val)
             int shift;
             n = (offset - 0x58) >> 2;
             shift = (offset & 3) * 8;
-            s->scratch[n] &= ~(0xff << shift);
-            s->scratch[n] |= (val & 0xff) << shift;
+            s->scratch[n] = deposit32(s->scratch[n], shift, 8, val);
         } else {
             BADF("Unhandled writeb 0x%x = 0x%x\n", offset, val);
         }
-- 
1.7.9.5


