Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bsnke-0006f6-1E
	for mharc-qemu-trivial@gnu.org; Sat, 08 Oct 2016 05:17:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46447)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bsnkb-0006aT-54
	for qemu-trivial@nongnu.org; Sat, 08 Oct 2016 05:17:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bsnkZ-0000o7-1H
	for qemu-trivial@nongnu.org; Sat, 08 Oct 2016 05:16:59 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:45274)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bsnkU-0000hb-Jn; Sat, 08 Oct 2016 05:16:54 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 00FED40ED8;
	Sat,  8 Oct 2016 12:16:49 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 7944EB39;
	Sat,  8 Oct 2016 11:58:16 +0300 (MSK)
Received: (nullmailer pid 19268 invoked by uid 1000);
	Sat, 08 Oct 2016 08:58:14 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: "Daniel P. Berrange" <berrange@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sat,  8 Oct 2016 11:58:09 +0300
Message-Id: <660a2d83e026496db6b3eaec2256a2cdd6c74de8.1475917008.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
References: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
References: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 23/26] char: fix missing return in error path
 for chardev TLS init
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
X-List-Received-Date: Sat, 08 Oct 2016 09:17:02 -0000

From: "Daniel P. Berrange" <berrange@redhat.com>

If the qio_channel_tls_new_(server|client) methods fail,
we disconnect the client. Unfortunately a missing return
means we then go on to try and run the TLS handshake on
a NULL I/O channel. This gives predictably segfaulty
results.

The main way to trigger this is to request a bogus TLS
priority string for the TLS credentials. e.g.

  -object tls-creds-x509,id=tls0,priority=wibble,...

Most other ways appear impossible to trigger except
perhaps if OOM conditions cause gnutls initialization
to fail.

Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qemu-char.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/qemu-char.c b/qemu-char.c
index fb456ce..48a45ef 100644
--- a/qemu-char.c
+++ b/qemu-char.c
@@ -3132,6 +3132,7 @@ static void tcp_chr_tls_init(CharDriverState *chr)
     if (tioc == NULL) {
         error_free(err);
         tcp_chr_disconnect(chr);
+        return;
     }
     object_unref(OBJECT(s->ioc));
     s->ioc = QIO_CHANNEL(tioc);
-- 
2.1.4


