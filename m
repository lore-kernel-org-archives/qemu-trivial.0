Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0A70106ACF9
	for <qemu-trivial@archiver.kernel.org>; Sat, 14 Mar 2026 20:16:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1w1VOa-0007yb-A5; Sat, 14 Mar 2026 16:15:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aadhyar.cs24@rvce.edu.in>)
 id 1w1UgG-0007LD-1h
 for qemu-trivial@nongnu.org; Sat, 14 Mar 2026 15:29:48 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aadhyar.cs24@rvce.edu.in>)
 id 1w1UgE-00066i-7T
 for qemu-trivial@nongnu.org; Sat, 14 Mar 2026 15:29:47 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-439f59dfda2so2572290f8f.2
 for <qemu-trivial@nongnu.org>; Sat, 14 Mar 2026 12:29:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773516581; cv=none;
 d=google.com; s=arc-20240605;
 b=iRrsheqZVnYFmr0W9P5rg9vYF8P28B6nj5gnxDf1pMnHFBb0VsGrhq5i4UjMa+3quf
 TCv+tiqj0EUu0id8qXqCrZ0qfI+Q2UpN848jHQIfwST/92GteOL26EuxGuw77hbsIYv1
 kgd8CEzLMExplWPElyPV1DAyLVo4ZpQr1mjCQKkjPkqdDL9iDV1fpUUVGH70EzMJ0O0B
 KVWyOWfbzaJo0VdMGH3jAmqAcCk5/lRvAnd0ErCjLtKZAztr2DKH0YzRqvyoerWVBBWL
 TGCRmGaSEGJL4rpvuLNvVbvU0kqGMcd8Upzhq8wYyFNXI4CqJ75xV7C4O8x4XZu0/raT
 zmhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
 bh=xLi4fHtc94ZOaV2+k4cXgPZo2Q77amdrgeIWUHhmgh4=;
 fh=F279LDLbJ0CherWYxyqjds00pEIiWFjWRCq7b6QARwA=;
 b=K+o27tiE4m9SmPTHD9SF5pAg22IRd8sN/ufptz/Oxez/bO7+YcIIt7sMCgNMVeDJnR
 qQ4YmzjvhxWMLelP1vJV1hKltPeBMf6V/tS6WBfor0knIdr59TscXmCNPRaoqanV/Tkj
 XZV941cgXoXk7TiRvlz6PcJ08AalsLkZWEXEo3KnHWFkIbmL0AK8y0XwebgGQzMFMLUr
 ABPVLYoFPFbAHeni3eiEZv7zNhWsj8H1GBuQUkQn1cT4PA/pX/lm9ENymZoMu4g6KX9z
 HuIr3BU99sdsYjM/7/Bm0ZGW20izMPr5+muKbBk8VxRSyLfLF3tYDKlos4tLv7MuQLoz
 ixeg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rvce-edu-in.20230601.gappssmtp.com; s=20230601; t=1773516581; x=1774121381;
 darn=nongnu.org; 
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=xLi4fHtc94ZOaV2+k4cXgPZo2Q77amdrgeIWUHhmgh4=;
 b=K5eZzkZRr4Q2zvcLMU4VUCVHeS5zYpwSKtZyHxy3TAZ7oLD4mXqXcVSxBzLsxji7kM
 cwH68e68voAgHxGGEVFr3OSmdWyAg4ACiO01cXZ08h/fTEP0/vMnhT68gprZDGpuCi6+
 7eZTk3ElsbVZ/IuPoq5bNFXJ3/SSMIsa6AN2jZXs6ypcjN7npoq+JNgpZu1lghZeDES3
 +2sg8hyABPJQhf9uUvlkNHfX6xaBPs/iVPYhhzph7qnm2kj+Yd7Lh2Q+dpFYPYz5HYYb
 RXE31h63yzt9jny6gFpXUnYiMt/X+L8a32LQcH+8ku2LPI0I9MnFiiJ4bYkGTN9goAQD
 N9Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773516581; x=1774121381;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xLi4fHtc94ZOaV2+k4cXgPZo2Q77amdrgeIWUHhmgh4=;
 b=H7CQbEYp2ttfJT8hbv9WDmIZRhPLWLBv7OJCoEQgPOc6104dG8kMyzXCl8Z3n9RDo/
 uJ5byoXAqLdx9VGCBk0R1+FaTEugCraEOyW62tAlcDWu9KyfEy7TBEUDEmgfKeBEDgn4
 f5FLqyiw4RkCB5XOoqvsH1zVn77iPS3kLZH7n9Q7jImHR+Uh/bctycCtcM+pPydejSxE
 rd8ONBqkR8d37R+FMvuiYEtTP9NbnkDWOx6yD2VpQRog411yK2whJ4ZJw8Ad9yzwr1aO
 1u8ZDjWiB0WCRcv4XDiFqqU8Fvb/ayIKI2UHTcQE33UmilEPEbnPfQsJC1MqRpzb/d1f
 h6Rw==
