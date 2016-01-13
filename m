Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aJSPH-000565-65
	for mharc-qemu-trivial@gnu.org; Wed, 13 Jan 2016 15:52:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45259)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sits@sucs.org>) id 1aJSPF-00052s-1q
	for qemu-trivial@nongnu.org; Wed, 13 Jan 2016 15:52:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sits@sucs.org>) id 1aJSPE-0002Td-3R
	for qemu-trivial@nongnu.org; Wed, 13 Jan 2016 15:52:36 -0500
Received: from silver.sucs.swan.ac.uk ([137.44.10.1]:54608)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sits@sucs.org>)
	id 1aJSP9-0002TB-JR; Wed, 13 Jan 2016 15:52:31 -0500
Received: from sits by silver.sucs.swan.ac.uk with local (Exim 4.80)
	(envelope-from <sits@sucs.org>)
	id 1aJSP2-0006n5-89; Wed, 13 Jan 2016 20:52:25 +0000
From: Sitsofe Wheeler <sitsofe@yahoo.com>
To: qemu-devel@nongnu.org
Date: Wed, 13 Jan 2016 20:50:26 +0000
Message-Id: <1452718226-25001-1-git-send-email-sitsofe@yahoo.com>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 137.44.10.1
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Sitsofe Wheeler <sitsofe@yahoo.com>
Subject: [Qemu-trivial] [PATCH] docs: Style the command and its options in
	the synopsis
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
X-List-Received-Date: Wed, 13 Jan 2016 20:52:38 -0000

Signed-off-by: Sitsofe Wheeler <sitsofe@yahoo.com>
---
 fsdev/virtfs-proxy-helper.texi | 2 +-
 qemu-doc.texi                  | 8 ++++----
 qemu-ga.texi                   | 2 +-
 qemu-img.texi                  | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/fsdev/virtfs-proxy-helper.texi b/fsdev/virtfs-proxy-helper.texi
index e60e3b9..9a25d7e 100644
--- a/fsdev/virtfs-proxy-helper.texi
+++ b/fsdev/virtfs-proxy-helper.texi
@@ -1,6 +1,6 @@
 @example
 @c man begin SYNOPSIS
-usage: virtfs-proxy-helper options
+@command{virtfs-proxy-helper} @var{options}
 @c man end
 @end example
 
diff --git a/qemu-doc.texi b/qemu-doc.texi
index 7bc3882..ca4d9de 100644
--- a/qemu-doc.texi
+++ b/qemu-doc.texi
@@ -259,7 +259,7 @@ Linux should boot and give you a prompt.
 
 @example
 @c man begin SYNOPSIS
-usage: qemu-system-i386 [options] [@var{disk_image}]
+@command{qemu-system-i386} [@var{options}] [@var{disk_image}]
 @c man end
 @end example
 
@@ -1406,7 +1406,7 @@ no type is given, the HCI logic corresponds to @code{-bt hci,vlan=0}.
 This USB device implements the USB Transport Layer of HCI.  Example
 usage:
 @example
-qemu-system-i386 [...OPTIONS...] -usbdevice bt:hci,vlan=3 -bt device:keyboard,vlan=3
+@command{qemu-system-i386} [...@var{OPTIONS}...] @option{-usbdevice} bt:hci,vlan=3 @option{-bt} device:keyboard,vlan=3
 @end example
 @end table
 
@@ -2755,7 +2755,7 @@ qemu-i386 /usr/local/qemu-i386/wine/bin/wine \
 @subsection Command line options
 
 @example
-usage: qemu-i386 [-h] [-d] [-L path] [-s size] [-cpu model] [-g port] [-B offset] [-R size] program [arguments...]
+@command{qemu-i386} [@option{-h]} [@option{-d]} [@option{-L} @var{path}] [@option{-s} @var{size}] [@option{-cpu} @var{model}] [@option{-g} @var{port}] [@option{-B} @var{offset}] [@option{-R} @var{size}] @var{program} [@var{arguments}...]
 @end example
 
 @table @option
@@ -2897,7 +2897,7 @@ qemu-sparc64 /bin/ls
 @subsection Command line options
 
 @example
-usage: qemu-sparc64 [-h] [-d] [-L path] [-s size] [-bsd type] program [arguments...]
+@command{qemu-sparc64} [@option{-h]} [@option{-d]} [@option{-L} @var{path}] [@option{-s} @var{size}] [@option{-bsd} @var{type}] @var{program} [@var{arguments}...]
 @end example
 
 @table @option
diff --git a/qemu-ga.texi b/qemu-ga.texi
index 536a9b5..0e53bf6 100644
--- a/qemu-ga.texi
+++ b/qemu-ga.texi
@@ -1,6 +1,6 @@
 @example
 @c man begin SYNOPSIS
-usage: qemu-ga [OPTIONS]
+@command{qemu-ga} [@var{OPTIONS}]
 @c man end
 @end example
 
diff --git a/qemu-img.texi b/qemu-img.texi
index 55c6be3..7163a10 100644
--- a/qemu-img.texi
+++ b/qemu-img.texi
@@ -1,6 +1,6 @@
 @example
 @c man begin SYNOPSIS
-usage: qemu-img command [command options]
+@command{qemu-img} @var{command} [@var{command} @var{options}]
 @c man end
 @end example
 
-- 
2.4.3


