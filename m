Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h0DHI-0004GN-Me
	for mharc-qemu-trivial@gnu.org; Sat, 02 Mar 2019 17:38:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38559)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h0DHG-0004EW-MS
	for qemu-trivial@nongnu.org; Sat, 02 Mar 2019 17:38:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h0DHF-0005ZH-Vq
	for qemu-trivial@nongnu.org; Sat, 02 Mar 2019 17:38:42 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53694)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1h0DHE-0005Vk-5I; Sat, 02 Mar 2019 17:38:40 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6F4E986658;
	Sat,  2 Mar 2019 22:38:39 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-70.brq.redhat.com [10.40.204.70])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E2D15D9C5;
	Sat,  2 Mar 2019 22:38:36 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	qemu-trivial@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Date: Sat,  2 Mar 2019 23:38:24 +0100
Message-Id: <20190302223825.11192-2-philmd@redhat.com>
In-Reply-To: <20190302223825.11192-1-philmd@redhat.com>
References: <20190302223825.11192-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Sat, 02 Mar 2019 22:38:39 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 1/2] util/error: Remove an unnecessary NULL
 check
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
X-List-Received-Date: Sat, 02 Mar 2019 22:38:43 -0000

This NULL check was required while introduced in 680d16dcb79f.
Later refactor added a NULL check in error_setv(), so this check
is now redundant.

Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 util/error.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/util/error.c b/util/error.c
index b5ccbd8eac..934a78e1b1 100644
--- a/util/error.c
+++ b/util/error.c
@@ -103,10 +103,6 @@ void error_setg_errno_internal(Error **errp,
     va_list ap;
     int saved_errno =3D errno;
=20
-    if (errp =3D=3D NULL) {
-        return;
-    }
-
     va_start(ap, fmt);
     error_setv(errp, src, line, func, ERROR_CLASS_GENERIC_ERROR, fmt, ap=
,
                os_errno !=3D 0 ? strerror(os_errno) : NULL);
--=20
2.20.1


