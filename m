Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rcLsk-0000m2-9L
	for mharc-qemu-trivial@gnu.org; Tue, 20 Feb 2024 03:53:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1rcLsi-0000id-5B
 for qemu-trivial@nongnu.org; Tue, 20 Feb 2024 03:53:40 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1rcLse-0008Hy-Oz
 for qemu-trivial@nongnu.org; Tue, 20 Feb 2024 03:53:39 -0500
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a3e4765c86eso299636566b.0
 for <qemu-trivial@nongnu.org>; Tue, 20 Feb 2024 00:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708419215; x=1709024015; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GDgHSGvtF7qGWqMyv82hrdTgzPdhn+1HJ5vS2mvdT+k=;
 b=WFs8ucruAXeC3ZWMKBzM8JO8YHKEN6OVm6dPuxfGoCggWu+h2kT4yNwRUx3+2ijAG5
 HxNNCGy8XjlP9k34lYSla/pj6olcheJqfHpqEEZobRtJ1XRoyUy/HqYu+zqXi3MyqL13
 Jsd3VONaZNZ0ZzdYRUFurXwXY44y7dLdPfUtXFbEjVZmFL7lelGyqTCAF6qfXtTw4NVJ
 mnccoNirNMYe5wMNcSPCO+lM4IIyoosGOKKeWISM1DH1Tw9wIXiTe9XaiqgSiONg7Ytl
 zIxJvFJLhPXsgdPF9wdWfZVlEWzN0hgKnegwjYEgj2qvrxpR7qs2avFe4hKKoF1Rro0g
 42tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708419215; x=1709024015;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GDgHSGvtF7qGWqMyv82hrdTgzPdhn+1HJ5vS2mvdT+k=;
 b=tCqyEnrvvFocxJoxU51R6DRUbrygxzyQw9OUqDpQInCcrPWWN1fbwnRp5z/wxM8yan
 PJdRD9E7cQ4LSOtrKAikTc/QRTv6R7AcUZ88+VOcmFe6CEYiCKA/4H0mJHIDCgk9AB35
 ieyk6LklSCZ5V0O6CIJ4WFp+7kbtY/PJE0pIwYkqhlr3QBHaN0epop1CBoEyNn/LvoOA
 1KwnrxfP5Ul/Izdhg3CE2cg4b92DmqolySxCJd6sIo4QEkO6OINrQCRK4MgnUqJZjtFu
 GcxAIUjFOQBu+BgTX0o3xmF+bfzss+CZS8RPpqUNllGiDIAkhwynii8G72LP7RPJzstU
 +pMQ==
X-Gm-Message-State: AOJu0Yxj2CWUXWrrhX2SceA9TNXEAXLsqajNq0OHvfXW6zTWbNbLCD4w
 zWXEEXD3J5oBL3bdiudQC0HG41d757ktsF652v3UzrVUN14qsBPzhaYUD9rSUbV//F3QDAiU/Wl
 NzjY=
X-Google-Smtp-Source: AGHT+IF05Jr+3eODfG9nVaaMLbz71kgqZc91A+v3oTf+OAYzS9zC6++fOVnHWqwv1rRNXeKZHLqYuw==
X-Received: by 2002:a17:907:100b:b0:a3e:876d:1b1 with SMTP id
 ox11-20020a170907100b00b00a3e876d01b1mr3944482ejb.20.1708419214949; 
 Tue, 20 Feb 2024 00:53:34 -0800 (PST)
Received: from localhost.localdomain (adsl-245.37.6.163.tellas.gr.
 [37.6.163.245]) by smtp.gmail.com with ESMTPSA id
 cu3-20020a170906ba8300b00a3d014fa12esm3747876ejd.196.2024.02.20.00.53.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 00:53:34 -0800 (PST)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Subject: [PATCH v1 21/21] target/sparc: correct typos
Date: Tue, 20 Feb 2024 10:52:28 +0200
Message-Id: <deda57f7d7dde2b88e2975ed6dee6cd85fb0ff96.1708419115.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1708419115.git.manos.pitsidianakis@linaro.org>
References: <cover.1708419115.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ej1-x62f.google.com
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
X-List-Received-Date: Tue, 20 Feb 2024 08:53:40 -0000

Correct typos automatically found with the `typos` tool
<https://crates.io/crates/typos>

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 target/sparc/asi.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/sparc/asi.h b/target/sparc/asi.h
index 3270ed0c7f..a66829674b 100644
--- a/target/sparc/asi.h
+++ b/target/sparc/asi.h
@@ -145,14 +145,14 @@
  * and later ASIs.
  */
 #define ASI_REAL                0x14 /* Real address, cacheable          */
-#define ASI_PHYS_USE_EC		0x14 /* PADDR, E-cachable		*/
-#define ASI_REAL_IO             0x15 /* Real address, non-cachable      */
+#define ASI_PHYS_USE_EC		0x14 /* PADDR, E-cacheable		*/
+#define ASI_REAL_IO             0x15 /* Real address, non-cacheable      */
 #define ASI_PHYS_BYPASS_EC_E	0x15 /* PADDR, E-bit			*/
 #define ASI_BLK_AIUP_4V		0x16 /* (4V) Prim, user, block ld/st	*/
 #define ASI_BLK_AIUS_4V		0x17 /* (4V) Sec, user, block ld/st	*/
 #define ASI_REAL_L              0x1c /* Real address, cacheable, LE      */
-#define ASI_PHYS_USE_EC_L	0x1c /* PADDR, E-cachable, little endian*/
-#define ASI_REAL_IO_L           0x1d /* Real address, non-cachable, LE  */
+#define ASI_PHYS_USE_EC_L	0x1c /* PADDR, E-cacheable, little endian*/
+#define ASI_REAL_IO_L           0x1d /* Real address, non-cacheable, LE  */
 #define ASI_PHYS_BYPASS_EC_E_L	0x1d /* PADDR, E-bit, little endian	*/
 #define ASI_BLK_AIUP_L_4V	0x1e /* (4V) Prim, user, block, l-endian*/
 #define ASI_BLK_AIUS_L_4V	0x1f /* (4V) Sec, user, block, l-endian	*/
-- 
γαῖα πυρί μιχθήτω


