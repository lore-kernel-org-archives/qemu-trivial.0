Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c09VY-00032q-8T
	for mharc-qemu-trivial@gnu.org; Fri, 28 Oct 2016 11:55:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37016)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1c09VV-000308-LW
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2016 11:55:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1c09VU-0003MJ-W0
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2016 11:55:49 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:33258)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1c09VQ-0003Gu-NS; Fri, 28 Oct 2016 11:55:44 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id C8AA74374C;
	Fri, 28 Oct 2016 18:55:43 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id EEB73B57;
	Fri, 28 Oct 2016 18:18:57 +0300 (MSK)
Received: (nullmailer pid 6073 invoked by uid 1000);
	Fri, 28 Oct 2016 15:18:56 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org
Date: Fri, 28 Oct 2016 18:18:45 +0300
Message-Id: <e1f3b974f46a15da038f3612bf1858ec81db793d.1477667878.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
References: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
References: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 14/23] qemu-options.hx: set: fix copy-paste
 error
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
X-List-Received-Date: Fri, 28 Oct 2016 15:55:50 -0000

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


