Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ozIGi-0002AZ-PP
	for mharc-qemu-trivial@gnu.org; Sun, 27 Nov 2022 09:04:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hoanguyen@ucdavis.edu>)
 id 1oz8FR-0004My-EH
 for qemu-trivial@nongnu.org; Sat, 26 Nov 2022 22:22:29 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hoanguyen@ucdavis.edu>)
 id 1oz8FP-0004jg-0w
 for qemu-trivial@nongnu.org; Sat, 26 Nov 2022 22:22:28 -0500
Received: by mail-pf1-x42f.google.com with SMTP id q12so3331114pfn.10
 for <qemu-trivial@nongnu.org>; Sat, 26 Nov 2022 19:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucdavis.edu; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mod3Ock7PvHPA+PuypUzbvv9VmCPX7bzLwcapdra0I4=;
 b=pmaK4pYIZNlbkmq+UQxTPDis8DHOPVqlZLsK75lEbAWnFiJHMaKDZYFh6s7JFj/1CB
 +/T7xtpWz9EY7eYvTJr6lsAPoGW6A6atdNqhfNwmRHGGrwiGoWCctsXqVloCamHP526O
 fLT9JlkQia/1r1OxEMo5VepcVlM5pFMtJtRlY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mod3Ock7PvHPA+PuypUzbvv9VmCPX7bzLwcapdra0I4=;
 b=pAiUocBu5dxjyRK/PJNhww40osgkdkGD86FZ38u1jhCbp4Goij/R2uv+IS496H7hn4
 mGARrVnjHeUv+vGwOrqkj0EoKdhG92mSUHK0Bxdi/7f7YItSmW2WRc4gLbX31BrkJ6Jk
 W8zc4YXt41ugtG+OGNK0q5lAvbuiIbR77oQsnT8RKvUaD9AeAopfTVeC/8jHSWS9ZYIo
 p11UYzuUFCr5BD2sNMKcT/qkvnkH62FPQh+9RwaTXUU9UaW+IEWYigHYl5TiEY4EAzMC
 IJwWLimTpKVUyAr4EuCz5YWNvItSta/N4Vq/oZamqAvCpDaBb0h2pR3gNteZ54uQG2RG
 lmYw==
X-Gm-Message-State: ANoB5plkvVVVH/38Q9ItojUUWnuVwdn2M4j7jWZtPwlJ2bxRJ99YtzHl
 umMTx6ajs8nNswAhf9iFK9odqg==
X-Google-Smtp-Source: AA0mqf7cNsA8EIDlAAsb1NPOVXzs01jgSbX7Bv0yQSF3BwLwQA7NMZm3abhvG0Y147kAF+5xxRrCGg==
X-Received: by 2002:a63:d948:0:b0:46f:1081:f517 with SMTP id
 e8-20020a63d948000000b0046f1081f517mr41357590pgj.297.1669519344341; 
 Sat, 26 Nov 2022 19:22:24 -0800 (PST)
Received: from penguin.lxd (c-73-41-83-143.hsd1.ca.comcast.net. [73.41.83.143])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a170902e5ca00b00188f07c10c9sm6037121plf.192.2022.11.26.19.22.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Nov 2022 19:22:23 -0800 (PST)
From: Hoa Nguyen <hoanguyen@ucdavis.edu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Hoa Nguyen <hoanguyen@ucdavis.edu>
Subject: [PATCH] hw/cxl/cxl-host: Fix an error message typo
Date: Sat, 26 Nov 2022 19:22:20 -0800
Message-Id: <20221127032220.2649-1-hoanguyen@ucdavis.edu>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=hoanguyen@ucdavis.edu; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 27 Nov 2022 09:04:28 -0500
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
X-List-Received-Date: Sun, 27 Nov 2022 03:22:29 -0000

Signed-off-by: Hoa Nguyen <hoanguyen@ucdavis.edu>
---
 hw/cxl/cxl-host.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/cxl/cxl-host.c b/hw/cxl/cxl-host.c
index 1adf61231a..3c1ec8732a 100644
--- a/hw/cxl/cxl-host.c
+++ b/hw/cxl/cxl-host.c
@@ -47,7 +47,7 @@ static void cxl_fixed_memory_window_config(CXLState *cxl_state,
 
     if (object->size % (256 * MiB)) {
         error_setg(errp,
-                   "Size of a CXL fixed memory window must my a multiple of 256MiB");
+                   "Size of a CXL fixed memory window must be a multiple of 256MiB");
         return;
     }
     fw->size = object->size;
-- 
2.30.2


