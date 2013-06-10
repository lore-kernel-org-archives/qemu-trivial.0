Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Um20R-0000DM-OS
	for mharc-qemu-trivial@gnu.org; Mon, 10 Jun 2013 09:19:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40059)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rjones@redhat.com>) id 1Um20K-0008U5-J6
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 09:19:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rjones@redhat.com>) id 1Um20J-0003cl-CB
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 09:19:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60941)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rjones@redhat.com>)
	id 1Um20B-0003aQ-NG; Mon, 10 Jun 2013 09:19:15 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r5ADJFjX030851
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 10 Jun 2013 09:19:15 -0400
Received: from choo.home.annexia.org (vpn1-6-48.ams2.redhat.com [10.36.6.48])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with
	ESMTP id r5ADJDew017178; Mon, 10 Jun 2013 09:19:13 -0400
From: "Richard W.M. Jones" <rjones@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 10 Jun 2013 14:19:07 +0100
Message-Id: <1370870347-22080-1-git-send-email-rjones@redhat.com>
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, kwolf@redhat.com, stefanha@redhat.com
Subject: [Qemu-trivial] [PATCH] curl: Don't set curl options on the handle
	just before it's going to be deleted.
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
X-List-Received-Date: Mon, 10 Jun 2013 13:19:30 -0000

From: "Richard W.M. Jones" <rjones@redhat.com>

(Found by Kamil Dudka)

Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
---
 block/curl.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/block/curl.c b/block/curl.c
index b634ccf..bf31efe 100644
--- a/block/curl.c
+++ b/block/curl.c
@@ -453,7 +453,6 @@ static int curl_open(BlockDriverState *bs, QDict *options, int flags)
         goto out;
     curl_easy_getinfo(state->curl, CURLINFO_CONTENT_LENGTH_DOWNLOAD, &d);
     curl_easy_setopt(state->curl, CURLOPT_WRITEFUNCTION, (void *)curl_read_cb);
-    curl_easy_setopt(state->curl, CURLOPT_NOBODY, 0);
     if (d)
         s->len = (size_t)d;
     else if(!s->len)
-- 
1.8.2.1


