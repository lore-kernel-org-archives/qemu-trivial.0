Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mjvpm-0007nC-4D
	for mharc-qemu-trivial@gnu.org; Sun, 07 Nov 2021 23:00:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvpl-0007jk-BP
 for qemu-trivial@nongnu.org; Sun, 07 Nov 2021 23:00:37 -0500
Received: from [2607:f8b0:4864:20::431] (port=43668
 helo=mail-pf1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvpj-00014V-Tr
 for qemu-trivial@nongnu.org; Sun, 07 Nov 2021 23:00:37 -0500
Received: by mail-pf1-x431.google.com with SMTP id n85so10221532pfd.10
 for <qemu-trivial@nongnu.org>; Sun, 07 Nov 2021 20:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VTdt3uC+ttB19F3HtSXrERhSxFv3zvRil3LE5812gSQ=;
 b=CekGNyIce6XdthziiJgk/NHpe3zTL+GqsQetJo3+U0Za57P3l7w0yRXyqgbmbtFnwD
 tgXNS7M1NHTlcweoCp+mhdhkWek3ziv3IfQkIRfpwLI1WYVhEhY6F9arMuSetWfgFLhk
 W75W0npC573EGzJZT/p+198J3VNnuOqF+M5Eaqo76jfKxsFfw6bYNJGW2EtqI+G/nmdB
 0xderTdRcsOswGdtlcpLm/FyhJsR+cXEYzSXmmynpusg0agJxfWASCcnqudbV9KMCAWI
 GsUzhSWbPGdE2NV5pPWUpI1sZIxTHNZrsH/kPoHQfzcHlYX5+0/QnTq4ssbvxr8LCE+t
 xSww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VTdt3uC+ttB19F3HtSXrERhSxFv3zvRil3LE5812gSQ=;
 b=VyYh/eTl7rDeiBpTKkut9ouY9QS2oDbkkR9p4uIBVwy0N+yons4kgQKYh6BLQ3nlda
 uuvFQiatvHYxN+HgUgiLX4SdZUyB8NtZjZoeyRkZnpgRrv2wBjIj95mAYnvt91iJJB/7
 UF4oI867wbbnnM6nj6RJNIe/zVyc97sjQaEF+/2tN/SrPcJrJeok5FsP8sJ/KQo6+NIw
 vymXHQM2wD6/8w3WkhrsoRMOOdAzEAbsI0E+IRV60ifKTRiEx7O927oJtIYTed4FASnB
 GyJOAbPoFVaSxUe42Ws20Lmzz09rZrLg4Rk3DxH5nVlGpG73vXPVuIZ0AvDmCg1+lI3w
 j8ZQ==
X-Gm-Message-State: AOAM531Gyp9OHzgooicjIV8+ZkvcIBuwHzivKyu5uIsPtOP35N6cVR8U
 b3xfrgGrm9C1l6OHifO/bdr1Q0aS+fW0qw==
X-Google-Smtp-Source: ABdhPJy6p764ECR0WIUF261YXMRgOfChCfxGVar0vHRFEe9bkKoa6IcJjrMgRBmp7uSyZFed2gSGBQ==
X-Received: by 2002:a6b:7306:: with SMTP id e6mr3914401ioh.25.1636343564293;
 Sun, 07 Nov 2021 19:52:44 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id x15sm876909iob.8.2021.11.07.19.52.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 19:52:43 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Michael Tokarev <mjt@tls.msk.ru>,
 Warner Losh <imp@bsdimp.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Kyle Evans <kevans@freebsd.org>, Philippe Mathieu-Daude <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Kyle Evans <kevans@FreeBSD.org>
Subject: [PATCH v5 37/37] bsd-user: add arm target build
Date: Sun,  7 Nov 2021 20:51:36 -0700
Message-Id: <20211108035136.43687-38-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211108035136.43687-1-imp@bsdimp.com>
References: <20211108035136.43687-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::431
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::431;
 envelope-from=imp@bsdimp.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 08 Nov 2021 04:00:37 -0000

CC: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Acked-by: Kyle Evans <kevans@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 configs/targets/arm-bsd-user.mak | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 configs/targets/arm-bsd-user.mak

diff --git a/configs/targets/arm-bsd-user.mak b/configs/targets/arm-bsd-user.mak
new file mode 100644
index 0000000000..cb143e6426
--- /dev/null
+++ b/configs/targets/arm-bsd-user.mak
@@ -0,0 +1,2 @@
+TARGET_ARCH=arm
+TARGET_XML_FILES= gdb-xml/arm-core.xml gdb-xml/arm-vfp.xml gdb-xml/arm-vfp3.xml gdb-xml/arm-vfp-sysregs.xml gdb-xml/arm-neon.xml gdb-xml/arm-m-profile.xml gdb-xml/arm-m-profile-mve.xml
-- 
2.33.0


