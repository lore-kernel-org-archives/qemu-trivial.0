Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bk56C-0005zE-8h
	for mharc-qemu-trivial@gnu.org; Wed, 14 Sep 2016 03:59:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32917)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bk567-0005s9-Hy
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2016 03:59:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bk565-0004cw-PA
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2016 03:59:10 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:52015)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bk562-0004YV-3y; Wed, 14 Sep 2016 03:59:06 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id C947A41848;
	Wed, 14 Sep 2016 10:58:58 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 464C4AEA;
	Wed, 14 Sep 2016 10:58:58 +0300 (MSK)
Received: (nullmailer pid 17319 invoked by uid 1000);
	Wed, 14 Sep 2016 07:58:57 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Wed, 14 Sep 2016 10:58:30 +0300
Message-Id: <55534b805c6d65b5aee9b1be6b109692cc722cee.1473839869.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
References: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
References: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 04/27] MAINTAINERS: Add include/hw/unicore32/
 to UniCore32 section
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
X-List-Received-Date: Wed, 14 Sep 2016 07:59:14 -0000

From: Thomas Huth <thuth@redhat.com>

get_maintainer.pl now properly recognizes that the file in
include/hw/unicore32/ belongs to UniCore32.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Acked-by: Guan Xuetao <gxt@mprc.pku.edu.cn>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2ffdb36..0ca0cd0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -202,6 +202,7 @@ M: Guan Xuetao <gxt@mprc.pku.edu.cn>
 S: Maintained
 F: target-unicore32/
 F: hw/unicore32/
+F: include/hw/unicore32/
 
 X86
 M: Paolo Bonzini <pbonzini@redhat.com>
-- 
2.1.4


