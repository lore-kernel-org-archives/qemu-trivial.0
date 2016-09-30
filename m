Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bpzKZ-00024U-B5
	for mharc-qemu-trivial@gnu.org; Fri, 30 Sep 2016 11:02:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51670)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1bpzKW-00021M-IT
	for qemu-trivial@nongnu.org; Fri, 30 Sep 2016 11:02:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1bpzKU-0006DD-NR
	for qemu-trivial@nongnu.org; Fri, 30 Sep 2016 11:02:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37708)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>)
	id 1bpzKD-000617-9x; Fri, 30 Sep 2016 11:02:09 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4B7E261E58;
	Fri, 30 Sep 2016 15:02:08 +0000 (UTC)
Received: from t530wlan.home.berrange.com.com (vpn1-6-125.ams2.redhat.com
	[10.36.6.125])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8UF25rX001699; Fri, 30 Sep 2016 11:02:06 -0400
From: "Daniel P. Berrange" <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, qemu-trivial@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Daniel P. Berrange" <berrange@redhat.com>
Date: Fri, 30 Sep 2016 16:02:01 +0100
Message-Id: <1475247721-30670-1-git-send-email-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 30 Sep 2016 15:02:08 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] char: fix missing return in error path for
 chardev TLS init
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
X-List-Received-Date: Fri, 30 Sep 2016 15:02:29 -0000

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
2.7.4


