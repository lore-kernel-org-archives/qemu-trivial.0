Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcsFt-0000xl-FF
	for mharc-qemu-trivial@gnu.org; Tue, 19 Oct 2021 12:46:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcsFI-0000Ui-Le
 for qemu-trivial@nongnu.org; Tue, 19 Oct 2021 12:45:49 -0400
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:44576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcsF1-0000ZU-Hm
 for qemu-trivial@nongnu.org; Tue, 19 Oct 2021 12:45:44 -0400
Received: by mail-io1-xd2e.google.com with SMTP id r134so21105386iod.11
 for <qemu-trivial@nongnu.org>; Tue, 19 Oct 2021 09:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+IzShWSBtrKSnWvv4DG7rTFLiXhPKkmis2WeVxX+t5Y=;
 b=mA3R5/Z+Dh9R3ffB9/w5D+gjvMDK7JFGgWz1M3g1xB4jEQ00ofg7pFPO8hfOBsQff/
 Crvkp4lb/pvC6elC9iG5S0wwtLE4LoVa2AJBRCeiOSq2Prr5TXyztB91uhcG247rB7H5
 A45fHuJK27R5Uh3+HtWmkNpLNhVWIjTlHgaOT/QpCfoxfeMdozHOXthrbGa3aEgWajt9
 FmX4oYG3lebwrt7Uwijei+KlgDOU6MRx9YSetT10dmdiwYeGHzknlQOS00lJe6lbFxf9
 2vSlA7aY6y2EpOkZ8WtVVQPrUmFCL5y8MGadS1TyPGQCOTcL1mc0lfQMQ3p1ah5toT9C
 Rolg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+IzShWSBtrKSnWvv4DG7rTFLiXhPKkmis2WeVxX+t5Y=;
 b=HxPaDYMjPRyaOB6148PrdtGFRoxBdGa9wr6GUwyt848TQ4vxf9UQMHcvzwBhBxQCa3
 p3QaoEIyASkT2eHF+FZj8EidwEmJbkskV9u8k5zr0+bTlR2bgIWwPUUgUytj5oXtfG+n
 MvIeyhBqOyRJkvqBgJHN1HO0HsG3vk3xWhdTrUo2eLrQBZPnKH4hla08U5o4JiStVj8a
 HUG2pGS9wlsabQnSUnSiChljT8PSoHrZqSu8Qf5G+Q2nKklPze8Qax2kpHoognqgbMMr
 7PAAPjJEjjd94VqAQ2xz3MESph2SNaiuqQzcg5avBA+SxVZkothA8mh6csIxaGa0H/sU
 HQWg==
X-Gm-Message-State: AOAM531bVcU/TaxqxyR3c1TGFz2vp5MLBmgBoKMhAgMTbbxFrvtBVMXb
 90aMIQJKQgqSEvdeff/LxXXAKg==
X-Google-Smtp-Source: ABdhPJwEcpW+oh6EBkfvo78QTibokqsrcsng7UrBmdnxPqTAIqm+Jw/rSgxAGWjaUY/S97XbCHg4Uw==
X-Received: by 2002:a05:6638:2581:: with SMTP id
 s1mr5001730jat.35.1634661930627; 
 Tue, 19 Oct 2021 09:45:30 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id q7sm1133951ilv.48.2021.10.19.09.45.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 09:45:30 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH 24/24] bsd-user: add arm target build
Date: Tue, 19 Oct 2021 10:44:47 -0600
Message-Id: <20211019164447.16359-25-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211019164447.16359-1-imp@bsdimp.com>
References: <20211019164447.16359-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 19 Oct 2021 16:45:50 -0000

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 configs/targets/arm-bsd-user.mak | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 configs/targets/arm-bsd-user.mak

diff --git a/configs/targets/arm-bsd-user.mak b/configs/targets/arm-bsd-user.mak
new file mode 100644
index 0000000000..deea21aaf5
--- /dev/null
+++ b/configs/targets/arm-bsd-user.mak
@@ -0,0 +1,2 @@
+TARGET_ARCH=arm
+TARGET_XML_FILES= gdb-xml/arm-core.xml gdb-xml/arm-vfp.xml gdb-xml/arm-vfp3.xml gdb-xml/arm-neon.xml gdb-xml/arm-m-profile.xml
-- 
2.32.0


