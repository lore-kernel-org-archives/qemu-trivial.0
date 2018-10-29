Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gH82A-0003TU-NU
	for mharc-qemu-trivial@gnu.org; Mon, 29 Oct 2018 09:56:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37717)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1gH826-0003KC-Ua
	for qemu-trivial@nongnu.org; Mon, 29 Oct 2018 09:56:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1gH826-0003H0-3b
	for qemu-trivial@nongnu.org; Mon, 29 Oct 2018 09:56:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44430)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1gH81k-0002xo-0d; Mon, 29 Oct 2018 09:56:22 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 19FD87DF9B;
	Mon, 29 Oct 2018 13:56:16 +0000 (UTC)
Received: from localhost (ovpn-116-92.ams2.redhat.com [10.36.116.92])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9759A600C5;
	Mon, 29 Oct 2018 13:56:15 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: <qemu-devel@nongnu.org>
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
	Fam Zheng <famz@redhat.com>, Li Qiang <liq3ea@gmail.com>,
	qemu-trivial@nongnu.org
Date: Mon, 29 Oct 2018 13:56:06 +0000
Message-Id: <20181029135607.4485-2-stefanha@redhat.com>
In-Reply-To: <20181029135607.4485-1-stefanha@redhat.com>
References: <20181029135607.4485-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Mon, 29 Oct 2018 13:56:16 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PULL 1/2] util: aio-posix: fix a typo
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
X-List-Received-Date: Mon, 29 Oct 2018 13:56:43 -0000

From: Li Qiang <liq3ea@gmail.com>

Cc: qemu-trivial@nongnu.org
Signed-off-by: Li Qiang <liq3ea@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Fam Zheng <famz@redhat.com>
Message-id: 1538964972-3223-1-git-send-email-liq3ea@gmail.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 util/aio-posix.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/util/aio-posix.c b/util/aio-posix.c
index 621b3025d8..51c41ed3c9 100644
--- a/util/aio-posix.c
+++ b/util/aio-posix.c
@@ -40,7 +40,7 @@ struct AioHandler
 
 #ifdef CONFIG_EPOLL_CREATE1
 
-/* The fd number threashold to switch to epoll */
+/* The fd number threshold to switch to epoll */
 #define EPOLL_ENABLE_THRESHOLD 64
 
 static void aio_epoll_disable(AioContext *ctx)
-- 
2.17.2


