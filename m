Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aijvl-0003Qv-OG
	for mharc-qemu-trivial@gnu.org; Wed, 23 Mar 2016 10:38:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57870)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1aijvj-0003NK-7f
	for qemu-trivial@nongnu.org; Wed, 23 Mar 2016 10:38:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1aijvi-0004R6-AM
	for qemu-trivial@nongnu.org; Wed, 23 Mar 2016 10:38:39 -0400
Received: from qemu.weilnetz.de ([37.221.198.45]:40842)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1aijvc-0004PS-QE; Wed, 23 Mar 2016 10:38:32 -0400
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id 69A5B17F50C; Wed, 23 Mar 2016 15:38:29 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Date: Wed, 23 Mar 2016 15:38:20 +0100
Message-Id: <1458743900-14742-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 37.221.198.45
Cc: Stefan Weil <sw@weilnetz.de>, zhang.zhanghailiang@huawei.com,
	Luiz Capitulino <lcapitulino@redhat.com>
Subject: [Qemu-trivial] [PATCH] trace-events: Fix typos (found by codespell)
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
X-List-Received-Date: Wed, 23 Mar 2016 14:38:40 -0000

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 trace-events | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/trace-events b/trace-events
index d494de1..996a77f 100644
--- a/trace-events
+++ b/trace-events
@@ -144,8 +144,8 @@ cpu_out(unsigned int addr, char size, unsigned int val) "addr %#x(%c) value %u"
 # Since requests are raised via monitor, not many tracepoints are needed.
 balloon_event(void *opaque, unsigned long addr) "opaque %p addr %lu"
 virtio_balloon_handle_output(const char *name, uint64_t gpa) "section name: %s gpa: %"PRIx64
-virtio_balloon_get_config(uint32_t num_pages, uint32_t acutal) "num_pages: %d acutal: %d"
-virtio_balloon_set_config(uint32_t acutal, uint32_t oldacutal) "acutal: %d oldacutal: %d"
+virtio_balloon_get_config(uint32_t num_pages, uint32_t actual) "num_pages: %d actual: %d"
+virtio_balloon_set_config(uint32_t actual, uint32_t oldactual) "actual: %d oldactual: %d"
 virtio_balloon_to_target(uint64_t target, uint32_t num_pages) "balloon target: %"PRIx64" num_pages: %d"
 
 # hw/intc/apic_common.c
-- 
2.1.4


