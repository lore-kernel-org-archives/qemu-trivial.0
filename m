Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W6Vka-0000Q1-Mb
	for mharc-qemu-trivial@gnu.org; Thu, 23 Jan 2014 20:40:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33602)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stewart@river.localdomain>) id 1W6VkL-0008VA-FS
	for qemu-trivial@nongnu.org; Thu, 23 Jan 2014 20:39:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stewart@river.localdomain>) id 1W6VkA-0000Sk-EQ
	for qemu-trivial@nongnu.org; Thu, 23 Jan 2014 20:39:49 -0500
Received: from e23smtp03.au.ibm.com ([202.81.31.145]:48904)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stewart@river.localdomain>) id 1W6Vk9-0000Rf-KC
	for qemu-trivial@nongnu.org; Thu, 23 Jan 2014 20:39:38 -0500
Received: from /spool/local
	by e23smtp03.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <stewart@river.localdomain>;
	Fri, 24 Jan 2014 11:39:31 +1000
Received: from d23dlp02.au.ibm.com (202.81.31.213)
	by e23smtp03.au.ibm.com (202.81.31.209) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Fri, 24 Jan 2014 11:39:29 +1000
Received: from d23relay03.au.ibm.com (d23relay03.au.ibm.com [9.190.235.21])
	by d23dlp02.au.ibm.com (Postfix) with ESMTP id AEEEB2BB0054;
	Fri, 24 Jan 2014 12:39:28 +1100 (EST)
Received: from d23av03.au.ibm.com (d23av03.au.ibm.com [9.190.234.97])
	by d23relay03.au.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	s0O1dFCg10158376; Fri, 24 Jan 2014 12:39:15 +1100
Received: from d23av03.au.ibm.com (localhost [127.0.0.1])
	by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
	s0O1dRZ5015419; Fri, 24 Jan 2014 12:39:28 +1100
Received: from river.localdomain (river.au.ibm.com [9.185.121.78])
	by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
	s0O1dRGq015416; Fri, 24 Jan 2014 12:39:27 +1100
Received: by river.localdomain (Postfix, from userid 1000)
	id 8F03822DD172; Fri, 24 Jan 2014 12:39:27 +1100 (EST)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Date: Fri, 24 Jan 2014 12:39:11 +1100
Message-Id: <1390527551-22069-7-git-send-email-stewart@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <1390527551-22069-1-git-send-email-stewart@linux.vnet.ibm.com>
References: <1390452896-20146-1-git-send-email-stewart@linux.vnet.ibm.com>
	<1390527551-22069-1-git-send-email-stewart@linux.vnet.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 14012401-6102-0000-0000-000004D4885C
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 202.81.31.145
Cc: qemu-trivial@nongnu.org, Stewart Smith <stewart@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PATCH v2 6/6] configure: helpfully output package
	names for some missing dependencies.
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
X-List-Received-Date: Fri, 24 Jan 2014 01:39:59 -0000

This just makes it a tiny bit easier for new developers to get started
by making it easy to see what package they need to install to get
the dependency.

Signed-off-by: Stewart Smith <stewart@linux.vnet.ibm.com>
---
 configure | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 4ad2de5..cc49cf4 100755
--- a/configure
+++ b/configure
@@ -1540,7 +1540,9 @@ EOF
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
@@ -2356,7 +2358,9 @@ if $pkg_config --atleast-version=$glib_req_ver gthread-2.0; then
     LIBS="$glib_libs $LIBS"
     libs_qga="$glib_libs $libs_qga"
 else
-    error_exit "glib-$glib_req_ver required to compile QEMU"
+    error_exit "glib-$glib_req_ver required to compile QEMU."\
+               "Debian/Ubuntu: libglib2.0-dev" \
+               "Fedora/RHEL: glib2-devel"
 fi
 
 ##########################################
@@ -2388,6 +2392,8 @@ else
     error_exit "pixman not present. Your options:" \
         "  (1) Preferred: Install the pixman devel package (any recent" \
         "      distro should have packages as Xorg needs pixman too)." \
+        "      Ubuntu/Debian: libpixman-1-dev" \
+        "      Fedora/RHEL: pixman-devel"\
         "  (2) Fetch the pixman submodule, using:" \
         "      git submodule update --init pixman"
   fi
@@ -2664,6 +2670,8 @@ EOF
     # have neither and want - prompt for system/submodule install
     error_exit "DTC (libfdt) not present. Your options:" \
         "  (1) Preferred: Install the DTC (libfdt) devel package" \
+        "      Ubuntu/Debian: libfdt-dev" \
+        "      Fedora/RHEL: libfdt-devel" \
         "  (2) Fetch the DTC submodule, using:" \
         "      git submodule update --init dtc"
   else
-- 
1.8.4.2


