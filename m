Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eQn8z-0008Ff-6M
	for mharc-qemu-trivial@gnu.org; Sun, 17 Dec 2017 23:35:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58282)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1eQn8r-0008AK-Gb
	for qemu-trivial@nongnu.org; Sun, 17 Dec 2017 23:35:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1eQn8q-0003gj-SN
	for qemu-trivial@nongnu.org; Sun, 17 Dec 2017 23:35:05 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:60245)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1eQn8l-0003cz-Gc; Sun, 17 Dec 2017 23:34:59 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id F2DB8411C1;
	Mon, 18 Dec 2017 07:34:56 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 1EAC1CF1;
	Mon, 18 Dec 2017 00:25:47 +0300 (MSK)
Received: (nullmailer pid 30888 invoked by uid 1000);
	Sun, 17 Dec 2017 21:28:08 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: "Emilio G. Cota" <cota@braap.org>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Mon, 18 Dec 2017 00:27:08 +0300
Message-Id: <4f0fca592e44cdfa50afcb93e9a14dfcb7c2c425.1513545944.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
References: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
References: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 03/61] disas/arm: fix 'instuction' typo in
 comment
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
X-List-Received-Date: Mon, 18 Dec 2017 04:35:06 -0000

From: "Emilio G. Cota" <cota@braap.org>

Signed-off-by: Emilio G. Cota <cota@braap.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 disas/arm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/disas/arm.c b/disas/arm.c
index 9967c45990..dda7b2a943 100644
--- a/disas/arm.c
+++ b/disas/arm.c
@@ -1662,7 +1662,7 @@ print_insn_coprocessor (bfd_vma pc, struct disassemble_info *info, long given,
 	}
       else
 	{
-	  /* Only match unconditional instuctions against unconditional
+          /* Only match unconditional instructions against unconditional
 	     patterns.  */
 	  if ((given & 0xf0000000) == 0xf0000000)
 	    {
-- 
2.11.0


