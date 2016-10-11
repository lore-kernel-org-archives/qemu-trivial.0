Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1btpVJ-0006I3-GB
	for mharc-qemu-trivial@gnu.org; Tue, 11 Oct 2016 01:21:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59097)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>) id 1btpVH-0006GV-2H
	for qemu-trivial@nongnu.org; Tue, 11 Oct 2016 01:21:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>) id 1btpVF-0001Gg-RU
	for qemu-trivial@nongnu.org; Tue, 11 Oct 2016 01:21:26 -0400
Received: from [59.151.112.132] (port=46104 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>)
	id 1btpV9-00018u-SV; Tue, 11 Oct 2016 01:21:20 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="11813343"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 11 Oct 2016 13:21:03 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 685F6466F735;
	Tue, 11 Oct 2016 13:21:00 +0800 (CST)
Received: from changlox.g08.fujitsu.local (10.167.225.55) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Tue, 11 Oct 2016 13:20:58 +0800
From: Changlong Xie <xiecl.fnst@cn.fujitsu.com>
To: Jason Wang <jasowang@redhat.com>, qemu devel <qemu-devel@nongnu.org>, qemu
	trival <qemu-trivial@nongnu.org>
Date: Tue, 11 Oct 2016 13:28:32 +0800
Message-ID: <1476163712-7965-1-git-send-email-xiecl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.3
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.55]
X-yoursite-MailScanner-ID: 685F6466F735.ADDF8
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xiecl.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: [Qemu-trivial] [PATCH] filter-dump: add missing "["
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
X-List-Received-Date: Tue, 11 Oct 2016 05:21:28 -0000

Signed-off-by: Changlong Xie <xiecl.fnst@cn.fujitsu.com>
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
1.9.3




