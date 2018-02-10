Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ekQHa-0007QR-LH
	for mharc-qemu-trivial@gnu.org; Sat, 10 Feb 2018 03:13:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60426)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ekQHW-0007Lx-Qd
	for qemu-trivial@nongnu.org; Sat, 10 Feb 2018 03:13:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ekQHV-0003Ls-38
	for qemu-trivial@nongnu.org; Sat, 10 Feb 2018 03:13:10 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:40001)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ekQHP-0003Fr-Sy; Sat, 10 Feb 2018 03:13:04 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id C0BE640C58;
	Sat, 10 Feb 2018 11:13:02 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 158517BB;
	Sat, 10 Feb 2018 10:55:17 +0300 (MSK)
Received: (nullmailer pid 22811 invoked by uid 1000);
	Sat, 10 Feb 2018 07:55:14 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sat, 10 Feb 2018 10:55:07 +0300
Message-Id: <e5dd987522b6c421e045d0890cbcd2656092cf22.1518249254.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1518249254.git.mjt@msgid.tls.msk.ru>
References: <cover.1518249254.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1518249254.git.mjt@msgid.tls.msk.ru>
References: <cover.1518249254.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 12/17] MAINTAINERS: Add qemu-binfmt-conf.sh
 script
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
X-List-Received-Date: Sat, 10 Feb 2018 08:13:12 -0000

From: Thomas Huth <thuth@redhat.com>

qemu-binfmt-conf.sh is used for the Linux usermode emulation, so
let's add this file to that section in the MAINTAINERS file.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 54feb95646..57358a08e2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1761,6 +1761,7 @@ R: Laurent Vivier <laurent@vivier.eu>
 S: Maintained
 F: linux-user/
 F: default-configs/*-linux-user.mak
+F: scripts/qemu-binfmt-conf.sh
 
 Tiny Code Generator (TCG)
 -------------------------
-- 
2.11.0


