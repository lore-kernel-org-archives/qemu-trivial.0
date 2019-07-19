Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hoSjW-0002Ho-Vc
	for mharc-qemu-trivial@gnu.org; Fri, 19 Jul 2019 09:15:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32791)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hoSjQ-0001rV-6V
 for qemu-trivial@nongnu.org; Fri, 19 Jul 2019 09:15:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hoSjO-0000zg-Ut
 for qemu-trivial@nongnu.org; Fri, 19 Jul 2019 09:15:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51498)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hoSjI-0000vJ-JN; Fri, 19 Jul 2019 09:15:20 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C39253084029;
 Fri, 19 Jul 2019 13:15:19 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.153])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6BCDD26DF0;
 Fri, 19 Jul 2019 13:15:13 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-block@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org,
 Corey Minyard <minyard@acm.org>, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Weil <sw@weilnetz.de>
Date: Fri, 19 Jul 2019 15:14:24 +0200
Message-Id: <20190719131425.10835-7-philmd@redhat.com>
In-Reply-To: <20190719131425.10835-1-philmd@redhat.com>
References: <20190719131425.10835-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Fri, 19 Jul 2019 13:15:19 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH-for-4.1? 6/7] vl: Rewrite a fall through
 comment
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 19 Jul 2019 13:15:32 -0000

GCC9 is confused by this comment when building with CFLAG
-Wimplicit-fallthrough=3D2:

  vl.c: In function =E2=80=98qemu_ref_timedate=E2=80=99:
  vl.c:773:15: error: this statement may fall through [-Werror=3Dimplicit=
-fallthrough=3D]
    773 |         value -=3D rtc_realtime_clock_offset;
        |         ~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~
  vl.c:775:5: note: here
    775 |     case QEMU_CLOCK_VIRTUAL:
        |     ^~~~
  cc1: all warnings being treated as errors

Rewrite the comment using 'fall through' which is recognized by
GCC and static analyzers.

Reported-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 vl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/vl.c b/vl.c
index a5808f9a02..f5cf71e3b4 100644
--- a/vl.c
+++ b/vl.c
@@ -771,7 +771,7 @@ static time_t qemu_ref_timedate(QEMUClockType clock)
     switch (clock) {
     case QEMU_CLOCK_REALTIME:
         value -=3D rtc_realtime_clock_offset;
-        /* no break */
+        /* fall through */
     case QEMU_CLOCK_VIRTUAL:
         value +=3D rtc_ref_start_datetime;
         break;
--=20
2.20.1


