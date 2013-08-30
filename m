Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VFV9f-0000h9-Aq
	for mharc-qemu-trivial@gnu.org; Fri, 30 Aug 2013 16:18:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33239)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1VFUUN-0005ve-Ip
	for qemu-trivial@nongnu.org; Fri, 30 Aug 2013 15:36:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1VFUUD-0002OH-2j
	for qemu-trivial@nongnu.org; Fri, 30 Aug 2013 15:36:11 -0400
Received: from qmta12.emeryville.ca.mail.comcast.net ([76.96.27.227]:43716)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1VFUUC-0002Nm-8v
	for qemu-trivial@nongnu.org; Fri, 30 Aug 2013 15:36:00 -0400
Received: from omta22.emeryville.ca.mail.comcast.net ([76.96.30.89])
	by qmta12.emeryville.ca.mail.comcast.net with comcast
	id K4CY1m0031vN32c017bzjy; Fri, 30 Aug 2013 19:35:59 +0000
Received: from red.redhat.com ([24.10.250.254])
	by omta22.emeryville.ca.mail.comcast.net with comcast
	id K7bt1m00S5W4ddU8i7bxCS; Fri, 30 Aug 2013 19:35:58 +0000
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Date: Fri, 30 Aug 2013 13:35:53 -0600
Message-Id: <1377891353-10682-1-git-send-email-eblake@redhat.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=comcast.net;
	s=q20121106; t=1377891359;
	bh=fgrCdiUec/hmRLEl5guS+VsxGwObJaO4LgxNtirNxVs=;
	h=Received:Received:From:To:Subject:Date:Message-Id:MIME-Version:
	Content-Type;
	b=WA6l4wVyfwahTteZmlnZru36IDW9sqwShhg1GOu+wfex74NWcJhLv0N+7dIFv8UpD
	AC7gNMz1+udVBbA5+K0bLTuJjkqIw6f+cX8vmu/Z/IywXVWMFa5g67dVsrAynWZnkX
	s+omZFaqecjv5mh0XRSdbG6Y2zVbM8eZcs5p1+9e+lC1JjlLuWXRjf8BwiTl9HXp3W
	zFccu9+6HOWKxJS6I6EdhnTT6b5Uq7vY6AdfAOy+ZuqDIsK35LTx0OtVyhBjKEkUm3
	wKMa4il841JE2rzKAOysv9adyg16yFabHfaFnroEpihg2EEuwLN0SZ67PMci6rXwTB
	zXNZBDjhS9yLw==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 76.96.27.227
Cc: benoit@irqsave.net, lcapitulino@redhat.com
Subject: [Qemu-trivial] [PATCH] qmp: fix integer usage in examples
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
X-List-Received-Date: Fri, 30 Aug 2013 20:18:50 -0000

* qmp-commands.hx (block_set_io_throttle): Use correct type.

Signed-off-by: Eric Blake <eblake@redhat.com>
---

Noticed while reviewing Benoît's series of "Continuous Leaky Bucket
Throttling" - depending on whose patch goes in first, the other
will have to rebase...

 qmp-commands.hx | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/qmp-commands.hx b/qmp-commands.hx
index bb09e72..87cfdce 100644
--- a/qmp-commands.hx
+++ b/qmp-commands.hx
@@ -1412,12 +1412,12 @@ Arguments:
 Example:

 -> { "execute": "block_set_io_throttle", "arguments": { "device": "virtio0",
-                                               "bps": "1000000",
-                                               "bps_rd": "0",
-                                               "bps_wr": "0",
-                                               "iops": "0",
-                                               "iops_rd": "0",
-                                               "iops_wr": "0" } }
+                                               "bps": 1000000,
+                                               "bps_rd": 0,
+                                               "bps_wr": 0,
+                                               "iops": 0,
+                                               "iops_rd": 0,
+                                               "iops_wr": 0 } }
 <- { "return": {} }

 EQMP
-- 
1.8.3.1


