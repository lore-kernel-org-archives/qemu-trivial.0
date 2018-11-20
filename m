Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPClK-0002dt-F2
	for mharc-qemu-trivial@gnu.org; Tue, 20 Nov 2018 15:36:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48793)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gPClH-0002c4-VT
	for qemu-trivial@nongnu.org; Tue, 20 Nov 2018 15:36:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gPClH-0005TG-2v
	for qemu-trivial@nongnu.org; Tue, 20 Nov 2018 15:36:43 -0500
Received: from mx1.redhat.com ([209.132.183.28]:55392)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1gPCl8-0005FM-IX; Tue, 20 Nov 2018 15:36:36 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E94DD308426A;
	Tue, 20 Nov 2018 20:36:32 +0000 (UTC)
Received: from red.redhat.com (ovpn-121-142.rdu2.redhat.com [10.10.121.142])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 51EE484ED;
	Tue, 20 Nov 2018 20:36:32 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Date: Tue, 20 Nov 2018 14:36:28 -0600
Message-Id: <20181120203628.2367003-1-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Tue, 20 Nov 2018 20:36:32 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] misc: Avoid UTF-8 in error messages
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
X-List-Received-Date: Tue, 20 Nov 2018 20:36:44 -0000

While most developers are now using UTF-8 environments, it's
harder to guarantee that error messages will be output to
a multibyte locale. Rather than risking error messages that
get corrupted into mojibake when the user runs qemu in a
non-multibyte locale, let's stick to straight ASCII error
messages, rather than assuming that our use of UTF-8 in source
code string constants will work unchanged in other locales.

Reported-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 hw/misc/tmp105.c | 2 +-
 hw/misc/tmp421.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/misc/tmp105.c b/hw/misc/tmp105.c
index 0918f3a6ea2..f6d7163273a 100644
--- a/hw/misc/tmp105.c
+++ b/hw/misc/tmp105.c
@@ -79,7 +79,7 @@ static void tmp105_set_temperature(Object *obj, Visitor=
 *v, const char *name,
         return;
     }
     if (temp >=3D 128000 || temp < -128000) {
-        error_setg(errp, "value %" PRId64 ".%03" PRIu64 " =C2=B0C is out=
 of range",
+        error_setg(errp, "value %" PRId64 ".%03" PRIu64 " C is out of ra=
nge",
                    temp / 1000, temp % 1000);
         return;
     }
diff --git a/hw/misc/tmp421.c b/hw/misc/tmp421.c
index c234044305d..eeb11000f0f 100644
--- a/hw/misc/tmp421.c
+++ b/hw/misc/tmp421.c
@@ -153,7 +153,7 @@ static void tmp421_set_temperature(Object *obj, Visit=
or *v, const char *name,
     }

     if (temp >=3D maxs[ext_range] || temp < mins[ext_range]) {
-        error_setg(errp, "value %" PRId64 ".%03" PRIu64 " =C2=B0C is out=
 of range",
+        error_setg(errp, "value %" PRId64 ".%03" PRIu64 " C is out of ra=
nge",
                    temp / 1000, temp % 1000);
         return;
     }
--=20
2.17.2


