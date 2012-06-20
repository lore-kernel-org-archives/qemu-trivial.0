Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ShCB8-0003gm-EZ
	for mharc-qemu-trivial@gnu.org; Wed, 20 Jun 2012 00:06:02 -0400
Received: from eggs.gnu.org ([208.118.235.92]:59568)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1ShCB5-0003Xd-OB
	for qemu-trivial@nongnu.org; Wed, 20 Jun 2012 00:06:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1ShCB3-0001yU-Sb
	for qemu-trivial@nongnu.org; Wed, 20 Jun 2012 00:05:59 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:57291)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1ShCB0-0001xi-NQ; Wed, 20 Jun 2012 00:05:54 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	7299C7280025; Wed, 20 Jun 2012 06:05:52 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id HUAw0PCWtSSE; Wed, 20 Jun 2012 06:05:51 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id DDEDA72800C1; Wed, 20 Jun 2012 06:05:51 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial <qemu-trivial@nongnu.org>
Date: Wed, 20 Jun 2012 06:05:51 +0200
Message-Id: <1340165151-30936-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.47.199.172
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] target-i386: Use QEMU instead of Qemu
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
X-List-Received-Date: Wed, 20 Jun 2012 04:06:01 -0000

This new 'QEmu' was recently added.
Replace it by the official all upper case 'QEMU'.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

Hopefully those 'Qemu' and 'QEmu' variants will stop
as soon as my patch for checkpatch.pl was applied.

 target-i386/cpu.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target-i386/cpu.c b/target-i386/cpu.c
index fdd95be..5521709 100644
--- a/target-i386/cpu.c
+++ b/target-i386/cpu.c
@@ -1303,7 +1303,7 @@ void x86_cpudef_setup(void)
         builtin_x86_defs[i].flags = 1;
 
         /* Look for specific "cpudef" models that */
-        /* have the QEmu version in .model_id */
+        /* have the QEMU version in .model_id */
         for (j = 0; j < ARRAY_SIZE(model_with_versions); j++) {
             if (strcmp(model_with_versions[j], builtin_x86_defs[i].name) == 0) {
                 pstrcpy(builtin_x86_defs[i].model_id, sizeof(builtin_x86_defs[i].model_id), "QEMU Virtual CPU version ");
-- 
1.7.10


