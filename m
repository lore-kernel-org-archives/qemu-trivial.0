Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cVxob-0001nT-G8
	for mharc-qemu-trivial@gnu.org; Tue, 24 Jan 2017 04:55:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45361)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cVxoX-0001iR-1w
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2017 04:54:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cVxoW-0005kv-2K
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2017 04:54:57 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:36317)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1cVxoQ-0005iR-7s; Tue, 24 Jan 2017 04:54:50 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id F1CA9420AB;
	Tue, 24 Jan 2017 12:54:47 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id A6A99560;
	Tue, 24 Jan 2017 12:39:42 +0300 (MSK)
Received: (nullmailer pid 12614 invoked by uid 1000);
	Tue, 24 Jan 2017 09:39:41 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Tue, 24 Jan 2017 12:39:07 +0300
Message-Id: <7f473c284e9811e3ac5dfcae1f858bac5ade1066.1485250702.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
References: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
References: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 03/31] README: Add linux to macOS build info
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
X-List-Received-Date: Tue, 24 Jan 2017 09:54:58 -0000

From: Peter Maydell <peter.maydell@linaro.org>

The README lists the URLs for the wiki pages describing
how to build on Linux and Windows; add the equivalent
link for building on macOS.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 README | 1 +
 1 file changed, 1 insertion(+)

diff --git a/README b/README
index bd8060a..cb60d05 100644
--- a/README
+++ b/README
@@ -45,6 +45,7 @@ of other UNIX targets. The simple steps to build QEMU are:
 Additional information can also be found online via the QEMU website:
 
   http://qemu-project.org/Hosts/Linux
+  http://qemu-project.org/Hosts/Mac
   http://qemu-project.org/Hosts/W32
 
 
-- 
2.1.4


