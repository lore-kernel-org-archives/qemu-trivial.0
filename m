Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZL9Lk-0006u5-2t
	for mharc-qemu-trivial@gnu.org; Fri, 31 Jul 2015 08:23:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40976)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1ZL9Lh-0006oE-St
	for qemu-trivial@nongnu.org; Fri, 31 Jul 2015 08:23:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1ZL9Ld-0002AD-8s
	for qemu-trivial@nongnu.org; Fri, 31 Jul 2015 08:23:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56974)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>)
	id 1ZL9LY-0001zU-9l; Fri, 31 Jul 2015 08:23:32 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id C8012A0CA8;
	Fri, 31 Jul 2015 12:23:31 +0000 (UTC)
Received: from localhost.localdomain.com (vpn1-4-231.ams2.redhat.com
	[10.36.4.231])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t6VCNU81026023; Fri, 31 Jul 2015 08:23:30 -0400
From: "Daniel P. Berrange" <berrange@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 31 Jul 2015 13:23:23 +0100
Message-Id: <1438345403-32467-1-git-send-email-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, "Daniel P. Berrange" <berrange@redhat.com>
Subject: [Qemu-trivial] [PATCH] configure: only add CONFIG_RDMA to
	config-host.h once
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
X-List-Received-Date: Fri, 31 Jul 2015 12:23:42 -0000

For unknown reasons (probably a git rebase merge mistake)

  commit 2da776db4846eadcb808598a5d3484d149773c05
  Author: Michael R. Hines <mrhines@us.ibm.com>
  Date:   Mon Jul 22 10:01:54 2013 -0400

    rdma: core logic

Adds CONFIG_RDMA to config-host.h twice, as can be seen
in the generated file:

 $ grep CONFIG_RDMA config-host.h
 #define CONFIG_RDMA 1
 #define CONFIG_RDMA 1

Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
---
 configure | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/configure b/configure
index a14dc44..8f35400b 100755
--- a/configure
+++ b/configure
@@ -5635,10 +5635,6 @@ if [ "$pixman" = "internal" ]; then
   echo "config-host.h: subdir-pixman" >> $config_host_mak
 fi
 
-if test "$rdma" = "yes" ; then
-echo "CONFIG_RDMA=y" >> $config_host_mak
-fi
-
 if [ "$dtc_internal" = "yes" ]; then
   echo "config-host.h: subdir-dtc" >> $config_host_mak
 fi
-- 
2.4.3


