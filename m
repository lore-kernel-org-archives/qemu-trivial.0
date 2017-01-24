Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cVxog-0001qu-54
	for mharc-qemu-trivial@gnu.org; Tue, 24 Jan 2017 04:55:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45385)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cVxoa-0001mD-E7
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2017 04:55:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cVxoV-0005kq-Uy
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2017 04:55:00 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:54761)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1cVxoQ-0005jF-V9; Tue, 24 Jan 2017 04:54:51 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 2723B42109;
	Tue, 24 Jan 2017 12:54:48 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 3FFBE56A;
	Tue, 24 Jan 2017 12:39:43 +0300 (MSK)
Received: (nullmailer pid 12640 invoked by uid 1000);
	Tue, 24 Jan 2017 09:39:41 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Cao jin <caoj.fnst@cn.fujitsu.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Tue, 24 Jan 2017 12:39:20 +0300
Message-Id: <6e3a7db24261589741fe7e447025d945bebf6503.1485250702.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
References: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
References: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 16/31] doc/usb2: fix typo
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
X-List-Received-Date: Tue, 24 Jan 2017 09:55:04 -0000

From: Cao jin <caoj.fnst@cn.fujitsu.com>

Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 docs/usb2.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/usb2.txt b/docs/usb2.txt
index c7a445a..b9e7548 100644
--- a/docs/usb2.txt
+++ b/docs/usb2.txt
@@ -19,7 +19,7 @@ the controller so the USB 2.0 bus gets a individual name, for example
 '-device usb-ehci,id=ehci".  This will give you a USB 2.0 bus named
 "ehci.0".
 
-I strongly recomment to also use -device to attach usb devices because
+I strongly recommend to also use -device to attach usb devices because
 you can specify the bus they should be attached to this way.  Here is
 a complete example:
 
-- 
2.1.4


