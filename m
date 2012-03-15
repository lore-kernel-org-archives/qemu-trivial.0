Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S8FO9-0007Kt-AN
	for mharc-qemu-trivial@gnu.org; Thu, 15 Mar 2012 14:27:01 -0400
Received: from eggs.gnu.org ([208.118.235.92]:46697)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcody@redhat.com>) id 1S8FNk-0006V2-4T
	for qemu-trivial@nongnu.org; Thu, 15 Mar 2012 14:27:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jcody@redhat.com>) id 1S8FNi-0005VS-HK
	for qemu-trivial@nongnu.org; Thu, 15 Mar 2012 14:26:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52553)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcody@redhat.com>)
	id 1S8FNZ-0005Tv-Mh; Thu, 15 Mar 2012 14:26:25 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q2FIQLmC015692
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Thu, 15 Mar 2012 14:26:21 -0400
Received: from localhost (ovpn-112-61.phx2.redhat.com [10.3.112.61])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q2FIQJ4u014816
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO);
	Thu, 15 Mar 2012 14:26:21 -0400
From: Jeff Cody <jcody@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 15 Mar 2012 14:26:18 -0400
Message-Id: <dc308d51a38be11f3de7dbc3f66e4716f8b559b3.1331835902.git.jcody@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com
Subject: [Qemu-trivial] [PATCH] qemu-ga: for w32,
	fix leaked handle ov.hEvent in ga_channel_write()
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
X-List-Received-Date: Thu, 15 Mar 2012 18:27:00 -0000

In the function ga_channel_write(), the handle ov.hEvent is created
by the call to CreateEvent(). However, the handle is not closed
prior to the function return.

This patch closes the handle before the return of the function.

Kudos to Paolo Bonzini for spotting this bug.

Signed-off-by: Jeff Cody <jcody@redhat.com>
---
 qga/channel-win32.c |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/qga/channel-win32.c b/qga/channel-win32.c
index 190251b..16bf44a 100644
--- a/qga/channel-win32.c
+++ b/qga/channel-win32.c
@@ -259,6 +259,10 @@ static GIOStatus ga_channel_write(GAChannel *c, const char *buf, size_t size,
         *count = written;
     }
 
+    if (ov.hEvent) {
+        CloseHandle(ov.hEvent);
+        ov.hEvent = NULL;
+    }
     return status;
 }
 
-- 
1.7.9.rc2.1.g69204


