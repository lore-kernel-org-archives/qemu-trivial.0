Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bn9js-0004EP-Bu
	for mharc-qemu-trivial@gnu.org; Thu, 22 Sep 2016 15:32:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51740)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1bn9jn-00045v-UV
	for qemu-trivial@nongnu.org; Thu, 22 Sep 2016 15:32:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1bn9jm-0008Aa-5Q
	for qemu-trivial@nongnu.org; Thu, 22 Sep 2016 15:32:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43110)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1bn9jc-0007wQ-Re; Thu, 22 Sep 2016 15:32:40 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 436896A0B;
	Thu, 22 Sep 2016 19:32:40 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-41.ams2.redhat.com [10.36.116.41])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u8MJWcnk018496; Thu, 22 Sep 2016 15:32:39 -0400
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Luiz Capitulino <lcapitulino@redhat.com>
Cc: qemu-trivial@nongnu.org
Date: Thu, 22 Sep 2016 21:32:38 +0200
Message-Id: <1474572758-763-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Thu, 22 Sep 2016 19:32:40 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] MAINTAINERS: Add some more files to the HMP
 section
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
X-List-Received-Date: Thu, 22 Sep 2016 19:32:55 -0000

The hmp-commands-info.hx, hmp.h and include/monitor/hmp-target.h
files were classified as unmaintained. Let's add them to the
HMP section.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9da3d09..3879e1c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1160,8 +1160,9 @@ Human Monitor (HMP)
 M: Luiz Capitulino <lcapitulino@redhat.com>
 S: Maintained
 F: monitor.c
-F: hmp.c
-F: hmp-commands.hx
+F: hmp.[ch]
+F: hmp-commands*.hx
+F: include/monitor/hmp-target.h
 T: git git://repo.or.cz/qemu/qmp-unstable.git queue/qmp
 
 Network device backends
-- 
1.8.3.1


