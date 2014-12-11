Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xz8Qh-0003OW-AS
	for mharc-qemu-trivial@gnu.org; Thu, 11 Dec 2014 13:25:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55727)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xz8QZ-0003AN-R8
	for qemu-trivial@nongnu.org; Thu, 11 Dec 2014 13:25:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xz8QU-0006A6-Si
	for qemu-trivial@nongnu.org; Thu, 11 Dec 2014 13:25:27 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:38728)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Xz8QJ-00066Q-GZ; Thu, 11 Dec 2014 13:25:11 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 5BFC041D44;
	Thu, 11 Dec 2014 21:25:10 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id F36EC8BE;
	Thu, 11 Dec 2014 21:16:16 +0300 (MSK)
Received: (nullmailer pid 22956 invoked by uid 1000);
	Thu, 11 Dec 2014 18:16:15 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 11 Dec 2014 21:15:49 +0300
Message-Id: <b5369dd841b55aa24dd107223e0a08d8624d1b19.1418321644.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.3
In-Reply-To: <cover.1418321644.git.mjt@msgid.tls.msk.ru>
References: <cover.1418321644.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 01/20] qmp: fix typo in input-send-event
	examples
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
X-List-Received-Date: Thu, 11 Dec 2014 18:25:33 -0000

From: Amos Kong <akong@redhat.com>

Lack of two closed bracket in json commands.

Signed-off-by: Amos Kong <akong@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qmp-commands.hx | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qmp-commands.hx b/qmp-commands.hx
index 718dd92..47bcf87 100644
--- a/qmp-commands.hx
+++ b/qmp-commands.hx
@@ -3820,13 +3820,13 @@ Press left mouse button.
 -> { "execute": "x-input-send-event",
     "arguments": { "console": 0,
                    "events": [ { "type": "btn",
-                    "data" : { "down": true, "button": "Left" } } } }
+                    "data" : { "down": true, "button": "Left" } } ] } }
 <- { "return": {} }
 
 -> { "execute": "x-input-send-event",
     "arguments": { "console": 0,
                    "events": [ { "type": "btn",
-                    "data" : { "down": false, "button": "Left" } } } }
+                    "data" : { "down": false, "button": "Left" } } ] } }
 <- { "return": {} }
 
 Example (2):
-- 
2.1.3


