Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UzqLe-0002HJ-I8
	for mharc-qemu-trivial@gnu.org; Thu, 18 Jul 2013 11:42:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39335)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1UzqLY-000280-Ps
	for qemu-trivial@nongnu.org; Thu, 18 Jul 2013 11:42:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1UzqLV-0001Q9-4H
	for qemu-trivial@nongnu.org; Thu, 18 Jul 2013 11:42:24 -0400
Received: from
	1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.d.1.0.0.b.8.0.1.0.0.2.ip6.arpa
	([2001:8b0:1d0::1]:58852 helo=mnementh.archaic.org.uk)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1UzqLN-0001Ms-St; Thu, 18 Jul 2013 11:42:14 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1UzqLB-0008Dr-SI; Thu, 18 Jul 2013 16:42:01 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu, 18 Jul 2013 16:42:01 +0100
Message-Id: <1374162121-31582-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	patches@linaro.org
Subject: [Qemu-trivial] [PATCH] configure: Provide more helpful message if
	libvte not present
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
X-List-Received-Date: Thu, 18 Jul 2013 15:42:28 -0000

If the system has GTK but not libvte, it's more helpful to
tell the user that libvte is missing than to simply say that
GTK is not present.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Since this confused me today and also iggy on IRC, it seems worth
making the message a little more specific about what's needed.

 configure |   18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/configure b/configure
index cb0f870..9e1cd19 100755
--- a/configure
+++ b/configure
@@ -1697,19 +1697,23 @@ if test "$gtk" != "no"; then
       vtepackage="vte"
       vteversion="0.24.0"
     fi
-    if $pkg_config --exists "$gtkpackage >= $gtkversion" && \
-       $pkg_config --exists "$vtepackage >= $vteversion"; then
+    if ! $pkg_config --exists "$gtkpackage >= $gtkversion"; then
+        if test "$gtk" = "yes" ; then
+            feature_not_found "gtk"
+        fi
+        gtk="no"
+    elif ! $pkg_config --exists "$vtepackage >= $vteversion"; then
+        if test "$gtk" = "yes" ; then
+            error_exit "libvte not found (required for gtk support)"
+        fi
+        gtk="no"
+    else
 	gtk_cflags=`$pkg_config --cflags $gtkpackage 2>/dev/null`
 	gtk_libs=`$pkg_config --libs $gtkpackage 2>/dev/null`
 	vte_cflags=`$pkg_config --cflags $vtepackage 2>/dev/null`
 	vte_libs=`$pkg_config --libs $vtepackage 2>/dev/null`
 	libs_softmmu="$gtk_libs $vte_libs $libs_softmmu"
 	gtk="yes"
-    else
-	if test "$gtk" = "yes" ; then
-	    feature_not_found "gtk"
-	fi
-	gtk="no"
     fi
 fi
 
-- 
1.7.9.5


