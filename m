Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vi9d5-0003XX-JJ
	for mharc-qemu-trivial@gnu.org; Sun, 17 Nov 2013 16:11:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55427)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1Vi9d3-0003UZ-AF
	for qemu-trivial@nongnu.org; Sun, 17 Nov 2013 16:11:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1Vi9d2-0003AZ-I2
	for qemu-trivial@nongnu.org; Sun, 17 Nov 2013 16:11:37 -0500
Received: from qemu.weilnetz.de ([2a03:4000:2:362::1]:56365
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1Vi9cu-00033l-9Z; Sun, 17 Nov 2013 16:11:28 -0500
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id ED9281802A3; Sun, 17 Nov 2013 22:11:24 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: 
Date: Sun, 17 Nov 2013 22:11:23 +0100
Message-Id: <1384722683-17205-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:2:362::1
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH] libcacard/cac: Remove unused statement
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
X-List-Received-Date: Sun, 17 Nov 2013 21:11:38 -0000

Warning from ccc-analyzer:

libcacard/cac.c:192:13: warning: Value stored to 'ret' is never read
            ret = VCARD_DONE;
            ^     ~~~~~~~~~~

Here 'ret' is assigned a value inside of a switch statement and also after
that switch statement.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

This patch is not needed for 1.7 (although I think that it is safe).

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


