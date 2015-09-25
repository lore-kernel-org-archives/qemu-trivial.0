Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZfZp7-0000uh-Dx
	for mharc-qemu-trivial@gnu.org; Fri, 25 Sep 2015 16:42:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40495)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1ZfZp5-0000rW-E3
	for qemu-trivial@nongnu.org; Fri, 25 Sep 2015 16:42:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1ZfZp4-0004s3-LF
	for qemu-trivial@nongnu.org; Fri, 25 Sep 2015 16:42:27 -0400
Received: from qemu.weilnetz.de ([37.221.198.45]:40970)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1ZfZov-0004mC-Fq; Fri, 25 Sep 2015 16:42:17 -0400
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id E8C3317F539; Fri, 25 Sep 2015 22:42:15 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: QEMU Developer <qemu-devel@nongnu.org>
Date: Fri, 25 Sep 2015 22:42:13 +0200
Message-Id: <1443213733-9807-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 37.221.198.45
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] target-arm: Add missing 'static' attribute
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
X-List-Received-Date: Fri, 25 Sep 2015 20:42:28 -0000

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 target-arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target-arm/helper.c b/target-arm/helper.c
index 8367997..584f6df 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -5194,7 +5194,7 @@ void switch_mode(CPUARMState *env, int mode)
  *        BIT IRQ     IMO      Non-secure         Secure
  *        EL3 FIQ  RW FMO   EL0 EL1 EL2 EL3   EL0 EL1 EL2 EL3
  */
-const int8_t target_el_table[2][2][2][2][2][4] = {
+static const int8_t target_el_table[2][2][2][2][2][4] = {
     {{{{/* 0   0   0   0 */{ 1,  1,  2, -1 },{ 3, -1, -1,  3 },},
        {/* 0   0   0   1 */{ 2,  2,  2, -1 },{ 3, -1, -1,  3 },},},
       {{/* 0   0   1   0 */{ 1,  1,  2, -1 },{ 3, -1, -1,  3 },},
-- 
2.1.4


