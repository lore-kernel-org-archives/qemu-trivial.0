Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wlyfy-0003r4-I1
	for mharc-qemu-trivial@gnu.org; Sun, 18 May 2014 06:50:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41970)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kroosec@gmail.com>) id 1Wlyfr-0003jZ-JK
	for qemu-trivial@nongnu.org; Sun, 18 May 2014 06:50:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kroosec@gmail.com>) id 1Wlyfl-0007MH-Ka
	for qemu-trivial@nongnu.org; Sun, 18 May 2014 06:50:35 -0400
Received: from mail-wi0-x230.google.com ([2a00:1450:400c:c05::230]:33977)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kroosec@gmail.com>)
	id 1WlyfY-0007KF-Vs; Sun, 18 May 2014 06:50:17 -0400
Received: by mail-wi0-f176.google.com with SMTP id n15so2826126wiw.9
	for <multiple recipients>; Sun, 18 May 2014 03:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=t+FhLz3Ri42rj+Rg/8/y1qnHjgmBbiLfFVVmcSjk2NY=;
	b=VAJJe8r7XZcnbVRUWJVopwUlmlgmb5fQ8s7PZBl6wPSCQY8SJqPhHjFLdEtAxxchIC
	zbsJ01sy6aLMLcJ47wnRI03sH0iIVyDSFOryoniG9lZsoGK1651Oc2FAN8QNaL2S359K
	e0iHmmSMZSTiylUZfOuhfMp3xvkxIYMSo3+4HW4hEPoAU1KQy5x623kNcWtg2MGAkOY5
	SLVeBszNyZT0qmYhbQyF1H7WBySFCTwtm/wbZMqiNNHnqHulW3TQ/d/9Pb/NblW2XsJs
	De2nMcGo4ZRlQG67aKzo1rgmW8LAF7DA0s6LrNbYj7m5dTUHLQV0hOjAPa77QxSXcPxW
	zEPQ==
X-Received: by 10.180.94.226 with SMTP id df2mr7185235wib.1.1400410216023;
	Sun, 18 May 2014 03:50:16 -0700 (PDT)
Received: from localhost.localdomain ([41.104.79.242])
	by mx.google.com with ESMTPSA id pm6sm2228191wjc.25.2014.05.18.03.50.14
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 18 May 2014 03:50:15 -0700 (PDT)
From: Hani Benhabiles <kroosec@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun, 18 May 2014 11:50:05 +0100
Message-Id: <1400410205-26152-2-git-send-email-kroosec@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1400410205-26152-1-git-send-email-kroosec@gmail.com>
References: <1400410205-26152-1-git-send-email-kroosec@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::230
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, kwolf@redhat.com,
	stefanha@redhat.com
Subject: [Qemu-trivial] [PATCH 2/2] nbd: Don't validate from and len in
	NBD_CMD_DISC.
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
X-List-Received-Date: Sun, 18 May 2014 10:50:41 -0000

These values aren't used in this case.

Currently, the from field in the request sent by the nbd kernel module leading
to a false error message when ending the connection with the client.

$ qemu-nbd some.img -v
// After nbd-client -d /dev/nbd0
nbd.c:nbd_trip():L1031: From: 18446744073709551104, Len: 0, Size: 20971520,
Offset: 0
nbd.c:nbd_trip():L1032: requested operation past EOF--bad client?
nbd.c:nbd_receive_request():L638: read failed

Signed-off-by: Hani Benhabiles <hani@linux.com>
---
 nbd.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/nbd.c b/nbd.c
index e5084b6..dc076d7 100644
--- a/nbd.c
+++ b/nbd.c
@@ -1001,6 +1001,7 @@ static void nbd_trip(void *opaque)
     struct nbd_request request;
     struct nbd_reply reply;
     ssize_t ret;
+    uint32_t type;
 
     TRACE("Reading request.");
     if (client->closing) {
@@ -1023,8 +1024,8 @@ static void nbd_trip(void *opaque)
         reply.error = -ret;
         goto error_reply;
     }
-
-    if ((request.from + request.len) > exp->size) {
+    type = request.type & NBD_CMD_MASK_COMMAND;
+    if (type != NBD_CMD_DISC && (request.from + request.len) > exp->size) {
             LOG("From: %" PRIu64 ", Len: %u, Size: %" PRIu64
             ", Offset: %" PRIu64 "\n",
                     request.from, request.len,
@@ -1033,7 +1034,7 @@ static void nbd_trip(void *opaque)
         goto invalid_request;
     }
 
-    switch (request.type & NBD_CMD_MASK_COMMAND) {
+    switch (type) {
     case NBD_CMD_READ:
         TRACE("Request type is READ");
 
-- 
1.8.3.2


