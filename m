Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l6ASU-0007X1-Ar
	for mharc-qemu-trivial@gnu.org; Sun, 31 Jan 2021 05:59:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6ASO-0007Tl-Rh; Sun, 31 Jan 2021 05:59:52 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:38412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6ASM-0000RF-H9; Sun, 31 Jan 2021 05:59:51 -0500
Received: by mail-wr1-x435.google.com with SMTP id s7so10436444wru.5;
 Sun, 31 Jan 2021 02:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZQoiucDIT4rSjEAY4ZuvMUxbDYBSZFNnjg1m60zIj8E=;
 b=ZeHl/siOlsjFxeuZteA5wZuvh/8NM5Q/I2spUpfS0cqhWQBuY9YgwoDKLtaByXCpsv
 b0l2aiuzFIE3GaVjOEgo5w3uUWtoV2d7riKMBtfaVJ1kcmy1TDVcMviNmkVSc50FUIl8
 RrgEgL711CCUFwBVMPacRJlikKGRdcdCvhRV9rDU50nyaf9FSdjlo0LKOVx8NE/An6Yu
 61dk28LtGZmnuUCSGprEiOQlo0nr4rlbWsq36QoRMDGQxhppeXn1SOKISZh6VVgpMrLE
 KLvyHAfmSA2gQpgT+pv2cCgdiaymRAn0USUG9JZhRcUFLTvmKSyFbU+nMMvDVbwRc+KV
 5j9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ZQoiucDIT4rSjEAY4ZuvMUxbDYBSZFNnjg1m60zIj8E=;
 b=eeGpwlW2OHj4k5qAGY5UBjSrVFvZnzEvbNEKkWfjX21z/FQ6xaOKstoyJgpuYdU4HM
 LxAk+Wem85tX+3N0pr4Gxjv7MLT2p6uSG/5U9G0Cp7Lx2HVahsekdzf2XuzIH+K6K3nD
 1pGEv7IszrWP5zNUA5AkI0cMdxierXrx4cAkx4n1K3DbOisafhbxw8ofefSs00rraYNJ
 IkkR1XrkjnMul+W1vcWLgocrbbFW8mWeQyrenFtM4Kc89Zg9IxeAwCbqIjJdofq5Cm+7
 ZDjtXpgcCni2+RQXL1xsISlejawbnwIDmHR/Dt74nP6WqsYhaFv54pe2hnko/cqyoSSQ
 tNmQ==
X-Gm-Message-State: AOAM532CVrzRTsZNXYi+fRl3zfcR3ZgIfSUby5mOa26GUv+PM/WsxmAF
 eRfYZJNS38eIuqnxHOOCWrxAOAfV19I=
X-Google-Smtp-Source: ABdhPJxVJS0UB3XcqSG9ZrQEJVPZb3WoW36SwkkysF0aEYp4+I6Gla/yX1CHAc/ThxX2mutk7FEQww==
X-Received: by 2002:adf:e9cf:: with SMTP id l15mr13003391wrn.317.1612090788500; 
 Sun, 31 Jan 2021 02:59:48 -0800 (PST)
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id d5sm22464661wrs.21.2021.01.31.02.59.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 02:59:47 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Antony Pavlov <antonynpavlov@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-trivial@nongnu.org, Alistair Francis <alistair@alistair23.me>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Radoslaw Biernacki <rad@semihalf.com>, Leif Lindholm <leif@nuviainc.com>
Subject: [PATCH v2 5/7] hw/arm/sbsa-ref: Restrict SBSA-ref board to 64-bit
 build
Date: Sun, 31 Jan 2021 11:59:16 +0100
Message-Id: <20210131105918.228787-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210131105918.228787-1-f4bug@amsat.org>
References: <20210131105918.228787-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Sun, 31 Jan 2021 10:59:55 -0000

The SBSA-ref board only use CPUs available in the 64-bit build,
it is pointless to have it available in the 32-bit build.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Cc: Radoslaw Biernacki <rad@semihalf.com>
Cc: Leif Lindholm <leif@nuviainc.com>
---
 hw/arm/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index be39117b9b6..059ff7382f2 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -22,7 +22,7 @@
 arm_ss.add(when: 'CONFIG_TOSA', if_true: files('tosa.c'))
 arm_ss.add(when: 'CONFIG_Z2', if_true: files('z2.c'))
 arm_ss.add(when: 'CONFIG_REALVIEW', if_true: files('realview.c'))
-arm_ss.add(when: 'CONFIG_SBSA_REF', if_true: files('sbsa-ref.c'))
+arm_ss.add(when: ['CONFIG_SBSA_REF', 'TARGET_AARCH64'], if_true: files('sbsa-ref.c'))
 arm_ss.add(when: 'CONFIG_STELLARIS', if_true: files('stellaris.c'))
 arm_ss.add(when: 'CONFIG_COLLIE', if_true: files('collie.c'))
 arm_ss.add(when: 'CONFIG_VERSATILE', if_true: files('versatilepb.c'))
-- 
2.26.2


