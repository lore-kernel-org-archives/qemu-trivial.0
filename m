Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c3bu2-0001C3-3e
	for mharc-qemu-trivial@gnu.org; Sun, 06 Nov 2016 23:51:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49013)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>) id 1c3bu0-0001As-QM
	for qemu-trivial@nongnu.org; Sun, 06 Nov 2016 23:51:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>) id 1c3bu0-0007ba-4q
	for qemu-trivial@nongnu.org; Sun, 06 Nov 2016 23:51:24 -0500
Received: from [59.151.112.132] (port=56384 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>)
	id 1c3btu-0007Ps-Hm; Sun, 06 Nov 2016 23:51:18 -0500
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="12723404"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 07 Nov 2016 12:51:13 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 7AE0543972A7;
	Mon,  7 Nov 2016 12:51:09 +0800 (CST)
Received: from changlox.g08.fujitsu.local (10.167.225.55) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Mon, 7 Nov 2016 12:51:12 +0800
From: Changlong Xie <xiecl.fnst@cn.fujitsu.com>
To: qemu devel <qemu-devel@nongnu.org>, qemu trival <qemu-trivial@nongnu.org>, 
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
CC: Eric Blake <eblake@redhat.com>
Date: Mon, 7 Nov 2016 12:59:25 +0800
Message-ID: <1478494765-13233-1-git-send-email-xiecl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.3
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.55]
X-yoursite-MailScanner-ID: 7AE0543972A7.AF551
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xiecl.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: [Qemu-trivial] [PATCH] tests/.gitignore: Ignore test-char
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
X-List-Received-Date: Mon, 07 Nov 2016 04:51:25 -0000

Signed-off-by: Changlong Xie <xiecl.fnst@cn.fujitsu.com>
---
 tests/.gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/.gitignore b/tests/.gitignore
index c0d7857..e9b182e 100644
--- a/tests/.gitignore
+++ b/tests/.gitignore
@@ -16,6 +16,7 @@ test-bitops
 test-blockjob
 test-blockjob-txn
 test-bufferiszero
+test-char
 test-clone-visitor
 test-coroutine
 test-crypto-afsplit
-- 
1.9.3




