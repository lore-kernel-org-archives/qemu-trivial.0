Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fKHlg-0008I7-CV
	for mharc-qemu-trivial@gnu.org; Sun, 20 May 2018 02:24:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44964)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1fKHlZ-0007tq-30
	for qemu-trivial@nongnu.org; Sun, 20 May 2018 02:24:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1fKHlY-0008Nx-AW
	for qemu-trivial@nongnu.org; Sun, 20 May 2018 02:24:25 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:52091)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1fKHlT-0008JF-GD; Sun, 20 May 2018 02:24:19 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id D51C44111F;
	Sun, 20 May 2018 09:24:18 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 58C6910C4;
	Sun, 20 May 2018 09:15:13 +0300 (MSK)
Received: (nullmailer pid 7376 invoked by uid 1000);
	Sun, 20 May 2018 06:15:11 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sun, 20 May 2018 09:14:54 +0300
Message-Id: <183861456d5e01649df9591a535486c10d72e060.1526796813.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1526796813.git.mjt@msgid.tls.msk.ru>
References: <cover.1526796813.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1526796813.git.mjt@msgid.tls.msk.ru>
References: <cover.1526796813.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 08/22] qemu-img: remove references to GEN_DOCS
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
X-List-Received-Date: Sun, 20 May 2018 06:24:26 -0000

From: John Snow <jsnow@redhat.com>

Nothing seemingly uses this.
(jcody: commit 77bd1119ba even mentions that it appears unused)

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Jeff Cody <jcody@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qemu-img.c             | 2 --
 qemu-options-wrapper.h | 1 -
 2 files changed, 3 deletions(-)

diff --git a/qemu-img.c b/qemu-img.c
index 60e45ec103..2b5a5706b6 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -123,7 +123,6 @@ static void QEMU_NORETURN help(void)
            "  " arg_string "\n"
 #include "qemu-img-cmds.h"
 #undef DEF
-#undef GEN_DOCS
            "\n"
            "Command parameters:\n"
            "  'filename' is a disk image filename\n"
@@ -4716,7 +4715,6 @@ static const img_cmd_t img_cmds[] = {
     { option, callback },
 #include "qemu-img-cmds.h"
 #undef DEF
-#undef GEN_DOCS
     { NULL, NULL, },
 };
 
diff --git a/qemu-options-wrapper.h b/qemu-options-wrapper.h
index 13bfea0294..6f548e3922 100644
--- a/qemu-options-wrapper.h
+++ b/qemu-options-wrapper.h
@@ -34,7 +34,6 @@
 #undef DEF
 #undef DEFHEADING
 #undef ARCHHEADING
-#undef GEN_DOCS
 
 #undef QEMU_OPTIONS_GENERATE_ENUM
 #undef QEMU_OPTIONS_GENERATE_HELP
-- 
2.11.0


