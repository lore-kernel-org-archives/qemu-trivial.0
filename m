Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bnT4W-0003dS-O2
	for mharc-qemu-trivial@gnu.org; Fri, 23 Sep 2016 12:11:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57921)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1bnT4T-0003Zr-MP
	for qemu-trivial@nongnu.org; Fri, 23 Sep 2016 12:11:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1bnT4S-0001Z5-Ml
	for qemu-trivial@nongnu.org; Fri, 23 Sep 2016 12:11:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46704)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1bnT4N-0001Ti-LB; Fri, 23 Sep 2016 12:11:23 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 31C76A757D;
	Fri, 23 Sep 2016 16:11:23 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-56.ams2.redhat.com [10.36.116.56])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u8NGBLOT027550; Fri, 23 Sep 2016 12:11:22 -0400
From: Thomas Huth <thuth@redhat.com>
To: Michael S Tsirkin <mst@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Date: Fri, 23 Sep 2016 18:11:21 +0200
Message-Id: <1474647081-30554-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Fri, 23 Sep 2016 16:11:23 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] MAINTAINERS: Add some more files to the
 virtio section
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
X-List-Received-Date: Fri, 23 Sep 2016 16:11:30 -0000

Makefile.objs and trace-events in hw/virtio/ were not covered
by MAINTAINERS yet.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index acf6d6c..6902885 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -928,6 +928,8 @@ virtio
 M: Michael S. Tsirkin <mst@redhat.com>
 S: Supported
 F: hw/*/virtio*
+F: hw/virtio/Makefile.objs
+F: hw/virtio/trace-events
 F: net/vhost-user.c
 F: include/hw/virtio/
 F: tests/virtio-balloon-test.c
-- 
1.8.3.1


