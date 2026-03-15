Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6929CD58B2B
	for <qemu-trivial@archiver.kernel.org>; Sun, 15 Mar 2026 13:03:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1w1l6v-0007Tl-2Q; Sun, 15 Mar 2026 09:02:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raghavendraaadhya@gmail.com>)
 id 1w1l6t-0007TJ-F3
 for qemu-trivial@nongnu.org; Sun, 15 Mar 2026 09:02:23 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <raghavendraaadhya@gmail.com>)
 id 1w1l6r-0003c5-Pk
 for qemu-trivial@nongnu.org; Sun, 15 Mar 2026 09:02:23 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-2ad9f316d68so17546585ad.2
 for <qemu-trivial@nongnu.org>; Sun, 15 Mar 2026 06:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773579737; x=1774184537; darn=nongnu.org;
 h=cc:to:subject:date:from:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GNIfAmKm5ApCc+B0mFDnttKVftHd6ynLG4xrxceTwoc=;
 b=PPSFCg5DL6KGPJsbWS2Qm1lGG4gfopzRT6X3lhjbyoavWZJaH9V8gbH0BV4xZwq1ub
 Gzb2T5BVjBzM74V8yG0eREwGkvOz2fDUMXdZa4NP5WgxtKqH27+emlWYY6znBRBXzIRw
 fGpK79aXN4Aqd+mUAFaHLHGOaeWAaZGc64tarRoT1PTMYjFHGmtPOLwtqkeYnRAt9WXz
 zN2U8SxmShhxb5xr0DhqXp865BZ2kAHn98Ehoi8329Eb0l+FN1qz+h8AanXP4iVervNi
 BG8gfcsSSYWHOXfZr26eueY2LHzAomn3HUSAjJL25J6nPCRv7ryhEwT2ZvzRTMqtghsm
 HYNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773579737; x=1774184537;
 h=cc:to:subject:date:from:message-id:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GNIfAmKm5ApCc+B0mFDnttKVftHd6ynLG4xrxceTwoc=;
 b=UfC3McyXBsNE9hQe7pXtHNqKWTDUipYyn9KW6n+52DNOu/uzCmef/n2zkMH0Y66AX6
 yLSDNIP7WoUYpTzruPTjCATtYKOOAj91h4HNI8oDS/hJxNgmmkP3Sx5qzL8Kg1s0ia67
 5RuCoEDGC9mSLAq8otbPJSyLZqd75Wi4Ua0tfcozUbro1aS9dRblexhNBj9/fiX42YBL
 3cCYmBIfbcKZ3AVfW8Zx+Teq/FPLoIFhInVOrI5oFJt77f4ELU3zFAr32hIjuhwbgBrO
 pTu+xbSJsKMtErwwXbbv0nF+34hGA6krR9fhKmxygFXP5rILqSY7gs/7MgPzplFzED0G
 hdcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX19H9PLTcTyHfYWPyHzO7NQiZbBE6mIvs8/5+Lq8X8D9tR3aJeCBTHbFz2C2omq1ZYuKOzWBZHqMFJ8lU=@nongnu.org
X-Gm-Message-State: AOJu0YxVWCaTmPwBY6DtIXfMNrmsdKoFqQBip1QImtUJaTY555roUeJr
 z0bkGKmCYtOQdw4lwKQ3mKIxA8/CeGOlOD264yM6iyQ+oQrCcMIFg3qIo3k1CHOb
X-Gm-Gg: ATEYQzyJvvJJIgkuQQPWnV3UyeSBqekFR4QkX+8+gtnMkhs5K8lciv4FLCKxw1IaxJK
 c1vdqPhFcyK7yJX+R0z4vzfpcGXfdrj5C8s3G3BVdpiFHLizoPGd7ZanQbtOaHAOBus99hYoc54
 RvY+7ZHcRuiozWHE/v39baZ0zqIivcOuoniEv5Hz1iaZJbK4zYdSUaVhNou0fu+b9BCKSJHeyZ8
 OgcZdjmK+VWrShDZlh5SzDX6YForoz21JyMCp+5kjwtIK/rtRVUigdpfeteeOopKv1/fVgRzppU
 LLliWDRYJNUd7r4ukEuJT6hq/sBeQkz+b+6utAHDajsneFERplW7hl6+02hdxu9JQH9KYispE6J
 jnIHiLtiOKaHHMStG01o81cVdYe8gqTbpWTQOM4Ycaa7pjnYzyt9FJpFibop5jjrUQ9yHCCGR0m
 hfZ7HzBHzy4Zo1vBx4NadhzeKSfb89cWxV7PB2cqqIxtNYwUCzpSju7Dy7k253YjKC4E6oZOlLb
 PtNhWvuUfXHrzLkYZR6OxyYEA==
X-Received: by 2002:a17:903:2ec7:b0:2ae:7f84:79e3 with SMTP id
 d9443c01a7336-2aeca9c64eamr91020695ad.16.1773579736856; 
 Sun, 15 Mar 2026 06:02:16 -0700 (PDT)
Received: from Obsi.localdomain ([49.43.240.32])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2aece56c2c4sm97450845ad.2.2026.03.15.06.02.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Mar 2026 06:02:16 -0700 (PDT)
Message-ID: <69b6add8.170a0220.2bbc48.6528@mx.google.com>
From: Aadhya-R <raghavendraaadhya@gmail.com>
X-Google-Original-From: Aadhya-R <aadhyar.cs24@rvce.edu.in>
Date: Sun, 15 Mar 2026 04:28:32 +0000
Subject: [PATCH v3 1/2] disas/sparc: Fix integer overflow in compare_opcodes
To: mark.cave-ayland@ilande.co.uk
Cc: qemu-devel@nongnu.org,
    qemu-trivial@nongnu.org
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=raghavendraaadhya@gmail.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_06_12=1.543,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Change '1 << i' to '1ul << i' to prevent undefined behavior when shifting into the sign bit on the 31st iteration. Resolves SVACE static analyzer warning.
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



