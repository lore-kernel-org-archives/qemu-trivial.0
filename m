Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UsdHb-000585-AT
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jun 2013 14:20:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58434)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UsdHU-0004tD-G8
	for qemu-trivial@nongnu.org; Fri, 28 Jun 2013 14:20:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UsdHS-0006Ik-I6
	for qemu-trivial@nongnu.org; Fri, 28 Jun 2013 14:20:24 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:41151)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UsdHO-0006GY-3z; Fri, 28 Jun 2013 14:20:18 -0400
Received: from gandalf.tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 8E93E42BD1;
	Fri, 28 Jun 2013 22:20:17 +0400 (MSK)
Received: by gandalf.tls.msk.ru (Postfix, from userid 1000)
	id 82D5A572; Fri, 28 Jun 2013 22:17:48 +0400 (MSK)
From: Michael Tokarev <mjt@tls.msk.ru>
To: Anthony Liguori <aliguori@us.ibm.com>
Date: Fri, 28 Jun 2013 22:17:43 +0400
Message-Id: <1372443465-22384-13-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1372443465-22384-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1372443465-22384-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 12/14] qemu-char: report udp backend errors
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
X-List-Received-Date: Fri, 28 Jun 2013 18:20:26 -0000

From: Gerd Hoffmann <kraxel@redhat.com>

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Laszlo Ersek <lersek@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qemu-char.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/qemu-char.c b/qemu-char.c
index c097ca1..5a8f9c0 100644
--- a/qemu-char.c
+++ b/qemu-char.c
@@ -2255,6 +2255,8 @@ static CharDriverState *qemu_chr_open_udp(QemuOpts *opts)
 
     fd = inet_dgram_opts(opts, &local_err);
     if (fd < 0) {
+        qerror_report_err(local_err);
+        error_free(local_err);
         return NULL;
     }
     return qemu_chr_open_udp_fd(fd);
-- 
1.7.10.4


