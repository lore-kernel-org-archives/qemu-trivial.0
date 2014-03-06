Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WLbrc-0001hM-VB
	for mharc-qemu-trivial@gnu.org; Thu, 06 Mar 2014 12:13:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50906)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1WLbra-0001dQ-7h
	for qemu-trivial@nongnu.org; Thu, 06 Mar 2014 12:13:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1WLbrZ-0002JI-G8
	for qemu-trivial@nongnu.org; Thu, 06 Mar 2014 12:13:42 -0500
Received: from qemu.weilnetz.de ([2a03:4000:2:362::1]:38539
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1WLbrV-000299-92; Thu, 06 Mar 2014 12:13:37 -0500
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id D1F0417F6D7; Thu,  6 Mar 2014 18:13:33 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Thu,  6 Mar 2014 18:13:33 +0100
Message-Id: <1394126013-26297-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:2:362::1
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [Qemu-trivial] [PATCH] configure: Prettify message for hosts
	without spice support
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
X-List-Received-Date: Thu, 06 Mar 2014 17:13:43 -0000

Instead of

    spice support     no (/)

configure now prints

    spice support     no

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 configure |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/configure b/configure
index 6ccadc3..212dcd7 100755
--- a/configure
+++ b/configure
@@ -4061,7 +4061,11 @@ echo "vhost-net support $vhost_net"
 echo "vhost-scsi support $vhost_scsi"
 echo "Trace backend     $trace_backend"
 echo "Trace output file $trace_file-<pid>"
+if test "$spice" = "yes"; then
 echo "spice support     $spice ($spice_protocol_version/$spice_server_version)"
+else
+echo "spice support     $spice"
+fi
 echo "rbd support       $rbd"
 echo "xfsctl support    $xfs"
 echo "nss used          $smartcard_nss"
-- 
1.7.10.4


