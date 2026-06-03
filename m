Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C8E2CD6E55
	for <qemu-trivial@archiver.kernel.org>; Wed,  3 Jun 2026 07:05:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wUfem-0001WQ-CO; Wed, 03 Jun 2026 03:04:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tahsinahmed217@gmail.com>)
 id 1wUcum-0000QG-0Z
 for qemu-trivial@nongnu.org; Wed, 03 Jun 2026 00:09:12 -0400
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tahsinahmed217@gmail.com>)
 id 1wUcuk-0003wc-Im
 for qemu-trivial@nongnu.org; Wed, 03 Jun 2026 00:09:11 -0400
Received: by mail-qk1-x733.google.com with SMTP id
 af79cd13be357-91587626a3eso106909985a.2
 for <qemu-trivial@nongnu.org>; Tue, 02 Jun 2026 21:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780459748; x=1781064548; darn=nongnu.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FVvLPhtSjcR9JUA+chKlMdrtJg+0QqpGpLjLsEGQ0SE=;
 b=cb0hxN9JjEZgylPlaWGs2EgCgrW2rkTnSpm6RhpBitLKC9fdLmDU4BFlRs6SvM9UNH
 8faNsXRlEhYno3VRYMlvSYGUhjDDQC5WtsMxJIqMqnWtPR/bBA0UiYQY3DkO/HotO4fG
 p5iUPLTS8gpejUsQ5+VtmYtOJv8beaMVgryfX8t2eQpTr77AOpIDJJKykalRLsPTqDt5
 Mbf9n18m5i4utQCsvdPFKqgfwjdpK8X2EA5tddQp+IKllgB+OBGpKibIfLXYpkzAbtoB
 O6p1K+Oy3NBV7u9OD+3FzCu6ak1pOlcCtk15/fHFCk1iFJCnB7MaIdIWgu7eA6Q8CCH5
 VExg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780459748; x=1781064548;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FVvLPhtSjcR9JUA+chKlMdrtJg+0QqpGpLjLsEGQ0SE=;
 b=rKRK8/iUdylecUnuRY/X/CwsIdDxsUk5RtAm0XI0OOnNcsMlveksLrKaMkCLLlWxwk
 OfpIW+TEm7OD5WJj417u1KCPEYdlaM+Ez9edQcw7se2ZqdfrRu0givmdtYTwvWVmDhGj
 me/nu+7BPE7SIAeOp1fmbwn3+gL04DL/siRJRsBd5VtDioSDkt0G2OMOMadG4Ds924Ko
 MTD10gjDG66d465VG0VIl3lxzERVCfruih8F+kQjNlGiD/lHPAN/RvrX+a+6AL8YYp/R
 yJZ1a7/k5EWA7IdXWk5tkO0ZjbCDVprx7Su9+RcPX1rf3o9NnqLy522TD6gUxSNOm/1F
 PEOQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9jt4aI/ByTTfBBiJgVpP4g5SxL4uRGFxHQVwnx2VrHTkmxY1AmeiHJYuQAb6kDP7OmKD7FKI6YUgEM1mA=@nongnu.org
X-Gm-Message-State: AOJu0YzWfGvJVU+XA1J0XkItCf4CWSxkEVWrN/w6ocPEZZ245PbzxgJc
 gxM8IT9CWqakuRhSjGwjPozYwk+zuEanoN446Dz1DUwhvqrpaKyvHDg+
X-Gm-Gg: Acq92OFAcEA7S/aFnWZnvv1ZRANXFNH4n9P2ybrkXYMq6QGW5SIv2XrgHsKepUoIkAE
 4K+SXuKJsFE+CvwHpTW7azzGmjl6m+HXltGVS6jLZ390pZY1rGfoqzqd76GeK9FzUm1J8zH4GKR
 nh0PBVl690IkbIjh1J5qgwv15dnHYXmqJWN1cp0SgiD0Qy+TrnRze63VqwGPfeLxsdXDHpFoYaH
 5FoP7vm/iUinIaaNjZ8ETVe7V5wp4sMYTAz9ZPcG5TzHoyqoFpFxRAqr5p59Tiirdz33+jEMr9+
 IhFjauAPMexOvH8lDD32sjmJj/ufSJ6dyoD6uxqRk0X6e3jXwoC314w0MidirwgiuNUhrNDfQq2
 xmxG9jLVHx5meSg71lItlnhdxBMUGJ6GjQAh7YE3Z/Bb3Eetk23YsIm8FwX+dl9tTZ4Jj/b7lU0
 PJXs1gbriZ+NH/qILutTGWJdr70dsP0GKS3UtzQocvVo156rpe5PM=
