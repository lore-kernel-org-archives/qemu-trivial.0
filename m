Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bn9UG-0007nP-97
	for mharc-qemu-trivial@gnu.org; Thu, 22 Sep 2016 15:16:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40855)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1bn9UE-0007jW-4O
	for qemu-trivial@nongnu.org; Thu, 22 Sep 2016 15:16:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1bn9UC-0002F2-8G
	for qemu-trivial@nongnu.org; Thu, 22 Sep 2016 15:16:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42315)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1bn9U4-000276-Vs; Thu, 22 Sep 2016 15:16:37 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2195A7CDE0;
	Thu, 22 Sep 2016 19:16:36 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-41.ams2.redhat.com [10.36.116.41])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u8MJGYnu020143; Thu, 22 Sep 2016 15:16:34 -0400
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Anthony Green <green@moxielogic.com>
Cc: qemu-trivial@nongnu.org
Date: Thu, 22 Sep 2016 21:16:33 +0200
Message-Id: <1474571793-32758-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 22 Sep 2016 19:16:36 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] MAINTAINERS: Add files to the Moxie section.
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
X-List-Received-Date: Thu, 22 Sep 2016 19:16:47 -0000

The hw/moxie/ folder and default-configs/moxie-softmmu.mak
obviously belong to the Moxie CPU.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c6297c2..9da3d09 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -157,6 +157,8 @@ M: Anthony Green <green@moxielogic.com>
 S: Maintained
 F: target-moxie/
 F: disas/moxie.c
+F: hw/moxie/
+F: default-configs/moxie-softmmu.mak
 
 OpenRISC
 M: Jia Liu <proljc@gmail.com>
-- 
1.8.3.1


