Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dX91t-0000SN-MM
	for mharc-qemu-trivial@gnu.org; Mon, 17 Jul 2017 12:37:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48572)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dX91r-0000Po-FI
	for qemu-trivial@nongnu.org; Mon, 17 Jul 2017 12:37:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dX91o-0005QC-76
	for qemu-trivial@nongnu.org; Mon, 17 Jul 2017 12:37:51 -0400
Received: from orth.archaic.org.uk ([81.2.115.148]:48550)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dX91o-0005Pg-0j
	for qemu-trivial@nongnu.org; Mon, 17 Jul 2017 12:37:48 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dX91j-0003lf-S4; Mon, 17 Jul 2017 17:37:43 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: patches@linaro.org,
	qemu-trivial@nongnu.org
Date: Mon, 17 Jul 2017 17:37:42 +0100
Message-Id: <1500309462-12792-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 81.2.115.148
Subject: [Qemu-trivial] [PATCH for-2.10] hw/display/sm501: Don't use
 vmstate_register_ram_global()
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Jul 2017 16:37:52 -0000

The sm501 device uses vmstate_register_ram_global() to register its
memory region for migration.  This means it gets a name that is
assumed to be global to the whole system, which in turn means that if
you create two of the device we assert because of the duplication:

qemu-system-ppc -device sm501 -device sm501
RAMBlock "sm501.local" already registered, abort!
Aborted (core dumped)

Changing this to just use memory_region_init_ram()'s automatic
registration of the memory region with a device-local name fixes
this.  The downside is that it breaks migration compatibility, but
luckily we only added migration support to this device in the 2.10
release cycle so we haven't released a QEMU version with the broken
implementation.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Recent refactoring that renamed the old "memory_region_init_ram"
to memory_region_init_ram_nomigrate" made this bug a bit easier
to find via grep...

 hw/display/sm501.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index af792c5..9aa515b 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -1578,9 +1578,8 @@ static void sm501_init(SM501State *s, DeviceState *dev,
                   s->local_mem_size_index);
 
     /* local memory */
-    memory_region_init_ram_nomigrate(&s->local_mem_region, OBJECT(dev), "sm501.local",
+    memory_region_init_ram(&s->local_mem_region, OBJECT(dev), "sm501.local",
                            get_local_mem_size(s), &error_fatal);
-    vmstate_register_ram_global(&s->local_mem_region);
     memory_region_set_log(&s->local_mem_region, true, DIRTY_MEMORY_VGA);
     s->local_mem = memory_region_get_ram_ptr(&s->local_mem_region);
 
-- 
2.7.4


