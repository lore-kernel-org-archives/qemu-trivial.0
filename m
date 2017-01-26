Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cWk6h-0002ax-W8
	for mharc-qemu-trivial@gnu.org; Thu, 26 Jan 2017 08:28:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33687)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1cWk6f-0002Yp-KV
	for qemu-trivial@nongnu.org; Thu, 26 Jan 2017 08:28:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1cWk6e-00089B-T7
	for qemu-trivial@nongnu.org; Thu, 26 Jan 2017 08:28:53 -0500
Received: from mx1.redhat.com ([209.132.183.28]:34278)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1cWk6a-000888-MZ; Thu, 26 Jan 2017 08:28:48 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2AD2A80480;
	Thu, 26 Jan 2017 13:28:48 +0000 (UTC)
Received: from localhost (ovpn-116-51.phx2.redhat.com [10.3.116.51])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v0QDSjXg018960; Thu, 26 Jan 2017 08:28:47 -0500
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, qemu-trivial@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Date: Thu, 26 Jan 2017 17:28:27 +0400
Message-Id: <20170126132827.7479-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 26 Jan 2017 13:28:48 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] Update copyright year
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
X-List-Received-Date: Thu, 26 Jan 2017 13:28:54 -0000

It's still time to wish happy new year!

The Year of the Rooster will begin on January 28, 2017!

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 include/qemu-common.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/qemu-common.h b/include/qemu-common.h
index 1430390eb6..d218821c14 100644
--- a/include/qemu-common.h
+++ b/include/qemu-common.h
@@ -19,7 +19,7 @@
 #include "qemu/option.h"
=20
 /* Copyright string for -version arguments, About dialogs, etc */
-#define QEMU_COPYRIGHT "Copyright (c) 2003-2016 " \
+#define QEMU_COPYRIGHT "Copyright (c) 2003-2017 " \
     "Fabrice Bellard and the QEMU Project developers"
=20
 /* main function, renamed */
--=20
2.11.0.295.gd7dffce1c


