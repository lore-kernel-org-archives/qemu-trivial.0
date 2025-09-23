Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB91DCAC5B0
	for <qemu-trivial@archiver.kernel.org>; Tue, 23 Sep 2025 12:02:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1v11it-0005ln-S1; Tue, 23 Sep 2025 08:02:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v11iJ-0005D5-BZ
 for qemu-trivial@nongnu.org; Tue, 23 Sep 2025 08:01:46 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v11iB-0003Kt-IM
 for qemu-trivial@nongnu.org; Tue, 23 Sep 2025 08:01:42 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3ee15b5435bso2901782f8f.0
 for <qemu-trivial@nongnu.org>; Tue, 23 Sep 2025 05:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758628884; x=1759233684; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=54hFyXF1XYUQuxGdWNU3fLqwHsZbQkwurRxxRgOmLPA=;
 b=XFMtInHAEwfqtuG8WwW1E206DhO3AabPrLRaPLPGHc1vj0hG8sNpqCMazhQKiD+irp
 FPDRa9WtSBIL4dKFqIYRW7Sv2rAwVh/uEiUq2NL+PKZ4uqoWF4racxnNaOP0WUV14X48
 8MNwr1UN40dVEOoa5Y/WzS21C93PB5N67Lka+IruKzz/JvvNJXelQes2FbLdGV+C4oP5
 pEKOUvij8TmioPiJCPsxzzJipRpFSAyeAnBHs1OZ/su7Fuoh3CBf//Au17NQBm/7Qyfc
 EY1PF9Qr1BSBFtUQSa8vUcCmf5CuHzNODjFawmeTGwhZT9UOFLa+OM+l2/QPAqGE0b9k
 swlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758628884; x=1759233684;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=54hFyXF1XYUQuxGdWNU3fLqwHsZbQkwurRxxRgOmLPA=;
 b=TSTt3uybZTVw1olvkKJmDfeOUKjs9OjhgqiXGkEvbeb38k7d3CVvc+5NUIXQyoVuby
 TRDDeryFvk9UBzrpv/UiNM6u7mhOFnd5XIysvVZkK02TFAb5SKI/epw3AnAjlw+0e8aw
 k1qp6FDlTeTInF1oAb2Drnxo3DM1VOlOsu+HCKjHWbg79v8aKG+BEIH+1suY0Rm8iB9C
 HV88zOzq2HmOHdLlMhXIa14QgKo7PyeVqN+3YU/K/xBrSIA6eUzpISy6cPghUE71aEtn
 WK+BWGrEqmcUVsMDLgekDP7p3ubJcpSXDG1G2hnZhJ6R0xX4Z9Muasio8iJEnp7ZkTSA
 DLdQ==
X-Gm-Message-State: AOJu0YzzuI5SlFD87f5hZwj6Pt0fFL+Zw9dNZGFsdLKgjPhWMkkJdBXB
 AIMeqGlqIeA8YzbK/FIf4KVk2Dle6zovmgmM8oReNWkKHPK6+HDVazq0NhFk9yeHLiVgCu2fhjU
 SvnZ2
X-Gm-Gg: ASbGncspAsf0310zduPHC3EUTpCkasp+g8zYMd4ZXuyJRuBsNoP9P7oCwNTm2zZBUdC
 M+jd86i8er9lk3dy/0Bw2+psaeenM9BGSb+ce4hfNplUz0OywbRxl/E43g6TMhtQ1yB1xDi4aYK
 uA8/h+LcMxXcAYj/0yu4Qi0lsBb0FGFHlJsvjTE2ottCFt7m2pu0XtpKHftYj1VwKVwnlqXszqv
 zqfxYGcFFg7SnFWUVnQ7/f7RV8p5daE9jHx+J4G2zGG86syU3GHjABosZFTI90aDMy57KLJHoPd
 879VT4RXsYyL0eMlKafW4w0QERnXGaxsdDZ8TywiALRFrtQpxIt+R16/h2VJeCLMhwn7DSBHg1Z
 yHKyWqke9zsUE6uza+MJwKmEDNCyH
X-Google-Smtp-Source: AGHT+IFRGkQw3wEEuf9fH6gi570fbfo+WzQWc+Ejc0rHD/1W17Yax/Mb45NlT9Tw2yLlwKoYun8mJg==
X-Received: by 2002:a05:6000:2891:b0:3e9:4fe4:2619 with SMTP id
 ffacd0b85a97d-405c5ccd047mr2271433f8f.25.1758628883618; 
 Tue, 23 Sep 2025 05:01:23 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3ee07411f4dsm23527878f8f.26.2025.09.23.05.01.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Sep 2025 05:01:20 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Subject: [PATCH] docs/specs/spdm.rst: Fix typo in x86_64 architecture name
Date: Tue, 23 Sep 2025 13:01:18 +0100
Message-ID: <20250923120118.858581-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

The spdm.rst docs call the 64-bit x86 architecture "x64-64".
This is a typo; correct it to our canonical name for the
architecture, "x86_64".

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/specs/spdm.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/specs/spdm.rst b/docs/specs/spdm.rst
index f7de080ff0b..0e3ad25bc69 100644
--- a/docs/specs/spdm.rst
+++ b/docs/specs/spdm.rst
@@ -102,7 +102,7 @@ Then you can add this to your QEMU command line:
 
 At which point QEMU will try to connect to the SPDM server.
 
-Note that if using x64-64 you will want to use the q35 machine instead
+Note that if using x86_64 you will want to use the q35 machine instead
 of the default. So the entire QEMU command might look like this
 
 .. code-block:: shell
-- 
2.43.0


