Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cVxaB-00067W-Sx
	for mharc-qemu-trivial@gnu.org; Tue, 24 Jan 2017 04:40:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40933)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cVxa7-00062B-4H
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2017 04:40:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cVxZz-0000ru-5g
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2017 04:40:03 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:49139)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1cVxZm-0000hC-Ve; Tue, 24 Jan 2017 04:39:43 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 78EB742104;
	Tue, 24 Jan 2017 12:39:42 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id BE09F55C;
	Tue, 24 Jan 2017 12:39:41 +0300 (MSK)
Received: (nullmailer pid 12610 invoked by uid 1000);
	Tue, 24 Jan 2017 09:39:41 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org
Date: Tue, 24 Jan 2017 12:39:05 +0300
Message-Id: <b26a6a65fd0b46a18a9d23ef3867b5e9d3a5469c.1485250702.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
References: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
References: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 01/31] doc: don't mention -memory, it is -m
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
X-List-Received-Date: Tue, 24 Jan 2017 09:40:07 -0000

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qemu-options.hx | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 80df526..232f737 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -250,7 +250,7 @@ use is discouraged as it may be removed from future versions.
 ETEXI
 
 DEF("m", HAS_ARG, QEMU_OPTION_m,
-    "-m[emory] [size=]megs[,slots=n,maxmem=size]\n"
+    "-m [size=]megs[,slots=n,maxmem=size]\n"
     "                configure guest RAM\n"
     "                size: initial amount of guest memory\n"
     "                slots: number of hotplug slots (default: none)\n"
-- 
2.1.4


