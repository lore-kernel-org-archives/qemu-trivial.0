Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Y3YfU-0006Cg-8o
	for mharc-qemu-trivial@gnu.org; Tue, 23 Dec 2014 18:15:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35658)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1Y3YfR-00068E-4g
	for qemu-trivial@nongnu.org; Tue, 23 Dec 2014 18:15:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1Y3YfO-0000PF-O7
	for qemu-trivial@nongnu.org; Tue, 23 Dec 2014 18:15:05 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:54651)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1Y3YfO-0000OY-IR
	for qemu-trivial@nongnu.org; Tue, 23 Dec 2014 18:15:02 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1Y3Xup-0004gp-US; Tue, 23 Dec 2014 22:26:55 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 23 Dec 2014 22:26:55 +0000
Message-Id: <1419373615-17989-4-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1419373615-17989-1-git-send-email-peter.maydell@linaro.org>
References: <1419373615-17989-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH 3/3] migration/qemu-file.c: Don't shift left
	into sign bit
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
X-List-Received-Date: Tue, 23 Dec 2014 23:15:06 -0000

Add a cast in qemu_get_be32() to avoid shifting left into the sign
bit of a signed integer (which is undefined behaviour in C).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 migration/qemu-file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index d2d4007..a7f2a34 100644
--- a/migration/qemu-file.c
+++ b/migration/qemu-file.c
@@ -503,7 +503,7 @@ unsigned int qemu_get_be16(QEMUFile *f)
 unsigned int qemu_get_be32(QEMUFile *f)
 {
     unsigned int v;
-    v = qemu_get_byte(f) << 24;
+    v = (unsigned int)qemu_get_byte(f) << 24;
     v |= qemu_get_byte(f) << 16;
     v |= qemu_get_byte(f) << 8;
     v |= qemu_get_byte(f);
-- 
1.9.1