X-Gm-Message-State: AOJu0YxXnogn+LZ3DhPjbuUb8aVWuST/NLziTdFsBAxybJsNq6wjaQBj
 3WR9kD0l6H71duQ1kXzO8OIcriiYSgjAHt2tINSl853QKeCT0Zfu6SMNL8yeFhb3R7Ff+GmsL12
 jQFyzAPaRo9gbucoRbVbkjoQ1fZfs9TM9A5LCkJS+NPAXOKQ+OnBfsWThQA==
X-Gm-Gg: ATEYQzwoHgKLJZbtcjzGARk8w6KN1s/yWFo4uwd3Qtx/lil4v/eKDBeyhg3ac+ztkFG
 AbsveofjtO08Zh00evf24+pX7r1ZA2C7DYLCLtKQIIrncUGHZbEtj5qOHPZTtrIVs3FnZN0wLI5
 FDvaqGHeAn4a+B4udSTf+soEuL9A8RMP9/mj0KHuNp53I5xSnkoXU2Zb3Qahbk8R4ynaOtSidxP
 JMLJBjheHA1mFbZEBDVnhJqxZyxkZQlgDQzfht7J/fEI5MizHPKtOqZiFaZPhyM0zKCsH+Tw7Po
 sK8NUoCRsLS1BavWmtCKcMedeiIzT6fJdz59ScBSPLSLvU8I2XXj9xXHLagysX9lF3+1ukfauYt
 OgChq9zHYzcEGrgaz7SexNNW4FA==
X-Received: by 2002:a05:6000:1886:b0:439:8f32:8674 with SMTP id
 ffacd0b85a97d-43a04dc4bffmr13937757f8f.53.1773516581083; Sat, 14 Mar 2026
 12:29:41 -0700 (PDT)
MIME-Version: 1.0
From: AADHYA R <aadhyar.cs24@rvce.edu.in>
Date: Sun, 15 Mar 2026 00:59:29 +0530
X-Gm-Features: AaiRm52TMzBYo7nlhg_YzEbgquHeyiv6YT1kV9wMhbUtAT-Iheu9--vL1y1sK8M
Message-ID: <CABHAK8Nuabpy412TgdEqtNJ0tucrqqVupwnZCYrZGmfHFtH5tw@mail.gmail.com>
Subject: [PATCH] hw/audio/fmopl: Convert malloc/free to g_malloc/g_free
To: kraxel@redhat.com
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=aadhyar.cs24@rvce.edu.in; helo=mail-wr1-x433.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 14 Mar 2026 16:15:35 -0400
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

As per the QEMU coding style guide, replace standard C malloc()
and free() with GLib's g_malloc() and g_free().

Since g_malloc() safely aborts on out-of-memory errors, the
redundant NULL checks and their associated error-handling paths
have been removed.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1798

