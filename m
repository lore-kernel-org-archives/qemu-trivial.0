Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XtB8d-000211-Ks
	for mharc-qemu-trivial@gnu.org; Tue, 25 Nov 2014 03:06:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50870)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <akong@redhat.com>) id 1XtB8V-0001rH-Jw
	for qemu-trivial@nongnu.org; Tue, 25 Nov 2014 03:06:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <akong@redhat.com>) id 1XtB8P-0002PX-Fq
	for qemu-trivial@nongnu.org; Tue, 25 Nov 2014 03:06:11 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56155)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <akong@redhat.com>)
	id 1XtB8C-0002Oj-VS; Tue, 25 Nov 2014 03:05:53 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sAP85pgh020917
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 25 Nov 2014 03:05:51 -0500
Received: from air.redhat.com (vpn1-115-205.nay.redhat.com [10.66.115.205])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sAP85lOj018833; Tue, 25 Nov 2014 03:05:48 -0500
From: Amos Kong <akong@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 25 Nov 2014 16:05:56 +0800
Message-Id: <1416902756-26593-1-git-send-email-akong@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, kraxel@redhat.com
Subject: [Qemu-trivial] [PATCH] qmp: fix typo in input-send-event examples
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
X-List-Received-Date: Tue, 25 Nov 2014 08:06:17 -0000

Lack of two closed bracket in json commands.

Signed-off-by: Amos Kong <akong@redhat.com>
---
 qmp-commands.hx | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qmp-commands.hx b/qmp-commands.hx
index 8812401..bb2e380 100644
--- a/qmp-commands.hx
+++ b/qmp-commands.hx
@@ -3818,13 +3818,13 @@ Press left mouse button.
 -> { "execute": "input-send-event",
     "arguments": { "console": 0,
                    "events": [ { "type": "btn",
-                    "data" : { "down": true, "button": "Left" } } } }
+                    "data" : { "down": true, "button": "Left" } } ] } }
 <- { "return": {} }
 
 -> { "execute": "input-send-event",
     "arguments": { "console": 0,
                    "events": [ { "type": "btn",
-                    "data" : { "down": false, "button": "Left" } } } }
+                    "data" : { "down": false, "button": "Left" } } ] } }
 <- { "return": {} }
 
 Example (2):
-- 
1.9.3


