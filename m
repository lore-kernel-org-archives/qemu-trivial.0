Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1av00Z-0001Ja-Fw
	for mharc-qemu-trivial@gnu.org; Tue, 26 Apr 2016 06:14:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45711)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <weijg.fnst@cn.fujitsu.com>) id 1av00X-0001Fc-As
	for qemu-trivial@nongnu.org; Tue, 26 Apr 2016 06:14:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <weijg.fnst@cn.fujitsu.com>) id 1av00W-0007Qd-EC
	for qemu-trivial@nongnu.org; Tue, 26 Apr 2016 06:14:17 -0400
Received: from [59.151.112.132] (port=41637 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <weijg.fnst@cn.fujitsu.com>)
	id 1av00R-0007OB-9G; Tue, 26 Apr 2016 06:14:11 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="5968344"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Apr 2016 18:14:09 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id BAFBE42B4AF3;
	Tue, 26 Apr 2016 18:14:08 +0800 (CST)
Received: from localhost.localdomain (10.167.226.50) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Tue, 26 Apr 2016 18:14:08 +0800
From: Wei Jiangang <weijg.fnst@cn.fujitsu.com>
To: <qemu-devel@nongnu.org>
CC: <kwolf@redhat.com>, <mreitz@redhat.com>, <qemu-trivial@nongnu.org>,
	<qemu-block@nongnu.org>, Wei Jiangang <weijg.fnst@cn.fujitsu.com>
Date: Tue, 26 Apr 2016 18:13:21 +0800
Message-ID: <1461665601-14908-1-git-send-email-weijg.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.3
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.226.50]
X-yoursite-MailScanner-ID: BAFBE42B4AF3.A2BB9
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: weijg.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: [Qemu-trivial] [Qemu-devel][PATCH] iotests: fix the redirection
 order in 083
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
X-List-Received-Date: Tue, 26 Apr 2016 10:14:18 -0000

It should redirect stdout to /dev/null first,
then redirect stderr to whatever stdout currently points at.

Signed-off-by: Wei Jiangang <weijg.fnst@cn.fujitsu.com>
---
 tests/qemu-iotests/083 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/083 b/tests/qemu-iotests/083
index aa99278..7d368b5 100755
--- a/tests/qemu-iotests/083
+++ b/tests/qemu-iotests/083
@@ -44,7 +44,7 @@ choose_tcp_port() {
 
 wait_for_tcp_port() {
 	while ! (netstat --tcp --listening --numeric | \
-		 grep "$1.*0\\.0\\.0\\.0:\\*.*LISTEN") 2>&1 >/dev/null; do
+		 grep "$1.*0\\.0\\.0\\.0:\\*.*LISTEN") >/dev/null 2>&1; do
 		sleep 0.1
 	done
 }
@@ -71,7 +71,7 @@ EOF
 		nbd_url="nbd:127.0.0.1:$port:exportname=foo"
 	fi
 
-	$PYTHON nbd-fault-injector.py $extra_args "127.0.0.1:$port" "$TEST_DIR/nbd-fault-injector.conf" 2>&1 >/dev/null &
+	$PYTHON nbd-fault-injector.py $extra_args "127.0.0.1:$port" "$TEST_DIR/nbd-fault-injector.conf" >/dev/null 2>&1 &
 	wait_for_tcp_port "127\\.0\\.0\\.1:$port"
 	$QEMU_IO -c "read 0 512" "$nbd_url" 2>&1 | _filter_qemu_io | _filter_nbd
 
-- 
1.9.3




