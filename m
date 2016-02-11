Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aTqLS-0006So-8z
	for mharc-qemu-trivial@gnu.org; Thu, 11 Feb 2016 07:27:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60391)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aTqLL-0006EZ-0S
	for qemu-trivial@nongnu.org; Thu, 11 Feb 2016 07:27:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aTqLK-00006U-27
	for qemu-trivial@nongnu.org; Thu, 11 Feb 2016 07:27:30 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:33935)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1aTqLG-00005M-7S; Thu, 11 Feb 2016 07:27:26 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id B8B1141455;
	Thu, 11 Feb 2016 15:19:05 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id A7DD1A99;
	Thu, 11 Feb 2016 15:19:04 +0300 (MSK)
Received: (nullmailer pid 11181 invoked by uid 1000);
	Thu, 11 Feb 2016 12:19:04 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 11 Feb 2016 15:18:54 +0300
Message-Id: <58c652c08acaabcf5f22d33021d9ffeae2f59263.1455192968.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1455192968.git.mjt@msgid.tls.msk.ru>
References: <cover.1455192968.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 05/14] qemu-sockets: simplify error handling
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
X-List-Received-Date: Thu, 11 Feb 2016 12:27:32 -0000

From: Paolo Bonzini <pbonzini@redhat.com>

Just go always through the err label.  (Noticed because Coverity
complains that peer is always non-NULL in the error cleanup code,
but removing the "if" is arguably more prone to introducing the
opposite bug in the future).

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Daniel P. Berrange <berrange@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 util/qemu-sockets.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index b665cdb..557da20 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -459,7 +459,7 @@ static int inet_dgram_saddr(InetSocketAddress *sraddr,
 
     if (err) {
         error_propagate(errp, err);
-        return -1;
+        goto err;
     }
 
     addr = sraddr->host;
@@ -469,13 +469,13 @@ static int inet_dgram_saddr(InetSocketAddress *sraddr,
     }
     if (port == NULL || strlen(port) == 0) {
         error_setg(errp, "remote port not specified");
-        return -1;
+        goto err;
     }
 
     if (0 != (rc = getaddrinfo(addr, port, &ai, &peer))) {
         error_setg(errp, "address resolution failed for %s:%s: %s", addr, port,
                    gai_strerror(rc));
-	return -1;
+	goto err;
     }
 
     /* lookup local addr */
-- 
2.1.4


