Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bsnau-0008EI-Uy
	for mharc-qemu-trivial@gnu.org; Sat, 08 Oct 2016 05:07:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44231)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bsnas-0008Ab-Ei
	for qemu-trivial@nongnu.org; Sat, 08 Oct 2016 05:06:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bsnaq-000427-Fw
	for qemu-trivial@nongnu.org; Sat, 08 Oct 2016 05:06:57 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:33946)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bsnak-0003tj-SC; Sat, 08 Oct 2016 05:06:51 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 1D28240ED5;
	Sat,  8 Oct 2016 12:06:49 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id D3970B31;
	Sat,  8 Oct 2016 11:58:15 +0300 (MSK)
Received: (nullmailer pid 19243 invoked by uid 1000);
	Sat, 08 Oct 2016 08:58:13 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sat,  8 Oct 2016 11:57:57 +0300
Message-Id: <03972660f74aee433274ec8ab5018a83bf6af67e.1475917008.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
References: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
References: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 11/26] MAINTAINERS: Add some more pattern to
 recognize all win32 related files
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
X-List-Received-Date: Sat, 08 Oct 2016 09:06:59 -0000

From: Thomas Huth <thuth@redhat.com>

The get_maintainer.pl script currently thinks that the win32
related files in the util and include folders are currently
unmaintained. Thus let's add some additional wildcards to
match these files.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4b17a05..f0ab48f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -322,6 +322,9 @@ L: qemu-devel@nongnu.org
 M: Stefan Weil <sw@weilnetz.de>
 S: Maintained
 F: *win32*
+F: */*win32*
+F: include/*/*win32*
+X: qga/*win32*
 F: qemu.nsi
 
 ARM Machines
-- 
2.1.4


