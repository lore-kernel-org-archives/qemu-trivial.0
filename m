Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rcLsY-0000P6-Fg
	for mharc-qemu-trivial@gnu.org; Tue, 20 Feb 2024 03:53:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1rcLsW-0000FF-FI
 for qemu-trivial@nongnu.org; Tue, 20 Feb 2024 03:53:28 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1rcLsP-0008Cu-1Y
 for qemu-trivial@nongnu.org; Tue, 20 Feb 2024 03:53:27 -0500
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a3e5d82ad86so280106966b.2
 for <qemu-trivial@nongnu.org>; Tue, 20 Feb 2024 00:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708419199; x=1709023999; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kfSQCPN1GGM5Zej4RQdSlhjLn3KZeYb7da7sMakzv6E=;
 b=WGXkxvlZ6X0ljqBuDLkDQUKYHZPNkK4xEiK0Q7QpmgnM2c8+/UnKk/TtuxEQOxlfBw
 /OJF9aQZRgw1rpTdv45AEImJTSo36yLxKRAjCR5VgGTDl7G/Dnkh8S4zlEiUy8SrjMEW
 9OzUbgsSU0AsRlSSoQ1iB6T5C6xTpjeBc2cteKU6QG6MzAGOyNveJ2ZBOsKTPHyYVfUk
 PRTKpS7g4T4QMBhrkqEciDwMelQ6TP04kQu7xuXeO93TxoicO+Y7p1LOLm7VTdvfcPOh
 WJjSGhRvHo6XqRkNym5YsWAL5nLqMKJ5CgKrJjyDG6M4L7BJtMVGpMBHqTrR4mtfMczn
 yfRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708419199; x=1709023999;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kfSQCPN1GGM5Zej4RQdSlhjLn3KZeYb7da7sMakzv6E=;
 b=kmAF+qJz1g5mPTZTuhSjpHujIToA1yAc/P9wzP9pzRIfdV2w01zvWMBwACIbLEZkcF
 cc+FCoB5Fdv98zZfC+ZWxQ4vfhMBEQFHGcdfol+BMAlUodBqBOu2FjpUAi4e1groG+cI
 VZ6HGS9gjOJ+E+AFdVNsB2JmplY6xo0WKIMT9tux6pkOJbq28yhOheROC+bhzVmm1fyF
 r7nIFYmZTKolf81ISnbRPL2vlKVmz6VhOul5JqHbI3kabfLs30M+MRTgrbXFrbN1avLd
 IHozp/h5+Dli73cDZGkvYR/nQoeMxIgYcxnUjSedt7JH3FkleEkMLFVCsHcxFK8MDXcj
 /Reg==
X-Gm-Message-State: AOJu0Yw/PTXjAqMybL+FHaG4Cze3Ow3slum/JoKdTFLEiRIGiJoVBpWG
 9f3K3mz3PJDjVjQU28Abo4bG+f2JrH9bd/oqzcrpEIZWbZNpzaJuB+rFYxAG89LvSCw2ETYuj+W
 fv9w=
X-Google-Smtp-Source: AGHT+IEBSeLFPPqoXQckZq4L1F+fqEd0CwMFbo5YwT3y/6QTRKiRFcCb7D2n3ONZUh236DgQvtgwLQ==
X-Received: by 2002:a17:906:f44:b0:a3d:d7f1:35fd with SMTP id
 h4-20020a1709060f4400b00a3dd7f135fdmr10250515ejj.9.1708419199506; 
 Tue, 20 Feb 2024 00:53:19 -0800 (PST)
Received: from localhost.localdomain (adsl-245.37.6.163.tellas.gr.
 [37.6.163.245]) by smtp.gmail.com with ESMTPSA id
 cu3-20020a170906ba8300b00a3d014fa12esm3747876ejd.196.2024.02.20.00.53.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 00:53:19 -0800 (PST)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Subject: [PATCH v1 10/21] hw/arm/omap.h: correct typos
Date: Tue, 20 Feb 2024 10:52:17 +0200
Message-Id: <3a8b80f6427bf84580eec8f7c5c411fab5419e1f.1708419115.git.manos.pitsidianakis@linaro.org>
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
X-List-Received-Date: Tue, 20 Feb 2024 08:53:28 -0000

Correct typos automatically found with the `typos` tool
<https://crates.io/crates/typos>

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 include/hw/arm/omap.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/arm/omap.h b/include/hw/arm/omap.h
index 067e9419f7..2f59220c0e 100644
--- a/include/hw/arm/omap.h
+++ b/include/hw/arm/omap.h
@@ -1008,7 +1008,7 @@ void omap_mpu_wakeup(void *opaque, int irq, int req);
                       __func__, paddr)
 
 /* OMAP-specific Linux bootloader tags for the ATAG_BOARD area
-   (Board-specifc tags are not here)  */
+   (Board-specific tags are not here)  */
 #define OMAP_TAG_CLOCK		0x4f01
 #define OMAP_TAG_MMC		0x4f02
 #define OMAP_TAG_SERIAL_CONSOLE	0x4f03
-- 
γαῖα πυρί μιχθήτω


