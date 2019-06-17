Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hcq1P-0004pq-U4
	for mharc-qemu-trivial@gnu.org; Mon, 17 Jun 2019 07:42:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55728)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <berrange@redhat.com>) id 1hcq16-0004nh-8d
 for qemu-trivial@nongnu.org; Mon, 17 Jun 2019 07:41:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1hcq15-0005YL-BJ
 for qemu-trivial@nongnu.org; Mon, 17 Jun 2019 07:41:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39854)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>)
 id 1hcq0t-0005Hc-Ds; Mon, 17 Jun 2019 07:41:29 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 460DC307E04A;
 Mon, 17 Jun 2019 11:41:16 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.42.22.189])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5849617165;
 Mon, 17 Jun 2019 11:41:15 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Date: Mon, 17 Jun 2019 12:41:14 +0100
Message-Id: <20190617114114.24897-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Mon, 17 Jun 2019 11:41:16 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] configure: use valid args testing
 sem_timedwait
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
X-List-Received-Date: Mon, 17 Jun 2019 11:41:51 -0000

The sem_timedwait function has been annotated as requiring
non-null args in latest header files from GCC snapshot
representing the future 2.30 release.

This causes configure to fail when -Werror is used:

config-temp/qemu-conf.c: In function =E2=80=98main=E2=80=99:
config-temp/qemu-conf.c:2:25: error: null argument where non-null require=
d (argument 1) [-Werror=3Dnonnull]
    2 | int main(void) { return sem_timedwait(0, 0); }
      |                         ^~~~~~~~~~~~~
config-temp/qemu-conf.c:2:25: error: null argument where non-null require=
d (argument 2) [-Werror=3Dnonnull]

Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index b091b82cb3..6632d05fc7 100755
--- a/configure
+++ b/configure
@@ -5139,7 +5139,7 @@ fi
 sem_timedwait=3Dno
 cat > $TMPC << EOF
 #include <semaphore.h>
-int main(void) { return sem_timedwait(0, 0); }
+int main(void) { sem_t s; struct timespec t =3D {0}; return sem_timedwai=
t(&s, &t); }
 EOF
 if compile_prog "" "" ; then
     sem_timedwait=3Dyes
--=20
2.21.0


