Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xyztm-0006Sp-SM
	for mharc-qemu-trivial@gnu.org; Thu, 11 Dec 2014 04:19:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39152)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1Xyztf-0006JZ-36
	for qemu-trivial@nongnu.org; Thu, 11 Dec 2014 04:19:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1XyztY-0004Cg-V8
	for qemu-trivial@nongnu.org; Thu, 11 Dec 2014 04:18:55 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51736)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>)
	id 1XyztL-00047A-J4; Thu, 11 Dec 2014 04:18:35 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sBB9IWcX016158
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Thu, 11 Dec 2014 04:18:33 -0500
Received: from localhost (ovpn-112-61.ams2.redhat.com [10.36.112.61])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sBB9IVPE023826; Thu, 11 Dec 2014 04:18:32 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 11 Dec 2014 09:18:29 +0000
Message-Id: <1418289509-25393-1-git-send-email-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Subject: [Qemu-trivial] [PATCH] hpet: increase spelling precision
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
X-List-Received-Date: Thu, 11 Dec 2014 09:19:01 -0000

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/timer/hpet.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/timer/hpet.c b/hw/timer/hpet.c
index e160e8f..d8bc231 100644
--- a/hw/timer/hpet.c
+++ b/hw/timer/hpet.c
@@ -1,5 +1,5 @@
 /*
- *  High Precisition Event Timer emulation
+ *  High Precision Event Timer emulation
  *
  *  Copyright (c) 2007 Alexander Graf
  *  Copyright (c) 2008 IBM Corporation
-- 
2.1.0


