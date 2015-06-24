Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z7jMw-00066m-N5
	for mharc-qemu-trivial@gnu.org; Wed, 24 Jun 2015 08:01:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35736)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1Z7jMr-00060b-6O
	for qemu-trivial@nongnu.org; Wed, 24 Jun 2015 08:01:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1Z7jMq-0002kr-9o
	for qemu-trivial@nongnu.org; Wed, 24 Jun 2015 08:01:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39577)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1Z7jMg-0002a7-4c; Wed, 24 Jun 2015 08:01:14 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 9B8B28E915;
	Wed, 24 Jun 2015 12:01:13 +0000 (UTC)
Received: from donizetti.redhat.com (ovpn-112-66.ams2.redhat.com
	[10.36.112.66])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t5OC1BNi029534; Wed, 24 Jun 2015 08:01:11 -0400
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 24 Jun 2015 14:01:10 +0200
Message-Id: <1435147270-1040-1-git-send-email-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [Qemu-trivial] [PATCH] target-tricore: fix depositing bits from
	PCXI into ICR
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
X-List-Received-Date: Wed, 24 Jun 2015 12:01:29 -0000

Spotted by Coverity, because (env->PCXI & MASK_PCXI_PCPN) >> 24
is always zero.  The immediately preceding assignment is also
wrong though.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target-tricore/op_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target-tricore/op_helper.c b/target-tricore/op_helper.c
index 10ed541..53edbda 100644
--- a/target-tricore/op_helper.c
+++ b/target-tricore/op_helper.c
@@ -2545,10 +2545,10 @@ void helper_rfm(CPUTriCoreState *env)
     env->PC = (env->gpr_a[11] & ~0x1);
     /* ICR.IE = PCXI.PIE; */
     env->ICR = (env->ICR & ~MASK_ICR_IE) |
-               ((env->PCXI & ~MASK_PCXI_PIE) >> 15);
+               ((env->PCXI & MASK_PCXI_PIE) >> 15);
     /* ICR.CCPN = PCXI.PCPN; */
     env->ICR = (env->ICR & ~MASK_ICR_CCPN) |
-               ((env->PCXI & ~MASK_PCXI_PCPN) >> 24);
+               ((env->PCXI & MASK_PCXI_PCPN) >> 24);
     /* {PCXI, PSW, A[10], A[11]} = M(DCX, 4 * word); */
     env->PCXI = cpu_ldl_data(env, env->DCX);
     psw_write(env, cpu_ldl_data(env, env->DCX+4));
-- 
2.4.3


