Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bvmLe-00040c-58
	for mharc-qemu-trivial@gnu.org; Sun, 16 Oct 2016 10:23:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59628)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bvmLc-0003zf-Af
	for qemu-trivial@nongnu.org; Sun, 16 Oct 2016 10:23:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bvmLb-0003xh-Hv
	for qemu-trivial@nongnu.org; Sun, 16 Oct 2016 10:23:32 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:37568)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bvmLX-0003wj-7d; Sun, 16 Oct 2016 10:23:27 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 6571A41E1A;
	Sun, 16 Oct 2016 17:23:25 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 6119EB2A;
	Sun, 16 Oct 2016 17:23:24 +0300 (MSK)
Received: (nullmailer pid 7192 invoked by uid 1000);
	Sun, 16 Oct 2016 14:23:24 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Date: Sun, 16 Oct 2016 17:23:22 +0300
Message-Id: <1476627802-7151-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PATCH] qemu-options.hx: set: fix copy-paste error
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
X-List-Received-Date: Sun, 16 Oct 2016 14:23:33 -0000

Reported-By: Daniel Shahaf <danielsh@apache.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qemu-options.hx | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index c209b53..f296406 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -172,7 +172,7 @@ DEF("set", HAS_ARG, QEMU_OPTION_set,
 STEXI
 @item -set @var{group}.@var{id}.@var{arg}=@var{value}
 @findex -set
-Set parameter @var{arg} for item @var{id} of type @var{group}\n"
+Set parameter @var{arg} for item @var{id} of type @var{group}
 ETEXI
 
 DEF("global", HAS_ARG, QEMU_OPTION_global,
-- 
2.1.4


