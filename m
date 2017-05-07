Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d7GUn-0004R7-Ec
	for mharc-qemu-trivial@gnu.org; Sun, 07 May 2017 03:20:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56069)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1d7GUh-0004KL-9z
	for qemu-trivial@nongnu.org; Sun, 07 May 2017 03:20:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1d7GUg-00036q-Hu
	for qemu-trivial@nongnu.org; Sun, 07 May 2017 03:20:39 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:52129)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1d7GUc-00034d-29; Sun, 07 May 2017 03:20:34 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 15A9440481;
	Sun,  7 May 2017 10:20:33 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 0F5D6439;
	Sun,  7 May 2017 10:02:32 +0300 (MSK)
Received: (nullmailer pid 26583 invoked by uid 1000);
	Sun, 07 May 2017 07:02:29 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  7 May 2017 10:02:25 +0300
Message-Id: <f5cdcaeea2944e6664b5abcfce5c3eaee71ca761.1494140528.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1494140527.git.mjt@msgid.tls.msk.ru>
References: <cover.1494140527.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1494140527.git.mjt@msgid.tls.msk.ru>
References: <cover.1494140527.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 22/23] MAINTAINERS: Update paths for
 AioContext implementation
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
X-List-Received-Date: Sun, 07 May 2017 07:20:40 -0000

From: Paolo Bonzini <pbonzini@redhat.com>

Moved by c2b38b2
("block: move AioContext, QEMUTimer, main-loop to libqemuutil")

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Laurent Vivier <lvivier@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index e6822b23bf..e79ffb3f8a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1175,8 +1175,8 @@ M: Stefan Hajnoczi <stefanha@redhat.com>
 M: Fam Zheng <famz@redhat.com>
 L: qemu-block@nongnu.org
 S: Supported
-F: async.c
-F: aio-*.c
+F: util/async.c
+F: util/aio-*.c
 F: block/io.c
 F: migration/block*
 F: include/block/aio.h
-- 
2.11.0


