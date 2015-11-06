Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZugSi-0005P1-To
	for mharc-qemu-trivial@gnu.org; Fri, 06 Nov 2015 07:49:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59443)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZugSg-0005L1-TA
	for qemu-trivial@nongnu.org; Fri, 06 Nov 2015 07:49:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZugSg-0001Wp-2E
	for qemu-trivial@nongnu.org; Fri, 06 Nov 2015 07:49:46 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:37469)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZugSa-0001S6-E2; Fri, 06 Nov 2015 07:49:40 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 29B3A40DD2;
	Fri,  6 Nov 2015 15:49:39 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id A3C9FACB;
	Fri,  6 Nov 2015 15:44:05 +0300 (MSK)
Received: (nullmailer pid 31719 invoked by uid 1000);
	Fri, 06 Nov 2015 12:44:03 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri,  6 Nov 2015 15:44:00 +0300
Message-Id: <a2f31f180499593b5edb8ac5ab8ac1b92f0abcd4.1446813769.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1446813768.git.mjt@msgid.tls.msk.ru>
References: <cover.1446813768.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 23/24] qemu-sockets: do not test path with
	access() before unlinking
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
X-List-Received-Date: Fri, 06 Nov 2015 12:49:47 -0000

From: Paolo Bonzini <pbonzini@redhat.com>

Using access() is a time-of-check/time-of-use race condition.  It is
okay to use them to provide better error messages, but that is pretty
much it.

This is not one such case; on the other hand, access() *will* skip
unlink() for a non-existent path, so ignore ENOENT return values from
the unlink() system call.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 util/qemu-sockets.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index dfe4587..5a31d16 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -751,8 +751,7 @@ int unix_listen_opts(QemuOpts *opts, Error **errp)
         qemu_opt_set(opts, "path", un.sun_path, &error_abort);
     }
 
-    if ((access(un.sun_path, F_OK) == 0) &&
-        unlink(un.sun_path) < 0) {
+    if (unlink(un.sun_path) < 0 && errno != ENOENT) {
         error_setg_errno(errp, errno,
                          "Failed to unlink socket %s", un.sun_path);
         goto err;
-- 
2.1.4


