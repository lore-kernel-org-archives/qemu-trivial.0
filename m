Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n7KvH-0001Ck-G4
	for mharc-qemu-trivial@gnu.org; Tue, 11 Jan 2022 12:27:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7KvF-00017M-Cs
 for qemu-trivial@nongnu.org; Tue, 11 Jan 2022 12:27:01 -0500
Received: from [2a00:1450:4864:20::436] (port=46637
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7KvE-0001Nc-1T
 for qemu-trivial@nongnu.org; Tue, 11 Jan 2022 12:27:01 -0500
Received: by mail-wr1-x436.google.com with SMTP id l25so23453617wrb.13
 for <qemu-trivial@nongnu.org>; Tue, 11 Jan 2022 09:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x9uFZuLSxnrrbaKMKz0QEdMW6rR5CgNOqST5WaB5t8E=;
 b=GrbV1mOh3GxY/tGa2PwoNOD3Y1XctAmgKi70ZGxjjM3SMRW16Ftk/8on3zfc6iwRW1
 9kPQaKaj1j7ZxgAMV/CkdI2vOoyJ3gbPuepcka2nm9yUVGPuLBKVbrZsJ/lshhHDaT6m
 u6oFelc4/stufeSz7e+QADI2+c/xrb/fQYPrFqV7TKehL+5g/EUWZRYf8tNd4ukkE5Q/
 lYTOx6nm+V/s5Z+QBdXutwm+qjnScirCYNKMEgMJU/tzDx5fhyEW3cAbR7BKKcOlxQcx
 us6uFrXyQJhKXNjqFUVpqWmjvIK7+YvJ6hh4hebL/2tNDxzbrjxFQDpjUl70PHwvJsT7
 If7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x9uFZuLSxnrrbaKMKz0QEdMW6rR5CgNOqST5WaB5t8E=;
 b=VNXGOIH+zJwyd3bjo8PmxNhgVeB13mQZycZsZxSfAMexnmoD2qzJPZUc+IlE1eiPAB
 j8Ec/S3k5VWunnwZAryb+83VOtyKE02/HEPAxxrVjGST09i0dXOvpveEQhSG7/AEthN0
 CerHOeNJPMXdD0w79znFVdwlnuz8j40XQ8DwI2YfWHsNk21UKXnH+c+b/XLjXoEUsx0z
 yHmr5SwdHoXrB4Uy/ayrBW1WimyR44jBOuP13yPpodP1TAe9XDkOUFdOoa3CyA7lFQ5W
 F2pS8LB9eaiQPibaF+TxgjsIYD7k93Tenmt1WesT7xQp2AAOpSrkdnGgysSGlwrkiEGO
 /q4Q==
X-Gm-Message-State: AOAM533Gh6mAJlrx8U4qN0dCISec5MA2BOhTOGqZtytcn2nfV3VDvCC8
 zZSEVUeJbKE1c2Qp07fK00AEBPzc6KoSaA==
X-Google-Smtp-Source: ABdhPJwSR8+Pfbefq9Yckq1dT/3+CSPO3Q2qe3z3rTje3rOhkF7K+nWG/OOl9xxxtuKjsnZC04k6AQ==
X-Received: by 2002:a05:6000:1b0e:: with SMTP id
 f14mr4788807wrz.100.1641922016674; 
 Tue, 11 Jan 2022 09:26:56 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id k33sm2172962wms.21.2022.01.11.09.26.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 09:26:56 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Subject: [PATCH] qdev-core.h: Fix wrongly named reference to TYPE_SPLIT_IRQ
Date: Tue, 11 Jan 2022 17:26:55 +0000
Message-Id: <20220111172655.3546766-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 11 Jan 2022 17:27:01 -0000

Fix a comment in qdev-core.h where we incorrectly referred
to TYPE_IRQ_SPLIT when we meant TYPE_SPLIT_IRQ.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/qdev-core.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index d19c9417520..92c3d652086 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -493,7 +493,7 @@ qemu_irq qdev_get_gpio_in_named(DeviceState *dev, const char *name, int n);
  * qemu_irqs at once, or to connect multiple outbound GPIOs to the
  * same qemu_irq. (Warning: there is no assertion or other guard to
  * catch this error: the model will just not do the right thing.)
- * Instead, for fan-out you can use the TYPE_IRQ_SPLIT device: connect
+ * Instead, for fan-out you can use the TYPE_SPLIT_IRQ device: connect
  * a device's outbound GPIO to the splitter's input, and connect each
  * of the splitter's outputs to a different device.  For fan-in you
  * can use the TYPE_OR_IRQ device, which is a model of a logical OR
-- 
2.25.1


