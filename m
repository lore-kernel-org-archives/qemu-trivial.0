Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WhhSt-0004sS-81
	for mharc-qemu-trivial@gnu.org; Tue, 06 May 2014 11:39:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50207)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1WhhSj-0004fc-Dp
	for qemu-trivial@nongnu.org; Tue, 06 May 2014 11:39:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1WhhSZ-0003Xv-HM
	for qemu-trivial@nongnu.org; Tue, 06 May 2014 11:39:21 -0400
Received: from qmta12.emeryville.ca.mail.comcast.net ([76.96.27.227]:35150)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1WhhSZ-0003Xf-8m
	for qemu-trivial@nongnu.org; Tue, 06 May 2014 11:39:11 -0400
Received: from omta18.emeryville.ca.mail.comcast.net ([76.96.30.74])
	by qmta12.emeryville.ca.mail.comcast.net with comcast
	id yfGN1n0081bwxyc01ff9iw; Tue, 06 May 2014 15:39:09 +0000
Received: from red.redhat.com ([24.10.254.122])
	by omta18.emeryville.ca.mail.comcast.net with comcast
	id yff41n00P2fD5rL8eff8cK; Tue, 06 May 2014 15:39:09 +0000
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  6 May 2014 09:39:03 -0600
Message-Id: <1399390743-21802-1-git-send-email-eblake@redhat.com>
X-Mailer: git-send-email 1.9.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=comcast.net;
	s=q20140121; t=1399390749;
	bh=/OHgHJsbAf4lR9UVGGTkm8FO+DRRB6zTrG4ThZq7VW0=;
	h=Received:Received:From:To:Subject:Date:Message-Id;
	b=fJUb2m30Y3yGT7YcrBpgiJA21giMhwpKqiQaEqKtdTquNP9iqpCmjVcKdRJcb+HQp
	cQNP796n1YH5ppe9FMNyfFbSffgP2jXfigRF/VKHkMpShAnECZGFVpjODArSuG6Yfb
	aDXDEMOaoY7j0WIRhB4TUTkdKf4Hp6+b4jheEJgAl8eFI6VWfKfBFL8yB9I35U5QTu
	dlWit8Ut50JJ3m3jdslf6hXO8/Sj1SB52N4QhvXaJ4kCfYvLtAJq44i6hEhazdYCYC
	uSwMlzDHiQQfkFZz+7wdnYjvhVfZVDNU/f1fRTouI9HI/c8m8Z8MeFtGeVdwkprxcK
	2WiJTohORBDLQ==
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 76.96.27.227
Cc: qemu-trivial@nongnu.org, lcapitulino@redhat.com
Subject: [Qemu-trivial] [PATCH] qmp: use valid JSON in transaction example
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
X-List-Received-Date: Tue, 06 May 2014 15:39:29 -0000

Our example should use the correct quotes to match what someone
could actually pass over the wire.

* qmp-commands.hx: Use correct JSON quotes.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 qmp-commands.hx | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/qmp-commands.hx b/qmp-commands.hx
index ed3ab92..e20fcf0 100644
--- a/qmp-commands.hx
+++ b/qmp-commands.hx
@@ -1165,19 +1165,19 @@ Example:

 -> { "execute": "transaction",
      "arguments": { "actions": [
-         { 'type': 'blockdev-snapshot-sync', 'data' : { "device": "ide-hd0",
+         { "type": "blockdev-snapshot-sync", "data" : { "device": "ide-hd0",
                                          "snapshot-file": "/some/place/my-image",
                                          "format": "qcow2" } },
-         { 'type': 'blockdev-snapshot-sync', 'data' : { "node-name": "myfile",
+         { "type": "blockdev-snapshot-sync", "data" : { "node-name": "myfile",
                                          "snapshot-file": "/some/place/my-image2",
                                          "snapshot-node-name": "node3432",
                                          "mode": "existing",
                                          "format": "qcow2" } },
-         { 'type': 'blockdev-snapshot-sync', 'data' : { "device": "ide-hd1",
+         { "type": "blockdev-snapshot-sync", "data" : { "device": "ide-hd1",
                                          "snapshot-file": "/some/place/my-image2",
                                          "mode": "existing",
                                          "format": "qcow2" } },
-         { 'type': 'blockdev-snapshot-internal-sync', 'data' : {
+         { "type": "blockdev-snapshot-internal-sync", "data" : {
                                          "device": "ide-hd2",
                                          "name": "snapshot0" } } ] } }
 <- { "return": {} }
-- 
1.9.0


