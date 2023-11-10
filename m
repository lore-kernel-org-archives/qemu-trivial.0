Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1r1UbR-00051w-Ca
	for mharc-qemu-trivial@gnu.org; Fri, 10 Nov 2023 11:43:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1r1UbM-0004yT-8A
 for qemu-trivial@nongnu.org; Fri, 10 Nov 2023 11:43:25 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1r1UbK-0001wm-IH
 for qemu-trivial@nongnu.org; Fri, 10 Nov 2023 11:43:24 -0500
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-32d81864e3fso1226129f8f.2
 for <qemu-trivial@nongnu.org>; Fri, 10 Nov 2023 08:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699634600; x=1700239400; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6Z/d/PlRIYV975I1CTJVwYo3Y8uvT4BaRAHDGx9VFCo=;
 b=k9umReDId+IMOUq6lNUoaLr143xY29H7d/WYEp8rOh5fjdAyJCliRiZFQJl+cTvvHj
 Z37yup8kNeW6JYYKVP/bV2wLChJ59mNsfPwq216VRDkC56krSzuWD3Uz5xEZAHhe59sx
 YGt3r55j2P2sZp//M6PVAH9U0Dnp1WL71ehrRokSkS8sqCqMKWv2MGRbVg2varThsrPk
 e346Mma6GDGUdDeeuIkLSrvIWTmKGdMWtvIIuqKnVqqBT7ZaFMIu6yJfQSjE5LNo7j5e
 crmBbsz4/oJ3kVhfKaD/v0UJt3kUHNczmVI1TRPeaGMMuaM44uI6vtHUVwl1pgHdyRcb
 1iig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699634600; x=1700239400;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6Z/d/PlRIYV975I1CTJVwYo3Y8uvT4BaRAHDGx9VFCo=;
 b=W+HV0xkuNFCRav5fp4wsqgJoKL6Jjqp0eb12TXt2wLeY7oJFE7ZwziFTpga8NIR7qY
 j0Bki1ooFJCKaJTlaqKWd5+O6NwG6DrY6Xwe6E5HV+v2mkbEiGwo1hXYBLXz0pF01Aot
 xY/SKM2E7tVEgPqCtMAMX2CpNVcN8npxhAOcfxHTAvA639fkPrZDoKvCJNWF2f1LXSvH
 lr25DPWeBZ1yQEIdNFVkpk+UPiMV5MTNvIMVNS/SR2IW53Bb6nOEQ3Vll8UCkUHC0oSd
 k8l5KgKhZaup4iB5H11u0COVRQOdTDX6BapDBtLopPUL6wWqIvYbMs+YVjEEy8gRikSX
 fIwA==
X-Gm-Message-State: AOJu0YxOEQ8gpZ2xhqjaHUfmwJ/OKTLK+lSS2r2CXEROsqf40nbCTV/y
 zA0tY7cRIYKmyT8FrVfEmg/aUA==
X-Google-Smtp-Source: AGHT+IGx5gc+JIu2aZBMQXpHFI/UqCkxNnckKmi5Lx2e4+ryDbsPkF/ivV3FxCrMYCvgyJB3V9qOxQ==
X-Received: by 2002:a5d:6c66:0:b0:32d:8819:4620 with SMTP id
 r6-20020a5d6c66000000b0032d88194620mr6701667wrz.14.1699634599977; 
 Fri, 10 Nov 2023 08:43:19 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 s8-20020adfea88000000b003196b1bb528sm2247958wrm.64.2023.11.10.08.43.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Nov 2023 08:43:19 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH] hw/audio/es1370: Clean up comment
Date: Fri, 10 Nov 2023 16:43:18 +0000
Message-Id: <20231110164318.2197569-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 10 Nov 2023 16:43:25 -0000

Replace a sweary comment with one that's a bit more helpful to
future readers of the code.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/audio/es1370.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/audio/es1370.c b/hw/audio/es1370.c
index 91c47330ad3..fad55412119 100644
--- a/hw/audio/es1370.c
+++ b/hw/audio/es1370.c
@@ -670,8 +670,13 @@ static void es1370_transfer_audio (ES1370State *s, struct chan *d, int loop_sel,
     cnt += (transferred + d->leftover) >> 2;
 
     if (s->sctl & loop_sel) {
-        /* Bah, how stupid is that having a 0 represent true value?
-           i just spent few hours on this shit */
+        /*
+         * loop_sel tells us which bit in the SCTL register to look at
+         * (either P1_LOOP_SEL, P2_LOOP_SEL or R1_LOOP_SEL). The sense
+         * of these bits is 0 for loop mode (set interrupt and keep recording
+         * when the sample count reaches zero) or 1 for stop mode (set
+         * interrupt and stop recording).
+         */
         AUD_log ("es1370: warning", "non looping mode\n");
     } else {
         d->frame_cnt = size;
-- 
2.34.1


