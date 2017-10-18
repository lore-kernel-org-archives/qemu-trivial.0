Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4wPc-0000VP-9r
	for mharc-qemu-trivial@gnu.org; Wed, 18 Oct 2017 18:02:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34329)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1e4wPZ-0000TE-AM
	for qemu-trivial@nongnu.org; Wed, 18 Oct 2017 18:02:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1e4wPY-0003tx-Hq
	for qemu-trivial@nongnu.org; Wed, 18 Oct 2017 18:02:01 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:55845)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cota@braap.org>)
	id 1e4wPT-0003mZ-SE; Wed, 18 Oct 2017 18:01:55 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 6F18821354;
	Wed, 18 Oct 2017 18:01:55 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
	by compute4.internal (MEProxy); Wed, 18 Oct 2017 18:01:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:date:from:in-reply-to:message-id:references:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc; s=mesmtp; bh=V4WjqGMe9gyipy
	ahrLLeyjSTyDXaekXoPn2fKYnX8TU=; b=qduS5e4MLM2FPcglGmcNA6cvbekYDM
	DkbOT3yPWbF8hHKXiKuAjyipVGA0iV7hvOwpEZae/fOAjdOZISGmUDJBb3GV27nv
	sippCDHbDJGXfqMsGLiNkvbuazyDOyD9QFNsMt46nrAJ/OrExffTA2BlTjRF6QZW
	48llbo9kbY00U=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; bh=V4WjqGMe9gyipyahrLLeyjSTyDXaekXoPn2fKYnX8TU=; b=Wd2jR8Pm
	dGdTCp5uB/iWj129P755qjCumgdI/pT4FqA1+xv775HYNHMmp8AD93UML/xRCl4T
	O8b9+1g+4AfO3EEqKaR5GQ3oEEGcoYRR+JxMQlGX/ko2Vesc6wakpJHu+IvV2nmB
	10ZWN+YmEKrQhfQT4Fg/75ulTm9LETeFbAgf5b3EiWyR7mm+zovIp8Iam3ehg8V5
	xwljcKYPQwBfN70tYCLLlcUDMI9WKATRgFmTBm0CDxxvsi9AeptSueIBU9HgkHPb
	Z2ayOCNN3f+Gl9iZHP1hcJwJgNsMka6ZhaM2ccZduTgjhokTvCCtI72KzI4lzpNi
	gWnUoE1EB94xGA==
X-ME-Sender: <xms:U8_nWU-vI55VVx7SsfLA31qFpvTE1V8La1WiNFVE1H8ChrKDFMpRIw>
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 294E8247D9;
	Wed, 18 Oct 2017 18:01:55 -0400 (EDT)
From: "Emilio G. Cota" <cota@braap.org>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org
Date: Wed, 18 Oct 2017 18:01:40 -0400
Message-Id: <1508364103-16131-2-git-send-email-cota@braap.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1508364103-16131-1-git-send-email-cota@braap.org>
References: <1508364103-16131-1-git-send-email-cota@braap.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.111.4.28
Subject: [Qemu-trivial] [PATCH 1/4] disas/arm: fix 'instuction' typo in
 comment
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
X-List-Received-Date: Wed, 18 Oct 2017 22:02:02 -0000

Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 disas/arm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/disas/arm.c b/disas/arm.c
index 27396dd..6f2079d 100644
--- a/disas/arm.c
+++ b/disas/arm.c
@@ -1651,7 +1651,7 @@ print_insn_coprocessor (bfd_vma pc, struct disassemble_info *info, long given,
 	}
       else
 	{
-	  /* Only match unconditional instuctions against unconditional
+          /* Only match unconditional instructions against unconditional
 	     patterns.  */
 	  if ((given & 0xf0000000) == 0xf0000000)
 	    {
-- 
2.7.4


