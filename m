Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aB2nD-0007L2-A0
	for mharc-qemu-trivial@gnu.org; Mon, 21 Dec 2015 10:54:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57185)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1aB2nB-0007HJ-3e
	for qemu-trivial@nongnu.org; Mon, 21 Dec 2015 10:54:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1aB2n6-0003Zl-5O
	for qemu-trivial@nongnu.org; Mon, 21 Dec 2015 10:54:33 -0500
Received: from resqmta-po-04v.sys.comcast.net ([96.114.154.163]:55398)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1aB2n6-0003Z0-0v
	for qemu-trivial@nongnu.org; Mon, 21 Dec 2015 10:54:28 -0500
Received: from resomta-po-09v.sys.comcast.net ([96.114.154.233])
	by resqmta-po-04v.sys.comcast.net with comcast
	id wFsi1r00252QWKC01FuSvU; Mon, 21 Dec 2015 15:54:26 +0000
Received: from red.redhat.com ([24.10.254.122])
	by resomta-po-09v.sys.comcast.net with comcast
	id wFuP1r0042fD5rL01FuRfi; Mon, 21 Dec 2015 15:54:26 +0000
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 21 Dec 2015 08:54:17 -0700
Message-Id: <1450713257-17108-1-git-send-email-eblake@redhat.com>
X-Mailer: git-send-email 2.4.3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=comcast.net;
	s=q20140121; t=1450713266;
	bh=ks4sQWeCqioLjLF/E9e2Fytfzv1MTb44ATfHO91DwEE=;
	h=Received:Received:From:To:Subject:Date:Message-Id;
	b=EqNvhJ6jkSd7RFBjQUhEZITAfiToVQCz61XYuGb9QsCJbB4KB6B6Huf6FgK8C28Oq
	7Ob8VBBhNe0peFLo8ucRhl4Ft8C4aIr+r95h1n3GC5N68XNVErJji18FQxl+MvtvqH
	S41+en6Bm/CVIxI9EHxOaYawEutYiGLMUAUNkEIhfnPSweDAHlY7Z6fWuSfhVk6PtB
	TqLagEakHO5q/1OnWfXAVfP5ShyzquCHaO/XfuDnH+886qfi04MSqGCvSSNiYRSCWQ
	y+fEXMvwHtaizGNu5qchA27VGNccxMS6kvgEstP7JToCPUhWDKv+HK3d7cOvq5eWd2
	VkD0uTaO3hWRg==
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 96.114.154.163
Cc: qemu-trivial@nongnu.org, "Daniel P. Berrange" <berrange@redhat.com>
Subject: [Qemu-trivial] [PATCH] crypto: Fix typo in example
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
X-List-Received-Date: Mon, 21 Dec 2015 15:54:33 -0000

The example code wouldn't even compile, since it did not use
a consistent spelling for the Error ** parameter.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 include/crypto/tlssession.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/crypto/tlssession.h b/include/crypto/tlssession.h
index b38fe69..d356a8d 100644
--- a/include/crypto/tlssession.h
+++ b/include/crypto/tlssession.h
@@ -56,7 +56,7 @@
  *
  * static int mysock_run_tls(int sockfd,
  *                           QCryptoTLSCreds *creds,
- *                           Error *erp)
+ *                           Error *errp)
  * {
  *    QCryptoTLSSession *sess;
  *
-- 
2.4.3


