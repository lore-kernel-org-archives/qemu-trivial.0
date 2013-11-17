Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vi9e6-0005Bj-Qw
	for mharc-qemu-trivial@gnu.org; Sun, 17 Nov 2013 16:12:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55746)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1Vi9e0-0004vX-Eg
	for qemu-trivial@nongnu.org; Sun, 17 Nov 2013 16:12:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1Vi9dv-0003V6-K0
	for qemu-trivial@nongnu.org; Sun, 17 Nov 2013 16:12:36 -0500
Received: from qemu.weilnetz.de ([37.221.198.45]:44706
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1Vi9dl-0003RZ-AY; Sun, 17 Nov 2013 16:12:21 -0500
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id 16EFD1802A3; Sun, 17 Nov 2013 22:12:19 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: 
Date: Sun, 17 Nov 2013 22:12:18 +0100
Message-Id: <1384722738-17345-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH] libcacard/vcard_emul_nss: Remove unused
	statement (value stored is never read)
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
X-List-Received-Date: Sun, 17 Nov 2013 21:12:42 -0000

Warning from ccc-analyzer:

libcacard/vcard_emul_nss.c:937:9: warning:
 Value stored to 'cert_count' is never read
        cert_count = options->vreader[i].cert_count;
        ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 libcacard/vcard_emul_nss.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/libcacard/vcard_emul_nss.c b/libcacard/vcard_emul_nss.c
index fb429b1..ee2dfae 100644
--- a/libcacard/vcard_emul_nss.c
+++ b/libcacard/vcard_emul_nss.c
@@ -934,7 +934,6 @@ vcard_emul_init(const VCardEmulOptions *options)
         vreader = vreader_new(options->vreader[i].vname, vreader_emul,
                               vreader_emul_delete);
         vreader_add_reader(vreader);
-        cert_count = options->vreader[i].cert_count;
 
         vcard_emul_alloc_arrays(&certs, &cert_len, &keys,
                                 options->vreader[i].cert_count);
-- 
1.7.10.4


