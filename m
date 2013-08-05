Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V6PSZ-0001tI-3G
	for mharc-qemu-trivial@gnu.org; Mon, 05 Aug 2013 14:24:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44313)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1V6PSU-0001o1-4o
	for qemu-trivial@nongnu.org; Mon, 05 Aug 2013 14:24:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1V6PSQ-0007c2-Ty
	for qemu-trivial@nongnu.org; Mon, 05 Aug 2013 14:24:42 -0400
Received: from
	1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.d.1.0.0.b.8.0.1.0.0.2.ip6.arpa
	([2001:8b0:1d0::1]:59109 helo=mnementh.archaic.org.uk)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1V6PSJ-0007ZC-5Q; Mon, 05 Aug 2013 14:24:31 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1V6PSF-0005lL-6b; Mon, 05 Aug 2013 19:24:27 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon,  5 Aug 2013 19:24:27 +0100
Message-Id: <1375727067-22126-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-trivial@nongnu.org, Jia Liu <proljc@gmail.com>, patches@linaro.org
Subject: [Qemu-trivial] [PATCH] hw/openrisc/openrisc_sim: Avoid using
	uninitialised variable 'entry'
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
X-List-Received-Date: Mon, 05 Aug 2013 18:24:45 -0000

clang warns that cpu_openrisc_load_kernel() can use 'entry' uninitialized:

hw/openrisc/openrisc_sim.c:69:9: error: variable 'entry' is used
      uninitialized whenever '&&' condition is false [-Werror,-Wsometimes-uninitialized]
    if (kernel_filename && !qtest_enabled()) {
        ^~~~~~~~~~~~~~~
hw/openrisc/openrisc_sim.c:91:19: note: uninitialized use occurs here
    cpu->env.pc = entry;
                  ^~~~~

Fix this by not attempting to change the CPU's starting PC unless
we actually loaded a kernel.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/openrisc/openrisc_sim.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/openrisc/openrisc_sim.c b/hw/openrisc/openrisc_sim.c
index a08f27c..4595fa9 100644
--- a/hw/openrisc/openrisc_sim.c
+++ b/hw/openrisc/openrisc_sim.c
@@ -86,9 +86,9 @@ static void cpu_openrisc_load_kernel(ram_addr_t ram_size,
                     kernel_filename);
             exit(1);
         }
-    }
 
-    cpu->env.pc = entry;
+        cpu->env.pc = entry;
+    }
 }
 
 static void openrisc_sim_init(QEMUMachineInitArgs *args)
-- 
1.7.9.5


