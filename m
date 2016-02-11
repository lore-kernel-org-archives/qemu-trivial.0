Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aTqKk-00054y-6N
	for mharc-qemu-trivial@gnu.org; Thu, 11 Feb 2016 07:26:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60171)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aTqKh-00050B-Qf
	for qemu-trivial@nongnu.org; Thu, 11 Feb 2016 07:26:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aTqKg-0008Qm-Vr
	for qemu-trivial@nongnu.org; Thu, 11 Feb 2016 07:26:51 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:60590)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1aTqKd-0008LV-6D; Thu, 11 Feb 2016 07:26:47 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id A927E41464;
	Thu, 11 Feb 2016 15:26:45 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id DFF7BA98;
	Thu, 11 Feb 2016 15:19:05 +0300 (MSK)
Received: (nullmailer pid 11187 invoked by uid 1000);
	Thu, 11 Feb 2016 12:19:04 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 11 Feb 2016 15:18:57 +0300
Message-Id: <0850d49cb6b808a334528ea9a239f8bdb0d5efca.1455192968.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1455192968.git.mjt@msgid.tls.msk.ru>
References: <cover.1455192968.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	"Daniel P. Berrange" <berrange@redhat.com>
Subject: [Qemu-trivial] [PULL 08/14] char: fix parameter name / type in BSD
	codepath
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
X-List-Received-Date: Thu, 11 Feb 2016 12:26:52 -0000

From: "Daniel P. Berrange" <berrange@redhat.com>

The BSD impl of qemu_chr_open_pp_fd had mis-declared
its parameter type as ChardevBackend instead of
ChardevCommon. It had also mistakenly used the variable
name 'common' instead of 'backend'.

Tested-by: Sean Bruno <sbruno@freebsd.org>
Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qemu-char.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qemu-char.c b/qemu-char.c
index 2b2c56b..1b7d5da 100644
--- a/qemu-char.c
+++ b/qemu-char.c
@@ -1796,12 +1796,12 @@ static int pp_ioctl(CharDriverState *chr, int cmd, void *arg)
 }
 
 static CharDriverState *qemu_chr_open_pp_fd(int fd,
-                                            ChardevBackend *backend,
+                                            ChardevCommon *backend,
                                             Error **errp)
 {
     CharDriverState *chr;
 
-    chr = qemu_chr_alloc(common, errp);
+    chr = qemu_chr_alloc(backend, errp);
     if (!chr) {
         return NULL;
     }
-- 
2.1.4


