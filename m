Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1botM6-0001Ib-UF
	for mharc-qemu-trivial@gnu.org; Tue, 27 Sep 2016 10:27:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46371)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1botM2-0001AQ-JD
	for qemu-trivial@nongnu.org; Tue, 27 Sep 2016 10:27:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1botLy-0003Eh-8M
	for qemu-trivial@nongnu.org; Tue, 27 Sep 2016 10:27:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60892)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1botLo-0003C3-0w; Tue, 27 Sep 2016 10:27:16 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 57F6661979;
	Tue, 27 Sep 2016 14:27:14 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-40.ams2.redhat.com [10.36.116.40])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u8RERCKg031437; Tue, 27 Sep 2016 10:27:13 -0400
From: Thomas Huth <thuth@redhat.com>
To: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Date: Tue, 27 Sep 2016 16:27:11 +0200
Message-Id: <1474986431-2701-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 27 Sep 2016 14:27:14 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] MAINTAINERS: Add some more pattern to
 recognize all win32 related files
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
X-List-Received-Date: Tue, 27 Sep 2016 14:27:33 -0000

The get_maintainer.pl script currently thinks that the win32
related files in the util and include folders are currently
unmaintained. Thus let's add some additional wildcards to
match these files.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6902885..a5dec30 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -324,6 +324,8 @@ L: qemu-devel@nongnu.org
 M: Stefan Weil <sw@weilnetz.de>
 S: Maintained
 F: *win32*
+F: */*win32*
+F: include/*/*win32*
 F: qemu.nsi
 
 ARM Machines
-- 
1.8.3.1


