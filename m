Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZugSk-0005Rb-Ck
	for mharc-qemu-trivial@gnu.org; Fri, 06 Nov 2015 07:49:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59455)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZugSh-0005Ls-AS
	for qemu-trivial@nongnu.org; Fri, 06 Nov 2015 07:49:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZugSg-0001XR-BT
	for qemu-trivial@nongnu.org; Fri, 06 Nov 2015 07:49:47 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:56959)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZugSa-0001S2-Dp; Fri, 06 Nov 2015 07:49:40 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 17F9340D82;
	Fri,  6 Nov 2015 15:49:39 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id D6E17ACF;
	Fri,  6 Nov 2015 15:44:05 +0300 (MSK)
Received: (nullmailer pid 31713 invoked by uid 1000);
	Fri, 06 Nov 2015 12:44:03 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri,  6 Nov 2015 15:43:57 +0300
Message-Id: <74de807f794ac5201b2b3c38ddadeef84a676a97.1446813769.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1446813768.git.mjt@msgid.tls.msk.ru>
References: <cover.1446813768.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 20/24] target-alpha: fix uninitialized variable
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
X-List-Received-Date: Fri, 06 Nov 2015 12:49:48 -0000

From: Paolo Bonzini <pbonzini@redhat.com>

I am not sure why the compiler does not catch it.  There is no
semantic change since gen_excp returns EXIT_NORETURN, but the
old code is wrong.

Reported by Coverity.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 target-alpha/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target-alpha/translate.c b/target-alpha/translate.c
index 87950c6..9909c70 100644
--- a/target-alpha/translate.c
+++ b/target-alpha/translate.c
@@ -2916,7 +2916,7 @@ void gen_intermediate_code(CPUAlphaState *env, struct TranslationBlock *tb)
         num_insns++;
 
         if (unlikely(cpu_breakpoint_test(cs, ctx.pc, BP_ANY))) {
-            gen_excp(&ctx, EXCP_DEBUG, 0);
+            ret = gen_excp(&ctx, EXCP_DEBUG, 0);
             /* The address covered by the breakpoint must be included in
                [tb->pc, tb->pc + tb->size) in order to for it to be
                properly cleared -- thus we increment the PC here so that
-- 
2.1.4


