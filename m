Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 116EFCD4F54
	for <qemu-trivial@archiver.kernel.org>; Wed, 27 May 2026 19:56:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wSKLw-0001gc-Sn; Wed, 27 May 2026 15:55:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christian.barry@usp.br>)
 id 1wSIVJ-00061K-2B
 for qemu-trivial@nongnu.org; Wed, 27 May 2026 13:57:17 -0400
Received: from mail-vk1-xa41.google.com ([2607:f8b0:4864:20::a41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christian.barry@usp.br>)
 id 1wSIVG-0002Nb-RF
 for qemu-trivial@nongnu.org; Wed, 27 May 2026 13:57:16 -0400
Received: by mail-vk1-xa41.google.com with SMTP id
 71dfb90a1353d-56f75445470so9177772e0c.2
 for <qemu-trivial@nongnu.org>; Wed, 27 May 2026 10:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=usp.br; s=usp-google; t=1779904632; x=1780509432; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jYPjzWriC/+sdM+dMQNidB15fYGlgBoH9MUH9Kya/tI=;
 b=PRAAX5IHQwlNDddP1wPV6gQ7TcTJucxuisTFafvRMGyrNs7/PYF0G1d0qurBx/Q8yy
 iPNGWw7GjPEDaMLjSx59U8EMFYxUMlWlSf3GBspF29gcgRHq6CIVRDjLNQno+LkU7Y1G
 LIRFmvx1x29mv7ZZPX0mS3jelscNioKd0A3oDC/sT0bGx50NHs/TqMlP2B+ubP7ROaXB
 Vryldi2i7r6h5nwnF8gtGehgOaUprVCRkX/s/fMIt1hP4r3PAJvv4wQY9/AcfKRWdC0N
 7HsfXOAcFkqdu9xfZOF1E2Bc8oXBiTA9WZBVv6fGwtfULJ2z2KK2vS4Qxi+Ywf37nb7y
 T2rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779904632; x=1780509432;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jYPjzWriC/+sdM+dMQNidB15fYGlgBoH9MUH9Kya/tI=;
 b=s1kCUnxD90ujHsu6zga33LV/05bG5VQQISl/Vehwbn50vW034L3IDvVXi1gYr740r+
 jgPlFWXe5axL9D/2EfDCBGGVanfjRmrxoQMHSsK9OZpHwu5Z5d7eik7XpRWHACK2G8wl
 cmnZIqM+RHhDtFqtbGCskHSu3EFfV7ZMcjJabuvXtlOIZGO88y6rGQAN1zOklcUyNReN
 YZWnSOImPx3nmnw+KcmAIJkJCq5ODp7XN603Vw616M0TbdynlpP75X6jQvNqAPB4vN7o
 q3lhYRCp2A03BlYhpfMqICQ2SRYJBqtZu57PcaM+28n7ENu+R1SztRo5C6xtNiiVzGGW
 YfwQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+l93W561SCK5DQuf3D8PW+3pS7GspgPgzZdev97q9eGQx7OrAZeHOjzivnL4Ksx2jgAS7rwbbyCuR0iOI=@nongnu.org
X-Gm-Message-State: AOJu0YzEbiMV8bhU0eTONBnT0mYwfX/MMEHzfBtF5ewwU+HGrvtyKCWT
 dD3TXGIo3cspNbZQltV2gUNro3ZfIA+kANLOf+pQ/HU6zh0hjgtS7VkY9OmBXN7uyZk=
X-Gm-Gg: Acq92OHdJ+xBwZw07SLW5b7zSapya+kN9mECpTNF6gK/4Gx3wBMWqLjYx5X6/73R5v4
 6DTCS76QPCvpwkOr0m32AG9lySa8d11R+nzX1ZyTeDaJvflNlYaFmwgdauS5/Fi9exshW4H+0j6
 b+LsX+3IrID0d66NZgdI5xP04nMW1A8nt/pPqD/J8ioxDPntoMU+dqOb4AoGBw+q5n7hJnEhCMl
 F8nyuOTYdf4Sqahs9vHL87dDH2YhDGmPSUBsZujTuFy6f8kRWfMKpb/Z/dqTtWW12GHafEbD1+u
 0q0nCLumv/DqNAVZH6OmtBJ7xrfdFD51pD7ol1u9e2GYFPGghCKOztHbTrKAKTBX7LzYWDSX+oJ
 RpsXoNE4S9PtXh5m/jUiy09gSsDXlX0/7dbKxOqRwOQPxbTzRZKNqXj/1KLMxN/A6ulkF7NtcZP
 m4ZDT7gKXHHWUMigG6gYqU43gJWBIhDDg/LSrjJkrOlxFoiiMck90K1Oom2R/h63EswES7DHO0
X-Received: by 2002:a05:6122:e250:b0:56d:2ca7:fbc3 with SMTP id
 71dfb90a1353d-5865fc0355cmr12799503e0c.5.1779904632439; 
 Wed, 27 May 2026 10:57:12 -0700 (PDT)
Received: from christian-barry-IdeaPad-Gaming-3-15IHU6.semfio.usp.br
 (nat.ime.usp.br. [143.107.45.1]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-586f3c003ffsm21298157e0c.8.2026.05.27.10.57.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2026 10:57:12 -0700 (PDT)
From: Christian Barry <christian.barry@usp.br>
X-Google-Original-From: Christian Barry
To: qemu-devel@nongnu.org
Cc: Artyom Tarasenko <atar4qemu@gmail.com>, qemu-trivial@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Christian Barry <christian.barry@usp.br>,
 Eduardo Augusto Cavalcanti <eduardoaugustoabc@ime.usp.br>
Subject: [PATCH] disas: sparc: Fix integer overflow in compare_opcodes() for
 loop
Date: Wed, 27 May 2026 14:57:05 -0300
Message-ID: <20260527175705.152301-1-christian.barry@usp.br>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a41;
 envelope-from=christian.barry@usp.br; helo=mail-vk1-xa41.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 27 May 2026 15:55:42 -0400
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
Errors-To: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org

From: Christian Barry <christian.barry@usp.br>

Replaced left-shift of a literal 1 by i inside of two for loops in compare_opcodes() with a call to BIT(i). This makes it so 1 is interpreted as an unsigned long int, preventing overflows.

Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/2618

Signed-off-by: Christian Barry <christian.barry@usp.br>
Co-developed-by: Eduardo Augusto Cavalcanti <eduardoaugustoabc@ime.usp.br>
Signed-off-by: Eduardo Augusto Cavalcanti <eduardoaugustoabc@ime.usp.br>
---
 disas/sparc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/disas/sparc.c b/disas/sparc.c
index 5689533ce1..6fc057e3a2 100644
--- a/disas/sparc.c
+++ b/disas/sparc.c
@@ -27,6 +27,7 @@
    see <http://www.gnu.org/licenses/>.  */
 
 #include "qemu/osdep.h"
+#include "qemu/bitops.h"
 #include "disas/dis-asm.h"
 
 /* The SPARC opcode table (and other related data) is defined in
@@ -2515,7 +2516,7 @@ compare_opcodes (const void * a, const void * b)
      another, it is important to order the opcodes in the right order.  */
   for (i = 0; i < 32; ++i)
     {
-      unsigned long int x = 1 << i;
+      unsigned long int x = BIT(i);
       int x0 = (match0 & x) != 0;
       int x1 = (match1 & x) != 0;
 
@@ -2525,7 +2526,7 @@ compare_opcodes (const void * a, const void * b)
 
   for (i = 0; i < 32; ++i)
     {
-      unsigned long int x = 1 << i;
+      unsigned long int x = BIT(i);
       int x0 = (lose0 & x) != 0;
       int x1 = (lose1 & x) != 0;
 
-- 
2.43.0


