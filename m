Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1blwFm-0005yt-Oh
	for mharc-qemu-trivial@gnu.org; Mon, 19 Sep 2016 06:56:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34189)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1blwFi-0005wH-GO
	for qemu-trivial@nongnu.org; Mon, 19 Sep 2016 06:56:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1blwFc-0008Vb-11
	for qemu-trivial@nongnu.org; Mon, 19 Sep 2016 06:56:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52028)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>)
	id 1blwFV-0008TP-FA; Mon, 19 Sep 2016 06:56:33 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3D06C35F1E1;
	Mon, 19 Sep 2016 10:56:31 +0000 (UTC)
Received: from localhost (ovpn-112-50.ams2.redhat.com [10.36.112.50])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8JAuTI6021667; Mon, 19 Sep 2016 06:56:30 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: <qemu-trivial@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>
Date: Mon, 19 Sep 2016 11:56:26 +0100
Message-Id: <1474282586-12211-1-git-send-email-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Mon, 19 Sep 2016 10:56:31 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] qemu-options.hx: fix -chardev ringbuf typos
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
X-List-Received-Date: Mon, 19 Sep 2016 10:56:49 -0000

Clean up the documentation for -chardev ringbuf.  There is a stray
closing parenthesis and the comma is unnecessary.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 qemu-options.hx | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 0b621bb..094733d 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2372,7 +2372,7 @@ console with the given dimensions.
 @item -chardev ringbuf ,id=@var{id} [,size=@var{size}]
 
 Create a ring buffer with fixed size @option{size}.
-@var{size} must be a power of two, and defaults to @code{64K}).
+@var{size} must be a power of two and defaults to @code{64K}.
 
 @item -chardev file ,id=@var{id} ,path=@var{path}
 
-- 
2.7.4


