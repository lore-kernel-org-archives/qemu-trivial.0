Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hoSjN-0001j0-R4
	for mharc-qemu-trivial@gnu.org; Fri, 19 Jul 2019 09:15:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60950)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hoSjJ-0001Q0-4q
 for qemu-trivial@nongnu.org; Fri, 19 Jul 2019 09:15:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hoSjI-0000vN-30
 for qemu-trivial@nongnu.org; Fri, 19 Jul 2019 09:15:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52998)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hoSjB-0000r4-Pd; Fri, 19 Jul 2019 09:15:13 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 073F0317916B;
 Fri, 19 Jul 2019 13:15:13 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.153])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C7D9C26E79;
 Fri, 19 Jul 2019 13:15:03 +0000 (UTC)
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
Date: Fri, 19 Jul 2019 15:14:23 +0200
Message-Id: <20190719131425.10835-6-philmd@redhat.com>
In-Reply-To: <20190719131425.10835-1-philmd@redhat.com>
References: <20190719131425.10835-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Fri, 19 Jul 2019 13:15:13 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH-for-4.1? 5/7] target/ppc: Rewrite a fall
 through comment
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
X-List-Received-Date: Fri, 19 Jul 2019 13:15:25 -0000

GCC9 is confused by this comment when building with CFLAG
-Wimplicit-fallthrough=3D2:

  target/ppc/mmu_helper.c: In function =E2=80=98dump_mmu=E2=80=99:
  target/ppc/mmu_helper.c:1349:12: error: this statement may fall through=
 [-Werror=3Dimplicit-fallthrough=3D]
   1349 |         if (ppc64_v3_radix(env_archcpu(env))) {
        |            ^
  target/ppc/mmu_helper.c:1356:5: note: here
   1356 |     default:
        |     ^~~~~~~
  cc1: all warnings being treated as errors

Rewrite the comment using 'fall through' which is recognized by
GCC and static analyzers.

Reported-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 target/ppc/mmu_helper.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index 261a8fe707..862824b073 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -98,7 +98,7 @@ static int pp_check(int key, int pp, int nx)
         case 0x1:
         case 0x2:
             access |=3D PAGE_WRITE;
-            /* No break here */
+            /* fall through */
         case 0x3:
             access |=3D PAGE_READ;
             break;
@@ -706,7 +706,7 @@ static int mmu40x_get_physical_address(CPUPPCState *e=
nv, mmu_ctx_t *ctx,
             if (pr !=3D 0) {
                 goto check_perms;
             }
-            /* No break here */
+            /* fall through */
         case 0x3:
             /* All accesses granted */
             ctx->prot =3D PAGE_READ | PAGE_WRITE | PAGE_EXEC;
@@ -720,7 +720,7 @@ static int mmu40x_get_physical_address(CPUPPCState *e=
nv, mmu_ctx_t *ctx,
                 ret =3D -2;
                 break;
             }
-            /* No break here */
+            /* fall through */
         case 0x1:
         check_perms:
             /* Check from TLB entry */
--=20
2.20.1


