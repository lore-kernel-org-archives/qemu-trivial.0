Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XFqwn-0005DK-SK
	for mharc-qemu-trivial@gnu.org; Fri, 08 Aug 2014 16:39:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39398)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XFqwh-00051I-Mx
	for qemu-trivial@nongnu.org; Fri, 08 Aug 2014 16:39:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XFqwd-0000yA-4T
	for qemu-trivial@nongnu.org; Fri, 08 Aug 2014 16:39:27 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:49615)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XFqwP-0000qg-Fb; Fri, 08 Aug 2014 16:39:09 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 964DD41A1B;
	Sat,  9 Aug 2014 00:39:06 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 833026D3;
	Sat,  9 Aug 2014 00:39:06 +0400 (MSK)
Received: (nullmailer pid 10316 invoked by uid 1000);
	Fri, 08 Aug 2014 20:39:05 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sat,  9 Aug 2014 00:38:57 +0400
Message-Id: <1407530342-10259-5-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1407530342-10259-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1407530342-10259-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Alex Bligh <alex@alex.org.uk>
Subject: [Qemu-trivial] [PULL 4/9] Show length mismatch error is hex
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
X-List-Received-Date: Fri, 08 Aug 2014 20:39:32 -0000

From: Alex Bligh <alex@alex.org.uk>

When live migrate fails due to a section length mismatch we currently
see an error message like:

Length mismatch: 0000:00:03.0/virtio-net-pci.rom: 10000 in != 20000

The section lengths are in fact in hex, so this should read

Length mismatch: 0000:00:03.0/virtio-net-pci.rom: 0x10000 in != 0x20000

Correct the error string to reflect this.

Signed-off-by: Alex Bligh <alex@alex.org.uk>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
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
1.7.10.4


