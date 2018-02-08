Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ejp0P-0007oS-UA
	for mharc-qemu-trivial@gnu.org; Thu, 08 Feb 2018 11:25:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35889)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1ejp0N-0007jO-9Z
	for qemu-trivial@nongnu.org; Thu, 08 Feb 2018 11:25:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1ejp0M-0005r3-Cx
	for qemu-trivial@nongnu.org; Thu, 08 Feb 2018 11:24:59 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:44094 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1ejp0J-0005qP-QQ; Thu, 08 Feb 2018 11:24:55 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 60CC84023141;
	Thu,  8 Feb 2018 16:24:55 +0000 (UTC)
Received: from localhost (unknown [10.36.112.14])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8B8362166BAE;
	Thu,  8 Feb 2018 16:24:54 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Date: Thu,  8 Feb 2018 17:24:47 +0100
Message-Id: <20180208162447.10851-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Thu, 08 Feb 2018 16:24:55 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Thu, 08 Feb 2018 16:24:55 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'marcandre.lureau@redhat.com'
	RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-trivial] [PATCH] misc: fix spelling
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
X-List-Received-Date: Thu, 08 Feb 2018 16:25:00 -0000

s/pupulate/populate

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 util/qemu-coroutine-lock.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/util/qemu-coroutine-lock.c b/util/qemu-coroutine-lock.c
index 846ff9167f..3d0152ebec 100644
--- a/util/qemu-coroutine-lock.c
+++ b/util/qemu-coroutine-lock.c
@@ -87,7 +87,7 @@ void qemu_co_queue_run_restart(Coroutine *co)
      * invalid memory.  Therefore, use a temporary queue and do not touc=
h
      * the "co" coroutine as soon as you enter another one.
      *
-     * In its turn resumed "co" can pupulate "co_queue_wakeup" queue wit=
h
+     * In its turn resumed "co" can populate "co_queue_wakeup" queue wit=
h
      * new coroutines to be woken up.  The caller, who has resumed "co",
      * will be responsible for traversing the same queue, which may caus=
e
      * a different wakeup order but not any missing wakeups.
--=20
2.16.1.73.g5832b7e9f2


