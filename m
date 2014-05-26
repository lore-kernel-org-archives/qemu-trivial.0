Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wopmo-00058L-NG
	for mharc-qemu-trivial@gnu.org; Mon, 26 May 2014 03:57:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51639)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Wopmh-0004uH-Hu
	for qemu-trivial@nongnu.org; Mon, 26 May 2014 03:57:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Wopmc-0001b7-LC
	for qemu-trivial@nongnu.org; Mon, 26 May 2014 03:57:27 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:36099)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WopmQ-0001WD-Pm; Mon, 26 May 2014 03:57:11 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id A027A42FAC;
	Mon, 26 May 2014 11:57:09 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 6F1896B5;
	Mon, 26 May 2014 11:20:15 +0400 (MSK)
Received: (nullmailer pid 23026 invoked by uid 1000);
	Mon, 26 May 2014 07:20:14 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 26 May 2014 11:20:06 +0400
Message-Id: <1401088811-22923-19-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1401088811-22923-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1401088811-22923-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Markus Armbruster <armbru@redhat.com>
Subject: [Qemu-trivial] [PULL 18/23] libcacard/vcard_emul_nss: Drop a
	redundant conditional
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
X-List-Received-Date: Mon, 26 May 2014 07:57:32 -0000

From: Markus Armbruster <armbru@redhat.com>

Bailing out when PK11_FindGenericObjects() returns null ensures the
loop that follows it executes at least once.  The "loop did not
execute" test right after it is useless.  Drop it.

Spotted by Coverity.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Alon Levy <alevy@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 libcacard/vcard_emul_nss.c |    5 -----
 1 file changed, 5 deletions(-)

diff --git a/libcacard/vcard_emul_nss.c b/libcacard/vcard_emul_nss.c
index 8e05551..b7db51d 100644
--- a/libcacard/vcard_emul_nss.c
+++ b/libcacard/vcard_emul_nss.c
@@ -618,11 +618,6 @@ vcard_emul_mirror_card(VReader *vreader)
         cert_count++;
     }
 
-    if (cert_count == 0) {
-        PK11_DestroyGenericObjects(firstObj);
-        return NULL;
-    }
-
     /* allocate the arrays */
     vcard_emul_alloc_arrays(&certs, &cert_len, &keys, cert_count);
 
-- 
1.7.10.4


