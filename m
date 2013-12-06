Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vp0zU-0008AH-Q2
	for mharc-qemu-trivial@gnu.org; Fri, 06 Dec 2013 14:23:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51256)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vp0zO-0007vF-7W
	for qemu-trivial@nongnu.org; Fri, 06 Dec 2013 14:23:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vp0zN-0008H1-At
	for qemu-trivial@nongnu.org; Fri, 06 Dec 2013 14:23:02 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:46068)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Vp0zB-0008Al-9c; Fri, 06 Dec 2013 14:22:49 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id BEE4040DD1;
	Fri,  6 Dec 2013 23:22:47 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id BC2F952D;
	Fri,  6 Dec 2013 23:15:44 +0400 (MSK)
Received: (nullmailer pid 19229 invoked by uid 1000);
	Fri, 06 Dec 2013 19:15:44 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@amazon.com
Date: Fri,  6 Dec 2013 23:15:37 +0400
Message-Id: <1386357341-19147-11-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1386357341-19147-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1386357341-19147-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 10/14] libcacard/cac: Remove unused statement
	(value stored is never read)
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
X-List-Received-Date: Fri, 06 Dec 2013 19:23:03 -0000

From: Stefan Weil <sw@weilnetz.de>

Warning from ccc-analyzer:

libcacard/cac.c:192:13: warning: Value stored to 'ret' is never read
            ret = VCARD_DONE;
            ^     ~~~~~~~~~~

Here 'ret' is assigned a value inside of a switch statement and also after
that switch statement.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 libcacard/cac.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/libcacard/cac.c b/libcacard/cac.c
index 7a06b5a..74ef3e3 100644
--- a/libcacard/cac.c
+++ b/libcacard/cac.c
@@ -189,7 +189,6 @@ cac_applet_pki_process_apdu(VCard *card, VCardAPDU *apdu,
             pki_applet->sign_buffer = sign_buffer;
             pki_applet->sign_buffer_len = size;
             *response = vcard_make_response(VCARD7816_STATUS_SUCCESS);
-            ret = VCARD_DONE;
             break;
         case 0x00:
             /* we now have the whole buffer, do the operation, result will be
-- 
1.7.10.4


