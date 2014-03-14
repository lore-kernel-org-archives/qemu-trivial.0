Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WOYPx-0006uu-6N
	for mharc-qemu-trivial@gnu.org; Fri, 14 Mar 2014 16:09:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38543)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1WOYPv-0006sH-4I
	for qemu-trivial@nongnu.org; Fri, 14 Mar 2014 16:09:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1WOYPu-0007sl-DE
	for qemu-trivial@nongnu.org; Fri, 14 Mar 2014 16:09:19 -0400
Received: from qemu.weilnetz.de ([2a03:4000:2:362::1]:49639
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1WOYPs-0007sA-Cz; Fri, 14 Mar 2014 16:09:16 -0400
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id 48F6B17F973; Fri, 14 Mar 2014 21:09:12 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Fri, 14 Mar 2014 21:09:10 +0100
Message-Id: <1394827750-28635-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:2:362::1
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: [Qemu-trivial] [PATCH] configure: Show trace output file
	conditionally
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
X-List-Received-Date: Fri, 14 Mar 2014 20:09:20 -0000

It is only used with the simple trace backend.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 configure |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/configure b/configure
index 1efb438..6eebd2c 100755
--- a/configure
+++ b/configure
@@ -4092,7 +4092,9 @@ echo "libcap-ng support $cap_ng"
 echo "vhost-net support $vhost_net"
 echo "vhost-scsi support $vhost_scsi"
 echo "Trace backend     $trace_backend"
+if test "$trace_backend" = "simple"; then
 echo "Trace output file $trace_file-<pid>"
+fi
 if test "$spice" = "yes"; then
 echo "spice support     $spice ($spice_protocol_version/$spice_server_version)"
 else
-- 
1.7.10.4


