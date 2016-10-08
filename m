Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bsogg-0003b9-Pp
	for mharc-qemu-trivial@gnu.org; Sat, 08 Oct 2016 06:17:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57030)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bsogd-0003Yq-Uh
	for qemu-trivial@nongnu.org; Sat, 08 Oct 2016 06:17:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bsogd-0000Eu-3T
	for qemu-trivial@nongnu.org; Sat, 08 Oct 2016 06:16:59 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:58783)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bsogY-00008v-Jt; Sat, 08 Oct 2016 06:16:54 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 2392940EB7;
	Sat,  8 Oct 2016 13:16:50 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 113B4B42;
	Sat,  8 Oct 2016 11:58:17 +0300 (MSK)
Received: (nullmailer pid 19270 invoked by uid 1000);
	Sat, 08 Oct 2016 08:58:14 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Felix Janda <felix.janda@posteo.de>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sat,  8 Oct 2016 11:58:10 +0300
Message-Id: <0839f11cda08039d15b3e7621390de3e512b24e7.1475917008.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
References: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
References: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 24/26] linux-user: include <poll.h> instead of
 <sys/poll.h>
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
X-List-Received-Date: Sat, 08 Oct 2016 10:17:01 -0000

From: Felix Janda <felix.janda@posteo.de>

This removes the last usage of <sys/poll.h> in the code base.

Signed-off-by: Felix Janda <felix.janda@posteo.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 linux-user/syscall.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 0815f30..52012d4 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -42,7 +42,7 @@ int __clone2(int (*fn)(void *), void *child_stack_base,
 #include <sys/socket.h>
 #include <sys/un.h>
 #include <sys/uio.h>
-#include <sys/poll.h>
+#include <poll.h>
 #include <sys/times.h>
 #include <sys/shm.h>
 #include <sys/sem.h>
-- 
2.1.4


