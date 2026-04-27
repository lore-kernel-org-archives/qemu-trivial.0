Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9696FF8867
	for <qemu-trivial@archiver.kernel.org>; Mon, 27 Apr 2026 23:47:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wHVfA-0004Nz-NQ; Mon, 27 Apr 2026 19:46:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc.fast2004@gmail.com>)
 id 1wHUcE-0003GC-3T
 for qemu-trivial@nongnu.org; Mon, 27 Apr 2026 18:39:46 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luc.fast2004@gmail.com>)
 id 1wHUcB-0003qV-Pa
 for qemu-trivial@nongnu.org; Mon, 27 Apr 2026 18:39:45 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-7a469383e0bso86123457b3.2
 for <qemu-trivial@nongnu.org>; Mon, 27 Apr 2026 15:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777329579; x=1777934379; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QR/8CAv1yHVvho2HJOnICwYccKH8BL0Tjx0osxNOLnc=;
 b=qDkOV5+eSRanDfH7+5qntBRptFwQQPMkWzWyJvmxyJBxl7q1regxb1TLKwWsmbIJy/
 /iI9EJ42aOnCxhF4vTMLsO46n2cCRFGRcDaQiuX5LU9YVx270nZDZGVWW11SfkYIQwfh
 QJGgssr1i8p0/eQ/wVwCl/VAM4GwUBIZo/rktCKcNCV2MmkWNcruAt+/WNF5Dgrg2e/r
 wzcaAWcBxe/HiJ6lwdQpJvKxyhCE99rtHvi47inWi05ihbG7HLcpmx9QIHSLiV8XhZTG
 2iYCSrPH0CyQhKRwePRT1mJLtC3+2gkwEsWD+oyvRr3J8WJb+zTMBdy4KdK+DvHbTyI3
 1z8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777329579; x=1777934379;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QR/8CAv1yHVvho2HJOnICwYccKH8BL0Tjx0osxNOLnc=;
 b=qMLrZoxETigNtkcf0NdXJEdQJWz776zjgkleXdlvSFIV4s+yEdErwhNSh/nbGBVliF
 KoU659QjB2tZJ+0i2PciE+wuylFSO0/+YZ0eOm6r4tW6YIIIt+GOuO7ARCsGgOR1Ng0S
 Yq/DaY7JzQCe4YWau+Y0GosNyiEWT7bQT6gLMbmXPfu3ATLTvfSULDF/M/rYMtmHy1w1
 WtA+b1cqyFUNNeY662sw6s6DAAZqsg/Rukiz62CrWOsuggaXp9saLxdPyXHsqfxvn+6U
 MKBMtpXJg5nwZWUFAW2V28gF9+7c6QP20cGrXLpeFH8DMSYWY+aBrabJoMK6ezj36pwF
 L1SA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+K9nJKFnVDeSwyuTtrndjauBtuUtp5/VfnPW4Q8y8fPeN1caMU6oq6M1wite/qq6x5dzRB3kh4qupzTbA=@nongnu.org
X-Gm-Message-State: AOJu0YwZrKJpLe9f6BJD72EsSz9sJyptPSj2Wf6SftKcJhms2uL1UbN4
 5MKobXz3K/d+Ye+zB7nSrm0GJR0H23cxqsDDiiBhij6ZSENXAWAIuj1o
X-Gm-Gg: AeBDiesFdMTGN28tNARM6mknd7GtwVlrJ1fZ8fv7epkIR0HSgwcK3QJgNHa6QbeTz0T
 yMZDWGvZDTdpMk5qC/2qeWDzCudCC2J7ErtP0Cjp2V0v1RMdNb8HSUaKufJvssHxi0rvlxUe1Ss
 eEpWhxSjvO8YASmDPtAOsqSUB7IwtCp5XpIrke0BU2RIwQlMn5WBAvQHJTv5tE32KOYeqoUgGg+
 Cz3WnM5BefQao7yct3qcS14hwDMckvJJEzgDcQ0FWkcn70/e9wEhNNJ41/PirM+T766sgpCwTSB
 haxpEdgVs+tw0q8A1qI7il+3/256tcHuvizTveNYmiDCmBRjLmek7elGM8pVwALitErTjzraj/v
 BYOPrNS6QXe0q94f+d7UynHMOizm4rLkd0MXL8l+ELaE78/XgAl/LgErTBJzNP1XOlnAkT3DO2p
 u1GQYIrIyJvp51H/jz9hB8XWJ4lw+pZNtgkQrWm/TrGdMtrFoc+Q==
X-Received: by 2002:a05:690c:3586:b0:7bb:eaf:5101 with SMTP id
 00721157ae682-7bcf51f5d10mr6026207b3.16.1777329579070; 
 Mon, 27 Apr 2026 15:39:39 -0700 (PDT)