Signed-off-by: Aadhya-R <aadhyar.cs24@rvce.edu.in>
---
 hw/audio/fmopl.c | 41 ++++++++++++-----------------------------
 1 file changed, 12 insertions(+), 29 deletions(-)

diff --git a/hw/audio/fmopl.c b/hw/audio/fmopl.c
index a63ad0f04d..79e43d5410 100644
--- a/hw/audio/fmopl.c
+++ b/hw/audio/fmopl.c
@@ -50,7 +50,6 @@ static int opl_dbg_maxchip,opl_dbg_chip;
 /* attack/decay rate time rate */
 #define OPL_ARRATE     141280  /* RATE 4 =  2826.24ms @ 3.6MHz */
 #define OPL_DRRATE    1956000  /* RATE 4 = 39280.64ms @ 3.6MHz */
-
 #define DELTAT_MIXING_LEVEL (1) /* DELTA-T ADPCM MIXING LEVEL */

 #define FREQ_BITS 24                   /* frequency turn          */
@@ -607,26 +606,10 @@ static int OPLOpenTable( void )
         double pom;

         /* allocate dynamic tables */
-       if( (TL_TABLE = malloc(TL_MAX*2*sizeof(int32_t))) == NULL)
-               return 0;
-       if( (SIN_TABLE = malloc(SIN_ENT*4 *sizeof(int32_t *))) == NULL)
-       {
-               free(TL_TABLE);
-               return 0;
-       }
-       if( (AMS_TABLE = malloc(AMS_ENT*2 *sizeof(int32_t))) == NULL)
-       {
-               free(TL_TABLE);
-               free(SIN_TABLE);
-               return 0;
-       }
-       if( (VIB_TABLE = malloc(VIB_ENT*2 *sizeof(int32_t))) == NULL)
-       {
-               free(TL_TABLE);
-               free(SIN_TABLE);
-               free(AMS_TABLE);
-               return 0;
-       }
+    TL_TABLE = g_malloc(TL_MAX * 2 * sizeof(int32_t));
+    SIN_TABLE = g_malloc(SIN_ENT * 4 * sizeof(int32_t *));
+    AMS_TABLE = g_malloc(AMS_ENT * 2 * sizeof(int32_t));
+    VIB_TABLE = g_malloc(VIB_ENT * 2 * sizeof(int32_t));
      ENV_CURVE = g_new(int32_t, 2 * EG_ENT + 1);
         /* make total level table */
         for (t = 0;t < EG_ENT-1 ;t++){
@@ -696,10 +679,10 @@ static int OPLOpenTable( void )
 static void OPLCloseTable( void )
 {
      g_free(ENV_CURVE);
-       free(TL_TABLE);
-       free(SIN_TABLE);
-       free(AMS_TABLE);
-       free(VIB_TABLE);
+    g_free(TL_TABLE);
+    g_free(SIN_TABLE);
+    g_free(AMS_TABLE);
+    g_free(VIB_TABLE);
 }

 /* CSM Key Control */
@@ -1082,9 +1065,9 @@ FM_OPL *OPLCreate(int clock, int rate)
         state_size  = sizeof(FM_OPL);
         state_size += sizeof(OPL_CH)*max_ch;
         /* allocate memory block */
-       ptr = malloc(state_size);
-       if(ptr==NULL) return NULL;
-       /* clear */
+    ptr = g_malloc(state_size);
+
+    /* clear */
         memset(ptr,0,state_size);
         OPL        = (FM_OPL *)ptr; ptr+=sizeof(FM_OPL);
         OPL->P_CH  = (OPL_CH *)ptr; ptr+=sizeof(OPL_CH)*max_ch;
@@ -1128,7 +1111,7 @@ void OPLDestroy(FM_OPL *OPL)
         }
 #endif
         OPL_UnLockTable();
-       free(OPL);
+    g_free(OPL);
 }

 /* ----------  Option handlers ----------       */
--
2.43.0

