Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UIxcF-0007kZ-OI
	for mharc-qemu-trivial@gnu.org; Fri, 22 Mar 2013 04:46:23 -0400
Received: from eggs.gnu.org ([208.118.235.92]:48366)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1UIxcD-0007g5-CG
	for qemu-trivial@nongnu.org; Fri, 22 Mar 2013 04:46:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1UIxcC-00048z-Cr
	for qemu-trivial@nongnu.org; Fri, 22 Mar 2013 04:46:21 -0400
Received: from [222.73.24.84] (port=36758 helo=song.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>)
	id 1UIxc9-00047G-TW; Fri, 22 Mar 2013 04:46:18 -0400
X-IronPort-AV: E=Sophos;i="4.84,891,1355068800"; 
   d="scan'208";a="6924235"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 22 Mar 2013 16:43:40 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r2M8k9gf025176;
	Fri, 22 Mar 2013 16:46:10 +0800
Received: from liguang.fnst.cn.fujitsu.com ([10.167.233.147])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013032216443987-1079426 ;
	Fri, 22 Mar 2013 16:44:39 +0800 
From: liguang <lig.fnst@cn.fujitsu.com>
To: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Date: Fri, 22 Mar 2013 16:44:13 +0800
Message-Id: <1363941854-27111-1-git-send-email-lig.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.2.5
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/03/22 16:44:40,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/03/22 16:44:41,
	Serialize complete at 2013/03/22 16:44:41
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 222.73.24.84
Cc: liguang <lig.fnst@cn.fujitsu.com>
Subject: [Qemu-trivial] [Qemu-devel][PATCH] gitignore: ignore more files
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
X-List-Received-Date: Fri, 22 Mar 2013 08:46:22 -0000

ignore *.patch, *.gcda, *.gcno

Signed-off-by: liguang <lig.fnst@cn.fujitsu.com>
---
 .gitignore |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/.gitignore b/.gitignore
index 27ad002..9c234a3 100644
--- a/.gitignore
+++ b/.gitignore
@@ -80,6 +80,9 @@ fsdev/virtfs-proxy-helper.pod
 *.swp
 *.orig
 .pc
+*.patch
+*.gcda
+*.gcno
 patches
 pc-bios/bios-pq/status
 pc-bios/vgabios-pq/status
-- 
1.7.2.5


