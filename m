Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1X8Qf3-0000lT-V5
	for mharc-qemu-trivial@gnu.org; Sat, 19 Jul 2014 05:10:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39615)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex@alex.org.uk>) id 1X8Qew-0000eX-Lx
	for qemu-trivial@nongnu.org; Sat, 19 Jul 2014 05:10:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex@alex.org.uk>) id 1X8Qer-0005ta-DE
	for qemu-trivial@nongnu.org; Sat, 19 Jul 2014 05:10:26 -0400
Received: from mail.avalus.com ([89.16.176.221]:56461)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex@alex.org.uk>) id 1X8Qer-0005so-74
	for qemu-trivial@nongnu.org; Sat, 19 Jul 2014 05:10:21 -0400
Received: by mail.avalus.com (Postfix) with ESMTPSA id 6BFACC561AB;
	Sat, 19 Jul 2014 10:10:09 +0100 (BST)
From: Alex Bligh <alex@alex.org.uk>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Date: Sat, 19 Jul 2014 10:09:51 +0100
Message-Id: <1405760991-2837-1-git-send-email-alex@alex.org.uk>
X-Mailer: git-send-email 1.7.9.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 89.16.176.221
Cc: peter.maydell@linaro.org, Alex Bligh <alex@alex.org.uk>,
	pbonzini@redhat.com
Subject: [Qemu-trivial] [PATCH] Show length mismatch error is hex
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
X-List-Received-Date: Sat, 19 Jul 2014 09:10:32 -0000

When live migrate fails due to a section length mismatch we currently
see an error message like:

Length mismatch: 0000:00:03.0/virtio-net-pci.rom: 10000 in != 20000

The section lengths are in fact in hex, so this should read

Length mismatch: 0000:00:03.0/virtio-net-pci.rom: 0x10000 in != 0x20000

Correct the error string to reflect this.

Signed-off-by: Alex Bligh <alex@alex.org.uk>
---
 arch_init.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch_init.c b/arch_init.c
index 8ddaf35..28ece76 100644
--- a/arch_init.c
+++ b/arch_init.c
@@ -1072,8 +1072,8 @@ static int ram_load(QEMUFile *f, void *opaque, int version_id)
                 QTAILQ_FOREACH(block, &ram_list.blocks, next) {
                     if (!strncmp(id, block->idstr, sizeof(id))) {
                         if (block->length != length) {
-                            error_report("Length mismatch: %s: " RAM_ADDR_FMT
-                                         " in != " RAM_ADDR_FMT, id, length,
+                            error_report("Length mismatch: %s: 0x" RAM_ADDR_FMT
+                                         " in != 0x" RAM_ADDR_FMT, id, length,
                                          block->length);
                             ret =  -EINVAL;
                         }
-- 
1.7.9.5


