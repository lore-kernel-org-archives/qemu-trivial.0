Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Va0Ep-0002Cd-DN
	for mharc-qemu-trivial@gnu.org; Sat, 26 Oct 2013 05:32:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60394)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Va0Ei-0001yw-IX
	for qemu-trivial@nongnu.org; Sat, 26 Oct 2013 05:32:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Va0Eb-000861-Aq
	for qemu-trivial@nongnu.org; Sat, 26 Oct 2013 05:32:48 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:50235)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Va0EN-00083y-Nw; Sat, 26 Oct 2013 05:32:27 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 1388643919;
	Sat, 26 Oct 2013 13:32:27 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id EC9EB213;
	Sat, 26 Oct 2013 13:32:26 +0400 (MSK)
Received: (nullmailer pid 19522 invoked by uid 1000);
	Sat, 26 Oct 2013 09:32:26 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: Anthony Liguori <aliguori@amazon.com>
Date: Sat, 26 Oct 2013 13:31:23 +0400
Message-Id: <1382779887-15971-4-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1382779887-15971-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1382779887-15971-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Fam Zheng <famz@redhat.com>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 3/7] .gitignore: ignore qmp-commands.txt
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
X-List-Received-Date: Sat, 26 Oct 2013 09:32:53 -0000

From: Fam Zheng <famz@redhat.com>

This file is moved out from QMP/ to BUILD dir, change the ignore file
too.

Signed-off-by: Fam Zheng <famz@redhat.com>
Reviewed-by: Luiz Capitulino <lcapitulino@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 .gitignore |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitignore b/.gitignore
index 8e1b73f..5584b5f 100644
--- a/.gitignore
+++ b/.gitignore
@@ -44,7 +44,7 @@ qemu-ga
 qemu-bridge-helper
 qemu-monitor.texi
 vscclient
-QMP/qmp-commands.txt
+qmp-commands.txt
 test-bitops
 test-coroutine
 test-int128
-- 
1.7.10.4


