Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i0OfX-0005FI-ON
	for mharc-qemu-trivial@gnu.org; Wed, 21 Aug 2019 07:20:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53590)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1i0OfS-00057L-QK
 for qemu-trivial@nongnu.org; Wed, 21 Aug 2019 07:20:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1i0OfQ-0006dc-Qt
 for qemu-trivial@nongnu.org; Wed, 21 Aug 2019 07:20:42 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:60159)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1i0OfI-0006XX-FM; Wed, 21 Aug 2019 07:20:34 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MJn4B-1hgNrk3nRJ-00K5FT; Wed, 21 Aug 2019 13:20:10 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Michael Tokarev <mjt@tls.msk.ru>,
 "Michael S. Tsirkin" <mst@redhat.com>, Corey Minyard <minyard@acm.org>,
 Juan Quintela <quintela@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <rth@twiddle.net>, Jason Wang <jasowang@redhat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefan Weil <sw@weilnetz.de>
Date: Wed, 21 Aug 2019 13:19:43 +0200
Message-Id: <20190821111947.26580-11-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190821111947.26580-1-laurent@vivier.eu>
References: <20190821111947.26580-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:dZPXJ7zALzqELWms6CgEg+HsPRg5cmClSJEGrVb744N3hZRY0VY
 GsNSpBr/WJLhfdimJegSry3T4iUgR0Gau1dCpecRqrJICDNbI8tIKBYazKZ+eiJF3IMPrW2
 rAga7e3JfkemVBGx7cLIV39JiZv8DlKZy7Xx8sudEKC2Wa6u0C7X7xR0YpFLgZlQo38VDEz
 Ro6O/YLOSQ8qtlqkySr/Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:DMrcvKZLe2c=:GljK/BN08zJCcYKWmmTCJu
 zUXpdhsuKZ2PWZl6nk/f21Ra9U865kOcgPAB+lac7HU3DtXHZRdFF8sfr/v5dXAoD9WcGFv0o
 Qfks28aECPpNLmJvLY/djUOUWEdTWscfaBpqtYavwlkJSBHsRTFcipy5dhFrF5Obvqc8am1zF
 WHLD5R64eGJYaLcEoIq+9udX8dQyMW92hdTSFsYW3Oe3m5WloJHGfshWzbMv+84OwZWaYYha6
 ePNw/hCS1ZNvC+2tNkq49TSlheLaIzYf4kFgPinlsoNT6SZ1mbPHCeIp2MkiTLCmF+wJfZeGg
 ltxWjzVagwXHTYUp87IenjjLkd99fFZwbjGkdCUhQHJCT1vOIroNulSkNIIYlEor0j5lhcA+C
 T8qIY+8r1YNXFRQA9QWi1bXgijYP75TATXWoKtq4vl8a+yPKwVXuomXuPg1f2AZG3asfCr7Td
 jNiZEGjiJ3uYyh75r/ryGU1X82s2p/o/A5YjykQ4Hmm8KbuQ5WWbYtGikp+0rNXEuTgq5TyG/
 FWquEvhAqkJuQL9iwX6/cV6eB8NQzaz6caAIpunGDmXAIAj3Xu0hA9cQntO7wWJrY+65M7QwS
 0i+RIjnWdZYPnQYOhU8tZCZMJwABlJTa40S9/IvK6FdSLq1xBcKMVlh2m682oTL2yl47YJ/6N
 /0O76BVBA1u4WZxfGURdOF4+rKGpX3ogwubUys57GVwLG/d1fR5/5N+zwTq2wUS5cKnfQMxiM
 GnLagKPYWd0QSAsISA3PoSTE6EtJftula6Z/rn+46EAvIVd8XJTebQspLbsf2Jad8F1JOnVUL
 tkfuT+Bne7shKIG2nlPPXa0snKxNQ==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.24
Subject: [Qemu-trivial] [PULL 10/14] target/ppc: Rewrite a fall through
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
X-List-Received-Date: Wed, 21 Aug 2019 11:20:46 -0000

From: Philippe Mathieu-Daudé <philmd@redhat.com>

GCC9 is confused by this comment when building with CFLAG
-Wimplicit-fallthrough=2:

  target/ppc/mmu_helper.c: In function ‘dump_mmu’:
  target/ppc/mmu_helper.c:1349:12: error: this statement may fall through [-Werror=implicit-fallthrough=]
   1349 |         if (ppc64_v3_radix(env_archcpu(env))) {
        |            ^
  target/ppc/mmu_helper.c:1356:5: note: here
   1356 |     default:
        |     ^~~~~~~
  cc1: all warnings being treated as errors

Rewrite the comment using 'fall through' which is recognized by
GCC and static analyzers.

Reported-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
Message-Id: <20190719131425.10835-6-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/ppc/mmu_helper.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index 55f7a7f16a12..86c667b09415 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -100,7 +100,7 @@ static int pp_check(int key, int pp, int nx)
         case 0x1:
         case 0x2:
             access |= PAGE_WRITE;
-            /* No break here */
+            /* fall through */
         case 0x3:
             access |= PAGE_READ;
             break;
@@ -708,7 +708,7 @@ static int mmu40x_get_physical_address(CPUPPCState *env, mmu_ctx_t *ctx,
             if (pr != 0) {
                 goto check_perms;
             }
-            /* No break here */
+            /* fall through */
         case 0x3:
             /* All accesses granted */
             ctx->prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
@@ -722,7 +722,7 @@ static int mmu40x_get_physical_address(CPUPPCState *env, mmu_ctx_t *ctx,
                 ret = -2;
                 break;
             }
-            /* No break here */
+            /* fall through */
         case 0x1:
         check_perms:
             /* Check from TLB entry */
-- 
2.21.0


