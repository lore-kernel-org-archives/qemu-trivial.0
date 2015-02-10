Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YL4PZ-0001Nz-Ha
	for mharc-qemu-trivial@gnu.org; Tue, 10 Feb 2015 01:35:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49070)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL4PX-0001Jz-2b
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 01:35:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL4PW-0001TJ-99
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 01:35:03 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:56228)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YL4PR-0001Id-TE; Tue, 10 Feb 2015 01:34:58 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id B8CCD4181E;
	Tue, 10 Feb 2015 09:34:43 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 9B71E8C9;
	Tue, 10 Feb 2015 09:34:43 +0300 (MSK)
Received: (nullmailer pid 9348 invoked by uid 1000);
	Tue, 10 Feb 2015 06:34:43 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 10 Feb 2015 09:33:57 +0300
Message-Id: <88ea8ed74cb6956f43199a098ca4963ae73bba57.1423549659.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
References: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 08/46] virtfs-proxy-helper: Fix possible
	socket leak.
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
X-List-Received-Date: Tue, 10 Feb 2015 06:35:04 -0000

From: Gonglei <arei.gonglei@huawei.com>

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 fsdev/virtfs-proxy-helper.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/fsdev/virtfs-proxy-helper.c b/fsdev/virtfs-proxy-helper.c
index cd291d3..c1da2d7 100644
--- a/fsdev/virtfs-proxy-helper.c
+++ b/fsdev/virtfs-proxy-helper.c
@@ -749,24 +749,29 @@ static int proxy_socket(const char *path, uid_t uid, gid_t gid)
     if (bind(sock, (struct sockaddr *)&proxy,
             sizeof(struct sockaddr_un)) < 0) {
         do_perror("bind");
-        return -1;
+        goto error;
     }
     if (chown(proxy.sun_path, uid, gid) < 0) {
         do_perror("chown");
-        return -1;
+        goto error;
     }
     if (listen(sock, 1) < 0) {
         do_perror("listen");
-        return -1;
+        goto error;
     }
 
     size = sizeof(qemu);
     client = accept(sock, (struct sockaddr *)&qemu, &size);
     if (client < 0) {
         do_perror("accept");
-        return -1;
+        goto error;
     }
+    close(sock);
     return client;
+
+error:
+    close(sock);
+    return -1;
 }
 
 static void usage(char *prog)
-- 
2.1.4