Received: from lucas-Vivobook-S14 ([2804:14d:8084:8f4b:f361:41cb:cdbc:1fa5])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-7bcf0d46735sm3890237b3.49.2026.04.27.15.39.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2026 15:39:38 -0700 (PDT)
From: Lucas Cardoso <luc.fast2004@gmail.com>
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com, qemu-trivial@nongnu.org,
 Lucas Cardoso <luc.fast2004@gmail.com>
Subject: [PATCH] hw/audio/fmopl.c: Convert malloc, free to g_malloc0,
 g_new and g_free
Date: Mon, 27 Apr 2026 19:39:28 -0300
Message-ID: <20260427223928.2742270-1-luc.fast2004@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=luc.fast2004@gmail.com; helo=mail-yw1-x1130.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 27 Apr 2026 19:46:50 -0400
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

In accordance with QEMU's coding style guidelines, replace raw memory
allocation functions (malloc/free) with their GLib equivalents
(g_new/g_malloc0/g_free).

Also removes the old generic error-handling code from
OPLOpenTable(), since the Glib functions abort the program automatically
if memory is exhausted.

Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/1798
Signed-off-by: Lucas Cardoso <luc.fast2004@gmail.com>
---
 hw/audio/fmopl.c | 41 +++++++++++------------------------------
 1 file changed, 11 insertions(+), 30 deletions(-)

diff --git a/hw/audio/fmopl.c b/hw/audio/fmopl.c
index a63ad0f04d..aeefc4c9fe 100644
--- a/hw/audio/fmopl.c
+++ b/hw/audio/fmopl.c
@@ -607,26 +607,10 @@ static int OPLOpenTable( void )
 	double pom;
 
 	/* allocate dynamic tables */
-	if( (TL_TABLE = malloc(TL_MAX*2*sizeof(int32_t))) == NULL)
-		return 0;
-	if( (SIN_TABLE = malloc(SIN_ENT*4 *sizeof(int32_t *))) == NULL)
-	{
-		free(TL_TABLE);
-		return 0;
-	}
-	if( (AMS_TABLE = malloc(AMS_ENT*2 *sizeof(int32_t))) == NULL)
-	{
-		free(TL_TABLE);
-		free(SIN_TABLE);
-		return 0;
-	}
-	if( (VIB_TABLE = malloc(VIB_ENT*2 *sizeof(int32_t))) == NULL)
-	{
-		free(TL_TABLE);
-		free(SIN_TABLE);
-		free(AMS_TABLE);
-		return 0;
-	}
+    TL_TABLE = g_new(int32_t, TL_MAX * 2);
+    SIN_TABLE = g_new(int32_t *, SIN_ENT * 4);
+    AMS_TABLE = g_new(int32_t, AMS_ENT * 2);
+    VIB_TABLE = g_new(int32_t, VIB_ENT * 2);
     ENV_CURVE = g_new(int32_t, 2 * EG_ENT + 1);
 	/* make total level table */
 	for (t = 0;t < EG_ENT-1 ;t++){
@@ -696,10 +680,10 @@ static int OPLOpenTable( void )
 static void OPLCloseTable( void )
 {
     g_free(ENV_CURVE);
-	free(TL_TABLE);
-	free(SIN_TABLE);
-	free(AMS_TABLE);
-	free(VIB_TABLE);
+    g_free(TL_TABLE);
+    g_free(SIN_TABLE);
+    g_free(AMS_TABLE);
+    g_free(VIB_TABLE);
 }
 
 /* CSM Key Control */
@@ -1081,11 +1065,8 @@ FM_OPL *OPLCreate(int clock, int rate)
 	/* allocate OPL state space */
 	state_size  = sizeof(FM_OPL);
 	state_size += sizeof(OPL_CH)*max_ch;
-	/* allocate memory block */
-	ptr = malloc(state_size);
-	if(ptr==NULL) return NULL;
-	/* clear */
-	memset(ptr,0,state_size);
+    /* allocate memory block and zero-initialize */
+    ptr = g_malloc0(state_size);
 	OPL        = (FM_OPL *)ptr; ptr+=sizeof(FM_OPL);
 	OPL->P_CH  = (OPL_CH *)ptr; ptr+=sizeof(OPL_CH)*max_ch;
 	/* set channel state pointer */
@@ -1128,7 +1109,7 @@ void OPLDestroy(FM_OPL *OPL)
 	}
 #endif
 	OPL_UnLockTable();
-	free(OPL);
+    g_free(OPL);
 }
 
 /* ----------  Option handlers ----------       */
-- 
2.51.0


