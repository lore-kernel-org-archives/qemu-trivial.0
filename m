Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m0wE1-0005f3-08
	for mharc-qemu-trivial@gnu.org; Tue, 06 Jul 2021 21:19:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1m0sOz-0000TM-53
 for qemu-trivial@nongnu.org; Tue, 06 Jul 2021 17:14:45 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:41764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1m0sOw-0004Re-7M
 for qemu-trivial@nongnu.org; Tue, 06 Jul 2021 17:14:44 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 oj10-20020a17090b4d8ab0290172f77377ebso293345pjb.0
 for <qemu-trivial@nongnu.org>; Tue, 06 Jul 2021 14:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wExOrkbXE+k9ZzW4PHpFswTvMVslLSEWrRVPqGpkEPQ=;
 b=OoQqHtKYy4y8XnAq4xz+KE0h5kIUCasmhylHledcVzh5NLJjPC8BUcQFK9l+2lIvEY
 1WffRJEIMB0YV31GJkvLOo28qLKf1MKQA9UywbgGRhGF49B5lBoGdDO6Fn3klxqVKoso
 lvJF9jobLQrDFyRXu70SlD9Nwejo2sMzSU0Vh69h3OJDIABNC1sKoG7+AlaIg3WND0DD
 PlPPnArg/DbcUVw0esJO650rDgX45YNq55vLS+j8jzguAzjASmjtqQdKvKlO7rwBmq6N
 bAaTQE+7/fgvds9QpCGclLxPbGd/oZWgNi6n0gpdg2fj2k1VYlj0D3uNbjrvkURFe+j+
 /CZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wExOrkbXE+k9ZzW4PHpFswTvMVslLSEWrRVPqGpkEPQ=;
 b=pnfzGvv+ItwEsQbDX1xY/RElwHuDGZ7BwYZusPLBgoEPltSFPS6Nyoh/SgZGJ7GIEg
 d+y29JNfTZwgRgJbZwvPJEMd4fUScnyIQfBcZ0AsGUqDS454SDQAhsJUXBCKj5HRGboN
 z9nleV8Z/j/Da/rjrfWsol7eoYWxrXn6xe9D64egV9W5W1oGqd5uwJbcv/KLJZoJQC5d
 lYvD5+pw7PRQBXIQMoMBk8/4QQbPmSPC5xLVRlsYp8nlLg1XCt7RHSdvhhHQouWZfq+A
 Af5I19EV0P3D+bcEjPty7IdrVWc28KDIkMjnc4wJ6NpTqs6s4O6JI0CFME0Zd30JjrBD
 CCfA==
X-Gm-Message-State: AOAM532Xvsh6TkFu5vLfGOEfH5eok3Vxa52gRFvllYr+9oSZr16UUGS9
 uV+h+PAADs+7So8KdOUUMEVa7A==
X-Google-Smtp-Source: ABdhPJwZkUWiPVmnITfLmoY69tZBI8xSP8tPTudpRAWA6ZWtJPRpR181J1WT6IOqeB65QYEAYf76YQ==
X-Received: by 2002:a17:90b:2512:: with SMTP id
 ns18mr22460568pjb.215.1625606080012; 
 Tue, 06 Jul 2021 14:14:40 -0700 (PDT)
Received: from linbox.int.bluestop.org.com
 (c-174-52-16-57.hsd1.ut.comcast.net. [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id e2sm20606290pgh.5.2021.07.06.14.14.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 14:14:39 -0700 (PDT)
From: Rebecca Cran <rebecca@nuviainc.com>
To: Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org
Cc: Rebecca Cran <rebecca@nuviainc.com>,
	qemu-devel@nongnu.org
Subject: [trivial PATCH 1/1] hw/intc: Improve formatting of MEMTX_ERROR guest
 error message
Date: Tue,  6 Jul 2021 15:14:32 -0600
Message-Id: <20210706211432.31902-1-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=rebecca@nuviainc.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 06 Jul 2021 21:19:38 -0400
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
X-List-Received-Date: Tue, 06 Jul 2021 21:14:45 -0000

Add a space in the message printed when gicr_read*/gicr_write* returns
MEMTX_ERROR in arm_gicv3_redist.c.

Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
---
 hw/intc/arm_gicv3_redist.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index 8645220d6183..53da703ed843 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -453,7 +453,7 @@ MemTxResult gicv3_redist_read(void *opaque, hwaddr offset, uint64_t *data,
     if (r == MEMTX_ERROR) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid guest read at offset " TARGET_FMT_plx
-                      "size %u\n", __func__, offset, size);
+                      " size %u\n", __func__, offset, size);
         trace_gicv3_redist_badread(gicv3_redist_affid(cs), offset,
                                    size, attrs.secure);
         /* The spec requires that reserved registers are RAZ/WI;
@@ -510,7 +510,7 @@ MemTxResult gicv3_redist_write(void *opaque, hwaddr offset, uint64_t data,
     if (r == MEMTX_ERROR) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid guest write at offset " TARGET_FMT_plx
-                      "size %u\n", __func__, offset, size);
+                      " size %u\n", __func__, offset, size);
         trace_gicv3_redist_badwrite(gicv3_redist_affid(cs), offset, data,
                                     size, attrs.secure);
         /* The spec requires that reserved registers are RAZ/WI;
-- 
2.26.2


