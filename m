Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fa2ta-0004MN-8g
	for mharc-qemu-trivial@gnu.org; Mon, 02 Jul 2018 13:45:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58088)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1fa2tX-0004M3-HE
	for qemu-trivial@nongnu.org; Mon, 02 Jul 2018 13:45:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1fa2tT-0007zx-J6
	for qemu-trivial@nongnu.org; Mon, 02 Jul 2018 13:45:47 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:50704 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1fa2tT-0007xd-DT
	for qemu-trivial@nongnu.org; Mon, 02 Jul 2018 13:45:43 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1FFBD7C6A9
	for <qemu-trivial@nongnu.org>; Mon,  2 Jul 2018 17:45:42 +0000 (UTC)
Received: from localhost (ovpn-112-43.ams2.redhat.com [10.36.112.43])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A84E52166B5D;
	Mon,  2 Jul 2018 17:45:41 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-trivial@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Date: Mon,  2 Jul 2018 19:45:38 +0200
Message-Id: <20180702174538.10683-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Mon, 02 Jul 2018 17:45:42 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Mon, 02 Jul 2018 17:45:42 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'marcandre.lureau@redhat.com'
	RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-trivial] [PATCH] dump: fix a typo
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
X-List-Received-Date: Mon, 02 Jul 2018 17:45:48 -0000

I suppose this is the correct spelling.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 dump.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/dump.c b/dump.c
index 04467b353e..e2956f5f2e 100644
--- a/dump.c
+++ b/dump.c
@@ -1120,7 +1120,7 @@ static uint64_t dump_pfn_to_paddr(DumpState *s, uin=
t64_t pfn)
 /*
  * exam every page and return the page frame number and the address of t=
he page.
  * bufptr can be NULL. note: the blocks here is supposed to reflect gues=
t-phys
- * blocks, so block->target_start and block->target_end should be intera=
l
+ * blocks, so block->target_start and block->target_end should be integr=
al
  * multiples of the target page size.
  */
 static bool get_next_page(GuestPhysBlock **blockptr, uint64_t *pfnptr,
--=20
2.18.0.rc1


