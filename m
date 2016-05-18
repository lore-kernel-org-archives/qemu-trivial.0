Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b30rj-0006NM-15
	for mharc-qemu-trivial@gnu.org; Wed, 18 May 2016 08:46:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39777)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b30re-0006Iw-GM
	for qemu-trivial@nongnu.org; Wed, 18 May 2016 08:46:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b30rc-0003YC-JM
	for qemu-trivial@nongnu.org; Wed, 18 May 2016 08:46:13 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:58939)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1b30rU-0003WG-Bv; Wed, 18 May 2016 08:46:04 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 26DBB417B9;
	Wed, 18 May 2016 15:46:01 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 463BAADA;
	Wed, 18 May 2016 15:46:00 +0300 (MSK)
Received: (nullmailer pid 20837 invoked by uid 1000);
	Wed, 18 May 2016 12:46:00 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Date: Wed, 18 May 2016 15:45:57 +0300
Message-Id: <1463575557-20797-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PATCH trivial] hw/ipmi: fix spelling
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
X-List-Received-Date: Wed, 18 May 2016 12:46:17 -0000

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
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


