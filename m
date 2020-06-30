Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jqMNn-0008AX-Rh
	for mharc-qemu-trivial@gnu.org; Tue, 30 Jun 2020 15:57:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jqMNm-00089N-9J; Tue, 30 Jun 2020 15:57:30 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:39291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jqMNl-00044X-1U; Tue, 30 Jun 2020 15:57:30 -0400
Received: by mail-wr1-x443.google.com with SMTP id q5so21326445wru.6;
 Tue, 30 Jun 2020 12:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U3siTkfLjVJQEaCMkrInYfzFvhXImBmDXKhPhC0qsnI=;
 b=EkBDPDfm41QjdCyNFfSY3uO9T/oVk/BxIFYE0qDNx+tazx1A4MerVH4FuVtKqPYRAk
 HPgkYhV0xwggFAYHGpuW1hRR1ZJ2ENpqci1WoNwpu6seNx6nMaegjFFeQnt+BJhLsLay
 RBpdDcMJmxijtCkxTbnDDa6ciL2TYlvxcDMxwePlKFNRMqiFzJR/ZY/P9LRA0evleq7B
 8gPlOXojQZasRhB2eh0vwmIjhAJiJvXqw9EXX3y4+wqsHqWxuTH6Zdl4GtZoJPQuuHaf
 LbJuqP/EjPR/uS8YUV9M7h6HVX8dRYVy0wa3Sp/Mhf68Z6e1UNPjWm9NKs0OyZA1vwuZ
 wj6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=U3siTkfLjVJQEaCMkrInYfzFvhXImBmDXKhPhC0qsnI=;
 b=RyshWyFOkuXxlTbFEjrf5OgHXwaOXi7HMoC6uv6NYzDOT6tj4uIWy+NPkywbZifQXJ
 DnJtvhCMBCuNauwS69/RluUA2Y+F0xnsddXeldnywbCOMo/1uX2BP44mr0Ly3QQQ8XQc
 iv4NqK6Yy09X0B5/MR1VOYIy2haQs5vBT9L1xLUD0bLH4ctG0WClh/KaWju8hleJ+lkS
 6wjwF/cbOFrBIYVwkywFf65LGGTvTHMgZfHpL5DeB/s2ZVTF9Za2NHZ3/tC68UIEfZ6/
 Cr9K8PIliDRi/qV1VE+BthW9P+RKi988EhmJHHAEH7OHjc9ZEOmzW/QnglNIxnTMpdPm
 1Zjw==
X-Gm-Message-State: AOAM530fvCVCxaPBKEB4Y0xMT0dMAzSRW/7fcgFESqVG2yEfWzye5yJn
 8rkPfqRjUDzFTmkxsRssOtBqKpRcg5o=
X-Google-Smtp-Source: ABdhPJx2wD5QVQlaXTpGyvQCGyqHMszfdzf6bxNLksOfafCeVC68Eut2P33k2F5fh5WY+mPzFlTdXQ==
X-Received: by 2002:adf:f5ce:: with SMTP id k14mr22106264wrp.234.1593547046627; 
 Tue, 30 Jun 2020 12:57:26 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id k11sm5172979wrd.23.2020.06.30.12.57.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2020 12:57:26 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org, Yunqiang Su <ysu@wavecomp.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Cc: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Laurent Vivier <laurent@vivier.eu>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH v3 1/5] hw/mips/malta: Trivial code movement
Date: Tue, 30 Jun 2020 21:57:19 +0200
Message-Id: <20200630195723.1359-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200630195723.1359-1-f4bug@amsat.org>
References: <20200630195723.1359-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 30 Jun 2020 19:57:30 -0000

Trivial code movement to make the next patch easier to review.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/mips/malta.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index d95926a89c..5b371c1e34 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -1426,6 +1426,13 @@ static const TypeInfo mips_malta_device = {
     .instance_size = sizeof(MaltaState),
 };
 
+static void mips_malta_register_types(void)
+{
+    type_register_static(&mips_malta_device);
+}
+
+type_init(mips_malta_register_types)
+
 static void mips_malta_machine_init(MachineClass *mc)
 {
     mc->desc = "MIPS Malta Core LV";
@@ -1442,10 +1449,3 @@ static void mips_malta_machine_init(MachineClass *mc)
 }
 
 DEFINE_MACHINE("malta", mips_malta_machine_init)
-
-static void mips_malta_register_types(void)
-{
-    type_register_static(&mips_malta_device);
-}
-
-type_init(mips_malta_register_types)
-- 
2.21.3


