Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WejCF-0003Gx-1E
	for mharc-qemu-trivial@gnu.org; Mon, 28 Apr 2014 06:54:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56072)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WejCC-0003D3-R5
	for qemu-trivial@nongnu.org; Mon, 28 Apr 2014 06:54:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WejCB-00080u-Sh
	for qemu-trivial@nongnu.org; Mon, 28 Apr 2014 06:54:00 -0400
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:47921)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WejC9-0007zn-Um; Mon, 28 Apr 2014 06:53:58 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WejC2-0006A4-HM; Mon, 28 Apr 2014 11:53:50 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 28 Apr 2014 11:53:50 +0100
Message-Id: <1398682430-23659-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-trivial@nongnu.org, patches@linaro.org
Subject: [Qemu-trivial] [PATCH] docs/memory.txt: old_portio has gone,
	so don't mention it
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
X-List-Received-Date: Mon, 28 Apr 2014 10:54:01 -0000

The old_portio mechanism in the memory API has been removed, but
we forgot to update the documentation to match. Remove the stray
reference to this now-vanished bit of back-compatibility API.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/memory.txt | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/docs/memory.txt b/docs/memory.txt
index 22eaec7..d344879 100644
--- a/docs/memory.txt
+++ b/docs/memory.txt
@@ -234,6 +234,5 @@ various constraints can be supplied to control how these callbacks are called:
    emulated using four 1-byte writes, if .impl.max_access_size = 1.
  - .impl.valid specifies that the *implementation* only supports unaligned
    accesses; unaligned accesses will be emulated by two aligned accesses.
- - .old_portio and .old_mmio can be used to ease porting from code using
-   cpu_register_io_memory() and register_ioport().  They should not be used
-   in new code.
+ - .old_mmio can be used to ease porting from code using
+   cpu_register_io_memory().  It should not be used in new code.
-- 
1.9.2


