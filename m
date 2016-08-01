Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bU5PS-00041s-DT
	for mharc-qemu-trivial@gnu.org; Mon, 01 Aug 2016 01:05:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52637)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1bU5PQ-0003zI-1I
	for qemu-trivial@nongnu.org; Mon, 01 Aug 2016 01:05:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1bU5PO-0006GV-7E
	for qemu-trivial@nongnu.org; Mon, 01 Aug 2016 01:04:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37050)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>)
	id 1bU5PI-0006Fv-NJ; Mon, 01 Aug 2016 01:04:52 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E02FFC0885C6;
	Mon,  1 Aug 2016 05:04:50 +0000 (UTC)
Received: from lemon.nay.redhat.com (dhcp-15-153.nay.redhat.com [10.66.15.153])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u7154nOH001007; Mon, 1 Aug 2016 01:04:50 -0400
From: Fam Zheng <famz@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Date: Mon,  1 Aug 2016 13:04:48 +0800
Message-Id: <1470027888-24381-1-git-send-email-famz@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Mon, 01 Aug 2016 05:04:51 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] curl: Cast fd to int for DPRINTF
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 01 Aug 2016 05:05:01 -0000

Currently "make docker-test-mingw@fedora" has a warning like:

    /tmp/qemu-test/src/block/curl.c: In function 'curl_sock_cb':
    /tmp/qemu-test/src/block/curl.c:172:6: warning: format '%d' expects
    argument of type 'int', but argument 4 has type 'curl_socket_t {aka long
    long unsigned int}'
         DPRINTF("CURL (AIO): Sock action %d on fd %d\n", action, fd);
          ^
    cc1: all warnings being treated as errors

Cast to int to suppress it.

Signed-off-by: Fam Zheng <famz@redhat.com>
---
 block/curl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/curl.c b/block/curl.c
index da9f5e8..426fb4d 100644
--- a/block/curl.c
+++ b/block/curl.c
@@ -169,7 +169,7 @@ static int curl_sock_cb(CURL *curl, curl_socket_t fd, int action,
     state->sock_fd = fd;
     s = state->s;
 
-    DPRINTF("CURL (AIO): Sock action %d on fd %d\n", action, fd);
+    DPRINTF("CURL (AIO): Sock action %d on fd %d\n", action, (int)fd);
     switch (action) {
         case CURL_POLL_IN:
             aio_set_fd_handler(s->aio_context, fd, false,
-- 
2.7.4


