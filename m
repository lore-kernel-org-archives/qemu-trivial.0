Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bso43-0007CJ-E9
	for mharc-qemu-trivial@gnu.org; Sat, 08 Oct 2016 05:37:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49833)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bso3z-00076e-AS
	for qemu-trivial@nongnu.org; Sat, 08 Oct 2016 05:37:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bso3x-0003OW-97
	for qemu-trivial@nongnu.org; Sat, 08 Oct 2016 05:37:02 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:52477)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bso3q-0003GM-Nq; Sat, 08 Oct 2016 05:36:54 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 1AA5140EDA;
	Sat,  8 Oct 2016 12:36:49 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 2E023B35;
	Sat,  8 Oct 2016 11:58:16 +0300 (MSK)
Received: (nullmailer pid 19245 invoked by uid 1000);
	Sat, 08 Oct 2016 08:58:13 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sat,  8 Oct 2016 11:57:58 +0300
Message-Id: <ccf0a57b45c1ff49d21d5b8c0322ea40b5f4f2c7.1475917008.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
References: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
References: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 12/26] MAINTAINERS: Add usermode related
 config files
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

The default-configs/*-linux-user.mak belong to Linux usermode
emulation, and default-configs/*-bsd-user.mak belong to BSD
usermode emulation.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f0ab48f..4a72b77 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1425,11 +1425,13 @@ F: user-exec.c
 BSD user
 S: Orphan
 F: bsd-user/
+F: default-configs/*-bsd-user.mak
 
 Linux user
 M: Riku Voipio <riku.voipio@iki.fi>
 S: Maintained
 F: linux-user/
+F: default-configs/*-linux-user.mak
 
 Tiny Code Generator (TCG)
 -------------------------
-- 
2.1.4


