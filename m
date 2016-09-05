Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bh0FF-00061g-8H
	for mharc-qemu-trivial@gnu.org; Mon, 05 Sep 2016 16:11:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40152)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1bh0FC-0005za-5p
	for qemu-trivial@nongnu.org; Mon, 05 Sep 2016 16:11:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1bh0FB-0007PE-CK
	for qemu-trivial@nongnu.org; Mon, 05 Sep 2016 16:11:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34868)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1bh0F6-0007OC-Ur; Mon, 05 Sep 2016 16:11:45 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3EDFA68B0;
	Mon,  5 Sep 2016 20:11:44 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-104.ams2.redhat.com
	[10.36.116.104])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u85KBgHE011539; Mon, 5 Sep 2016 16:11:43 -0400
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-trivial@nongnu.org
Date: Mon,  5 Sep 2016 22:11:41 +0200
Message-Id: <1473106301-23102-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Mon, 05 Sep 2016 20:11:44 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] MAINTAINERS: Fix wildcard for scsi headers
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
X-List-Received-Date: Mon, 05 Sep 2016 20:11:51 -0000

get_maintainer.pl currently thinks that the scsi headers are
currrently unmaintained. So let's fix the corresponding wildcard
expression.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index d1bacb2..60af338 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -842,7 +842,7 @@ T: git git://github.com/jasowang/qemu.git net
 SCSI
 M: Paolo Bonzini <pbonzini@redhat.com>
 S: Supported
-F: include/hw/scsi*
+F: include/hw/scsi/*
 F: hw/scsi/*
 T: git git://github.com/bonzini/qemu.git scsi-next
 
-- 
1.8.3.1


