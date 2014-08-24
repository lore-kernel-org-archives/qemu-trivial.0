Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XLXtF-000482-Ks
	for mharc-qemu-trivial@gnu.org; Sun, 24 Aug 2014 09:31:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45164)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XLXt9-0003w2-HB
	for qemu-trivial@nongnu.org; Sun, 24 Aug 2014 09:31:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XLXt5-0004Gd-5o
	for qemu-trivial@nongnu.org; Sun, 24 Aug 2014 09:31:19 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:41258)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XLXsw-0004FF-4j; Sun, 24 Aug 2014 09:31:06 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 151A044A01;
	Sun, 24 Aug 2014 17:31:04 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id CB3606D3;
	Sun, 24 Aug 2014 17:31:03 +0400 (MSK)
Received: (nullmailer pid 30089 invoked by uid 1000);
	Sun, 24 Aug 2014 13:31:03 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sun, 24 Aug 2014 17:31:00 +0400
Message-Id: <1408887062-30022-10-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1408887062-30022-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1408887062-30022-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	zhanghailiang <zhang.zhanghailiang@huawei.com>
Subject: [Qemu-trivial] [PULL 09/11] linux-user: fix file descriptor leaks
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
X-List-Received-Date: Sun, 24 Aug 2014 13:31:24 -0000

From: zhanghailiang <zhang.zhanghailiang@huawei.com>

Handle variable "fd_orig" going out of scope leaks the handle.

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
Reviewed-by: Gonglei <arei.gonglei@huawei.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 linux-user/syscall.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 7ff7c21..8fe9df7 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -5167,6 +5167,7 @@ static int open_self_cmdline(void *cpu_env, int fd)
 
         if (word_skipped) {
             if (write(fd, cp_buf, nb_read) != nb_read) {
+                close(fd_orig);
                 return -1;
             }
         }
-- 
1.7.10.4


