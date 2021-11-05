Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1miplo-0004L8-AB
	for mharc-qemu-trivial@gnu.org; Thu, 04 Nov 2021 23:20:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1miplh-0004GG-Lj
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 23:19:54 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:34399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1miple-00043I-Jo
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 23:19:53 -0400
Received: by mail-io1-xd30.google.com with SMTP id 2so5963161iou.1
 for <qemu-trivial@nongnu.org>; Thu, 04 Nov 2021 20:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=av0Dv2nhr+A9RjUWFgiLGe/ya97+oVzXha6GTTS/bK4=;
 b=FL8PpF/bRQjurmKXUiXCaEzmEmu1BIFgiiJo97Bntca3FNHooDZKmhcXvOALhlZXFT
 kwGRaFndRybwqQlCo6089MA5hlfFdFwer1/TPY1YvlHI6lITZc7SUwsklI2o2Y5nMD4j
 9TKrZip2X1zxhfCer6QHwElBTKZFl4cI++A7bOJHPtpMYy51FoDK+nsJl0/sjZDBLoMm
 ORSEsNEGV4ZG4CD1KUuPB42o4nsWZJ+vIcLegA44GKiuIGdUp25L+W1y5vw956SqL2Yh
 BJsGqaXu+7/KYe8BTod1bSRvkmbRNxObWl1shmFHois0kJ6JVRNXM8SgsOnDFkbC+3EK
 BKaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=av0Dv2nhr+A9RjUWFgiLGe/ya97+oVzXha6GTTS/bK4=;
 b=r1oICTOLWnM5nK0O1vT7uf1mfvPfg4ckysoyapIbM7Dbu/ENLr6FHxqIIgDJuNEuX+
 WFtmSun8GQ9c9H3eQAD94D6OM4fZC8bx65QCDxizbEe6aLI4ocpQ1UkZUVSPNQoQCykE
 TEOJdBouriS9wyh4PpyWWsen8F5FWCmtZVUVnvwUvm92LvRJziLmw/NknL2nk0q2o96L
 JxfY9P6GNeVB4HeVWTffHK5VjD2t0Mi6GixJydcTKZviAXG92vXuGOd8GFgc4vhYznmz
 YsYd0P9nIHE9nfvM+Yx50O9776oxrHDBsyf4dmCtlF2cGHeSP9/iqN6UlMJHHiQAciKB
 kbKA==
X-Gm-Message-State: AOAM530Ha9/v74T+hm9ULj16pPjZ7LzY09flnn7Sm+bHsySeGSmpSf3M
 ogcZ4VH1tP5avR6ObON1Q/ocig==
X-Google-Smtp-Source: ABdhPJze3OlhIZYiAvDFxr/mQj024QZqGlPPdxsN09L8oX6kXJyhRRhWvTQmMeGil2Qk0QSaJ//JHQ==
X-Received: by 2002:a05:6638:1606:: with SMTP id
 x6mr6760992jas.17.1636082389335; 
 Thu, 04 Nov 2021 20:19:49 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id v4sm3508528ilq.57.2021.11.04.20.19.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 20:19:48 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Philippe Mathieu-Daude <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Laurent Vivier <laurent@vivier.eu>,
 Kyle Evans <kevans@freebsd.org>
Subject: [PATCH v4 03/36] bsd-user: create a per-arch signal.c file
Date: Thu,  4 Nov 2021 21:18:44 -0600
Message-Id: <20211105031917.87837-4-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211105031917.87837-1-imp@bsdimp.com>
References: <20211105031917.87837-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d30;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd30.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 05 Nov 2021 03:19:56 -0000

Create a place-holder signal.c file for each of the architectures that
are currently built. In the future, some code that's currently inlined
in target_arch_signal.h will live here.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/i386/signal.c   | 1 +
 bsd-user/x86_64/signal.c | 1 +
 meson.build              | 2 +-
 3 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 bsd-user/i386/signal.c
 create mode 100644 bsd-user/x86_64/signal.c

diff --git a/bsd-user/i386/signal.c b/bsd-user/i386/signal.c
new file mode 100644
index 0000000000..ac90323365
--- /dev/null
+++ b/bsd-user/i386/signal.c
@@ -0,0 +1 @@
+/* Placeholder for signal.c */
diff --git a/bsd-user/x86_64/signal.c b/bsd-user/x86_64/signal.c
new file mode 100644
index 0000000000..ac90323365
--- /dev/null
+++ b/bsd-user/x86_64/signal.c
@@ -0,0 +1 @@
+/* Placeholder for signal.c */
diff --git a/meson.build b/meson.build
index 26c58123e9..14b0bb2042 100644
--- a/meson.build
+++ b/meson.build
@@ -2888,7 +2888,7 @@ foreach target : target_dirs
       base_dir = 'bsd-user'
       target_inc += include_directories('bsd-user/' / targetos)
       dir = base_dir / abi
-      arch_srcs += files(dir / 'target_arch_cpu.c')
+      arch_srcs += files(dir / 'signal.c', dir / 'target_arch_cpu.c')
     endif
     target_inc += include_directories(
       base_dir,
-- 
2.33.0


