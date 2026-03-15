Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34A54D58B08
	for <qemu-trivial@archiver.kernel.org>; Sun, 15 Mar 2026 05:31:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1w1e4G-0008TC-4g; Sun, 15 Mar 2026 01:31:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aadhyar.cs24@rvce.edu.in>)
 id 1w1e49-0008OQ-04
 for qemu-trivial@nongnu.org; Sun, 15 Mar 2026 01:31:09 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aadhyar.cs24@rvce.edu.in>)
 id 1w1e45-0006py-26
 for qemu-trivial@nongnu.org; Sun, 15 Mar 2026 01:31:04 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4855dbfc129so12206115e9.0
 for <qemu-trivial@nongnu.org>; Sat, 14 Mar 2026 22:31:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773552659; cv=none;
 d=google.com; s=arc-20240605;
 b=d1qxjiQkOA71s0sLOaow5cwk6xlnaZNO5apiFncgECbS01jCCzQ14HfwKh764mN5sC
 cVwiHIMsu2iKAST6cGdPzyulvQo2tvQ59lpTAfRuZLUwSAcRs14YErQblRNx8OofHsUy
 7xH1gqJsDNT2hU2dAzff8B/y+xaCNnVPQg8JvruUUgQU475kuF6N3BWZ5l5IE5BJje+/
 0RH2htKL0fuKPffQ0Qp2OqvejHWETgqygN6nDetcIh90ERXKQue/OZqSlLg7Lb81J7Wx
 ZFIYy0vxesYz1ih6KH4LFCucSslRv57judFhbfJORi3jYtYfshd0GMJGWEc+if6JAY5t
 eD7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
 bh=CfyygR+sECrrOERmmBzcfpk+QvGnGA8OCfr7siflh38=;
 fh=F279LDLbJ0CherWYxyqjds00pEIiWFjWRCq7b6QARwA=;
 b=N2Kx65XNOj2Hvy1/N+zac2I8v7jBTgJ8BOjDoM/lELyVlj3h341+7V7+rJ6sWpB2Fs
 Y1KzStr1MCnXYggCd6eSnX50YtqWPHekNk6WDEB9CBPKmbHuYYfvTrtwQK9gblviFYoV
 F6SkUKDZ/SAWuqq70aQ6UrIMhOJc6U2kBvaZGTmv36uCRJllBJlVW0YZgyhBN7LWIK+r
 yi8Db2WfYEN7lktHUeYiIV/7XUsDXDYg9NeFE34y37ZmI3bXZYwm2J9x6Nz1PWb4250v
 QMjvrzMcpyEtyjEaUPAjLKBxH57xxbRKD2VXmyt6JX074YwKeF8/EHW/zE8lGMn9Odfr
 QiLg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rvce-edu-in.20230601.gappssmtp.com; s=20230601; t=1773552659; x=1774157459;
 darn=nongnu.org; 
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=CfyygR+sECrrOERmmBzcfpk+QvGnGA8OCfr7siflh38=;
 b=y7JmnPJSOB3Mn/lWk2kg5ORp6WmmQjR+5sFbU2NPJhQW+iDxyepptQWYXo6B/0HsqK
 gietdFmqSL8vEeMpYXQEh+ZYFhcuCjyOw/v58/nVDDVlIrNPdgSc9YNiIYJu9BCOgbif
 r5KxoiQGGRiiwqINILXs4zhoo0U1TQYjEZ6KZ2lZrkkS9+q4uBzWKiAdz97RAF77Bf/f
 KftTpwu25xbxv1fXnAMCZsBEyFJ96JDcYG8eEKP+hubIUZ1BfSHDJM5nfiOxrkunL1gF
 ycSHJMMB5lKtRWM7TlxuZiJ5bhGUlFSAEsbA+3oG74RwcY50azZWsBvyWnLTm53itk05
 1fhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773552659; x=1774157459;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CfyygR+sECrrOERmmBzcfpk+QvGnGA8OCfr7siflh38=;
 b=RhWkQMkXqvBZKoyGuNQ41qzuhN6LvvKoRhmhfA5fgowLGP7jR8FMQbxxr+wWCZuMMi
 2xprMYfE8eh+FOjrEw52xEPcRG7KqUBRGSFqiEvguGn6LIteH3zpQqEYGSrKeQWL24l/
 fODai2XDKkS3vkmQL1zj5QS4PcKcbnatMNi7sqr3xz6yQtkiIdbTQy188hR6j9VJsdG/
 VvgH7G1EyVEX0/PvKo8dX2k52uqGWlcZ4PrDw54SZIczi0CXBNmdnnfxQo3A1q6JTuCa
 0XDk0lba7XON4Ho9IeGJ0Cvh1LkhlIIWwduHfdiBCLkfHOF8mj68cDH5Oj24kiVen9qq
 uQMA==
