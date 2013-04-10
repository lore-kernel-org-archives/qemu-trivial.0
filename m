Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UQ0Ry-000876-5W
	for mharc-qemu-trivial@gnu.org; Wed, 10 Apr 2013 15:12:54 -0400
Received: from eggs.gnu.org ([208.118.235.92]:40073)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1UQ0Ru-00086d-RA
	for qemu-trivial@nongnu.org; Wed, 10 Apr 2013 15:12:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1UQ0Rt-00006U-N0
	for qemu-trivial@nongnu.org; Wed, 10 Apr 2013 15:12:50 -0400
Received: from qmta01.emeryville.ca.mail.comcast.net
	([2001:558:fe2d:43:76:96:30:16]:55527)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1UQ0Rt-00006C-De
	for qemu-trivial@nongnu.org; Wed, 10 Apr 2013 15:12:49 -0400
Received: from omta01.emeryville.ca.mail.comcast.net ([76.96.30.11])
	by qmta01.emeryville.ca.mail.comcast.net with comcast
	id NDa11l00L0EPchoA1KCoo3; Wed, 10 Apr 2013 19:12:48 +0000
Received: from red.redhat.com ([24.10.251.25])
	by omta01.emeryville.ca.mail.comcast.net with comcast
	id NKCk1l00U0ZdyUg8MKCnZn; Wed, 10 Apr 2013 19:12:48 +0000
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 10 Apr 2013 13:12:44 -0600
Message-Id: <1365621164-17079-1-git-send-email-eblake@redhat.com>
X-Mailer: git-send-email 1.8.1.4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=comcast.net;
	s=q20121106; t=1365621168;
	bh=7zqIj8DnBIk6iQfRazLIHsFhOGfIApARe7pZL9RF5Pc=;
	h=Received:Received:From:To:Subject:Date:Message-Id;
	b=gEHtJAc5wJXuOizXB530SKY49itiyUavuRYnIxBdyzVZUbaUDYMjtpIL3PX/hFYuN
	QITuoM14BIl3MkU3XN2DPndl8HqcD/RxqwAC6zXqStWrl5Et0VleB/08fwqErLa2Pt
	EBVGeVPG7GZSPKegnvx2LLjlCHYn2374yRU1ayj+qA9qUKa3N0D+scwpZ7Bv8QL4BM
	XoSxvZDgF/6rb3xsRf31Nl/ooocRPQ17dcutEVkXyHqiuY81q73HUXrSBpf8yEqq5l
	QGiBPdQZ5RXmhShSNpyKRVdfdkEIFPnxsekIEg1VX44ALcfHX2HQjkIRfp39AZKlyy
	0JWsJqJ1jjpjg==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 2001:558:fe2d:43:76:96:30:16
Cc: kwolf@redhat.com, qemu-trivial@nongnu.org, lcapitulino@redhat.com
Subject: [Qemu-trivial] [PATCH] qapi: use valid JSON in schema
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
X-List-Received-Date: Wed, 10 Apr 2013 19:12:53 -0000

* qapi-schema.json: JSON doesn't allow trailing commas.

Signed-off-by: Eric Blake <eblake@redhat.com>
---

a multi-line regex search for ',[ \n]*[]}]' didn't turn up any
other violations

 qapi-schema.json | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qapi-schema.json b/qapi-schema.json
index db542f6..044517d 100644
--- a/qapi-schema.json
+++ b/qapi-schema.json
@@ -1600,7 +1600,7 @@
 ##
 { 'union': 'BlockdevAction',
   'data': {
-       'blockdev-snapshot-sync': 'BlockdevSnapshot',
+       'blockdev-snapshot-sync': 'BlockdevSnapshot'
    } }

 ##
-- 
1.8.1.4


