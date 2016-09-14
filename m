Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bk5ec-0008Vw-O2
	for mharc-qemu-trivial@gnu.org; Wed, 14 Sep 2016 04:34:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40444)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bk5eY-0008Pn-Be
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2016 04:34:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bk5eT-0006uE-EF
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2016 04:34:45 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:43952)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bk5eO-0006rV-KC; Wed, 14 Sep 2016 04:34:36 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id BD84D4184E;
	Wed, 14 Sep 2016 11:34:32 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id CEF71B0B;
	Wed, 14 Sep 2016 10:58:59 +0300 (MSK)
Received: (nullmailer pid 17321 invoked by uid 1000);
	Wed, 14 Sep 2016 07:58:57 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Wed, 14 Sep 2016 10:58:31 +0300
Message-Id: <bd876f385d49196750725c53e5d754ad1cc471f6.1473839869.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
References: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
References: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 05/27] MAINTAINERS: Add include/hw/tricore/ to
 TriCore section
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
X-List-Received-Date: Wed, 14 Sep 2016 08:34:48 -0000

From: Thomas Huth <thuth@redhat.com>

get_maintainer.pl now properly recognizes that the file in
include/hw/tricore/ belongs to TriCore.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0ca0cd0..8f6e8a2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -226,6 +226,7 @@ M: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
 S: Maintained
 F: target-tricore/
 F: hw/tricore/
+F: include/hw/tricore/
 
 Guest CPU Cores (KVM):
 ----------------------
-- 
2.1.4


