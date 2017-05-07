Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d7GL5-0006nL-Je
	for mharc-qemu-trivial@gnu.org; Sun, 07 May 2017 03:10:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54478)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1d7GL1-0006gu-6Y
	for qemu-trivial@nongnu.org; Sun, 07 May 2017 03:10:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1d7GL0-0000k8-3l
	for qemu-trivial@nongnu.org; Sun, 07 May 2017 03:10:39 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:54911)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1d7GKv-0000hb-FR; Sun, 07 May 2017 03:10:33 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id AA5C740476;
	Sun,  7 May 2017 10:10:32 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id D1E403F6;
	Sun,  7 May 2017 10:02:30 +0300 (MSK)
Received: (nullmailer pid 26565 invoked by uid 1000);
	Sun, 07 May 2017 07:02:29 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  7 May 2017 10:02:16 +0300
Message-Id: <68935a65e66ead7fda58beb51191beaea3995ab4.1494140528.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1494140527.git.mjt@msgid.tls.msk.ru>
References: <cover.1494140527.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1494140527.git.mjt@msgid.tls.msk.ru>
References: <cover.1494140527.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 13/23] qemu-doc: Fix broken URLs of
 amnhltm.zip and dosidle210.zip
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
X-List-Received-Date: Sun, 07 May 2017 07:10:40 -0000

From: Thomas Huth <thuth@redhat.com>

There are some broken URLs in the qemu-doc which reference tools that
are not available at their original location anymore. Fortunately, they
have been mirrored to archive.org, so point to that location instead.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Laurent Vivier <lvivier@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qemu-doc.texi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/qemu-doc.texi b/qemu-doc.texi
index 794ab4a080..50411bc0ff 100644
--- a/qemu-doc.texi
+++ b/qemu-doc.texi
@@ -1878,8 +1878,8 @@ resolution modes which the Cirrus Logic BIOS does not support (i.e. >=
 Windows 9x does not correctly use the CPU HLT
 instruction. The result is that it takes host CPU cycles even when
 idle. You can install the utility from
-@url{http://www.user.cityline.ru/~maxamn/amnhltm.zip} to solve this
-problem. Note that no such tool is needed for NT, 2000 or XP.
+@url{http://web.archive.org/web/20060212132151/http://www.user.cityline.ru/~maxamn/amnhltm.zip}
+to solve this problem. Note that no such tool is needed for NT, 2000 or XP.
 
 @subsubsection Windows 2000 disk full problem
 
@@ -1927,9 +1927,9 @@ vvfat block device ("-hdb fat:directory_which_holds_the_SP").
 @subsubsection CPU usage reduction
 
 DOS does not correctly use the CPU HLT instruction. The result is that
-it takes host CPU cycles even when idle. You can install the utility
-from @url{http://www.vmware.com/software/dosidle210.zip} to solve this
-problem.
+it takes host CPU cycles even when idle. You can install the utility from
+@url{http://web.archive.org/web/20051222085335/http://www.vmware.com/software/dosidle210.zip}
+to solve this problem.
 
 @node QEMU System emulator for non PC targets
 @chapter QEMU System emulator for non PC targets
-- 
2.11.0


