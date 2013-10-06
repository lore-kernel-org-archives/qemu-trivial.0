Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VSkrx-0004CQ-FM
	for mharc-qemu-trivial@gnu.org; Sun, 06 Oct 2013 05:43:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48524)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VSkrr-00041j-GH
	for qemu-trivial@nongnu.org; Sun, 06 Oct 2013 05:43:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VSkrm-0004jq-Kl
	for qemu-trivial@nongnu.org; Sun, 06 Oct 2013 05:43:15 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:33382)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VSkrc-0004iT-7W; Sun, 06 Oct 2013 05:43:00 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id E981940CFE;
	Sun,  6 Oct 2013 13:33:02 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id CA28F510;
	Sun,  6 Oct 2013 13:33:02 +0400 (MSK)
Received: (nullmailer pid 25799 invoked by uid 1000);
	Sun, 06 Oct 2013 09:33:01 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@us.ibm.com
Date: Sun,  6 Oct 2013 13:32:46 +0400
Message-Id: <1381051979-25742-2-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1381051979-25742-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1381051979-25742-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Fam Zheng <famz@redhat.com>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 01/14] .gitignore: ignore
	tests/qemu-iotests/socket_scm_helper
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
X-List-Received-Date: Sun, 06 Oct 2013 09:43:20 -0000

From: Fam Zheng <famz@redhat.com>

Signed-off-by: Fam Zheng <famz@redhat.com>
Reviewed-by: Wenchao Xia<xiawenc@linux.vnet.ibm.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 tests/qemu-iotests/.gitignore |    1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qemu-iotests/.gitignore b/tests/qemu-iotests/.gitignore
index 62b4002..0541f80 100644
--- a/tests/qemu-iotests/.gitignore
+++ b/tests/qemu-iotests/.gitignore
@@ -2,6 +2,7 @@ check.log
 check.time
 *.out.bad
 *.notrun
+socket_scm_helper
 
 # ignore everything in the scratch directory
 scratch/
-- 
1.7.10.4


