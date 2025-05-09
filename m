Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uDPYH-00013d-WB
	for mharc-qemu-trivial@gnu.org; Fri, 09 May 2025 11:22:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uDPYG-00013N-BQ
 for qemu-trivial@nongnu.org; Fri, 09 May 2025 11:22:16 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uDPYD-0007Fh-Ng
 for qemu-trivial@nongnu.org; Fri, 09 May 2025 11:22:15 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3a0b9625662so1669451f8f.3
 for <qemu-trivial@nongnu.org>; Fri, 09 May 2025 08:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746804131; x=1747408931; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Q3L8IJ7smViU/9Uzo6s+QEqifWFFE9joZ/9cY8U16AU=;
 b=dNaQqEdFq75sT9/sVEVxswdcC8MXhrxeSK/bArJusxEkLjTv88s6TfqjDoMuhiKT9L
 l0kwA3rusS9yj5uShcwnK8HvZKoVXu9vuZXmDlKKjxcBiAcRPDWR475D1TmlkE7z55wP
 AHgUKhFOLpab8ZejINPDck7jEoXo1scCmK0e296JmH4AiGEQ51njkt6fPBghv8mkNv/0
 ANhAsxjCrTtPFGYJj8jfTho8j86Qa6hZPBPMvpyxUJUyz/jI0IdYN8id8xSHLd5PWbq8
 Rz1BurdpL89DauULcY4lnc2xjC9Dq5MetMDg1Rq+6r/MSMJHfGAEk1aB15eyIWQALkmg
 85MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746804131; x=1747408931;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q3L8IJ7smViU/9Uzo6s+QEqifWFFE9joZ/9cY8U16AU=;
 b=tclRbl/GFtjTAsYgEScwZY5Shzr7hpOAhjSe02UIAlo4CMeLM8WLCUlKDn4NBSw7iT
 PrksXJ4lDt2IW20cDypBIToP8vmVaYGDRfiy/WVsKrQ6CHKytAUCQcJRn8lJiSur1qvy
 6JRNEhV7VpYqcdQHO/ZH5Nyk7JU8x2i1U4onO35Pv99pXVrxFz4fGmIjjn94hLB/wIgB
 hEFV0eTeuUvYPqsREcYHxxfcjXTT8ENL6rEWUlzpAbMfnCBI09S/lui6wehZ/FxTtL/H
 tdPDnVbL1ci57JzVuJ12W2BXE82sWWkomwGQpSm4WxS0+ruSOQ6oKyk72mF60PyZ2p/K
 c9zA==
X-Gm-Message-State: AOJu0Yw+beKRFALmvVUAnF/lZ3pRgdcH/Ps+RJtij94296WoQf7IarLD
 uSdiHn0EwxMw2/wVkcwSDF0dQxr0xEkUkzNUbrRt8tnMExHvqvaprTIHXiWiv95/eOxwOO44RyY
 Ets4=
X-Gm-Gg: ASbGncvwQ9Y/OfO0bUaI1apkNq0At63K6p51Ci9pV6l8B9RJz/iF7+UrbmxynszkoFL
 VkVSbUA8eq4lTrAciqXoyCu94et56Oh8SQ4T5fN5INUfeMM/Jj5GRZQ91gMH0klKU/awg7TOOSS
 JRqAHHOA5wom9ataAzZhsM2jvg+Ld/8QjtmFx0xZT7QYrih0cura3B6yYY6RnlpsSgtD9P4ySiu
 SqoqOSn1axwQ8epLsrPV/s5M7lDqHV3IiSxc9IUCHf4XWQtMgelAgnAcGfgx+sFJIcUp6sE/F/8
 Bz2f+0moRxIdBjYCt1EUQbwF7k7riRyBqyr5TTTiDrriHPXLD7YXF+cXAZG0GOJO8sr3GA==
X-Google-Smtp-Source: AGHT+IF3vVv1IG7UetPvXYgwUy6xO7Ann44GxXpkx3dB6hlBYUqvuUt4VMMw3LfDpbItgFKuoOaw4Q==
X-Received: by 2002:a05:6000:2481:b0:3a0:bb2b:14e3 with SMTP id
 ffacd0b85a97d-3a1f647864fmr3530730f8f.33.1746804131241; 
 Fri, 09 May 2025 08:22:11 -0700 (PDT)
Received: from xps13.. (83.69.114.89.rev.vodafone.pt. [89.114.69.83])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a1f58ecb46sm3611817f8f.30.2025.05.09.08.22.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 May 2025 08:22:10 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	gustavo.romero@linaro.org
Subject: [PATCH] docs/devel/testing/functional: Fix typo
Date: Fri,  9 May 2025 16:21:58 +0100
Message-ID: <20250509152201.19085-1-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=gustavo.romero@linaro.org; helo=mail-wr1-x430.google.com
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
X-List-Received-Date: Fri, 09 May 2025 15:22:16 -0000

Fix the duplication of the word 'run'.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 docs/devel/testing/functional.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/devel/testing/functional.rst b/docs/devel/testing/functional.rst
index 8030cb4299..9e56dd1b11 100644
--- a/docs/devel/testing/functional.rst
+++ b/docs/devel/testing/functional.rst
@@ -274,7 +274,7 @@ speed mode in the meson.build file, while the "quick" speed mode is
 fine for functional tests that can be run without downloading files.
 ``make check`` then only runs the quick functional tests along with
 the other quick tests from the other test suites. If you choose to
-run only run ``make check-functional``, the "thorough" tests will be
+run only ``make check-functional``, the "thorough" tests will be
 executed, too. And to run all functional tests along with the others,
 you can use something like::
 
-- 
2.43.0


