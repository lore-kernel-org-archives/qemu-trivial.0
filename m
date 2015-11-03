Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZtZre-0003xi-F5
	for mharc-qemu-trivial@gnu.org; Tue, 03 Nov 2015 06:34:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51632)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1ZtZrX-0003px-VP
	for qemu-trivial@nongnu.org; Tue, 03 Nov 2015 06:34:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1ZtZrT-0003dy-Rh
	for qemu-trivial@nongnu.org; Tue, 03 Nov 2015 06:34:51 -0500
Received: from mx1.redhat.com ([209.132.183.28]:46635)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>)
	id 1ZtZrK-0003cq-Il; Tue, 03 Nov 2015 06:34:38 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 261A18F4E7;
	Tue,  3 Nov 2015 11:34:38 +0000 (UTC)
Received: from localhost.localdomain.com (vpn1-6-163.ams2.redhat.com
	[10.36.6.163])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tA3BYa6N032507; Tue, 3 Nov 2015 06:34:37 -0500
From: "Daniel P. Berrange" <berrange@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  3 Nov 2015 11:34:31 +0000
Message-Id: <1446550471-19118-1-git-send-email-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, "Daniel P. Berrange" <berrange@redhat.com>
Subject: [Qemu-trivial] [PATCH] configure: remove help string for 'vnc-tls'
	option
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Nov 2015 11:34:57 -0000

The '--enable-vnc-tls' option to configure was removed in

  commit 3e305e4a4752f70c0b5c3cf5b43ec957881714f7
  Author: Daniel P. Berrange <berrange@redhat.com>
  Date:   Thu Aug 6 14:39:32 2015 +0100

    ui: convert VNC server to use QCryptoTLSSession

This removes the corresponding help string.

Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
---
 configure | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configure b/configure
index b4a3488..761a4d6 100755
--- a/configure
+++ b/configure
@@ -1340,7 +1340,6 @@ disabled with --disable-FEATURE, default is enabled if available:
   vte             vte support for the gtk UI
   curses          curses UI
   vnc             VNC UI support
-  vnc-tls         TLS encryption for VNC server
   vnc-sasl        SASL encryption for VNC server
   vnc-jpeg        JPEG lossy compression for VNC server
   vnc-png         PNG compression for VNC server
-- 
2.5.0


