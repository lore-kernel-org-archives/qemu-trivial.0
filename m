Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bsnSl-0002UH-LI
	for mharc-qemu-trivial@gnu.org; Sat, 08 Oct 2016 04:58:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42981)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bsnSh-0002PM-W7
	for qemu-trivial@nongnu.org; Sat, 08 Oct 2016 04:58:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bsnSg-0007rp-8R
	for qemu-trivial@nongnu.org; Sat, 08 Oct 2016 04:58:31 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:55036)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bsnSZ-0007gA-SR; Sat, 08 Oct 2016 04:58:24 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 97AF540ED8;
	Sat,  8 Oct 2016 11:58:15 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id B2600B26;
	Sat,  8 Oct 2016 11:58:14 +0300 (MSK)
Received: (nullmailer pid 19241 invoked by uid 1000);
	Sat, 08 Oct 2016 08:58:13 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sat,  8 Oct 2016 11:57:56 +0300
Message-Id: <de85094825834df939d1f6f09bdc573d2b72f7ae.1475917008.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
References: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
References: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 10/26] MAINTAINERS: Add some more rocker
 related files
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
X-List-Received-Date: Sat, 08 Oct 2016 08:58:33 -0000

From: Thomas Huth <thuth@redhat.com>

The files in tests/rocker/ and docs/specs/rocker.txt
should be listed in the Rocker section of MAINTAINERS.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a5751a6..4b17a05 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1023,6 +1023,8 @@ Rocker
 M: Jiri Pirko <jiri@resnulli.us>
 S: Maintained
 F: hw/net/rocker/
+F: tests/rocker/
+F: docs/specs/rocker.txt
 
 NVDIMM
 M: Xiao Guangrong <guangrong.xiao@linux.intel.com>
-- 
2.1.4


