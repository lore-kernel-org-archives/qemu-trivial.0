Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WeeNM-0005mC-NK
	for mharc-qemu-trivial@gnu.org; Mon, 28 Apr 2014 01:45:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52950)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WeeNG-0005W3-1m
	for qemu-trivial@nongnu.org; Mon, 28 Apr 2014 01:45:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WeeNB-0002UI-2F
	for qemu-trivial@nongnu.org; Mon, 28 Apr 2014 01:45:05 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:41200)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WeeMt-0002Qn-RV; Mon, 28 Apr 2014 01:44:49 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id C6EAB4303B;
	Mon, 28 Apr 2014 09:44:40 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 2E7AA674;
	Mon, 28 Apr 2014 09:08:28 +0400 (MSK)
Received: (nullmailer pid 19159 invoked by uid 1000);
	Mon, 28 Apr 2014 05:08:26 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 28 Apr 2014 09:08:00 +0400
Message-Id: <1398661684-19059-15-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1398661684-19059-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1398661684-19059-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Mike Frysinger <vapier@gentoo.org>, Tim Comer <comer0@gmail.com>
Subject: [Qemu-trivial] [PULL 14/18] virtfs-proxy-helper: fix call to accept
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
X-List-Received-Date: Mon, 28 Apr 2014 05:45:11 -0000

From: Tim Comer <comer0@gmail.com>

The current code calls accept() without initializing the size parameter
which means the accept call might write too much to the stack.

URL: https://bugs.gentoo.org/486714
Signed-off-by: Tim Comer <comer0@gmail.com>
Signed-off-by: Mike Frysinger <vapier@gentoo.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 fsdev/virtfs-proxy-helper.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/fsdev/virtfs-proxy-helper.c b/fsdev/virtfs-proxy-helper.c
index bfecb87..cd291d3 100644
--- a/fsdev/virtfs-proxy-helper.c
+++ b/fsdev/virtfs-proxy-helper.c
@@ -760,6 +760,7 @@ static int proxy_socket(const char *path, uid_t uid, gid_t gid)
         return -1;
     }
 
+    size = sizeof(qemu);
     client = accept(sock, (struct sockaddr *)&qemu, &size);
     if (client < 0) {
         do_perror("accept");
-- 
1.7.10.4


