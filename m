Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UPEMX-0005wW-00
	for mharc-qemu-trivial@gnu.org; Mon, 08 Apr 2013 11:52:05 -0400
Received: from eggs.gnu.org ([208.118.235.92]:35618)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1UPEMO-0005jh-M4
	for qemu-trivial@nongnu.org; Mon, 08 Apr 2013 11:52:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1UPEML-0004F4-Vn
	for qemu-trivial@nongnu.org; Mon, 08 Apr 2013 11:51:56 -0400
Received: from
	1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.d.1.0.0.b.8.0.1.0.0.2.ip6.arpa
	([2001:8b0:1d0::1]:33682 helo=mnementh.archaic.org.uk)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1UPEMG-00049O-2b; Mon, 08 Apr 2013 11:51:48 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.72)
	(envelope-from <pm215@archaic.org.uk>)
	id 1UPEME-0005FT-7O; Mon, 08 Apr 2013 16:51:46 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon,  8 Apr 2013 16:51:46 +0100
Message-Id: <1365436306-20152-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-trivial@nongnu.org, Anthony Green <green@moxielogic.com>,
	patches@linaro.org
Subject: [Qemu-trivial] [PATCH] target-moxie: Fix VMState registration
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
X-List-Received-Date: Mon, 08 Apr 2013 15:52:03 -0000

Register the CPU VMState in the correct way, via cpu_class_set_vmsd(),
rather than doing it in two different wrong ways (once by providing
cpu_save and cpu_load functions, and once by setting the vmsd field in
DeviceClass).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Having just revamped the target-arm vmstate code I now have a
better grasp of how it should work, so I noticed we didn't quite
get moxie right. Not really very tested since I couldn't find a test
image to try, but should work better than the previous code...

 target-moxie/cpu.c     |    2 +-
 target-moxie/cpu.h     |    2 --
 target-moxie/machine.c |   12 +-----------
 3 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/target-moxie/cpu.c b/target-moxie/cpu.c
index c0855f0..f2b0791 100644
--- a/target-moxie/cpu.c
+++ b/target-moxie/cpu.c
@@ -97,7 +97,7 @@ static void moxie_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->class_by_name = moxie_cpu_class_by_name;
 
-    dc->vmsd = &vmstate_moxie_cpu;
+    cpu_class_set_vmsd(cc, &vmstate_moxie_cpu);
     cc->do_interrupt = moxie_cpu_do_interrupt;
 }
 
diff --git a/target-moxie/cpu.h b/target-moxie/cpu.h
index 988729a..a9d9ace 100644
--- a/target-moxie/cpu.h
+++ b/target-moxie/cpu.h
@@ -28,8 +28,6 @@
 
 #define TARGET_HAS_ICE 1
 
-#define CPU_SAVE_VERSION 1
-
 #define ELF_MACHINE     0xFEED /* EM_MOXIE */
 
 #define MOXIE_EX_DIV0        0
diff --git a/target-moxie/machine.c b/target-moxie/machine.c
index 5bfdb28..0f5992b 100644
--- a/target-moxie/machine.c
+++ b/target-moxie/machine.c
@@ -3,7 +3,7 @@
 
 const VMStateDescription vmstate_moxie_cpu = {
     .name = "cpu",
-    .version_id = CPU_SAVE_VERSION,
+    .version_id = 1,
     .minimum_version_id = 1,
     .minimum_version_id_old = 1,
     .fields      = (VMStateField[]) {
@@ -16,13 +16,3 @@ const VMStateDescription vmstate_moxie_cpu = {
         VMSTATE_END_OF_LIST()
     }
 };
-
-void cpu_save(QEMUFile *f, void *opaque)
-{
-    vmstate_save_state(f, &vmstate_moxie_cpu, opaque);
-}
-
-int cpu_load(QEMUFile *f, void *opaque, int version_id)
-{
-    return vmstate_load_state(f, &vmstate_moxie_cpu, opaque, version_id);
-}
-- 
1.7.9.5


