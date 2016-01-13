Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aJGg6-0002w7-7f
	for mharc-qemu-trivial@gnu.org; Wed, 13 Jan 2016 03:21:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42637)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1aJGg3-0002sc-Lv
	for qemu-trivial@nongnu.org; Wed, 13 Jan 2016 03:21:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1aJGg2-0001Ne-Pe
	for qemu-trivial@nongnu.org; Wed, 13 Jan 2016 03:21:11 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58717)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1aJGfy-0001My-HE; Wed, 13 Jan 2016 03:21:06 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 7D05F1C5F55;
	Wed, 13 Jan 2016 08:21:05 +0000 (UTC)
Received: from thh440s.fritz.box (vpn1-6-147.ams2.redhat.com [10.36.6.147])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u0D8L2bg023088; Wed, 13 Jan 2016 03:21:03 -0500
From: Thomas Huth <thuth@redhat.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, qemu-devel@nongnu.org,
	Jason Wang <jasowang@redhat.com>
Date: Wed, 13 Jan 2016 09:21:02 +0100
Message-Id: <1452673262-11279-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] qemu-doc: Do not promote deprecated -smb and
	-redir options
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
X-List-Received-Date: Wed, 13 Jan 2016 08:21:12 -0000

Since -smb and -redir are deprecated options, we should not
use them as examples in the documentation anymore.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 qemu-doc.texi | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/qemu-doc.texi b/qemu-doc.texi
index 7bc3882..2596503 100644
--- a/qemu-doc.texi
+++ b/qemu-doc.texi
@@ -1237,9 +1237,9 @@ echo 100 100 > /proc/sys/net/ipv4/ping_group_range
 When using the built-in TFTP server, the router is also the TFTP
 server.
 
-When using the @option{-redir} option, TCP or UDP connections can be
-redirected from the host to the guest. It allows for example to
-redirect X11, telnet or SSH connections.
+When using the @option{'-netdev user,hostfwd=...'} option, TCP or UDP
+connections can be redirected from the host to the guest. It allows for
+example to redirect X11, telnet or SSH connections.
 
 @subsection Connecting VLANs between QEMU instances
 
@@ -1889,7 +1889,8 @@ correctly instructs QEMU to shutdown at the appropriate moment.
 
 @subsubsection Share a directory between Unix and Windows
 
-See @ref{sec_invocation} about the help of the option @option{-smb}.
+See @ref{sec_invocation} about the help of the option
+@option{'-netdev user,smb=...'}.
 
 @subsubsection Windows XP security problem
 
-- 
1.8.3.1


