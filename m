Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ppTJX-0002ln-6x
	for mharc-qemu-trivial@gnu.org; Thu, 20 Apr 2023 08:23:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppTJV-0002lF-4p
 for qemu-trivial@nongnu.org; Thu, 20 Apr 2023 08:23:02 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppTJT-0000WY-GK
 for qemu-trivial@nongnu.org; Thu, 20 Apr 2023 08:23:00 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 o6-20020a05600c4fc600b003ef6e6754c5so2958405wmq.5
 for <qemu-trivial@nongnu.org>; Thu, 20 Apr 2023 05:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681993378; x=1684585378;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=6cd/R92LpLzp49y8yUdy/r7HZc5QLWjNbD/woMnw1OI=;
 b=EDCkDArKWhgcNDHyFS6BX64EEjV11nekanScpLmTSiTwW01NmUSkPjMOE3f6zSsjiB
 VLiFzSmcjgQiVP0cQjL9fpWiZd54IYFbR2OFZ1gc5YV8gntxStjtR2h2uXYQsv87Wh+T
 NeLGfhTpin+hyuWb/A1WYZRVddfva2BstxH2F33RjNYWYiGuaMV5HNM9P/KtFlx0k3QH
 OCo6BVvzalfL3I9eMTkyY+Of14VLELaLwq68nasbo2w8sBqY67yJ030YgeG+1NcUgWTz
 3C8AlLEWnlLjbjFuzL42KiTXSMBr8RZ2ZFKVZjx2eYsxqc+HAeG1oMETXbVkWv7SNfcL
 dTsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681993378; x=1684585378;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6cd/R92LpLzp49y8yUdy/r7HZc5QLWjNbD/woMnw1OI=;
 b=ARKxuMaHQ7nYQzJjGfxChjBdvuORIW+YhRW/Q/9dz99wDGYzEjQVt+8sxmadcs88Jb
 q02DrGTegz6dsjmE71ojyWVN4wVgLgUjSK0VnmfTsligiGAdztXJNaw/LVKOaB0qRojW
 KulQK/8PfjhSY4E2QNG185+shHriLPLq1qlBCR3OmyZnrOz2yypC8F4nHlfKydpRuFpy
 vCbcY7K/RccoMaboIVr6M2Dk4aX76Mr433kWMgw93o05m6PyOGLL4G6QKs+13CPh7ht1
 VHGKboenujopTvS5ZMMLwFVhWWFDCkIdD3ka/wQgG8XNVHHtSf7j9eeJQY8kbpFc8z3z
 xnrg==
X-Gm-Message-State: AAQBX9dS97SZTGS1xoQDiGj/LHmTiQMGrLLlotQtraFJEvV3Kho9rFCM
 k5t70oLxu9zAygSNPinNU0dovA==
X-Google-Smtp-Source: AKy350Y5Ch8KqZKunNuvAZ9tFSr6E7lcjGFPyFVEi2zJmH8pRXvkL83pIgpTwYaGbyD15/xSdPWCyg==
X-Received: by 2002:a05:600c:4e45:b0:3f1:7b63:bf0e with SMTP id
 e5-20020a05600c4e4500b003f17b63bf0emr4799766wmq.18.1681993377906; 
 Thu, 20 Apr 2023 05:22:57 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a7bc5cc000000b003f17329f7f2sm1851762wmk.38.2023.04.20.05.22.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 05:22:57 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Subject: [PATCH] docs/about/deprecated.rst: Add "since 7.1" tag to
 dtb-kaslr-seed deprecation
Date: Thu, 20 Apr 2023 13:22:56 +0100
Message-Id: <20230420122256.1023709-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 20 Apr 2023 12:23:02 -0000

In commit 5242876f37ca we deprecated the dtb-kaslr-seed property of
the virt board, but forgot the "since n.n" tag in the documentation
of this in deprecated.rst.

This deprecation note first appeared in the 7.1 release, so
retrospectively add the correct "since 7.1" annotation to it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
My mistake, since I added the deprecation.rst text to that commit.
---
 docs/about/deprecated.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 1ca9dc33d61..914938fd76a 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -219,8 +219,8 @@ Use the more generic event ``DEVICE_UNPLUG_GUEST_ERROR`` instead.
 System emulator machines
 ------------------------
 
-Arm ``virt`` machine ``dtb-kaslr-seed`` property
-''''''''''''''''''''''''''''''''''''''''''''''''
+Arm ``virt`` machine ``dtb-kaslr-seed`` property (since 7.1)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
 
 The ``dtb-kaslr-seed`` property on the ``virt`` board has been
 deprecated; use the new name ``dtb-randomness`` instead. The new name
-- 
2.34.1


