Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rcLsc-0000ZC-JP
	for mharc-qemu-trivial@gnu.org; Tue, 20 Feb 2024 03:53:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1rcLsa-0000S0-Jd
 for qemu-trivial@nongnu.org; Tue, 20 Feb 2024 03:53:32 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1rcLsS-0008Dg-58
 for qemu-trivial@nongnu.org; Tue, 20 Feb 2024 03:53:32 -0500
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a3cc2f9621aso548702566b.1
 for <qemu-trivial@nongnu.org>; Tue, 20 Feb 2024 00:53:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708419202; x=1709024002; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tZji5wyrV5xt58PDS30yI8Y6P72XZ/u9rGD8EwbSOro=;
 b=sbj+UnOzJtD3AikVf3btL27l8M86HLTS0o88w9xAZtXQHnnFeGno13Hqkt0eePKjDf
 t/ungRJjDezBPdNHBwPq4tUNu3t+5zqJZSELlGiGvhTJ1L+BioJP8CK8Tri7y3d17RUt
 G9KAOrHHZxM+Ad2LQO8lkRhjExKfefoke/9SiI7/bgUDM4O5frv9kGabrVceReXl3tQh
 ugGpVZi4x/7R89Nh8mGxAqP/10VFX5GYTc8lVPuE1+XX8ng07IVFtU9cZ/AwqR1dtEdD
 VVqkjooomPyPAQq8+pUVgtLssq4/GAMb9D6eRWHl5Ywkn/uDsXQNGuhyTexcW1x6HAZj
 MWYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708419202; x=1709024002;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tZji5wyrV5xt58PDS30yI8Y6P72XZ/u9rGD8EwbSOro=;
 b=qx5ohxXN3GqwPwm4ZEE2/GWkGWnTN1CpPB9kRmeeURHWKPZnUaBRkBKIs6hEPrZvjh
 QB+J/GjUbJNE24OiTtfyHmulbd7dcVVjG/Q3eZe/5ylJiVYc6QakPhbSFeLDFffoX3p9
 kSefxdLTUivs6NeZfhcA5JGbMVzswJNLl6G9EZjlT6Lrg/1d9SdGV8tXtCHM2g87oH9Q
 yoCrYzO4214vKA1u98QX0x2yvHQ/CC4e//Xv0iyzxO+lYajGVE8hrVpN2frbjSvwO7Wz
 6q3CoaxtC3eQNWCo0kP840jjy4s25zqdL3oatJYYeXv9ylJ28roZyJm/fbK3Foq/9stk
 +5Pw==
X-Gm-Message-State: AOJu0Yw9ZCucTJC484jB7998lRnhh2H7/5Ed0D6LkTGoogu1s/ybOrpQ
 Ua90UqYIkSfpEsMBqMNr0nhSgpRs6Hu9gpmHP7Ev3XwA3FPOuYrKC9D/YSDXUZyoRKT2eSvdIli
 RMAs=
X-Google-Smtp-Source: AGHT+IElUnqH7706lYh8AhZYGRobTHibllu2I17T9nZLMCgOAlENqiN1aYsFpZ0vQR6rBOeeY9+XYA==
X-Received: by 2002:a17:906:ff52:b0:a3e:9c2e:40d5 with SMTP id
 zo18-20020a170906ff5200b00a3e9c2e40d5mr3099984ejb.5.1708419202262; 
 Tue, 20 Feb 2024 00:53:22 -0800 (PST)
Received: from localhost.localdomain (adsl-245.37.6.163.tellas.gr.
 [37.6.163.245]) by smtp.gmail.com with ESMTPSA id
 cu3-20020a170906ba8300b00a3d014fa12esm3747876ejd.196.2024.02.20.00.53.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 00:53:22 -0800 (PST)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>,
 Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org
Subject: [PATCH v1 12/21] hw/net/npcm_gmac.h: correct typos
Date: Tue, 20 Feb 2024 10:52:19 +0200
Message-Id: <c81005d5160a7f312d8e0f7120d601219e4e5e09.1708419115.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1708419115.git.manos.pitsidianakis@linaro.org>
References: <cover.1708419115.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ej1-x633.google.com
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
X-List-Received-Date: Tue, 20 Feb 2024 08:53:32 -0000

Correct typos automatically found with the `typos` tool
<https://crates.io/crates/typos>

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 include/hw/net/npcm_gmac.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/hw/net/npcm_gmac.h b/include/hw/net/npcm_gmac.h
index f2d9f08ec1..6340ffe92c 100644
--- a/include/hw/net/npcm_gmac.h
+++ b/include/hw/net/npcm_gmac.h
@@ -81,7 +81,7 @@ struct NPCMGMACRxDesc {
 
 /* Disable Interrupt on Completion */
 #define RX_DESC_RDES1_DIS_INTR_COMP_MASK BIT(31)
-/* Recieve end of ring */
+/* Receive end of ring */
 #define RX_DESC_RDES1_RC_END_RING_MASK BIT(25)
 /* Second Address Chained */
 #define RX_DESC_RDES1_SEC_ADDR_CHND_MASK BIT(24)
@@ -213,7 +213,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(NPCMGMACState, NPCM_GMAC)
 #define NPCM_DMA_STATUS_FBI BIT(13)
 /* Early transmit Interrupt */
 #define NPCM_DMA_STATUS_ETI BIT(10)
-/* Receive Watchdog Timout */
+/* Receive Watchdog Timeout */
 #define NPCM_DMA_STATUS_RWT BIT(9)
 /* Receive Process Stopped */
 #define NPCM_DMA_STATUS_RPS BIT(8)
-- 
γαῖα πυρί μιχθήτω


