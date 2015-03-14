Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YWhZQ-0003FD-G2
	for mharc-qemu-trivial@gnu.org; Sat, 14 Mar 2015 04:37:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54529)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1YWhZO-0003Cs-GX
	for qemu-trivial@nongnu.org; Sat, 14 Mar 2015 04:37:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1YWhZN-00048h-Fh
	for qemu-trivial@nongnu.org; Sat, 14 Mar 2015 04:37:18 -0400
Received: from qemu.weilnetz.de ([37.221.198.45]:59130)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1YWhZI-00046z-W0; Sat, 14 Mar 2015 04:37:13 -0400
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id 7288B17F713; Sat, 14 Mar 2015 09:37:09 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: QEMU Trivial <qemu-trivial@nongnu.org>
Date: Sat, 14 Mar 2015 09:37:08 +0100
Message-Id: <1426322228-465-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: Stefan Weil <sw@weilnetz.de>, QEMU Developer <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH] elf-loader: Fix truncation warning from
	coverity
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
X-List-Received-Date: Sat, 14 Mar 2015 08:37:19 -0000

Coverity reports a truncation due to cast operation on operand
reltab->sh_size from 64 bits to 32 bits for calls of load_at.

Fix the types of the function arguments to match their use in
function load_at: the offset is used for lseek which takes an
off_t parameter, the size is used for g_malloc and read.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 hw/core/loader.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/core/loader.c b/hw/core/loader.c
index 76d8aca..d4c441f 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -267,7 +267,7 @@ int load_aout(const char *filename, hwaddr addr, int max_sz,
 
 /* ELF loader */
 
-static void *load_at(int fd, int offset, int size)
+static void *load_at(int fd, off_t offset, size_t size)
 {
     void *ptr;
     if (lseek(fd, offset, SEEK_SET) < 0)
-- 
1.7.10.4


