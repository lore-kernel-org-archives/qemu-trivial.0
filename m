Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YBfxI-0005oq-Ch
	for mharc-qemu-trivial@gnu.org; Thu, 15 Jan 2015 03:39:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33619)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YBfxF-0005jG-7q
	for qemu-trivial@nongnu.org; Thu, 15 Jan 2015 03:39:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YBfxE-0002HH-HS
	for qemu-trivial@nongnu.org; Thu, 15 Jan 2015 03:39:01 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:49414)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YBfx8-0002EQ-Tw; Thu, 15 Jan 2015 03:38:55 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 09E1A40DB5;
	Thu, 15 Jan 2015 11:38:54 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 288BD8CA;
	Thu, 15 Jan 2015 11:30:53 +0300 (MSK)
Received: (nullmailer pid 31355 invoked by uid 1000);
	Thu, 15 Jan 2015 08:30:51 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 15 Jan 2015 11:30:46 +0300
Message-Id: <fac6688a18574b6f2caa8c699a936e729ed53ece.1421310394.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1421310394.git.mjt@msgid.tls.msk.ru>
References: <cover.1421310394.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Don Slutz <dslutz@verizon.com>
Subject: [Qemu-trivial] [PULL 08/12] Do not hang on full PTY
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Jan 2015 08:39:02 -0000

From: Don Slutz <dslutz@verizon.com>

Signed-off-by: Don Slutz <dslutz@verizon.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qemu-char.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/qemu-char.c b/qemu-char.c
index 5430b87..98d4342 100644
--- a/qemu-char.c
+++ b/qemu-char.c
@@ -1402,6 +1402,7 @@ static CharDriverState *qemu_chr_open_pty(const char *id,
     }
 
     close(slave_fd);
+    qemu_set_nonblock(master_fd);
 
     chr = qemu_chr_alloc();
 
-- 
2.1.4


