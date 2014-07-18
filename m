Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1X88vs-0001VG-Gn
	for mharc-qemu-trivial@gnu.org; Fri, 18 Jul 2014 10:14:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38398)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1X88vl-0001NL-Ng
	for qemu-trivial@nongnu.org; Fri, 18 Jul 2014 10:14:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1X88vf-0004jk-Ui
	for qemu-trivial@nongnu.org; Fri, 18 Jul 2014 10:14:37 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:33928)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1X88vS-0004dL-NI; Fri, 18 Jul 2014 10:14:18 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 931604386C;
	Fri, 18 Jul 2014 18:14:17 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 4347A6BC;
	Fri, 18 Jul 2014 18:09:15 +0400 (MSK)
Received: (nullmailer pid 625 invoked by uid 1000);
	Fri, 18 Jul 2014 14:09:14 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri, 18 Jul 2014 18:09:08 +0400
Message-Id: <1405692553-564-4-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1405692553-564-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1405692553-564-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Chen Gang <gang.chen.5i5j@gmail.com>
Subject: [Qemu-trivial] [PULL 3/8] qemu-img: Remove redundancy "ret = -1"
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
X-List-Received-Date: Fri, 18 Jul 2014 14:14:43 -0000

From: Chen Gang <gang.chen.5i5j@gmail.com>

In this case, 'ret' is already '-1', so need not do it again.

Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qemu-img.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/qemu-img.c b/qemu-img.c
index c98896b..d4518e7 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -246,7 +246,6 @@ static int read_password(char *buf, int buf_size)
             if (errno == EAGAIN || errno == EINTR) {
                 continue;
             } else {
-                ret = -1;
                 break;
             }
         } else if (ret == 0) {
-- 
1.7.10.4


