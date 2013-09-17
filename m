Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VM24C-0006Ns-EG
	for mharc-qemu-trivial@gnu.org; Tue, 17 Sep 2013 16:40:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37192)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VM249-0006IZ-3z
	for qemu-trivial@nongnu.org; Tue, 17 Sep 2013 16:40:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VM242-0000Dy-7x
	for qemu-trivial@nongnu.org; Tue, 17 Sep 2013 16:40:09 -0400
Received: from qemu.weilnetz.de ([2a03:4000:2:362::1]:32864
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VM23z-0008VA-Pd; Tue, 17 Sep 2013 16:39:59 -0400
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id 92A7A18911F; Tue, 17 Sep 2013 22:39:56 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel <qemu-devel@nongnu.org>
Date: Tue, 17 Sep 2013 22:39:55 +0200
Message-Id: <1379450395-13460-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:2:362::1
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] kvm: Fix compiler warning (clang)
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
X-List-Received-Date: Tue, 17 Sep 2013 20:40:10 -0000

Report from clang analyzer:

clock.c:42:15: warning:
Value stored to 'cpu' during its initialization is never read

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 hw/i386/kvm/clock.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/kvm/clock.c b/hw/i386/kvm/clock.c
index 92aabb8..383938d 100644
--- a/hw/i386/kvm/clock.c
+++ b/hw/i386/kvm/clock.c
@@ -39,7 +39,7 @@ static void kvmclock_vm_state_change(void *opaque, int running,
                                      RunState state)
 {
     KVMClockState *s = opaque;
-    CPUState *cpu = first_cpu;
+    CPUState *cpu;
     int cap_clock_ctrl = kvm_check_extension(kvm_state, KVM_CAP_KVMCLOCK_CTRL);
     int ret;
 
-- 
1.7.10.4


