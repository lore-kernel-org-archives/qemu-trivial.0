Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wk12Z-00043T-Db
	for mharc-qemu-trivial@gnu.org; Mon, 12 May 2014 20:57:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60277)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kroosec@gmail.com>) id 1Wjzl2-0000Gp-5Z
	for qemu-trivial@nongnu.org; Mon, 12 May 2014 19:35:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kroosec@gmail.com>) id 1Wjzkw-0007DK-6f
	for qemu-trivial@nongnu.org; Mon, 12 May 2014 19:35:44 -0400
Received: from mail-wi0-x22d.google.com ([2a00:1450:400c:c05::22d]:51629)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kroosec@gmail.com>)
	id 1Wjzkj-000749-Ua; Mon, 12 May 2014 19:35:26 -0400
Received: by mail-wi0-f173.google.com with SMTP id bs8so5355111wib.12
	for <multiple recipients>; Mon, 12 May 2014 16:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=VtriVcgqd1KSvr7I/EW9jpN+ZbVNn5Xxo+dQMrTDGHw=;
	b=N0xsqGS64REO3IZHkPe6e93A+kPv0ELw+fw5awyWpGQIdzYHOrC8UyFTTIRnjr4Qmj
	HT75KWDhDwQm6flPxHeuS1DN7nnOWaJzFuDkFZzTro8EfsoI7lLlHjle9dSqsUQHLJCw
	/X7U3EU0EynXtgNisqHp+mXY3ID+W/VO6FOLdscQ3nUABL037v7Fj13puRfFzau2tgll
	QhwfOGWFLy/LiYC5CkDjepRbtChMbkHafhPVFK2mCpLAwFt3p24cV/WEDS9jv8qyQvmc
	r39pSkh3qv2AYVruxAMOpuCedhJ/on7cXUKEu7kiLEpuVcbWs1ilL2SxKIZFCrc7E8B4
	7npw==
X-Received: by 10.180.97.10 with SMTP id dw10mr18006818wib.38.1399937724731;
	Mon, 12 May 2014 16:35:24 -0700 (PDT)
Received: from localhost.localdomain ([41.103.114.211])
	by mx.google.com with ESMTPSA id
	pj5sm18659355wic.20.2014.05.12.16.35.22 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 12 May 2014 16:35:24 -0700 (PDT)
From: Hani Benhabiles <kroosec@gmail.com>
To: qemu-devel@nongnu.org
Date: Tue, 13 May 2014 00:35:15 +0100
Message-Id: <1399937716-6086-1-git-send-email-kroosec@gmail.com>
X-Mailer: git-send-email 1.8.3.2
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::22d
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, kwolf@redhat.com,
	stefanha@redhat.com
Subject: [Qemu-trivial] [PATCH 1/2] nbd: Close socket on negotiation failure.
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
X-List-Received-Date: Tue, 13 May 2014 00:57:54 -0000

Otherwise, the nbd client may hang waiting for the server response.

Signed-off-by: Hani Benhabiles <hani@linux.com>
---

Quick method to trigger such behaviour:

(qemu) nbd_server_start localhost:10809
(qemu) nbd_server_add sd0
$ nbd-client localhost 10809 -name AAAA /dev/nbd0
Negotiation: ..

(Client will hang indefinitely.)

 blockdev-nbd.c | 4 ++--
 qemu-nbd.c     | 4 +++-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/blockdev-nbd.c b/blockdev-nbd.c
index 922cf56..b60b66d 100644
--- a/blockdev-nbd.c
+++ b/blockdev-nbd.c
@@ -27,8 +27,8 @@ static void nbd_accept(void *opaque)
     socklen_t addr_len = sizeof(addr);
 
     int fd = accept(server_fd, (struct sockaddr *)&addr, &addr_len);
-    if (fd >= 0) {
-        nbd_client_new(NULL, fd, nbd_client_put);
+    if (fd >= 0 && !nbd_client_new(NULL, fd, nbd_client_put)) {
+        close(fd);
     }
 }
 
diff --git a/qemu-nbd.c b/qemu-nbd.c
index eed79fa..f70e4b0 100644
--- a/qemu-nbd.c
+++ b/qemu-nbd.c
@@ -369,8 +369,10 @@ static void nbd_accept(void *opaque)
         return;
     }
 
-    if (fd >= 0 && nbd_client_new(exp, fd, nbd_client_closed)) {
+    if (nbd_client_new(exp, fd, nbd_client_closed)) {
         nb_fds++;
+    } else {
+        close(fd);
     }
 }
 
-- 
1.8.3.2


