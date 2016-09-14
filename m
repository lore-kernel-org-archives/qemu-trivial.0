Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bk5eW-0008P5-LB
	for mharc-qemu-trivial@gnu.org; Wed, 14 Sep 2016 04:34:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40415)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bk5eU-0008Mm-84
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2016 04:34:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bk5eT-0006uJ-FE
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2016 04:34:42 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:57395)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bk5eO-0006rX-Ko; Wed, 14 Sep 2016 04:34:36 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id B3CCD4184D;
	Wed, 14 Sep 2016 11:34:32 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id CD67FAF1;
	Wed, 14 Sep 2016 10:58:58 +0300 (MSK)
Received: (nullmailer pid 17327 invoked by uid 1000);
	Wed, 14 Sep 2016 07:58:57 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Wed, 14 Sep 2016 10:58:34 +0300
Message-Id: <922cc7480385920751f7e904d73bc88e0735b467.1473839869.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
References: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
References: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 08/27] MAINTAINERS: Fix wildcard for scsi
 headers
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
X-List-Received-Date: Wed, 14 Sep 2016 08:34:43 -0000

From: Thomas Huth <thuth@redhat.com>

get_maintainer.pl currently thinks that the scsi headers are
currrently unmaintained. So let's fix the corresponding wildcard
expression.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 635ca77..13dae75 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -835,7 +835,7 @@ T: git git://github.com/jasowang/qemu.git net
 SCSI
 M: Paolo Bonzini <pbonzini@redhat.com>
 S: Supported
-F: include/hw/scsi*
+F: include/hw/scsi/*
 F: hw/scsi/*
 T: git git://github.com/bonzini/qemu.git scsi-next
 
-- 
2.1.4


