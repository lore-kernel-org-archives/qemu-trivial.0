Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b9TwK-0004Fs-83
	for mharc-qemu-trivial@gnu.org; Sun, 05 Jun 2016 05:01:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41142)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9TwE-00046B-GQ
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 05:01:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9TwC-0004oB-IY
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 05:01:41 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:34031)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1b9Tw5-0004lE-P1; Sun, 05 Jun 2016 05:01:33 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id E746E40915;
	Sun,  5 Jun 2016 12:01:26 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 7E087ADC;
	Sun,  5 Jun 2016 10:43:33 +0300 (MSK)
Received: (nullmailer pid 1093 invoked by uid 1000);
	Sun, 05 Jun 2016 07:43:32 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org
Date: Sun,  5 Jun 2016 10:42:39 +0300
Message-Id: <56e1f60309eb653f8cd2323cecfc06c2c84242a4.1465112552.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
References: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 02/52] hw/ipmi: fix spelling
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 05 Jun 2016 09:01:47 -0000

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
Acked-by: Corey Minyard <cminyard@mvista.com>
---
 hw/ipmi/ipmi_bmc_extern.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ipmi/ipmi_bmc_extern.c b/hw/ipmi/ipmi_bmc_extern.c
index fe12112..157879e 100644
--- a/hw/ipmi/ipmi_bmc_extern.c
+++ b/hw/ipmi/ipmi_bmc_extern.c
@@ -190,7 +190,7 @@ static void ipmi_bmc_extern_handle_command(IPMIBmc *b,
     if (ibe->outlen) {
         /* We already have a command queued.  Shouldn't ever happen. */
         fprintf(stderr, "IPMI KCS: Got command when not finished with the"
-                " previous commmand\n");
+                " previous command\n");
         abort();
     }
 
-- 
2.1.4


