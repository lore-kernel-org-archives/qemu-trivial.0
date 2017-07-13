Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dVh5A-0005Xs-85
	for mharc-qemu-trivial@gnu.org; Thu, 13 Jul 2017 12:35:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43447)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1dVh55-0005TU-LY
	for qemu-trivial@nongnu.org; Thu, 13 Jul 2017 12:35:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1dVh54-0005vO-L9
	for qemu-trivial@nongnu.org; Thu, 13 Jul 2017 12:35:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55248)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1dVh4w-0005ms-UY; Thu, 13 Jul 2017 12:35:03 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9FA898553E;
	Thu, 13 Jul 2017 16:35:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 9FA898553E
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=marcandre.lureau@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 9FA898553E
Received: from localhost (ovpn-112-18.ams2.redhat.com [10.36.112.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A411577EE1;
	Thu, 13 Jul 2017 16:34:58 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>, Alexander Graf <agraf@suse.de>,
	qemu-ppc@nongnu.org (open list:PowerPC)
Date: Thu, 13 Jul 2017 18:32:12 +0200
Message-Id: <20170713163219.9024-23-marcandre.lureau@redhat.com>
In-Reply-To: <20170713163219.9024-1-marcandre.lureau@redhat.com>
References: <20170713163219.9024-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 13 Jul 2017 16:35:02 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH v2 22/29] ppc: use DIV_ROUND_UP
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
X-List-Received-Date: Thu, 13 Jul 2017 16:35:14 -0000

I used the clang-tidy qemu-round check to generate the fix:
https://github.com/elmarco/clang-tools-extra

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/mem_helper.c | 2 +-
 target/ppc/translate.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/ppc/mem_helper.c b/target/ppc/mem_helper.c
index e6383c6bfa..a34e604db3 100644
--- a/target/ppc/mem_helper.c
+++ b/target/ppc/mem_helper.c
@@ -111,7 +111,7 @@ void helper_lswx(CPUPPCState *env, target_ulong addr,=
 uint32_t reg,
                  uint32_t ra, uint32_t rb)
 {
     if (likely(xer_bc !=3D 0)) {
-        int num_used_regs =3D (xer_bc + 3) / 4;
+        int num_used_regs =3D DIV_ROUND_UP(xer_bc, 4);
         if (unlikely((ra !=3D 0 && lsw_reg_in_range(reg, num_used_regs, =
ra)) ||
                      lsw_reg_in_range(reg, num_used_regs, rb))) {
             raise_exception_err_ra(env, POWERPC_EXCP_PROGRAM,
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index c0cd64d927..76f9ccde25 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -2882,7 +2882,7 @@ static void gen_lswi(DisasContext *ctx)
     }
     if (nb =3D=3D 0)
         nb =3D 32;
-    nr =3D (nb + 3) / 4;
+    nr =3D DIV_ROUND_UP(nb, 4);
     if (unlikely(lsw_reg_in_range(start, nr, ra))) {
         gen_inval_exception(ctx, POWERPC_EXCP_INVAL_LSWX);
         return;
--=20
2.13.1.395.gf7b71de06