X-Gm-Message-State: AOJu0YzFSMkmEB8NJCeT67xs5lbsrSYSqse8nnHY9TThWhjiNMtycZwd
 8UoqDRC9ZOTL3boGkga83+qeOtbzR19xMTzuvm9dimGOFJQCztL81aNeyJURDNGmJsVckwUw3Go
 ehO3Gm9pMUmVGF8KxFVHoO9Ojl5rk0XzevT+KPsRd0A==
X-Gm-Gg: ATEYQzx8rtFYH358B6c9pty1H30wN62CB+uoUmHGakgD8V+5OmZQNo7HW9/Q2L34PCb
 udOF+04BoZ01FfQbTNpPHrB1nyz/VvEERxHMRmjt+ipjNc66R2D87lkUyqiH/6ffR697wTjQzne
 yrJStRLyr1VugdM7l242BEOdqhfWG74usFKyixb9Bv5k8MHNCw1XMqw++94bZGxmJCVD+htvDbC
 pirL6JR17+wCk9ryqqO7i9xGf52B50eT4gWV//0nEmggIFXlhQk8DIo/jr3ZBZafApa7zi6LKRt
 ysV+h86qXtg3ohDmmmS9XRz6Bp3RvMqSuIRKvp6swgU2KMrkVskCz33lTLvcgWYjKNO9GKWDrun
 j1/GBsf8K+eEjdFao0YqVfQ9/fw==
X-Received: by 2002:a05:600c:a46:b0:485:3bb5:92c5 with SMTP id
 5b1f17b1804b1-485566d52c8mr150093825e9.14.1773552658767; Sat, 14 Mar 2026
 22:30:58 -0700 (PDT)
MIME-Version: 1.0
From: AADHYA R <aadhyar.cs24@rvce.edu.in>
Date: Sun, 15 Mar 2026 11:00:47 +0530
X-Gm-Features: AaiRm51T85fm4nc5M48-zs4j7ctlFbYz9MPb-19UWK-zR_090tJcs5lWsQv7pu8
Message-ID: <CABHAK8MozZd5SkxsCQTxHR9xbGfWdJii7dAJEgCJS_yMVtN0+A@mail.gmail.com>
Subject: [PATCH v3] hw/audio/fmopl: Convert malloc/free to g_malloc/g_free
To: kraxel@redhat.com
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=aadhyar.cs24@rvce.edu.in; helo=mail-wm1-x332.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From 4311b6e7ea205c16a96cb7f4392b26db9e7b4d6f Mon Sep 17 00:00:00 2001
From: Aadhya R <aadhyar.cs24@rvce.edu.in>
Date: Sat, 14 Mar 2026 08:22:51 +0000
Subject: [PATCH v3] hw/audio/fmopl: Convert malloc/free to g_malloc/g_free

As per the QEMU coding style guide, replace standard C malloc()
and free() with GLib's g_malloc() and g_free().

Since g_malloc() safely aborts on out-of-memory errors, the
redundant NULL checks and their associated error-handling paths
have been removed.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1798

Signed-off-by: Aadhya R <aadhyar.cs24@rvce.edu.in>
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

 #define FREQ_BITS 24 /* frequency turn          */
@@ -607,26 +606,10 @@ static int OPLOpenTable( void )
  double pom;

  /* allocate dynamic tables */
- if( (TL_TABLE = malloc(TL_MAX*2*sizeof(int32_t))) == NULL)
- return 0;
- if( (SIN_TABLE = malloc(SIN_ENT*4 *sizeof(int32_t *))) == NULL)
- {
- free(TL_TABLE);
- return 0;
- }
- if( (AMS_TABLE = malloc(AMS_ENT*2 *sizeof(int32_t))) == NULL)
- {
- free(TL_TABLE);
- free(SIN_TABLE);
- return 0;
- }
- if( (VIB_TABLE = malloc(VIB_ENT*2 *sizeof(int32_t))) == NULL)
- {
- free(TL_TABLE);
- free(SIN_TABLE);
- free(AMS_TABLE);
- return 0;
- }
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
- free(TL_TABLE);
- free(SIN_TABLE);
- free(AMS_TABLE);
- free(VIB_TABLE);
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
- ptr = malloc(state_size);
- if(ptr==NULL) return NULL;
- /* clear */
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
- free(OPL);
+    g_free(OPL);
 }

 /* ----------  Option handlers ----------       */
-- 
2.43.0

