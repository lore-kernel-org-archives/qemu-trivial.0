Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cRZz5-00079J-Pp
	for mharc-qemu-trivial@gnu.org; Thu, 12 Jan 2017 02:39:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38848)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1cRZyz-00073H-Of
	for qemu-trivial@nongnu.org; Thu, 12 Jan 2017 02:39:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1cRZyv-0002UQ-6u
	for qemu-trivial@nongnu.org; Thu, 12 Jan 2017 02:39:37 -0500
Received: from [59.151.112.132] (port=2358 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1cRZyq-0002SE-I4; Thu, 12 Jan 2017 02:39:28 -0500
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="14707028"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 12 Jan 2017 15:39:21 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id B074347B0C8E;
	Thu, 12 Jan 2017 15:39:19 +0800 (CST)
Received: from G08FNSTD140223.g08.fujitsu.local (10.167.226.69) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Thu, 12 Jan 2017 15:39:20 +0800
From: Cao jin <caoj.fnst@cn.fujitsu.com>
To: <qemu-devel@nongnu.org>
CC: <kraxel@redhat.com>, <qemu-trivial@nongnu.org>
Date: Thu, 12 Jan 2017 15:44:55 +0800
Message-ID: <1484207095-16224-1-git-send-email-caoj.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.226.69]
X-yoursite-MailScanner-ID: B074347B0C8E.AAF21
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: [Qemu-trivial] [PATCH] doc/usb2: fix typo
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
X-List-Received-Date: Thu, 12 Jan 2017 07:39:42 -0000

Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
---
 docs/usb2.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/usb2.txt b/docs/usb2.txt
index c7a445afcd55..b9e75480737c 100644
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
2.1.0




