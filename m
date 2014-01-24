Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W6VkY-0000O2-Qv
	for mharc-qemu-trivial@gnu.org; Thu, 23 Jan 2014 20:40:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33578)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stewart@river.localdomain>) id 1W6VkJ-0008Ss-MM
	for qemu-trivial@nongnu.org; Thu, 23 Jan 2014 20:39:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stewart@river.localdomain>) id 1W6VkA-0000SP-5y
	for qemu-trivial@nongnu.org; Thu, 23 Jan 2014 20:39:47 -0500
Received: from e28smtp07.in.ibm.com ([122.248.162.7]:46321)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stewart@river.localdomain>) id 1W6Vk9-0000RV-H9
	for qemu-trivial@nongnu.org; Thu, 23 Jan 2014 20:39:38 -0500
Received: from /spool/local
	by e28smtp07.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <stewart@river.localdomain>;
	Fri, 24 Jan 2014 07:09:31 +0530
Received: from d28dlp02.in.ibm.com (9.184.220.127)
	by e28smtp07.in.ibm.com (192.168.1.137) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Fri, 24 Jan 2014 07:09:29 +0530
Received: from d28relay05.in.ibm.com (d28relay05.in.ibm.com [9.184.220.62])
	by d28dlp02.in.ibm.com (Postfix) with ESMTP id EE257394003F;
	Fri, 24 Jan 2014 07:09:28 +0530 (IST)
Received: from d28av03.in.ibm.com (d28av03.in.ibm.com [9.184.220.65])
	by d28relay05.in.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	s0O1dSDT8323528; Fri, 24 Jan 2014 07:09:29 +0530
Received: from d28av03.in.ibm.com (localhost [127.0.0.1])
	by d28av03.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
	s0O1dS0H030628; Fri, 24 Jan 2014 07:09:28 +0530
Received: from river.localdomain (river.au.ibm.com [9.185.121.78])
	by d28av03.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
	s0O1dRtv030594; Fri, 24 Jan 2014 07:09:28 +0530
Received: by river.localdomain (Postfix, from userid 1000)
	id 5680E2391FB6; Fri, 24 Jan 2014 12:39:27 +1100 (EST)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Date: Fri, 24 Jan 2014 12:39:06 +1100
Message-Id: <1390527551-22069-2-git-send-email-stewart@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <1390527551-22069-1-git-send-email-stewart@linux.vnet.ibm.com>
References: <1390452896-20146-1-git-send-email-stewart@linux.vnet.ibm.com>
	<1390527551-22069-1-git-send-email-stewart@linux.vnet.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 14012401-8878-0000-0000-00000A95AACE
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 122.248.162.7
Cc: qemu-trivial@nongnu.org, Stewart Smith <stewart@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PATCH v2 1/6] configure: add hint of libfdt to DTC
	dependency not found message
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
X-List-Received-Date: Fri, 24 Jan 2014 01:39:57 -0000

Most distros package it as libfdt, and mentioning libfdt here makes it
much easier to find the package you're missing.

Signed-off-by: Stewart Smith <stewart@linux.vnet.ibm.com>
---
 configure | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 3782a6a..8b6e64a 100755
--- a/configure
+++ b/configure
@@ -2654,8 +2654,8 @@ EOF
     fdt_libs="-L\$(BUILD_DIR)/dtc/libfdt $fdt_libs"
   elif test "$fdt" = "yes" ; then
     # have neither and want - prompt for system/submodule install
-    error_exit "DTC not present. Your options:" \
-        "  (1) Preferred: Install the DTC devel package" \
+    error_exit "DTC (libfdt) not present. Your options:" \
+        "  (1) Preferred: Install the DTC (libfdt) devel package" \
         "  (2) Fetch the DTC submodule, using:" \
         "      git submodule update --init dtc"
   else
-- 
1.8.4.2


