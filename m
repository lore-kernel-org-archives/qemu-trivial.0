Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W6DyT-0002w4-71
	for mharc-qemu-trivial@gnu.org; Thu, 23 Jan 2014 01:41:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42733)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stewart@river.localdomain>) id 1W6CKT-0000NB-A5
	for qemu-trivial@nongnu.org; Wed, 22 Jan 2014 23:55:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stewart@river.localdomain>) id 1W6CKE-0008Nh-Rw
	for qemu-trivial@nongnu.org; Wed, 22 Jan 2014 23:55:49 -0500
Received: from e28smtp05.in.ibm.com ([122.248.162.5]:43282)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stewart@river.localdomain>) id 1W6CKE-0008NE-3b
	for qemu-trivial@nongnu.org; Wed, 22 Jan 2014 23:55:34 -0500
Received: from /spool/local
	by e28smtp05.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <stewart@river.localdomain>;
	Thu, 23 Jan 2014 10:25:31 +0530
Received: from d28dlp01.in.ibm.com (9.184.220.126)
	by e28smtp05.in.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Thu, 23 Jan 2014 10:25:29 +0530
Received: from d28relay05.in.ibm.com (d28relay05.in.ibm.com [9.184.220.62])
	by d28dlp01.in.ibm.com (Postfix) with ESMTP id A8121E004A;
	Thu, 23 Jan 2014 10:28:29 +0530 (IST)
Received: from d28av05.in.ibm.com (d28av05.in.ibm.com [9.184.220.67])
	by d28relay05.in.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	s0N4tTgm9437478; Thu, 23 Jan 2014 10:25:29 +0530
Received: from d28av05.in.ibm.com (localhost [127.0.0.1])
	by d28av05.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
	s0N4tSPg006876; Thu, 23 Jan 2014 10:25:28 +0530
Received: from river.localdomain (river.au.ibm.com [9.185.121.78])
	by d28av05.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
	s0N4tQc1006786; Thu, 23 Jan 2014 10:25:28 +0530
Received: by river.localdomain (Postfix, from userid 1000)
	id 13E0A23B68FB; Thu, 23 Jan 2014 15:55:26 +1100 (EST)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Date: Thu, 23 Jan 2014 15:54:56 +1100
Message-Id: <1390452896-20146-1-git-send-email-stewart@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.4.2
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 14012304-8256-0000-0000-00000B2181FB
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 122.248.162.5
X-Mailman-Approved-At: Thu, 23 Jan 2014 01:41:11 -0500
Cc: qemu-trivial@nongnu.org, Stewart Smith <stewart@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PATCH] configure: helpfully output package names
	for some missing dependencies.
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
X-List-Received-Date: Thu, 23 Jan 2014 04:55:58 -0000

This just makes it a tiny bit easier for new developers to get started
by making it easy to see what package they need to install to get
the dependency.

Signed-off-by: Stewart Smith <stewart@linux.vnet.ibm.com>
---
 configure | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 3782a6a..87303f6 100755
--- a/configure
+++ b/configure
@@ -1532,7 +1532,9 @@ EOF
         :
     else
         error_exit "zlib check failed" \
-            "Make sure to have the zlib libs and headers installed."
+            "Make sure to have the zlib libs and headers installed." \
+            "Debian/Ubuntu: zlib1g-dev" \
+            "Fedora/RHEL: zlib-devel"
     fi
 fi
 libs_softmmu="$libs_softmmu -lz"
@@ -2348,7 +2350,9 @@ if $pkg_config --atleast-version=$glib_req_ver gthread-2.0; then
     LIBS="$glib_libs $LIBS"
     libs_qga="$glib_libs $libs_qga"
 else
-    error_exit "glib-$glib_req_ver required to compile QEMU"
+    error_exit "glib-$glib_req_ver required to compile QEMU."\
+               "Debian/Ubuntu: libglib2.0-dev" \
+               "Fedora/RHEL: glib2-devel"
 fi
 
 ##########################################
@@ -2380,6 +2384,8 @@ else
     error_exit "pixman not present. Your options:" \
         "  (1) Preferred: Install the pixman devel package (any recent" \
         "      distro should have packages as Xorg needs pixman too)." \
+	"      Ubuntu/Debian: libpixman-1-dev" \
+        "      Fedora/RHEL: pixman-devel"\
         "  (2) Fetch the pixman submodule, using:" \
         "      git submodule update --init pixman"
   fi
@@ -2656,6 +2662,8 @@ EOF
     # have neither and want - prompt for system/submodule install
     error_exit "DTC not present. Your options:" \
         "  (1) Preferred: Install the DTC devel package" \
+	"      Ubuntu/Debian: libfdt-dev" \
+        "      Fedora/RHEL: libfdt-devel" \
         "  (2) Fetch the DTC submodule, using:" \
         "      git submodule update --init dtc"
   else
-- 
1.8.4.2


