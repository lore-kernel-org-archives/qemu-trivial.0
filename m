Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WuPqN-0000Wg-L8
	for mharc-qemu-trivial@gnu.org; Tue, 10 Jun 2014 13:28:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54828)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WuPqG-0000Lq-Rq
	for qemu-trivial@nongnu.org; Tue, 10 Jun 2014 13:28:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WuPqC-0000Uz-9E
	for qemu-trivial@nongnu.org; Tue, 10 Jun 2014 13:28:12 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:37596)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WuPpy-0000Re-PI; Tue, 10 Jun 2014 13:27:54 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 986F4412DA;
	Tue, 10 Jun 2014 21:27:53 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 1D0846AC;
	Tue, 10 Jun 2014 20:08:48 +0400 (MSK)
Received: (nullmailer pid 13306 invoked by uid 1000);
	Tue, 10 Jun 2014 16:08:47 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 10 Jun 2014 20:08:26 +0400
Message-Id: <1402416523-13212-9-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1402416523-13212-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1402416523-13212-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 08/25] hw/sd/sd.c: Drop unused sd_acmd_type[]
	array
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
X-List-Received-Date: Tue, 10 Jun 2014 17:28:17 -0000

From: Peter Maydell <peter.maydell@linaro.org>

Drop the sd_acmd_type[] array: it is never used. (The equivalent
sd_cmd_type[] array for normal commands is used to identify
those commands whose argument includes the card address in the
top 16 bits; but for app commands the card address is passed
with the APP_CMD prefix, not with the argument to the app command
itself.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/sd/sd.c |   11 -----------
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
1.7.10.4


