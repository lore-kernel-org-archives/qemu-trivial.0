Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mVZFK-0003n0-71
	for mharc-qemu-trivial@gnu.org; Wed, 29 Sep 2021 09:03:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mVZFC-0003iF-Me
 for qemu-trivial@nongnu.org; Wed, 29 Sep 2021 09:03:30 -0400
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f]:39491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mVZF9-0004NP-1G
 for qemu-trivial@nongnu.org; Wed, 29 Sep 2021 09:03:30 -0400
Received: by mail-ot1-x32f.google.com with SMTP id
 j11-20020a9d190b000000b00546fac94456so2742272ota.6
 for <qemu-trivial@nongnu.org>; Wed, 29 Sep 2021 06:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LyetlMXJuiaLe3ru8UBdniu3ZM3POgnzNt97yDI2Myc=;
 b=Ozjsagm9sGN3D+tKsv5km4XvUYnILhwzuoJPBYMzSGJmgpBm4rPWsVEe2eXLQ6HMgs
 zhm7G/xNMNt7gbM7Os5b531AA9JCpEyAExEdVEND31Zpvw021bMQIsaU9F3ABDtcA4+O
 +fbNelEiCIDCWaW6NDiR1BXTQsuKCWwDEkWpIIOQbJHfaatmVvJftItfzwo1mnxhufsM
 VjRFruTjwM9ZOQmlOIgCGRQq95l1/K6YcBw+8eJ/pUhlSHzkpCkGuK407zwQA0vbWfzN
 mFRDOrMz+N4ng3lO57Wnx3LPVrE2tKbj+GOSf/Dkj3nLh8fadwvYruXMoxmmFiSO4Xeq
 WVWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LyetlMXJuiaLe3ru8UBdniu3ZM3POgnzNt97yDI2Myc=;
 b=bFREfD7hNw4OvL47SM5/DEA+6BcorY8o45DCbmwFTUC4CVpXRCIgpDOTD7FxF9iRTo
 UYWvF9sCa5Bhsdh5CMP7zEGooHmURv/+9oSlZ3BP5w2kIADokzKdCj4EgorNlk27IjY5
 STz9B1t+0anKh/WoSAF/p9Yiy/4672Tr6YBxbCqzkXzjQGMpwSYa9eOr6ZT5q2QPWon4
 tWADJCFzOgaf4QSaT7y0pas9TEHbomg5psgxcggX2ehD/i5nVLov0nruvzcgWGvtNfuX
 eVyuF8u/s5pVDcVgZKz3qeSgbehBpzFfaiRBjmHy4YDUDd1n475uX9C4691g1Pt2mmbj
 CsVQ==
X-Gm-Message-State: AOAM531VxLc1D9Z/aSIl9DA4B5+5icpWuDXnoqXptOSSBblQGpxsxODl
 RV6e0QpJoTA1QflHsuclalYlM7Nu8sCM2A==
X-Google-Smtp-Source: ABdhPJy8D30FHCfG00txPsB05K2Cs+P28l9Uq7OH/cTzrVJfq/gy8ERrJ/kipjLjHvUUMcc4dkTpmw==
X-Received: by 2002:a9d:719a:: with SMTP id o26mr10227193otj.278.1632920603924; 
 Wed, 29 Sep 2021 06:03:23 -0700 (PDT)
Received: from localhost.localdomain ([172.58.171.248])
 by smtp.gmail.com with ESMTPSA id l8sm431715oii.57.2021.09.29.06.03.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 06:03:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ysato@users.sourceforge.jp,
	qemu-trivial@nongnu.org
Subject: [PATCH] target/sh4: Use lookup_symbol in sh4_tr_disas_log
Date: Wed, 29 Sep 2021 09:03:16 -0400
Message-Id: <20210929130316.121330-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 29 Sep 2021 13:03:31 -0000

The correct thing to do has been present but commented
out since the initial commit of the sh4 translator.

Fixes: fdf9b3e831e
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sh4/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/sh4/translate.c b/target/sh4/translate.c
index cf5fe9243d..d363050272 100644
--- a/target/sh4/translate.c
+++ b/target/sh4/translate.c
@@ -2344,7 +2344,7 @@ static void sh4_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
 
 static void sh4_tr_disas_log(const DisasContextBase *dcbase, CPUState *cs)
 {
-    qemu_log("IN:\n");  /* , lookup_symbol(dcbase->pc_first)); */
+    qemu_log("IN: %s\n", lookup_symbol(dcbase->pc_first));
     log_target_disas(cs, dcbase->pc_first, dcbase->tb->size);
 }
 
-- 
2.25.1


