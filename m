Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XXZZX-0004Zd-Ec
	for mharc-qemu-trivial@gnu.org; Fri, 26 Sep 2014 13:44:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36748)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XXZZQ-0004OE-Uy
	for qemu-trivial@nongnu.org; Fri, 26 Sep 2014 13:44:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XXZZM-00060D-KX
	for qemu-trivial@nongnu.org; Fri, 26 Sep 2014 13:44:40 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:37945)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XXZZC-0005vg-5V; Fri, 26 Sep 2014 13:44:26 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 0BEA646F6B;
	Fri, 26 Sep 2014 21:44:20 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 7B15F711;
	Fri, 26 Sep 2014 21:36:19 +0400 (MSK)
Received: (nullmailer pid 29129 invoked by uid 1000);
	Fri, 26 Sep 2014 17:36:18 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri, 26 Sep 2014 21:36:16 +0400
Message-Id: <1411752976-29051-13-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1411752976-29051-1-git-send-email-mjt@tls.msk.ru>
References: <1411752976-29051-1-git-send-email-mjt@tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Gonglei <arei.gonglei@huawei.com>, Huangweidong <weidong.huang@huawei.com>
Subject: [Qemu-trivial] [PULL 12/12] os-posix: report error message when
	lock file failed
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
X-List-Received-Date: Fri, 26 Sep 2014 17:44:45 -0000

From: Gonglei <arei.gonglei@huawei.com>

It will cause that create vm failed When manager
tool is killed forcibly (kill -9 libvirtd_pid),
the file not was unlink, and unlock. It's better
that report the error message for users.

Signed-off-by: Huangweidong <weidong.huang@huawei.com>
Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 os-posix.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/os-posix.c b/os-posix.c
index e31a099..4898ebf 100644
--- a/os-posix.c
+++ b/os-posix.c
@@ -319,6 +319,8 @@ int qemu_create_pidfile(const char *filename)
         return -1;
     }
     if (lockf(fd, F_TLOCK, 0) == -1) {
+        fprintf(stderr, "lock file '%s' failed: %s\n",
+                filename, strerror(errno));
         close(fd);
         return -1;
     }
-- 
1.7.10.4


