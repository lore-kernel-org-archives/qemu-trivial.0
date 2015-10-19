Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZoB7W-0004rG-BP
	for mharc-qemu-trivial@gnu.org; Mon, 19 Oct 2015 10:09:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48407)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1ZoB7Q-0004iC-Rj
	for qemu-trivial@nongnu.org; Mon, 19 Oct 2015 10:09:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1ZoB7L-0000pp-9p
	for qemu-trivial@nongnu.org; Mon, 19 Oct 2015 10:08:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47014)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1ZoB7D-0000nr-Ea; Mon, 19 Oct 2015 10:08:43 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id EABE0319B0D;
	Mon, 19 Oct 2015 14:08:42 +0000 (UTC)
Received: from donizetti.redhat.com (ovpn-112-64.ams2.redhat.com
	[10.36.112.64])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t9JE8e6v026368; Mon, 19 Oct 2015 10:08:41 -0400
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 19 Oct 2015 16:08:38 +0200
Message-Id: <1445263720-6765-1-git-send-email-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] target-alpha: fix uninitialized variable
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
X-List-Received-Date: Mon, 19 Oct 2015 14:09:01 -0000

I am not sure why the compiler does not catch it.  There is no
semantic change since gen_excp returns EXIT_NORETURN, but the
old code is wrong.

Reported by Coverity.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target-alpha/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target-alpha/translate.c b/target-alpha/translate.c
index f936d1b..53f6833 100644
--- a/target-alpha/translate.c
+++ b/target-alpha/translate.c
@@ -2916,7 +2916,7 @@ void gen_intermediate_code(CPUAlphaState *env, struct TranslationBlock *tb)
         num_insns++;
 
         if (unlikely(cpu_breakpoint_test(cs, ctx.pc, BP_ANY))) {
-            gen_excp(&ctx, EXCP_DEBUG, 0);
+            ret = gen_excp(&ctx, EXCP_DEBUG, 0);
             break;
         }
         if (num_insns == max_insns && (tb->cflags & CF_LAST_IO)) {
-- 
2.5.0


