Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ry4kO-0003Y1-QE
	for mharc-qemu-trivial@gnu.org; Thu, 16 Feb 2012 12:03:56 -0500
Received: from eggs.gnu.org ([140.186.70.92]:41070)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1Ry4kF-0002wc-LT
	for qemu-trivial@nongnu.org; Thu, 16 Feb 2012 12:03:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1Ry4k8-0004Il-7k
	for qemu-trivial@nongnu.org; Thu, 16 Feb 2012 12:03:47 -0500
Received: from cantor2.suse.de ([195.135.220.15]:56956 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1Ry4jt-0004GJ-0K; Thu, 16 Feb 2012 12:03:25 -0500
Received: from relay2.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id 37E95906EB;
	Thu, 16 Feb 2012 18:03:23 +0100 (CET)
From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
To: qemu-devel@nongnu.org
Date: Thu, 16 Feb 2012 18:03:19 +0100
Message-Id: <1329411799-4266-3-git-send-email-afaerber@suse.de>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <1329411799-4266-1-git-send-email-afaerber@suse.de>
References: <1329411799-4266-1-git-send-email-afaerber@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [Qemu-trivial] [PATCH 2/2] qom: Fix identifiers in documentation
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
X-List-Received-Date: Thu, 16 Feb 2012 17:03:53 -0000

Fixes gtk-doc warnings.

Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
---
 include/qemu/object.h |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/qemu/object.h b/include/qemu/object.h
index c871254..5179c0c 100644
--- a/include/qemu/object.h
+++ b/include/qemu/object.h
@@ -486,7 +486,7 @@ void object_finalize(void *obj);
 Object *object_dynamic_cast(Object *obj, const char *typename);
=20
 /**
- * @object_dynamic_cast_assert:
+ * object_dynamic_cast_assert:
  *
  * See object_dynamic_cast() for a description of the parameters of this
  * function.  The only difference in behavior is that this function asse=
rts
@@ -730,7 +730,7 @@ void object_property_set(Object *obj, struct Visitor =
*v, const char *name,
                          struct Error **errp);
=20
 /**
- * @object_property_get_type:
+ * object_property_get_type:
  * @obj: the object
  * @name: the name of the property
  * @errp: returns an error if this function fails
--=20
1.7.7


