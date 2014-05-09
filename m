Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wiklf-0001ny-JI
	for mharc-qemu-trivial@gnu.org; Fri, 09 May 2014 09:23:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32884)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1Wikld-0001m8-Hr
	for qemu-trivial@nongnu.org; Fri, 09 May 2014 09:23:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1Wiklc-0007bU-H8
	for qemu-trivial@nongnu.org; Fri, 09 May 2014 09:23:13 -0400
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:48087)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WiklX-0007Zx-55; Fri, 09 May 2014 09:23:07 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WiklJ-0005Pq-WE; Fri, 09 May 2014 14:22:54 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri,  9 May 2014 14:22:53 +0100
Message-Id: <1399641773-20793-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-trivial@nongnu.org, "Vassili Karpov \(malc\)" <av1474@comtv.ru>,
	Gerd Hoffmann <kraxel@redhat.com>, patches@linaro.org
Subject: [Qemu-trivial] [PATCH] hw/audio/intel-hda: Avoid shift into sign bit
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
X-List-Received-Date: Fri, 09 May 2014 13:23:14 -0000

Add a U suffix to avoid shifting into the sign bit (which is
undefined behaviour in C).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Another one from clang's sanitizer...

 hw/audio/intel-hda.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/audio/intel-hda.c b/hw/audio/intel-hda.c
index d41f82c..0cec2d2 100644
--- a/hw/audio/intel-hda.c
+++ b/hw/audio/intel-hda.c
@@ -245,7 +245,7 @@ static void intel_hda_update_int_sts(IntelHDAState *d)
 
     /* update global status */
     if (sts & d->int_ctl) {
-        sts |= (1 << 31);
+        sts |= (1U << 31);
     }
 
     d->int_sts = sts;
@@ -257,7 +257,7 @@ static void intel_hda_update_irq(IntelHDAState *d)
     int level;
 
     intel_hda_update_int_sts(d);
-    if (d->int_sts & (1 << 31) && d->int_ctl & (1 << 31)) {
+    if (d->int_sts & (1U << 31) && d->int_ctl & (1U << 31)) {
         level = 1;
     } else {
         level = 0;
-- 
1.9.2


