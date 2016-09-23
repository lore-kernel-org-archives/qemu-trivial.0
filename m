Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bnQNz-0003HL-76
	for mharc-qemu-trivial@gnu.org; Fri, 23 Sep 2016 09:19:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35366)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1bnQNt-0003Ah-Ka
	for qemu-trivial@nongnu.org; Fri, 23 Sep 2016 09:19:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1bnQNr-0000ht-Ow
	for qemu-trivial@nongnu.org; Fri, 23 Sep 2016 09:19:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48962)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1bnQNm-0000gV-30; Fri, 23 Sep 2016 09:19:14 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4B53EC00BB38;
	Fri, 23 Sep 2016 13:19:13 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-56.ams2.redhat.com [10.36.116.56])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u8NDJBeE005849; Fri, 23 Sep 2016 09:19:11 -0400
From: Thomas Huth <thuth@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Date: Fri, 23 Sep 2016 15:19:10 +0200
Message-Id: <1474636750-7177-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Fri, 23 Sep 2016 13:19:13 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] MAINTAINERS: Add include/hw/audio/ to audio
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
X-List-Received-Date: Fri, 23 Sep 2016 13:19:25 -0000

audio.h and pcspk.h are recognized as maintained files now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9fcb901..f49ee36 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1032,6 +1032,7 @@ M: Gerd Hoffmann <kraxel@redhat.com>
 S: Maintained
 F: audio/
 F: hw/audio/
+F: include/hw/audio/
 F: tests/ac97-test.c
 F: tests/es1370-test.c
 F: tests/intel-hda-test.c
-- 
1.8.3.1


