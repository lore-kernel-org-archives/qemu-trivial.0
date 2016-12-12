Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cGVAz-00013N-Qk
	for mharc-qemu-trivial@gnu.org; Mon, 12 Dec 2016 13:18:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43138)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1cGUSa-00046r-03
	for qemu-trivial@nongnu.org; Mon, 12 Dec 2016 12:32:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1cGUSZ-0000wT-8K
	for qemu-trivial@nongnu.org; Mon, 12 Dec 2016 12:32:20 -0500
Received: from mx1.redhat.com ([209.132.183.28]:42520)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1cGUSU-0000tB-OE; Mon, 12 Dec 2016 12:32:14 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5DD0A4DD6D;
	Mon, 12 Dec 2016 17:32:13 +0000 (UTC)
Received: from localhost (ovpn-116-27.ams2.redhat.com [10.36.116.27])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uBCHWBuq028312; Mon, 12 Dec 2016 12:32:12 -0500
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Date: Mon, 12 Dec 2016 20:31:49 +0300
Message-Id: <20161212173151.18092-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Mon, 12 Dec 2016 17:32:13 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 1/3] object.h: spelling fix
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
X-List-Received-Date: Mon, 12 Dec 2016 17:32:20 -0000

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 include/qom/object.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/qom/object.h b/include/qom/object.h
index 5ecc2d166d..c5e6fc1f5d 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -432,7 +432,7 @@ struct Object
  * @class_base_init: This function is called for all base classes after =
all
  *   parent class initialization has occurred, but before the class itse=
lf
  *   is initialized.  This is the function to use to undo the effects of
- *   memcpy from the parent class to the descendents.
+ *   memcpy from the parent class to the descendants.
  * @class_finalize: This function is called during class destruction and=
 is
  *   meant to release and dynamic parameters allocated by @class_init.
  * @class_data: Data to pass to the @class_init, @class_base_init and
--=20
2.11.0


