Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bBOJy-0004TZ-RE
	for mharc-qemu-trivial@gnu.org; Fri, 10 Jun 2016 11:26:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46824)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1bBOJw-0004Rf-O0
	for qemu-trivial@nongnu.org; Fri, 10 Jun 2016 11:26:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1bBOJu-0007le-QO
	for qemu-trivial@nongnu.org; Fri, 10 Jun 2016 11:26:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36678)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1bBOJq-0007l6-DZ; Fri, 10 Jun 2016 11:25:58 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D99444DB08;
	Fri, 10 Jun 2016 15:25:56 +0000 (UTC)
Received: from thh440s.fritz.box (vpn1-6-25.ams2.redhat.com [10.36.6.25])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5AFPtuo013270; Fri, 10 Jun 2016 11:25:55 -0400
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-trivial@nongnu.org
Date: Fri, 10 Jun 2016 17:25:54 +0200
Message-Id: <1465572354-3083-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 10 Jun 2016 15:25:56 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] configure: Rename CONFIG_QGA_NTDDDISK into
 CONFIG_QGA_NTDDSCSI
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
X-List-Received-Date: Fri, 10 Jun 2016 15:26:05 -0000

There is no CONFIG_QGA_NTDDDISK define used anywhere in the QEMU
sources. Looking at the changelog and qga/commands-win32.c, it
seems like this should be called CONFIG_QGA_NTDDSCSI instead.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 8c2f90b..55019d6 100755
--- a/configure
+++ b/configure
@@ -4965,7 +4965,7 @@ if test "$mingw32" = "yes" ; then
     echo "WIN_SDK=\"$win_sdk\"" >> $config_host_mak
   fi
   if test "$guest_agent_ntddscsi" = "yes" ; then
-    echo "CONFIG_QGA_NTDDDISK=y" >> $config_host_mak
+    echo "CONFIG_QGA_NTDDSCSI=y" >> $config_host_mak
   fi
   if test "$guest_agent_msi" = "yes"; then
     echo "QEMU_GA_MSI_ENABLED=yes" >> $config_host_mak  
-- 
1.8.3.1


