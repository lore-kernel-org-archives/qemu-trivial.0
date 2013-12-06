Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vp0zV-0008B6-2E
	for mharc-qemu-trivial@gnu.org; Fri, 06 Dec 2013 14:23:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51291)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vp0zP-0007y9-Ea
	for qemu-trivial@nongnu.org; Fri, 06 Dec 2013 14:23:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vp0zO-0008HX-H8
	for qemu-trivial@nongnu.org; Fri, 06 Dec 2013 14:23:03 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:38909)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Vp0zB-0008Am-9Z; Fri, 06 Dec 2013 14:22:49 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 8E18840D77;
	Fri,  6 Dec 2013 23:22:47 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id F34F35FC;
	Fri,  6 Dec 2013 23:15:44 +0400 (MSK)
Received: (nullmailer pid 19231 invoked by uid 1000);
	Fri, 06 Dec 2013 19:15:44 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@amazon.com
Date: Fri,  6 Dec 2013 23:15:38 +0400
Message-Id: <1386357341-19147-12-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1386357341-19147-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1386357341-19147-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 11/14] libcacard/vcard_emul_nss: Remove unused
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
X-List-Received-Date: Fri, 06 Dec 2013 19:23:04 -0000

From: Stefan Weil <sw@weilnetz.de>

Warning from ccc-analyzer:

libcacard/vcard_emul_nss.c:937:9: warning:
 Value stored to 'cert_count' is never read
        cert_count = options->vreader[i].cert_count;
        ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
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


