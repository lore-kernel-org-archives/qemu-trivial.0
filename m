Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Si25F-0004TN-KD
	for mharc-qemu-trivial@gnu.org; Fri, 22 Jun 2012 07:31:25 -0400
Received: from eggs.gnu.org ([208.118.235.92]:60777)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1Si25B-0004Ge-Jt
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2012 07:31:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1Si259-0005QS-S9
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2012 07:31:21 -0400
Received: from mnementh.archaic.org.uk ([81.2.115.146]:53418)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1Si24z-0005L6-MO; Fri, 22 Jun 2012 07:31:09 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.72)
	(envelope-from <pm215@archaic.org.uk>)
	id 1Si24q-0005GJ-0k; Fri, 22 Jun 2012 12:31:00 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 22 Jun 2012 12:30:59 +0100
Message-Id: <1340364659-20200-3-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1340364659-20200-1-git-send-email-peter.maydell@linaro.org>
References: <1340364659-20200-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 81.2.115.146
Cc: qemu-trivial@nongnu.org, patches@linaro.org
Subject: [Qemu-trivial] [PATCH 2/2] cpu-common.h: Remove a pointless ifndef
	CONFIG_USER_ONLY
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
X-List-Received-Date: Fri, 22 Jun 2012 11:31:23 -0000

Remove an ifndef CONFIG_USER_ONLY guard that was pointless
because it is already inside an if !defined(CONFIG_USER_ONLY).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 cpu-common.h |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/cpu-common.h b/cpu-common.h
index 321037f..85548de 100644
--- a/cpu-common.h
+++ b/cpu-common.h
@@ -69,9 +69,7 @@ void cpu_physical_memory_unmap(void *buffer, target_phys_addr_t len,
 void *cpu_register_map_client(void *opaque, void (*callback)(void *opaque));
 void cpu_unregister_map_client(void *cookie);
 
-#ifndef CONFIG_USER_ONLY
 bool cpu_physical_memory_is_io(target_phys_addr_t phys_addr);
-#endif
 
 /* Coalesced MMIO regions are areas where write operations can be reordered.
  * This usually implies that write operations are side-effect free.  This allows
-- 
1.7.1


