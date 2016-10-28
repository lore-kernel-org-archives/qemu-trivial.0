Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c09Vf-0003B3-2r
	for mharc-qemu-trivial@gnu.org; Fri, 28 Oct 2016 11:55:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37085)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1c09Va-00035o-F6
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2016 11:55:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1c09VZ-0003PS-G0
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2016 11:55:54 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:56048)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1c09VQ-0003Gw-NI; Fri, 28 Oct 2016 11:55:44 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id C1C204374A;
	Fri, 28 Oct 2016 18:55:43 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 8B739B66;
	Fri, 28 Oct 2016 18:18:58 +0300 (MSK)
Received: (nullmailer pid 6069 invoked by uid 1000);
	Fri, 28 Oct 2016 15:18:56 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Fri, 28 Oct 2016 18:18:43 +0300
Message-Id: <936c223051cf2a59ad7be9cc353b8426d5a02173.1477667878.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
References: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
References: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 12/23] MAINTAINERS: qemu-trivial information
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
X-List-Received-Date: Fri, 28 Oct 2016 15:55:57 -0000

From: Laurent Vivier <laurent@vivier.eu>

Information about "qemu-trivial" ML can be found in the wiki:

    http://wiki.qemu.org/Contribute/TrivialPatches

But the first place where a developer looks is the file MAINTAINERS.

This also allows the get_maintainer.pl script to display
the qemu-trivial ML address when the mail subject contains "trivial".

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b01fec0..a87965f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -63,6 +63,17 @@ W: http://wiki.qemu.org/SecurityProcess
 M: Michael S. Tsirkin <mst@redhat.com>
 L: secalert@redhat.com
 
+Trivial patches
+---------------
+Trivial patches
+M: Michael Tokarev <mjt@tls.msk.ru>
+M: Laurent Vivier <laurent@vivier.eu>
+S: Maintained
+L: qemu-trivial@nongnu.org
+K: ^Subject:.*(?i)trivial
+T: git git://git.corpit.ru/qemu.git trivial-patches
+T: git git://github.com/vivier/qemu.git trivial-patches
+
 Guest CPU cores (TCG):
 ----------------------
 Overall
-- 
2.1.4


