Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UkDxw-0006WB-No
	for mharc-qemu-trivial@gnu.org; Wed, 05 Jun 2013 09:41:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55523)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>) id 1UkDxq-0006O9-Fw
	for qemu-trivial@nongnu.org; Wed, 05 Jun 2013 09:41:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>) id 1UkDxl-0000e9-R3
	for qemu-trivial@nongnu.org; Wed, 05 Jun 2013 09:41:22 -0400
Received: from [101.78.175.194] (port=39976 helo=ibis.ibis)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>)
	id 1UkDxb-0000c9-PE; Wed, 05 Jun 2013 09:41:08 -0400
Received: from [172.19.126.47] (helo=localhost.localdomain)
	by ibis.ibis with esmtp (Exim 4.70)
	(envelope-from <hpoussin@reactos.org>)
	id 1UkDxZ-00028a-0H; Wed, 05 Jun 2013 21:41:05 +0800
From: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
To: qemu-devel@nongnu.org
Date: Wed,  5 Jun 2013 21:42:28 +0800
Message-Id: <1370439748-18092-1-git-send-email-hpoussin@reactos.org>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
	[fuzzy]
X-Received-From: 101.78.175.194
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
Subject: [Qemu-trivial] [PATCH] ioport/memory: check that both .read and
	.write callbacks are defined
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
X-List-Received-Date: Wed, 05 Jun 2013 13:41:27 -0000

If that's not the case, QEMU will may during execution.
This has recently been fixed for:
- acpi (2d3b989529727ccace243b953a181fbae04a30d1)
- kvmapic (0c1cd0ae2a4faabeb948b9a07ea1696e853de174)
- xhci (6d3bc22e31bcee74dc1e05a5370cabb33b7c3fda)

Signed-off-by: Hervé Poussineau <hpoussin@reactos.org>
---
I started all current QEMU system emulations with
qemu-system-{arch} -M {machine} , and none broke on these
additionnal asserts.
However, lots of them exited for other reasons, like not having the
right number of CPUs, no -kernel argument, or fetching invalid
instructions from RAM.

 ioport.c |    1 +
 memory.c |    2 ++
 2 files changed, 3 insertions(+)

diff --git a/ioport.c b/ioport.c
index a0ac2a0..8dd9d50 100644
--- a/ioport.c
+++ b/ioport.c
@@ -337,6 +337,7 @@ void portio_list_init(PortioList *piolist,
     unsigned n = 0;
 
     while (callbacks[n].size) {
+        assert(callbacks[n].read && callbacks[n].write);
         ++n;
     }
 
diff --git a/memory.c b/memory.c
index 5cb8f4a..654d1ce 100644
--- a/memory.c
+++ b/memory.c
@@ -1008,6 +1008,8 @@ void memory_region_init_io(MemoryRegion *mr,
                            uint64_t size)
 {
     memory_region_init(mr, name, size);
+    assert(ops->read || ops->old_mmio.read);
+    assert(ops->write || ops->old_mmio.write);
     mr->ops = ops;
     mr->opaque = opaque;
     mr->terminates = true;
-- 
1.7.10.4


