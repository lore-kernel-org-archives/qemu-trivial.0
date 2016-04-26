Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1auzzm-0008FC-Bz
	for mharc-qemu-trivial@gnu.org; Tue, 26 Apr 2016 06:13:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45228)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <weijg.fnst@cn.fujitsu.com>) id 1auzzi-00089W-Ow
	for qemu-trivial@nongnu.org; Tue, 26 Apr 2016 06:13:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <weijg.fnst@cn.fujitsu.com>) id 1auzzh-0007BL-PW
	for qemu-trivial@nongnu.org; Tue, 26 Apr 2016 06:13:26 -0400
Received: from [59.151.112.132] (port=31234 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <weijg.fnst@cn.fujitsu.com>)
	id 1auzze-00079P-7v; Tue, 26 Apr 2016 06:13:22 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="5968301"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Apr 2016 18:13:20 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 01C834219163;
	Tue, 26 Apr 2016 18:13:17 +0800 (CST)
Received: from localhost.localdomain (10.167.226.50) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Tue, 26 Apr 2016 18:13:16 +0800
From: Wei Jiangang <weijg.fnst@cn.fujitsu.com>
To: <qemu-devel@nongnu.org>
CC: <kwolf@redhat.com>, <mreitz@redhat.com>, <armbru@redhat.com>,
	<qemu-trivial@nongnu.org>, <qemu-block@nongnu.org>, Wei Jiangang
	<weijg.fnst@cn.fujitsu.com>
Date: Tue, 26 Apr 2016 18:12:43 +0800
Message-ID: <1461665563-14831-1-git-send-email-weijg.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.3
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.226.50]
X-yoursite-MailScanner-ID: 01C834219163.ACF4E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: weijg.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: [Qemu-trivial] [Qemu-devel][PATCH] block: Fix typo in comment
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
X-List-Received-Date: Tue, 26 Apr 2016 10:13:28 -0000

s/imlement/implement/

Signed-off-by: Wei Jiangang <weijg.fnst@cn.fujitsu.com>
---
 blockdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/blockdev.c b/blockdev.c
index f1f520a..f74eb43 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -73,7 +73,7 @@ static int if_max_devs[IF_COUNT] = {
      * Do not change these numbers!  They govern how drive option
      * index maps to unit and bus.  That mapping is ABI.
      *
-     * All controllers used to imlement if=T drives need to support
+     * All controllers used to implement if=T drives need to support
      * if_max_devs[T] units, for any T with if_max_devs[T] != 0.
      * Otherwise, some index values map to "impossible" bus, unit
      * values.
-- 
1.9.3




