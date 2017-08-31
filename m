Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dnMq2-00039z-95
	for mharc-qemu-trivial@gnu.org; Thu, 31 Aug 2017 06:36:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42009)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1dnMpw-000362-1C
	for qemu-trivial@nongnu.org; Thu, 31 Aug 2017 06:36:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1dnMpv-0006f9-04
	for qemu-trivial@nongnu.org; Thu, 31 Aug 2017 06:36:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59250)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1dnMpr-0006Ya-2j; Thu, 31 Aug 2017 06:36:31 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 129B6356D4;
	Thu, 31 Aug 2017 10:36:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 129B6356D4
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=marcandre.lureau@redhat.com
Received: from localhost (ovpn-112-36.ams2.redhat.com [10.36.112.36])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BE77C92B93;
	Thu, 31 Aug 2017 10:36:26 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Date: Thu, 31 Aug 2017 12:34:28 +0200
Message-Id: <20170831103432.6007-26-marcandre.lureau@redhat.com>
In-Reply-To: <20170831103432.6007-1-marcandre.lureau@redhat.com>
References: <20170831103432.6007-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 31 Aug 2017 10:36:29 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PULL 25/29] decnumber: use DIV_ROUND_UP
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
X-List-Received-Date: Thu, 31 Aug 2017 10:36:37 -0000

I used the clang-tidy qemu-round check to generate the fix:
https://github.com/elmarco/clang-tools-extra

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Richard Henderson <rth@twiddle.net>
---
 libdecnumber/decNumber.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libdecnumber/decNumber.c b/libdecnumber/decNumber.c
index c9e7807f87..8c197023f4 100644
--- a/libdecnumber/decNumber.c
+++ b/libdecnumber/decNumber.c
@@ -4775,7 +4775,7 @@ static decNumber * decDivideOp(decNumber *res,
 	    half=3D*up & 0x01;
 	    *up/=3D2;		   /* [shift] */
 	    if (!half) continue;
-	    *(up-1)+=3D(DECDPUNMAX+1)/2;
+	    *(up-1)+=3DDIV_ROUND_UP(DECDPUNMAX, 2);
 	    }
 	  /* [accunits still describes the original remainder length] */
=20
--=20
2.14.1.146.gd35faa819