X-Received: by 2002:a05:620a:2406:10b0:915:6c4d:d74b with SMTP id
 af79cd13be357-9158a7aa7d7mr236671685a.31.1780459747767; 
 Tue, 02 Jun 2026 21:09:07 -0700 (PDT)
Received: from cosmos.localdomain ([47.230.224.41])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9158a37bae6sm132017185a.31.2026.06.02.21.09.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2026 21:09:07 -0700 (PDT)
From: tahsina13 <tahsinahmed217@gmail.com>
Date: Wed, 03 Jun 2026 00:08:58 -0400
Subject: [PATCH] system/cpus.c: Change qemu_cond_wait -> qemu_cond_wait_bql
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-qemu_cond_wait_bql-v1-1-0d04f0d587cd@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDMwMj3cLU3NL45Py8lPjyxMyS+KTCHF1jSwPLZNNUI3MjExMloMaCotS
 0zAqwodGxEH5xaVJWanIJyCSl2loA3lJ90XYAAAA=
X-Change-ID: 20260602-qemu_cond_wait_bql-3909c5e27244
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>, 
 qemu-trivial@nongnu.org, tahsina13 <tahsinahmed217@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780459745; l=1379;
 i=tahsinahmed217@gmail.com; s=20260603; h=from:subject:message-id;
 bh=8wUkmQvp4eac2gbo42vE4QAyVYFNtSicEAvecVTgQvM=;
 b=6kryT1Wv65VAkKTPwU9mkNnE7A4cCWdmUPVdBOcxs3i0Dqkq3bD31jzEyxkBOvE3Cf/ccMOAx
 XGfppltC29ECw7HoBz5GYteI9TLK7y7Ox2aQJ0fkZscAmmsvhaZqUTj
X-Developer-Key: i=tahsinahmed217@gmail.com; a=ed25519;
 pk=JfqIEYrQSsTnK0suzDJvT1w9PC0wESzl1NHgiFwAMQQ=
Received-SPF: pass client-ip=2607:f8b0:4864:20::733;
 envelope-from=tahsinahmed217@gmail.com; helo=mail-qk1-x733.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 03 Jun 2026 03:04:51 -0400
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

Change qemu_cond_wait to qemu_cond_wait_bql when waiting on the bql.

Signed-off-by: tahsina13 <tahsinahmed217@gmail.com>
---
 system/cpus.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/system/cpus.c b/system/cpus.c
index bded87feb1..33b33bd4e1 100644
--- a/system/cpus.c
+++ b/system/cpus.c
@@ -469,7 +469,7 @@ void qemu_process_cpu_events(CPUState *cpu)
             slept = true;
             qemu_plugin_vcpu_idle_cb(cpu);
         }
-        qemu_cond_wait(cpu->halt_cond, &bql);
+        qemu_cond_wait_bql(cpu->halt_cond);
     }
     if (slept) {
         qemu_plugin_vcpu_resume_cb(cpu);
@@ -654,7 +654,7 @@ void pause_all_vcpus(void)
     replay_mutex_unlock();
 
     while (!all_vcpus_paused()) {
-        qemu_cond_wait(&qemu_pause_cond, &bql);
+        qemu_cond_wait_bql(&qemu_pause_cond);
         /* FIXME: is this needed? */
         CPU_FOREACH(cpu) {
             qemu_cpu_kick(cpu);
@@ -726,7 +726,7 @@ void qemu_init_vcpu(CPUState *cpu)
     cpus_accel->create_vcpu_thread(cpu);
 
     while (!cpu->created) {
-        qemu_cond_wait(&qemu_cpu_cond, &bql);
+        qemu_cond_wait_bql(&qemu_cpu_cond);
     }
 }
 

---
base-commit: 405c32d2b18a683ba36301351af75125d9afda08
change-id: 20260602-qemu_cond_wait_bql-3909c5e27244

Best regards,
--  
tahsina13 <tahsinahmed217@gmail.com>


