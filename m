Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bso42-0007B5-Nk
	for mharc-qemu-trivial@gnu.org; Sat, 08 Oct 2016 05:37:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49840)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bso3z-00076x-Li
	for qemu-trivial@nongnu.org; Sat, 08 Oct 2016 05:37:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bso3x-0003Pn-RS
	for qemu-trivial@nongnu.org; Sat, 08 Oct 2016 05:37:02 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:43760)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bso3q-0003GI-Ns; Sat, 08 Oct 2016 05:36:54 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id E690540EB7;
	Sat,  8 Oct 2016 12:36:48 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 9523CB30;
	Sat,  8 Oct 2016 11:58:15 +0300 (MSK)
Received: (nullmailer pid 19233 invoked by uid 1000);
	Sat, 08 Oct 2016 08:58:13 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sat,  8 Oct 2016 11:57:52 +0300
Message-Id: <a2b245ae2f67ef08b861e17c643ef9f2e77a0a51.1475917008.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
References: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
References: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 06/26] MAINTAINERS: Add include/hw/audio/ to
 audio section
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
X-List-Received-Date: Sat, 08 Oct 2016 09:37:04 -0000

From: Thomas Huth <thuth@redhat.com>

audio.h and pcspk.h are recognized as maintained files now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ba50167..94f14ea 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1046,6 +1046,7 @@ M: Gerd Hoffmann <kraxel@redhat.com>
 S: Maintained
 F: audio/
 F: hw/audio/
+F: include/hw/audio/
 F: tests/ac97-test.c
 F: tests/es1370-test.c
 F: tests/intel-hda-test.c
-- 
2.1.4


