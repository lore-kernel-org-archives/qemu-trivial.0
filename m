Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bnT3D-0002Oa-DT
	for mharc-qemu-trivial@gnu.org; Fri, 23 Sep 2016 12:10:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57498)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1bnT3B-0002Jr-NJ
	for qemu-trivial@nongnu.org; Fri, 23 Sep 2016 12:10:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1bnT3A-0000Y6-O4
	for qemu-trivial@nongnu.org; Fri, 23 Sep 2016 12:10:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50614)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1bnT31-0000LC-Q6; Fri, 23 Sep 2016 12:09:59 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4C268C0528A3;
	Fri, 23 Sep 2016 16:09:59 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-56.ams2.redhat.com [10.36.116.56])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u8NG9vqu011237; Fri, 23 Sep 2016 12:09:57 -0400
From: Thomas Huth <thuth@redhat.com>
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, qemu-block@nongnu.org
Date: Fri, 23 Sep 2016 18:09:56 +0200
Message-Id: <1474646996-30421-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Fri, 23 Sep 2016 16:09:59 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] MAINTAINERS: Add some more headers to the
 IDE section
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
X-List-Received-Date: Fri, 23 Sep 2016 16:10:10 -0000

The folder include/hw/ide/ belongs to the IDE section.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d8a0cfc..acf6d6c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -791,6 +791,7 @@ M: John Snow <jsnow@redhat.com>
 L: qemu-block@nongnu.org
 S: Supported
 F: include/hw/ide.h
+F: include/hw/ide/
 F: hw/ide/
 F: hw/block/block.c
 F: hw/block/cdrom.c
-- 
1.8.3.1


