Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YBfyY-0008Hg-U7
	for mharc-qemu-trivial@gnu.org; Thu, 15 Jan 2015 03:40:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34030)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YBfyR-00084r-Dd
	for qemu-trivial@nongnu.org; Thu, 15 Jan 2015 03:40:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YBfyQ-0002ie-Do
	for qemu-trivial@nongnu.org; Thu, 15 Jan 2015 03:40:15 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:48034)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YBfyI-0002bB-6A; Thu, 15 Jan 2015 03:40:06 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 6F8E240D99;
	Thu, 15 Jan 2015 11:30:52 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 2E5EF8CA;
	Thu, 15 Jan 2015 11:30:52 +0300 (MSK)
Received: (nullmailer pid 31357 invoked by uid 1000);
	Thu, 15 Jan 2015 08:30:51 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 15 Jan 2015 11:30:47 +0300
Message-Id: <3d59b6808bc5e0efbf1aee48d7f9ea96d19df05d.1421310394.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1421310394.git.mjt@msgid.tls.msk.ru>
References: <cover.1421310394.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, David Morrison <dmorrison@invlim.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 09/12] target-openrisc: bugfix for dec_sys to
	decode instructions correctly
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
X-List-Received-Date: Thu, 15 Jan 2015 08:40:20 -0000

From: David Morrison <dmorrison@invlim.com>

Fixed the decoding of "system" instructions (starting with 0x2)
in dec_sys() in translate.c.  In particular, the l.trap instruction
is now correctly decoded, which enables for singlestepping and
breakpoints to be set in GDB.

Signed-off-by: David R. Morrison <dmorrison@invlim.com>
Acked-by: Jia Liu <proljc@gmail.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 target-openrisc/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target-openrisc/translate.c b/target-openrisc/translate.c
index 7dea405..b90181d 100644
--- a/target-openrisc/translate.c
+++ b/target-openrisc/translate.c
@@ -1320,7 +1320,7 @@ static void dec_sys(DisasContext *dc, uint32_t insn)
 #ifdef OPENRISC_DISAS
     uint32_t K16;
 #endif
-    op0 = extract32(insn, 16, 8);
+    op0 = extract32(insn, 16, 10);
 #ifdef OPENRISC_DISAS
     K16 = extract32(insn, 0, 16);
 #endif
-- 
2.1.4


