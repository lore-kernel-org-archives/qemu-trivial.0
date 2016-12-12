Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cGUvO-0001gV-FC
	for mharc-qemu-trivial@gnu.org; Mon, 12 Dec 2016 13:02:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43148)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1cGUSa-00047D-Mu
	for qemu-trivial@nongnu.org; Mon, 12 Dec 2016 12:32:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1cGUSZ-0000x2-UH
	for qemu-trivial@nongnu.org; Mon, 12 Dec 2016 12:32:20 -0500
Received: from mx1.redhat.com ([209.132.183.28]:45084)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1cGUSY-0000v8-4P; Mon, 12 Dec 2016 12:32:18 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 53A6E19CF46;
	Mon, 12 Dec 2016 17:32:17 +0000 (UTC)
Received: from localhost (ovpn-116-27.ams2.redhat.com [10.36.116.27])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uBCHWFpO030073; Mon, 12 Dec 2016 12:32:16 -0500
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Date: Mon, 12 Dec 2016 20:31:50 +0300
Message-Id: <20161212173151.18092-2-marcandre.lureau@redhat.com>
In-Reply-To: <20161212173151.18092-1-marcandre.lureau@redhat.com>
References: <20161212173151.18092-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Mon, 12 Dec 2016 17:32:17 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 2/3] object.h: improve OBJECT/OBJECT_CLASS doc
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
X-List-Received-Date: Mon, 12 Dec 2016 17:32:21 -0000

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 include/qom/object.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/qom/object.h b/include/qom/object.h
index c5e6fc1f5d..c5456db05d 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -467,7 +467,7 @@ struct TypeInfo
  * OBJECT:
  * @obj: A derivative of #Object
  *
- * Converts an object to a #Object.  Since all objects are #Objects,
+ * Converts an object to a #Object.  Since all objects are #Object,
  * this function will always succeed.
  */
 #define OBJECT(obj) \
@@ -477,8 +477,8 @@ struct TypeInfo
  * OBJECT_CLASS:
  * @class: A derivative of #ObjectClass.
  *
- * Converts a class to an #ObjectClass.  Since all objects are #Objects,
- * this function will always succeed.
+ * Converts a class to an #ObjectClass.  Since all classes are
+ * #ObjectClass, this function will always succeed.
  */
 #define OBJECT_CLASS(class) \
     ((ObjectClass *)(class))
--=20
2.11.0


