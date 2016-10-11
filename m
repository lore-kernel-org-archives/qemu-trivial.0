Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1btyr3-0005lk-SL
	for mharc-qemu-trivial@gnu.org; Tue, 11 Oct 2016 11:20:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35161)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1btyqy-0005ha-JH
	for qemu-trivial@nongnu.org; Tue, 11 Oct 2016 11:20:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1btyqx-0004Wv-Pl
	for qemu-trivial@nongnu.org; Tue, 11 Oct 2016 11:20:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35918)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>)
	id 1btyqr-0004UV-AF; Tue, 11 Oct 2016 11:20:21 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C37F2662D;
	Tue, 11 Oct 2016 15:20:20 +0000 (UTC)
Received: from localhost (ovpn-116-23.phx2.redhat.com [10.3.116.23])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9BFKIS2011706; Tue, 11 Oct 2016 11:20:19 -0400
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Date: Tue, 11 Oct 2016 19:20:12 +0400
Message-Id: <20161011152012.3228-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 11 Oct 2016 15:20:20 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] char.h: misc doc fix
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
X-List-Received-Date: Tue, 11 Oct 2016 15:20:32 -0000

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 include/sysemu/char.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sysemu/char.h b/include/sysemu/char.h
index 19dad3f..d0ffdbd 100644
--- a/include/sysemu/char.h
+++ b/include/sysemu/char.h
@@ -380,7 +380,7 @@ int qemu_chr_fe_claim(CharDriverState *s);
 void qemu_chr_fe_claim_no_fail(CharDriverState *s);
=20
 /**
- * @qemu_chr_fe_claim:
+ * @qemu_chr_fe_release:
  *
  * Release a backend for use by another frontend.
  *
--=20
2.10.0


