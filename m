Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XoCie-0002cq-OB
	for mharc-qemu-trivial@gnu.org; Tue, 11 Nov 2014 09:46:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60751)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XoCiY-0002Pj-6q
	for qemu-trivial@nongnu.org; Tue, 11 Nov 2014 09:46:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XoCiT-00081I-7h
	for qemu-trivial@nongnu.org; Tue, 11 Nov 2014 09:46:50 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:52083)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XoCiJ-0007yV-TM; Tue, 11 Nov 2014 09:46:36 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id E845E41DF4;
	Tue, 11 Nov 2014 17:46:34 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id CF9F9706;
	Tue, 11 Nov 2014 17:46:34 +0300 (MSK)
Received: (nullmailer pid 14572 invoked by uid 1000);
	Tue, 11 Nov 2014 14:46:34 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 11 Nov 2014 17:46:29 +0300
Message-Id: <7f151e6f718f2edaf8661c4dedf6fcdb30b10e1b.1415716845.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1415716845.git.mjt@msgid.tls.msk.ru>
References: <cover.1415716845.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: Willem Pinckaers <willem_qemu@lekkertech.net>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 07/11] coroutine-sigaltstack: Change jmp_buf
	to sigjmp_buf
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
X-List-Received-Date: Tue, 11 Nov 2014 14:46:55 -0000

From: Willem Pinckaers <willem_qemu@lekkertech.net>

This is a simple patch to change the type of old_env from jmp_buf
to sigjmp_buf.  old_env is used by sigsetjmp and as such should be
a sigjmp_buf.

This fixes a stack_chk fail in a OSX 32bit build. Since at least on
OSX sigjmp_buf is four bytes larger then a jmpbuf, resulting in an
overflow in sigsetjmp. Due to variable reordering this overwrites
the stack cookie.

Signed-off-by: Willem Pinckaers <willem_qemu@lekkertech.net>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Peter: I think I must have missed this one when I converted
       all the jmp_buf to sigjmp_buf in commit 6ab7e546.
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 coroutine-sigaltstack.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/coroutine-sigaltstack.c b/coroutine-sigaltstack.c
index 3de0bb3..63519ff 100644
--- a/coroutine-sigaltstack.c
+++ b/coroutine-sigaltstack.c
@@ -155,7 +155,7 @@ Coroutine *qemu_coroutine_new(void)
     stack_t oss;
     sigset_t sigs;
     sigset_t osigs;
-    jmp_buf old_env;
+    sigjmp_buf old_env;
 
     /* The way to manipulate stack is with the sigaltstack function. We
      * prepare a stack, with it delivering a signal to ourselves and then
-- 
1.7.10.4


