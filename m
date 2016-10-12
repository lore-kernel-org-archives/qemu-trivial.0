Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1buS7q-0002jz-9a
	for mharc-qemu-trivial@gnu.org; Wed, 12 Oct 2016 18:35:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56961)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <michael@walle.cc>) id 1buS7n-0002hf-SU
	for qemu-trivial@nongnu.org; Wed, 12 Oct 2016 18:35:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <michael@walle.cc>) id 1buS7k-0002fD-K4
	for qemu-trivial@nongnu.org; Wed, 12 Oct 2016 18:35:47 -0400
Received: from ssl.serverraum.org ([213.133.101.245]:54020)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <michael@walle.cc>)
	id 1buS7e-0002co-UU; Wed, 12 Oct 2016 18:35:39 -0400
Received: from apollo.fritz.box (ip5f585ef2.dynamic.kabel-deutschland.de
	[95.88.94.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id 5FCC322279;
	Thu, 13 Oct 2016 00:35:36 +0200 (CEST)
Authentication-Results: ssl.serverraum.org; dmarc=none header.from=walle.cc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
	s=mail2016061301; t=1476311736;
	bh=MHjo65lw4bcj5UKqnutSVcwHaURBYPqy/rGuv2R8lCk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iHF/IRXgy39otntDcmjSIsy0JWalAn8yGD+1Ta/wMqzMXfJXIxTkp0uLchDuMntVx
	KgBB77P5bXTM+TTyvmQ0c4PAVFBr8Dvw7QX0cbqSyRdcgBhZjP7UoNbSrUg/lVPtKF
	78aIcrLuvDrEOqAoSLi3NqOXfVUjPteU3/aYsyoo=
From: Michael Walle <michael@walle.cc>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Michael Walle <michael@walle.cc>
Date: Thu, 13 Oct 2016 00:35:08 +0200
Message-Id: <1476311708-14792-4-git-send-email-michael@walle.cc>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1476311708-14792-1-git-send-email-michael@walle.cc>
References: <1476311708-14792-1-git-send-email-michael@walle.cc>
X-Virus-Scanned: clamav-milter 0.99.2 at web
X-Virus-Status: Clean
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 213.133.101.245
Subject: [Qemu-trivial] [PATCH 4/4] target-lm32: rewrite gen_compare()
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
X-List-Received-Date: Wed, 12 Oct 2016 22:35:49 -0000

Drop the rX, rY and rZ stuff and use dc->r{0,1,2} directly. This should
also fix the false positive in coverity CID 1005720.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 target-lm32/translate.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/target-lm32/translate.c b/target-lm32/translate.c
index 792637f..842af63 100644
--- a/target-lm32/translate.c
+++ b/target-lm32/translate.c
@@ -344,9 +344,6 @@ static void dec_calli(DisasContext *dc)
 
 static inline void gen_compare(DisasContext *dc, int cond)
 {
-    int rX = (dc->format == OP_FMT_RR) ? dc->r2 : dc->r1;
-    int rY = dc->r0;
-    int rZ = (dc->format == OP_FMT_RR) ? dc->r1 : -1;
     int i;
 
     if (dc->format == OP_FMT_RI) {
@@ -360,9 +357,9 @@ static inline void gen_compare(DisasContext *dc, int cond)
             break;
         }
 
-        tcg_gen_setcondi_tl(cond, cpu_R[rX], cpu_R[rY], i);
+        tcg_gen_setcondi_tl(cond, cpu_R[dc->r1], cpu_R[dc->r0], i);
     } else {
-        tcg_gen_setcond_tl(cond, cpu_R[rX], cpu_R[rY], cpu_R[rZ]);
+        tcg_gen_setcond_tl(cond, cpu_R[dc->r2], cpu_R[dc->r0], cpu_R[dc->r1]);
     }
 }
 
-- 
2.1.4


