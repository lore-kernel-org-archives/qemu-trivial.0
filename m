Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uBhLO-0007SR-7J
	for mharc-qemu-trivial@gnu.org; Sun, 04 May 2025 17:57:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uBhLN-0007RY-G2
 for qemu-trivial@nongnu.org; Sun, 04 May 2025 17:57:53 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uBhLM-0005Br-5H
 for qemu-trivial@nongnu.org; Sun, 04 May 2025 17:57:53 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-22e15aea506so26218365ad.1
 for <qemu-trivial@nongnu.org>; Sun, 04 May 2025 14:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746395870; x=1747000670; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zwc13b8kC9Z5he0z0xvhp1yrhhR7Vt1vlSABNOYVc1M=;
 b=LGQzhjBgt2ttE9oJZgT7ocBsB0XIUL8ipEyqdR4Z1JNyf9vZI0sdwavhYBSpqwJTRc
 D2C4sz7FkFFvssT7mKatxvoa8iVVetQV+gV0TX6wvmrhwLUIs3Ux3/gFlo2bmYH5G8L0
 fyWZuycALRVIKvleHBrdrRxHSuhGLQanxiVKFN3SbVCatkG8V8sZI94deCc7pmBni4BK
 +/oJcOOMgDjQcTFkTgg6Gr7YmFsuct9gh4A+d98YgKkpSeSned1+KZtOaU+eKFiRZiE8
 phlDSf1toMTqljM+rdDb9NLa/i69xwk0Rgu28zG3byM8XhzlkMb2+V0B/kk8H/7AgHnj
 l3NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746395870; x=1747000670;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zwc13b8kC9Z5he0z0xvhp1yrhhR7Vt1vlSABNOYVc1M=;
 b=Nkx4s9PTY9rswVGgS5v2krOv0fUic7O8yV5KPOFmZrIDpUUKbOgW6haWzsAt6Ho9hz
 Fd2xTkqpOViI5Xk3CxDxLgpsbVKqXKsl5x/pUd6etfiN+viUZpRWQ91iQ2d4MaQbIQgf
 pZuBBJgIueZ7HwlMZ+j/Zmpe3PRqjWth7heTtsMI/APMV1BGiuBi0svGdyOMRjNAti9o
 v5nfM6Tf1VL9C2nO82N7MRf/BPdgb8Jn7RXp3Dd8DedB+JMcUqNfsR/EyQCpXyptNhmz
 YwoMXdGpRpO3Cevk+Sk59G1Qs4voeJ25DxOLsHHh0pIrC7oPZkHBKA2L1V7jlr2bQ9Zj
 Z7YA==
X-Gm-Message-State: AOJu0YwBfeNBoZzY16NIq3ZwNHpqtPB0zl1AhNnPBqaJTuOsgBlsId3l
 oDLa1vswajJlzWyo81ODQMTZWEcDN81ZoWkokdVhf2W0wWTg4T1UPK8MixsmaZw=
X-Gm-Gg: ASbGncsk98EYh7MtErg8lTVXwmj++XhNVwDrHtxyebAvdj+wmpyKeOVCWTWuxcaRsa7
 jpLwDYW1juA3JNTlPH2Q6r0nl7z3efqRRFUfHsBUDAykzgfxbvPdmRpvEuxXMIkBIraBfNbhhnt
 EGGn6nt2p0a8fiZHbZFxn7oehEE+BuR51+wNc7cZMZIDvCia3cgCf/rZgHEFjHZdIQU3xAAsupZ
 ZC5oiE13YKYzZ4Zoznk5P5GQR20bv7qYe26H8QFeI2MCxfjkfGQbDuQIyW6E1b2j4f7hMEBWbsG
 jUhGSxqzpkEPE3EhzweiieUSGxTrLpqfSNb2PC8vaugV9km8
X-Google-Smtp-Source: AGHT+IECbiCHIB9yXeZyP/73ydQgOkmKcL7fDhfifpt8nRB3vdpLxi/bJq0+dAIeGnkTNsGzJmDT0w==
X-Received: by 2002:a17:902:dacf:b0:224:24d5:f20a with SMTP id
 d9443c01a7336-22e1eaeecf4mr93104875ad.48.1746395870493; 
 Sun, 04 May 2025 14:57:50 -0700 (PDT)
Received: from gromero0.. ([200.150.181.215]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22e152204fesm41664875ad.137.2025.05.04.14.57.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 May 2025 14:57:50 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, philmd@linaro.org, alex.bennee@linaro.org,
 gustavo.romero@linaro.org
Subject: [PATCH] qom/object: Fix typo in comment
Date: Sun,  4 May 2025 21:56:33 +0000
Message-Id: <20250504215639.54860-5-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sun, 04 May 2025 21:57:53 -0000

Fix duplicate preposition in comment.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 qom/object.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qom/object.c b/qom/object.c
index 664f0f24ae..7b013f40a0 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -485,7 +485,7 @@ bool object_apply_global_props(Object *obj, const GPtrArray *props,
  * Slot 0: accelerator's global property defaults
  * Slot 1: machine's global property defaults
  * Slot 2: global properties from legacy command line option
- * Each is a GPtrArray of of GlobalProperty.
+ * Each is a GPtrArray of GlobalProperty.
  * Applied in order, later entries override earlier ones.
  */
 static GPtrArray *object_compat_props[3];
-- 
2.34.1


