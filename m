Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cCLJJ-0001Tc-PJ
	for mharc-qemu-trivial@gnu.org; Thu, 01 Dec 2016 01:57:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35939)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhangchen.fnst@cn.fujitsu.com>) id 1cCLJG-0001Rr-R4
	for qemu-trivial@nongnu.org; Thu, 01 Dec 2016 01:57:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhangchen.fnst@cn.fujitsu.com>) id 1cCLJF-0007oa-VB
	for qemu-trivial@nongnu.org; Thu, 01 Dec 2016 01:57:34 -0500
Received: from [59.151.112.132] (port=55960 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhangchen.fnst@cn.fujitsu.com>)
	id 1cCLJA-0007gr-Bs; Thu, 01 Dec 2016 01:57:28 -0500
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="13498100"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 01 Dec 2016 14:57:08 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 05A5A41B5F58;
	Thu,  1 Dec 2016 14:57:09 +0800 (CST)
Received: from localhost.localdomain (10.167.226.56) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Thu, 1 Dec 2016 14:57:07 +0800
From: Zhang Chen <zhangchen.fnst@cn.fujitsu.com>
To: qemu devel <qemu-devel@nongnu.org>, QEMU Trivial
	<qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier
	<laurent@vivier.eu>
CC: Zhang Chen <zhangchen.fnst@cn.fujitsu.com>, Eric Blake
	<eblake@redhat.com>, Stefan Weil <sw@weilnetz.de>
Date: Thu, 1 Dec 2016 14:55:57 +0800
Message-ID: <1480575357-25056-1-git-send-email-zhangchen.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.226.56]
X-yoursite-MailScanner-ID: 05A5A41B5F58.AE5B4
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhangchen.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: [Qemu-trivial] [PATCH] docs: Fix description of the sentence
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
X-List-Received-Date: Thu, 01 Dec 2016 06:57:35 -0000

Say it in another way to make it easier to understand.

Signed-off-by: Zhang Chen <zhangchen.fnst@cn.fujitsu.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 docs/colo-proxy.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/docs/colo-proxy.txt b/docs/colo-proxy.txt
index 76767cb..c4941de 100644
--- a/docs/colo-proxy.txt
+++ b/docs/colo-proxy.txt
@@ -158,7 +158,9 @@ secondary.
 
 == Usage ==
 
-Here, we use demo ip and port discribe more clearly.
+Here is an example using demonstration IP and port addresses to more
+clearly describe the usage.
+
 Primary(ip:3.3.3.3):
 -netdev tap,id=hn0,vhost=off,script=/etc/qemu-ifup,downscript=/etc/qemu-ifdown
 -device e1000,id=e0,netdev=hn0,mac=52:a4:00:12:78:66
-- 
2.7.4




