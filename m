Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UEGb9-0003Kl-FH
	for mharc-qemu-trivial@gnu.org; Sat, 09 Mar 2013 05:01:51 -0500
Received: from eggs.gnu.org ([208.118.235.92]:46790)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hutao@cn.fujitsu.com>) id 1UEGb3-0003K1-8E
	for qemu-trivial@nongnu.org; Sat, 09 Mar 2013 05:01:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hutao@cn.fujitsu.com>) id 1UEGay-00073c-2Q
	for qemu-trivial@nongnu.org; Sat, 09 Mar 2013 05:01:45 -0500
Received: from [222.73.24.84] (port=59870 helo=song.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hutao@cn.fujitsu.com>)
	id 1UEGax-00071q-Oc; Sat, 09 Mar 2013 05:01:40 -0500
X-IronPort-AV: E=Sophos;i="4.84,814,1355068800"; 
   d="scan'208";a="6840900"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 09 Mar 2013 17:59:08 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r29A1XCY019812;
	Sat, 9 Mar 2013 18:01:33 +0800
Received: from localhost.localdomain ([10.167.233.156])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013030918002513-729760 ;
	Sat, 9 Mar 2013 18:00:25 +0800 
From: Hu Tao <hutao@cn.fujitsu.com>
To: qemu-devel@nongnu.org
Date: Sat, 9 Mar 2013 18:01:40 +0800
Message-Id: <1362823300-19352-1-git-send-email-hutao@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.1.4
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/03/09 18:00:25,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/03/09 18:00:25,
	Serialize complete at 2013/03/09 18:00:25
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 222.73.24.84
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>
Subject: [Qemu-trivial] [PATCH] hw/baum.c: fix build error about baum.h
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
X-List-Received-Date: Sat, 09 Mar 2013 10:01:50 -0000

commit 08744c98115cfa144ed3493556024e400b2e2573 removes baum.h, but baum.c
still includes it. Remove it from baum.c.

Signed-off-by: Hu Tao <hutao@cn.fujitsu.com>
---
 hw/baum.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/hw/baum.c b/hw/baum.c
index d75b150..d8919d5 100644
--- a/hw/baum.c
+++ b/hw/baum.c
@@ -25,7 +25,6 @@
 #include "char/char.h"
 #include "qemu/timer.h"
 #include "usb.h"
-#include "baum.h"
 #include <brlapi.h>
 #include <brlapi_constants.h>
 #include <brlapi_keycodes.h>
-- 
1.7.2.5


