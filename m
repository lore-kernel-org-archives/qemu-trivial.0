Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VXZoD-0000hp-I6
	for mharc-qemu-trivial@gnu.org; Sat, 19 Oct 2013 12:55:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48225)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1VXZo4-0000h4-Fl
	for qemu-trivial@nongnu.org; Sat, 19 Oct 2013 12:55:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1VXZnt-0003S8-Qh
	for qemu-trivial@nongnu.org; Sat, 19 Oct 2013 12:55:16 -0400
Received: from qmta10.emeryville.ca.mail.comcast.net ([76.96.30.17]:44517)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1VXZnt-0003OW-IL
	for qemu-trivial@nongnu.org; Sat, 19 Oct 2013 12:55:05 -0400
Received: from omta01.emeryville.ca.mail.comcast.net ([76.96.30.11])
	by qmta10.emeryville.ca.mail.comcast.net with comcast
	id f4jQ1m0020EPchoAA4v3mX; Sat, 19 Oct 2013 16:55:03 +0000
Received: from red.redhat.com ([82.68.109.172])
	by omta01.emeryville.ca.mail.comcast.net with comcast
	id f4sg1m00P3jCnES8M4sptA; Sat, 19 Oct 2013 16:53:01 +0000
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Date: Sat, 19 Oct 2013 17:52:33 +0100
Message-Id: <1382201553-6561-1-git-send-email-eblake@redhat.com>
X-Mailer: git-send-email 1.8.3.1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=comcast.net;
	s=q20121106; t=1382201703;
	bh=NV3yvjKs0J4Zewan8tFzohQurPBelw55CGv9g8rZ6Fg=;
	h=Received:Received:From:To:Subject:Date:Message-Id;
	b=U6Ck0ARgltWb1NQaWGOKzFznmZZmbcjAjv9iUhBt52kghHZwUhLmF3jAX0bNP4koM
	KxqcsAliBffNo0OuQmZKwPgJ59fRXEAiAQ4iLsquhRnQkwysU3SRvocDg3pDn27n2S
	A4PbQPamJwFsJuFiyGsVE1OIOJPr6Ln1Xu6+P0pED00f+7l+C40XiVmDWNLD7UXU9Q
	s10oiFztt4g7J6DXNmey7TTL2R8BWXSirD3B+6xGGAMty6VeEpyFDJJsfqZhvyi93L
	FJ4uVy2yw1WlCbyeWJPsfunnSO8vILvV7RMXL7kljk+QRWNKnIHxxg3EjBEgL9osGb
	qaoTjkF5Myvqw==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 76.96.30.17
Cc: kwolf@redhat.com, qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] qapi: fix documentation example
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
X-List-Received-Date: Sat, 19 Oct 2013 16:55:24 -0000

The QMP wire format uses "", not '', around strings.

* docs/qapi-code-gen.txt: Fix typo.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 docs/qapi-code-gen.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/qapi-code-gen.txt b/docs/qapi-code-gen.txt
index 91f44d0..0728f36 100644
--- a/docs/qapi-code-gen.txt
+++ b/docs/qapi-code-gen.txt
@@ -164,7 +164,7 @@ This example allows using both of the following example objects:
  { "file": "my_existing_block_device_id" }
  { "file": { "driver": "file",
              "readonly": false,
-             'filename': "/tmp/mydisk.qcow2" } }
+             "filename": "/tmp/mydisk.qcow2" } }


 === Commands ===
-- 
1.8.3.1


