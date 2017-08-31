Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dnMpF-0002TG-0i
	for mharc-qemu-trivial@gnu.org; Thu, 31 Aug 2017 06:35:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41436)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1dnMpC-0002QT-O5
	for qemu-trivial@nongnu.org; Thu, 31 Aug 2017 06:35:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1dnMpB-00066A-Nt
	for qemu-trivial@nongnu.org; Thu, 31 Aug 2017 06:35:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41572)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1dnMp8-000608-Iq; Thu, 31 Aug 2017 06:35:46 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A3776883AC;
	Thu, 31 Aug 2017 10:35:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com A3776883AC
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=marcandre.lureau@redhat.com
Received: from localhost (ovpn-112-36.ams2.redhat.com [10.36.112.36])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 46AB89D5E7;
	Thu, 31 Aug 2017 10:35:44 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>
Date: Thu, 31 Aug 2017 12:34:18 +0200
Message-Id: <20170831103432.6007-16-marcandre.lureau@redhat.com>
In-Reply-To: <20170831103432.6007-1-marcandre.lureau@redhat.com>
References: <20170831103432.6007-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 31 Aug 2017 10:35:45 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PULL 15/29] monitor: use DIV_ROUND_UP
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
X-List-Received-Date: Thu, 31 Aug 2017 10:35:52 -0000

I used the clang-tidy qemu-round check to generate the fix:
https://github.com/elmarco/clang-tools-extra

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Richard Henderson <rth@twiddle.net>
---
 monitor.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/monitor.c b/monitor.c
index e0f880107f..135ec2de8f 100644
--- a/monitor.c
+++ b/monitor.c
@@ -1349,7 +1349,7 @@ static void memory_dump(Monitor *mon, int count, in=
t format, int wsize,
=20
     switch(format) {
     case 'o':
-        max_digits =3D (wsize * 8 + 2) / 3;
+        max_digits =3D DIV_ROUND_UP(wsize * 8, 3);
         break;
     default:
     case 'x':
@@ -1357,7 +1357,7 @@ static void memory_dump(Monitor *mon, int count, in=
t format, int wsize,
         break;
     case 'u':
     case 'd':
-        max_digits =3D (wsize * 8 * 10 + 32) / 33;
+        max_digits =3D DIV_ROUND_UP(wsize * 8 * 10, 33);
         break;
     case 'c':
         wsize =3D 1;
--=20
2.14.1.146.gd35faa819


