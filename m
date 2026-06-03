Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD98ECD6E57
	for <qemu-trivial@archiver.kernel.org>; Wed,  3 Jun 2026 19:05:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wUqte-0005Wd-DR; Wed, 03 Jun 2026 15:04:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christian.barry@usp.br>)
 id 1wUqtd-0005WK-Bq
 for qemu-trivial@nongnu.org; Wed, 03 Jun 2026 15:04:57 -0400
Received: from mail-vs1-xe43.google.com ([2607:f8b0:4864:20::e43])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christian.barry@usp.br>)
 id 1wUqtb-0001Qf-3q
 for qemu-trivial@nongnu.org; Wed, 03 Jun 2026 15:04:57 -0400
Received: by mail-vs1-xe43.google.com with SMTP id
 ada2fe7eead31-6cfc8f8e127so1408233137.1
 for <qemu-trivial@nongnu.org>; Wed, 03 Jun 2026 12:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=usp.br; s=usp-google; t=1780513492; x=1781118292; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6/G/uqHfwL0zUCXsViLqL5ougH2I2Vk7WD45s454m9g=;
 b=B7wO5S3+YUpBXsZxsGJ5tAGkA1epFeMlf1AGSVoXvIOoxWNndWSvMZAh9KniwPxCcF
 rx+P9A8JCqJqsirPMvIR+ny7alrvHfBzzZkBdfueolTElXiiUfcWsYpi8YzbHPpyTM7c
 IXMu2v1CG/fIjIWUOqC56ErV7scHXLSjTm0NGqCBPzK5zjwZ4pHH8Ovdg+bXVPgDNOdW
 LE7wI/UaA1XmLz1rNgG0IqaPIKzkiJVfMlAvW9v1TqzaFGaq/vpib/XBZ982sHZI+T+a
 xWnP1q8IjplX5M+baIUaCa/sv1dCdQ2XcvCoNPd1AuwW8I38BobFO7PBqLp7iwKuXXyx
 hgaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780513492; x=1781118292;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6/G/uqHfwL0zUCXsViLqL5ougH2I2Vk7WD45s454m9g=;
 b=Dlt065P57iSB4KvIfDzFht6ItC9hdfhTqMV6CQyPQlrN/9wp381IqcLCF1xKBea5KN
 BbRjOXvLwyBApZRz+EBuKBkpU3JehwXgiA3MTOO8HTJuEfzPVqgX5A5S/GuAke3ShPVN
 Fa8lJbGxHIDbkHtB3dcH1N0oTIzFH5W3Laje9ile/+wSEcc1HXkAf0GTL2bq+8lXnbPw
 Lxcvn4BqisurQzw7jwbTCmssTb40sPykq+srvwK/8Eo7qPg765q1TA/7+ygPTSAFXzaS
 aMb4x41lriftfjnSN7Mlvo5HdqzA2Xy479qaeRL3tlBP0t/jFdLZLX4K+EpVjmgGlywT
 IV/A==
X-Forwarded-Encrypted: i=1;
 AFNElJ9B8nZjIMRRcLrhwAKkDNUFmu9BWnUtBgjANQZ2o4gvaj39mszRG76ha+aUEuED4gw59BVmxm+LqkKmNZA=@nongnu.org
X-Gm-Message-State: AOJu0YywqQxB0miEO9zc7ijVJMRrZl66VAwwsYvkboDQnQWlSfGD0STv
 8sbI3zMDRSlFELXlN3QLjr3UWDL//OktuFRdL+1tCm7g604WiFosM/VkyS/RHfi8L2w=
X-Gm-Gg: Acq92OGPZxzYZOwUXw4Wq3Z6R4MR6kpkBCRf/4yN/WyMGe7UkXC5rXRVNgxAhsBzu5s
 DWHX8tXDuQPIJiclbBX8hubnJGZoRDy07Kqsr5omiVCdvVsYulsFDHUfvZx4KywMQLaC6kTJjzK
 kIqaYlLkE+LXr0cgtxBNcvuMfOQkH6uZInFCA9bTvLkZ3NY6ls4zBMn8GnpjZyDtCd2L7JLr1Yt
 /0cbHMEUz8patbFix6aoeDxTiag45ZTGTg/mBrjuwj2MkW6kj0zYx6Wk/w+6PlWu2r9+yWedHi0
 GiBNrXUdihXulwoqjffWlybS0aSwerawGgQ3hG9HDn4U4xKx0WEnlJ2MBWI46xKveX6O3CQo40K
 zGrd+jPFGrmG2TefIAEZH2/aAQiN/HEMccCRhMvmmTNSRn5D2wU/x4RaBG1UxMnglrn52Ujl4AW
 i3hW7lz1q3gMhzOXnGs8be1i6CK+1P6Rxwq/6u/l3XfhO49lUxBDvyq4dZPqygEzOG4wQSdNIx
X-Received: by 2002:a05:6102:41a4:b0:607:5cd7:d7c0 with SMTP id
 ada2fe7eead31-6ec460bc68emr3093161137.19.1780513492027; 
 Wed, 03 Jun 2026 12:04:52 -0700 (PDT)
Received: from christian-barry-IdeaPad-Gaming-3-15IHU6.semfio.usp.br
 (nat.ime.usp.br. [143.107.45.1]) by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-6eb649b54e0sm3100574137.9.2026.06.03.12.04.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jun 2026 12:04:51 -0700 (PDT)
From: Christian Barry <christian.barry@usp.br>
X-Google-Original-From: Christian Barry
To: qemu-devel@nongnu.org
Cc: Artyom Tarasenko <atar4qemu@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-trivial@nongnu.org,
 Christian Barry <christian.barry@usp.br>,
 Eduardo Augusto Cavalcanti <eduardoaugustoabc@ime.usp.br>
Subject: [PATCH v2] disas: sparc: Fix integer overflow in compare_opcodes()
 for loop
Date: Wed,  3 Jun 2026 16:04:46 -0300
Message-ID: <20260603190446.10319-1-christian.barry@usp.br>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e43;
 envelope-from=christian.barry@usp.br; helo=mail-vs1-xe43.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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

Replaced left-shift of a literal 1 by i inside of two for loops in compare_opcodes() with 1ul type qualifier. This makes it so 1 is explicitly interpreted as an unsigned long int, preventing overflows.

Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/2618

Signed-off-by: Christian Barry <christian.barry@usp.br>
Co-developed-by: Eduardo Augusto Cavalcanti <eduardoaugustoabc@ime.usp.br>
Signed-off-by: Eduardo Augusto Cavalcanti <eduardoaugustoabc@ime.usp.br>
---
 disas/sparc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/disas/sparc.c b/disas/sparc.c
index 5689533ce1..40c1164554 100644
--- a/disas/sparc.c
+++ b/disas/sparc.c
@@ -2515,7 +2515,7 @@ compare_opcodes (const void * a, const void * b)
      another, it is important to order the opcodes in the right order.  */
   for (i = 0; i < 32; ++i)
     {
-      unsigned long int x = 1 << i;
+      unsigned long int x = 1ul << i;
       int x0 = (match0 & x) != 0;
       int x1 = (match1 & x) != 0;
 
@@ -2525,7 +2525,7 @@ compare_opcodes (const void * a, const void * b)
 
   for (i = 0; i < 32; ++i)
     {
-      unsigned long int x = 1 << i;
+      unsigned long int x = 1ul << i;
       int x0 = (lose0 & x) != 0;
       int x1 = (lose1 & x) != 0;
 
-- 
2.43.0


