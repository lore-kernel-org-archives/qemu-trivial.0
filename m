Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WrsWP-0006QM-HK
	for mharc-qemu-trivial@gnu.org; Tue, 03 Jun 2014 13:29:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57258)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WrsWM-0006Kc-7i
	for qemu-trivial@nongnu.org; Tue, 03 Jun 2014 13:29:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WrsWI-0001mN-Er
	for qemu-trivial@nongnu.org; Tue, 03 Jun 2014 13:29:10 -0400
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:48342)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WrsWG-0001lP-2L; Tue, 03 Jun 2014 13:29:04 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WrsWD-0000P1-3E; Tue, 03 Jun 2014 18:29:01 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue,  3 Jun 2014 18:29:01 +0100
Message-Id: <1401816541-1522-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-trivial@nongnu.org, patches@linaro.org
Subject: [Qemu-trivial] [PATCH] hw/sd/sd.c: Drop unused sd_acmd_type[] array
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
X-List-Received-Date: Tue, 03 Jun 2014 17:29:11 -0000

Drop the sd_acmd_type[] array: it is never used. (The equivalent
sd_cmd_type[] array for normal commands is used to identify
those commands whose argument includes the card address in the
top 16 bits; but for app commands the card address is passed
with the APP_CMD prefix, not with the argument to the app command
itself.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
clang 3.4 warns about this unused variable. If we ever turn out to
need the information it's all in the sd card spec anyway.

 hw/sd/sd.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 4502ad1..5efe8c1 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -151,17 +151,6 @@ static const sd_cmd_type_t sd_cmd_type[64] = {
     sd_adtc, sd_none, sd_none, sd_none, sd_none, sd_none, sd_none, sd_none,
 };
 
-static const sd_cmd_type_t sd_acmd_type[64] = {
-    sd_none, sd_none, sd_none, sd_none, sd_none, sd_none, sd_ac,   sd_none,
-    sd_none, sd_none, sd_none, sd_none, sd_none, sd_adtc, sd_none, sd_none,
-    sd_none, sd_none, sd_none, sd_none, sd_none, sd_none, sd_adtc, sd_ac,
-    sd_none, sd_none, sd_none, sd_none, sd_none, sd_none, sd_none, sd_none,
-    sd_none, sd_none, sd_none, sd_none, sd_none, sd_none, sd_none, sd_none,
-    sd_none, sd_bcr,  sd_ac,   sd_none, sd_none, sd_none, sd_none, sd_none,
-    sd_none, sd_none, sd_none, sd_adtc, sd_none, sd_none, sd_none, sd_none,
-    sd_none, sd_none, sd_none, sd_none, sd_none, sd_none, sd_none, sd_none,
-};
-
 static const int sd_cmd_class[64] = {
     0,  0,  0,  0,  0,  9, 10,  0,  0,  0,  0,  1,  0,  0,  0,  0,
     2,  2,  2,  2,  3,  3,  3,  3,  4,  4,  4,  4,  6,  6,  6,  6,
-- 
1.9.2


