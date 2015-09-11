Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZaMiK-0000oG-Ky
	for mharc-qemu-trivial@gnu.org; Fri, 11 Sep 2015 07:41:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38594)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZaMiI-0000jB-43
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 07:41:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZaMiH-0004uS-4k
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 07:41:54 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:43028)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZaMiC-0004sC-6s; Fri, 11 Sep 2015 07:41:48 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 031FF4143C;
	Fri, 11 Sep 2015 14:41:46 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 9C01EA6C;
	Fri, 11 Sep 2015 14:03:53 +0300 (MSK)
Received: (nullmailer pid 22789 invoked by uid 1000);
	Fri, 11 Sep 2015 11:03:51 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri, 11 Sep 2015 14:03:42 +0300
Message-Id: <2382053f1deea2a2b49cf15571be7b542bec5fcf.1441969369.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1441969369.git.mjt@msgid.tls.msk.ru>
References: <cover.1441969369.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 18/26] help: dd missing newline
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
X-List-Received-Date: Fri, 11 Sep 2015 11:41:55 -0000

From: Laurent Vivier <lvivier@redhat.com>

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qemu-options.hx | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 739894d..166eae6 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -3513,7 +3513,7 @@ DEF("dump-vmstate", HAS_ARG, QEMU_OPTION_dump_vmstate,
     "                Output vmstate information in JSON format to file.\n"
     "                Use the scripts/vmstate-static-checker.py file to\n"
     "                check for possible regressions in migration code\n"
-    "                by comparing two such vmstate dumps.",
+    "                by comparing two such vmstate dumps.\n",
     QEMU_ARCH_ALL)
 STEXI
 @item -dump-vmstate @var{file}
-- 
2.1.4


