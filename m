Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yzm2X-0000YD-7m
	for mharc-qemu-trivial@gnu.org; Tue, 02 Jun 2015 09:15:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57793)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mkletzan@redhat.com>) id 1YzhCv-0002bH-9K
	for qemu-trivial@nongnu.org; Tue, 02 Jun 2015 04:05:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mkletzan@redhat.com>) id 1YzhCu-00022H-EW
	for qemu-trivial@nongnu.org; Tue, 02 Jun 2015 04:05:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42520)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mkletzan@redhat.com>)
	id 1YzhCl-000203-FF; Tue, 02 Jun 2015 04:05:47 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id C77033679FD;
	Tue,  2 Jun 2015 08:05:46 +0000 (UTC)
Received: from wheatley.brq.redhat.com (dhcp129-92.brq.redhat.com
	[10.34.129.92])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t5285joJ020907; Tue, 2 Jun 2015 04:05:45 -0400
From: Martin Kletzander <mkletzan@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  2 Jun 2015 10:05:29 +0200
Message-Id: <1433232329-14983-1-git-send-email-mkletzan@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
X-Mailman-Approved-At: Tue, 02 Jun 2015 09:15:32 -0400
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: [Qemu-trivial] [PATCH] arm: Fix invalid assert logic in op_helper.c
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
X-List-Received-Date: Tue, 02 Jun 2015 08:05:58 -0000

Boolean value '!arm_current_el(env)' can never be equal to 3.  Fix it
according to the comment above as currently the build fails with
gcc-5.1.0.

Signed-off-by: Martin Kletzander <mkletzan@redhat.com>
---
 target-arm/op_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
index 3f5b9ab5963b..7583ae71217b 100644
--- a/target-arm/op_helper.c
+++ b/target-arm/op_helper.c
@@ -421,7 +421,7 @@ void HELPER(access_check_cp_reg)(CPUARMState *env, void *rip, uint32_t syndrome)
         /* Requesting a trap to EL2 when we're in EL3 or S-EL0/1 is
          * a bug in the access function.
          */
-        assert(!arm_is_secure(env) && !arm_current_el(env) == 3);
+        assert(!arm_is_secure(env) && arm_current_el(env) != 3);
         target_el = 2;
         break;
     case CP_ACCESS_TRAP_EL3:
-- 
2.4.2


