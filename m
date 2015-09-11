Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZaM7m-0004uR-Fs
	for mharc-qemu-trivial@gnu.org; Fri, 11 Sep 2015 07:04:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57783)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZaM7f-0004gx-De
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 07:04:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZaM7e-0006tq-Ch
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 07:04:03 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:43172)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZaM7W-0006os-2B; Fri, 11 Sep 2015 07:03:54 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 29B3441439;
	Fri, 11 Sep 2015 14:03:52 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id EFCA6A59;
	Fri, 11 Sep 2015 14:03:51 +0300 (MSK)
Received: (nullmailer pid 22782 invoked by uid 1000);
	Fri, 11 Sep 2015 11:03:51 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri, 11 Sep 2015 14:03:39 +0300
Message-Id: <8cb76755615326dd824ee3c7f3588afcd17acb28.1441969369.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1441969369.git.mjt@msgid.tls.msk.ru>
References: <cover.1441969369.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 15/26] linux-user: Fix warnings caused by
	missing 'static' attribute
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
X-List-Received-Date: Fri, 11 Sep 2015 11:04:04 -0000

From: Stefan Weil <sw@weilnetz.de>

Warnings from the Sparse static analysis tool:

linux-user/main.c:40:12: warning:
 symbol 'filename' was not declared. Should it be static?
linux-user/main.c:41:12: warning:
 symbol 'argv0' was not declared. Should it be static?
linux-user/main.c:42:5: warning:
 symbol 'gdbstub_port' was not declared. Should it be static?
linux-user/main.c:43:11: warning:
 symbol 'envlist' was not declared. Should it be static?

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 linux-user/main.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/linux-user/main.c b/linux-user/main.c
index 06dd296..829ee64 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -37,10 +37,10 @@
 char *exec_path;
 
 int singlestep;
-const char *filename;
-const char *argv0;
-int gdbstub_port;
-envlist_t *envlist;
+static const char *filename;
+static const char *argv0;
+static int gdbstub_port;
+static envlist_t *envlist;
 static const char *cpu_model;
 unsigned long mmap_min_addr;
 unsigned long guest_base;
-- 
2.1.4


