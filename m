Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XktoR-00065M-A8
	for mharc-qemu-trivial@gnu.org; Sun, 02 Nov 2014 06:59:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51489)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XktoK-0005sR-8B
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 06:59:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XktoF-0002UA-B3
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 06:59:08 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:43979)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Xkto0-0002RE-Nh; Sun, 02 Nov 2014 06:58:48 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id D99C4402BA;
	Sun,  2 Nov 2014 14:58:47 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 9EF0C705;
	Sun,  2 Nov 2014 14:58:47 +0300 (MSK)
Received: (nullmailer pid 14964 invoked by uid 1000);
	Sun, 02 Nov 2014 11:58:47 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sun,  2 Nov 2014 14:57:19 +0300
Message-Id: <404ac83efd5761c6b590fd9f00fbbe8ee2281aa6.1414929285.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
References: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
References: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michal Privoznik <mprivozn@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 07/23] util: Improve os_mem_prealloc error
	message
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
X-List-Received-Date: Sun, 02 Nov 2014 11:59:13 -0000

From: Michal Privoznik <mprivozn@redhat.com>

Currently, when the preallocating guest memory process fails, a not
so helpful error message is printed out:

    # virsh start migt10
    error: Failed to start domain migt10
    error: internal error: process exited while connecting to monitor:
    os_mem_prealloc: failed to preallocate pages

From the error message it's not clear at the first glance where the
problem lies. However, changing the error message might give users a
clue.

Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 util/oslib-posix.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index 016a047..8c9d80e 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -390,7 +390,8 @@ void os_mem_prealloc(int fd, char *area, size_t memory)
     pthread_sigmask(SIG_UNBLOCK, &set, &oldset);
 
     if (sigsetjmp(sigjump, 1)) {
-        fprintf(stderr, "os_mem_prealloc: failed to preallocate pages\n");
+        fprintf(stderr, "os_mem_prealloc: Insufficient free host memory "
+                        "pages available to allocate guest RAM\n");
         exit(1);
     } else {
         int i;
-- 
1.7.10.4


