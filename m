Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VpIFY-0000B0-KU
	for mharc-qemu-trivial@gnu.org; Sat, 07 Dec 2013 08:48:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32916)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VpIFV-0008Ui-4X
	for qemu-trivial@nongnu.org; Sat, 07 Dec 2013 08:48:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VpIFU-0001TS-D9
	for qemu-trivial@nongnu.org; Sat, 07 Dec 2013 08:48:49 -0500
Received: from qemu.weilnetz.de ([2a03:4000:2:362::1]:53212
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VpIFS-0001SU-1k; Sat, 07 Dec 2013 08:48:46 -0500
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id A79891802AD; Sat,  7 Dec 2013 14:48:43 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel <qemu-devel@nongnu.org>
Date: Sat,  7 Dec 2013 14:48:08 +0100
Message-Id: <1386424088-23196-6-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1386424088-23196-1-git-send-email-sw@weilnetz.de>
References: <1386424088-23196-1-git-send-email-sw@weilnetz.de>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:2:362::1
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Riku Voipio <riku.voipio@iki.fi>
Subject: [Qemu-trivial] [PATCH v2 5/5] linux-user: Use macro
	TARGET_NSIG_WORDS where possible
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
X-List-Received-Date: Sat, 07 Dec 2013 13:48:50 -0000

This improves readability and simplifies the code.

Cc: Riku Voipio <riku.voipio@iki.fi>
Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 linux-user/signal.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/linux-user/signal.c b/linux-user/signal.c
index 7751c47..8f692cd 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -2537,9 +2537,9 @@ void sparc64_set_context(CPUSPARCState *env)
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
@@ -2642,9 +2642,9 @@ void sparc64_get_context(CPUSPARCState *env)
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


