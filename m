Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YYWyc-0003Fs-Vp
	for mharc-qemu-trivial@gnu.org; Thu, 19 Mar 2015 05:42:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41917)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YYWyV-0002zE-NF
	for qemu-trivial@nongnu.org; Thu, 19 Mar 2015 05:42:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YYWyU-0001pS-RJ
	for qemu-trivial@nongnu.org; Thu, 19 Mar 2015 05:42:47 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:50197)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YYWyM-0001lY-KH; Thu, 19 Mar 2015 05:42:38 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id B150B41E51;
	Thu, 19 Mar 2015 12:42:36 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 2A13A943;
	Thu, 19 Mar 2015 12:05:48 +0300 (MSK)
Received: (nullmailer pid 369 invoked by uid 1000);
	Thu, 19 Mar 2015 09:05:44 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 19 Mar 2015 12:05:40 +0300
Message-Id: <6cbfb86f4c0ea7cbe852c7bc62a4ef523887c143.1426755483.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1426755483.git.mjt@msgid.tls.msk.ru>
References: <cover.1426755483.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 22/24] elf-loader: Fix truncation warning from
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
X-List-Received-Date: Thu, 19 Mar 2015 09:42:53 -0000

From: Stefan Weil <sw@weilnetz.de>

Coverity reports a truncation due to cast operation on operand
reltab->sh_size from 64 bits to 32 bits for calls of load_at.

Fix the types of the function arguments to match their use in
function load_at: the offset is used for lseek which takes an
off_t parameter, the size is used for g_malloc and read.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Thomas Huth <thuth@linux.vnet.ibm.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/core/loader.c | 2 +-
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
2.1.4


