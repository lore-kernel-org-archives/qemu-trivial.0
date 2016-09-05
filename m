Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bh1UG-0002h2-Qn
	for mharc-qemu-trivial@gnu.org; Mon, 05 Sep 2016 17:31:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55814)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1bh1UE-0002fG-Gs
	for qemu-trivial@nongnu.org; Mon, 05 Sep 2016 17:31:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1bh1UC-0005XH-LW
	for qemu-trivial@nongnu.org; Mon, 05 Sep 2016 17:31:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54494)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1bh1U6-0005Wn-Fz; Mon, 05 Sep 2016 17:31:18 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B6BA281231;
	Mon,  5 Sep 2016 21:31:17 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-104.ams2.redhat.com
	[10.36.116.104])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u85LVFUs006732; Mon, 5 Sep 2016 17:31:16 -0400
From: Thomas Huth <thuth@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Mon,  5 Sep 2016 23:31:15 +0200
Message-Id: <1473111075-25311-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Mon, 05 Sep 2016 21:31:17 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] MAINTAINERS: Add some header files to the PC
 chipset section
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
X-List-Received-Date: Mon, 05 Sep 2016 21:31:27 -0000

These header files obviously belong to the PC chipset (since
their names match the other .c files in this section).

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 60af338..cc69977 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -725,6 +725,10 @@ F: hw/misc/pc-testdev.c
 F: hw/timer/hpet*
 F: hw/timer/i8254*
 F: hw/timer/mc146818rtc*
+F: include/hw/i2c/pm_smbus.h
+F: include/hw/timer/hpet.h
+F: include/hw/timer/i8254*
+F: include/hw/timer/mc146818rtc*
 
 Machine core
 M: Eduardo Habkost <ehabkost@redhat.com>
-- 
1.8.3.1


