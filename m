Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bqH2v-0003RU-AG
	for mharc-qemu-trivial@gnu.org; Sat, 01 Oct 2016 05:57:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53181)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <felix.janda@posteo.de>) id 1bq7Rd-0006kS-5A
	for qemu-trivial@nongnu.org; Fri, 30 Sep 2016 19:42:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <felix.janda@posteo.de>) id 1bq7RY-00019U-EG
	for qemu-trivial@nongnu.org; Fri, 30 Sep 2016 19:42:20 -0400
Received: from mout02.posteo.de ([185.67.36.66]:57842)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <felix.janda@posteo.de>) id 1bq7RY-00017i-89
	for qemu-trivial@nongnu.org; Fri, 30 Sep 2016 19:42:16 -0400
Received: from submission (posteo.de [89.146.220.130]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 867F620A0B
	for <qemu-trivial@nongnu.org>; Sat,  1 Oct 2016 01:42:14 +0200 (CEST)
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 3sm7Jj5K0KzyZZ;
	Sat,  1 Oct 2016 01:42:13 +0200 (CEST)
Date: Fri, 30 Sep 2016 19:40:21 -0400
From: Felix Janda <felix.janda@posteo.de>
To: qemu-devel@nongnu.org
Cc: Riku Voipio <riku.voipio@iki.fi>, qemu-trivial@nongnu.org
Message-ID: <20160930234021.GC5887@nyan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.6.1 (2016-04-27)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 185.67.36.66
X-Mailman-Approved-At: Sat, 01 Oct 2016 05:57:27 -0400
Subject: [Qemu-trivial] [PATCH] linux-user: include <poll.h> instead of
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
X-List-Received-Date: Fri, 30 Sep 2016 23:42:22 -0000

This removes the last usage of <sys/poll.h> in the code base.

Signed-off-by: Felix Janda <felix.janda@posteo.de>
---
 linux-user/syscall.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 3d1f694..4bfb671 100644
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
2.7.3


