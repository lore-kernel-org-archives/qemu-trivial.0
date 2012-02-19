Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RzGVS-0004zC-J9
	for mharc-qemu-trivial@gnu.org; Sun, 19 Feb 2012 18:49:26 -0500
Received: from eggs.gnu.org ([140.186.70.92]:59354)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1RzGVP-0004oa-Or
	for qemu-trivial@nongnu.org; Sun, 19 Feb 2012 18:49:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1RzGVO-0001P8-L8
	for qemu-trivial@nongnu.org; Sun, 19 Feb 2012 18:49:23 -0500
Received: from cantor2.suse.de ([195.135.220.15]:35581 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1RzGVM-0001Op-9L; Sun, 19 Feb 2012 18:49:20 -0500
Received: from relay1.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id A8DF694C60;
	Mon, 20 Feb 2012 00:49:14 +0100 (CET)
From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
To: qemu-devel@nongnu.org
Date: Mon, 20 Feb 2012 00:49:07 +0100
Message-Id: <1329695347-9289-1-git-send-email-afaerber@suse.de>
X-Mailer: git-send-email 1.7.7
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, anthony@codemonkey.ws
Subject: [Qemu-trivial] [PATCH] qom: Fix object_initialize_with_type()
	assertion
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
X-List-Received-Date: Sun, 19 Feb 2012 23:49:25 -0000

Assert the object is at least sizeof(Object), not sizeof(ObjectClass).

Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
---
 qom/object.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/qom/object.c b/qom/object.c
index b1ead15..dbfd6a4 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -262,7 +262,7 @@ void object_initialize_with_type(void *data, TypeImpl=
 *type)
     Object *obj =3D data;
=20
     g_assert(type !=3D NULL);
-    g_assert(type->instance_size >=3D sizeof(ObjectClass));
+    g_assert(type->instance_size >=3D sizeof(Object));
=20
     type_class_init(type);
     g_assert(type->abstract =3D=3D false);
--=20
1.7.7


