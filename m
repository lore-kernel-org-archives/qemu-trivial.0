Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VwfhD-00014j-6S
	for mharc-qemu-trivial@gnu.org; Fri, 27 Dec 2013 17:15:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33191)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vwfh7-0000si-JH
	for qemu-trivial@nongnu.org; Fri, 27 Dec 2013 17:15:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vwfh3-0005rO-MB
	for qemu-trivial@nongnu.org; Fri, 27 Dec 2013 17:15:49 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:49947)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Vwfgq-0005nz-Ig; Fri, 27 Dec 2013 17:15:32 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id C6A03438A2;
	Sat, 28 Dec 2013 02:15:32 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 7F2645FC;
	Sat, 28 Dec 2013 02:07:35 +0400 (MSK)
Received: (nullmailer pid 10337 invoked by uid 1000);
	Fri, 27 Dec 2013 22:07:34 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@amazon.com
Date: Sat, 28 Dec 2013 02:07:19 +0400
Message-Id: <1388182050-10270-7-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1388182050-10270-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1388182050-10270-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Riku Voipio <riku.voipio@iki.fi>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 06/17] linux-user: Use macro TARGET_NSIG_WORDS
	where possible
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
X-List-Received-Date: Fri, 27 Dec 2013 22:15:53 -0000

From: Stefan Weil <sw@weilnetz.de>

This improves readability and simplifies the code.

Cc: Riku Voipio <riku.voipio@iki.fi>
Signed-off-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 linux-user/signal.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/linux-user/signal.c b/linux-user/signal.c
index 4e7148a..0034c70 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -2539,9 +2539,9 @@ void sparc64_set_context(CPUSPARCState *env)
             abi_ulong *src, *dst;
             src = ucp->tuc_sigmask.sig;
             dst = target_set.sig;
-            for (i = 0; i < sizeof(target_sigset_t) / sizeof(abi_ulong);
-                 i++, dst++, src++)
+            for (i = 0; i < TARGET_NSIG_WORDS; i++, dst++, src++) {
                 err |= __get_user(*dst, src);
+            }
             if (err)
                 goto do_sigsegv;
         }
@@ -2644,9 +2644,9 @@ void sparc64_get_context(CPUSPARCState *env)
         abi_ulong *src, *dst;
         src = target_set.sig;
         dst = ucp->tuc_sigmask.sig;
-        for (i = 0; i < sizeof(target_sigset_t) / sizeof(abi_ulong);
-             i++, dst++, src++)
+        for (i = 0; i < TARGET_NSIG_WORDS; i++, dst++, src++) {
             err |= __put_user(*src, dst);
+        }
         if (err)
             goto do_sigsegv;
     }
-- 
1.7.10.4


