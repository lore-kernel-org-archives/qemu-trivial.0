Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c08w4-0004Lu-4D
	for mharc-qemu-trivial@gnu.org; Fri, 28 Oct 2016 11:19:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56671)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1c08vx-0004E2-0M
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2016 11:19:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1c08vw-0004b9-4t
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2016 11:19:05 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:43016)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1c08vr-0004U0-Kt; Fri, 28 Oct 2016 11:18:59 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id CD72B43730;
	Fri, 28 Oct 2016 18:18:57 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id A1720B43;
	Fri, 28 Oct 2016 18:18:56 +0300 (MSK)
Received: (nullmailer pid 6046 invoked by uid 1000);
	Fri, 28 Oct 2016 15:18:56 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Changlong Xie <xiecl.fnst@cn.fujitsu.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Fri, 28 Oct 2016 18:18:32 +0300
Message-Id: <c551cd52cc4424b98548132d6a49baddeae6ee80.1477667878.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
References: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
References: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 01/23] filter-dump: add missing "["
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
X-List-Received-Date: Fri, 28 Oct 2016 15:19:10 -0000

From: Changlong Xie <xiecl.fnst@cn.fujitsu.com>

Signed-off-by: Changlong Xie <xiecl.fnst@cn.fujitsu.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qemu-options.hx | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index b1fbdb0..c209b53 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -3902,7 +3902,7 @@ colo secondary:
 -object filter-redirector,id=f2,netdev=hn0,queue=rx,outdev=red1
 -object filter-rewriter,id=rew0,netdev=hn0,queue=all
 
-@item -object filter-dump,id=@var{id},netdev=@var{dev},file=@var{filename}][,maxlen=@var{len}]
+@item -object filter-dump,id=@var{id},netdev=@var{dev}[,file=@var{filename}][,maxlen=@var{len}]
 
 Dump the network traffic on netdev @var{dev} to the file specified by
 @var{filename}. At most @var{len} bytes (64k by default) per packet are stored.
-- 
2.1.4


