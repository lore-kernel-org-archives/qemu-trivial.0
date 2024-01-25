Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rT2gF-0006se-OM
	for mharc-qemu-trivial@gnu.org; Thu, 25 Jan 2024 11:34:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rT2gB-0006kl-8F
 for qemu-trivial@nongnu.org; Thu, 25 Jan 2024 11:34:15 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rT2g8-00027r-4f
 for qemu-trivial@nongnu.org; Thu, 25 Jan 2024 11:34:14 -0500
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-33922b66bd7so4779353f8f.2
 for <qemu-trivial@nongnu.org>; Thu, 25 Jan 2024 08:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706200450; x=1706805250; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xcUJGzACtWHBMo3Dsdcr3bXAecU2iiyRxVi/UEQTqS4=;
 b=WHlhMl+5mBgjtAiH9fXiLu+gY7NCJoQj+Id1O7EHCM4/Hh+REqCKfqi1+4o1qDXN6i
 m/zfxx35tbocP0J9uwWwmN86mTSlFRmMezzxc4DG7H+PVLxqwQnImKAj8uifN5VVjRiF
 +Xaz5xQm7JqxtEdzQr1zLhzCuqrVA2oJQPmzENVRX61mAb98VIsvj3/YXb5xqhvB57Rh
 CCrpmOd+ywlfZ95FJnJkmMS+TxnoTzxUbEGeFGp3x0njvXVRTeNsqnP8L0HvVqBuEE7M
 mNUb/Zikul0kGfm+gNM7sRKwq8Czk/2Y4kwZDNXblecURIUtswd7Q9oaryhn657Gnmib
 Go9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706200450; x=1706805250;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xcUJGzACtWHBMo3Dsdcr3bXAecU2iiyRxVi/UEQTqS4=;
 b=Y32O1YhFcbtoUJ4mu/IxA/5n6ZuGHxa2tzP+MysuCFycQrXnLFCHY4CZoPkMXrreI/
 4ZPd+kMfZcZUNJueIStM+uvLiRKl89dLy23D9UiwgKfJS+cCrqE6an3KUn1QapSGsppP
 QAtguANuThVbNIeiTDuCOHGuGqU2rhnPTeZjgy/SmgbttSq/V2q/XXP0FbVgfFPY3uEq
 Ku5gVsGidzSdeEObF77i5t/pH97WMweEF9U1ccIaqA5rgGNaqXCjP+q00hFVod7wq1bu
 3vlilTR8Nf6F6GwqJPpQcS+C++QzgneLEXWDjE7co7uYCHVUpTx5T9w20u9aRVu78QD9
 RR3g==
X-Gm-Message-State: AOJu0YyFisRr6mBoElFip9vqG2UVSWqmtWOu8M1q9OmW2hnEuWldUh0S
 HQlD0nqYford6e3jffXLVrxbN7XiwD+PEz+geitPs1ao5jyurvNUC57am2n4nyY=
X-Google-Smtp-Source: AGHT+IFaNtKkAeyZi47rE73Knr6TEJBL2FAd/W1s55yQnxxsA0UE/q/rGjeuQmvKm5YM1kxiqK0BRQ==
X-Received: by 2002:a5d:4dcd:0:b0:336:7300:f532 with SMTP id
 f13-20020a5d4dcd000000b003367300f532mr1072181wru.85.1706200450563; 
 Thu, 25 Jan 2024 08:34:10 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a05600c358d00b0040ea875a527sm3122208wmq.26.2024.01.25.08.34.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jan 2024 08:34:10 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Subject: [PATCH 02/10] hyperv: Clean up includes
Date: Thu, 25 Jan 2024 16:34:00 +0000
Message-Id: <20240125163408.1595135-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240125163408.1595135-1-peter.maydell@linaro.org>
References: <20240125163408.1595135-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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
X-List-Received-Date: Thu, 25 Jan 2024 16:34:15 -0000

This commit was created with scripts/clean-includes:
 ./scripts/clean-includes --git hyperv hw/hyperv/*.[ch]

All .c should include qemu/osdep.h first.  The script performs three
related cleanups:

* Ensure .c files include qemu/osdep.h first.
* Including it in a .h is redundant, since the .c  already includes
  it.  Drop such inclusions.
* Likewise, including headers qemu/osdep.h includes is redundant.
  Drop these, too.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/hyperv/hv-balloon-internal.h           | 1 -
 hw/hyperv/hv-balloon-our_range_memslots.h | 1 -
 hw/hyperv/hv-balloon-page_range_tree.h    | 1 -
 hw/hyperv/hv-balloon-our_range_memslots.c | 1 +
 hw/hyperv/hv-balloon-page_range_tree.c    | 1 +
 hw/hyperv/hv-balloon.c                    | 1 +
 6 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/hyperv/hv-balloon-internal.h b/hw/hyperv/hv-balloon-internal.h
index 164c2e58253..ee53a28a266 100644
--- a/hw/hyperv/hv-balloon-internal.h
+++ b/hw/hyperv/hv-balloon-internal.h
@@ -10,7 +10,6 @@
 #ifndef HW_HYPERV_HV_BALLOON_INTERNAL_H
 #define HW_HYPERV_HV_BALLOON_INTERNAL_H
 
-#include "qemu/osdep.h"
 
 #define HV_BALLOON_PFN_SHIFT 12
 #define HV_BALLOON_PAGE_SIZE (1 << HV_BALLOON_PFN_SHIFT)
diff --git a/hw/hyperv/hv-balloon-our_range_memslots.h b/hw/hyperv/hv-balloon-our_range_memslots.h
index b6f592d34b0..df3b686bc7c 100644
--- a/hw/hyperv/hv-balloon-our_range_memslots.h
+++ b/hw/hyperv/hv-balloon-our_range_memslots.h
@@ -10,7 +10,6 @@
 #ifndef HW_HYPERV_HV_BALLOON_OUR_RANGE_MEMSLOTS_H
 #define HW_HYPERV_HV_BALLOON_OUR_RANGE_MEMSLOTS_H
 
-#include "qemu/osdep.h"
 
 #include "exec/memory.h"
 #include "qom/object.h"
diff --git a/hw/hyperv/hv-balloon-page_range_tree.h b/hw/hyperv/hv-balloon-page_range_tree.h
index 07a9ae0da61..333772b86d2 100644
--- a/hw/hyperv/hv-balloon-page_range_tree.h
+++ b/hw/hyperv/hv-balloon-page_range_tree.h
@@ -10,7 +10,6 @@
 #ifndef HW_HYPERV_HV_BALLOON_PAGE_RANGE_TREE_H
 #define HW_HYPERV_HV_BALLOON_PAGE_RANGE_TREE_H
 
-#include "qemu/osdep.h"
 
 /* PageRange */
 typedef struct PageRange {
diff --git a/hw/hyperv/hv-balloon-our_range_memslots.c b/hw/hyperv/hv-balloon-our_range_memslots.c
index 99bae870f37..1505a395cf7 100644
--- a/hw/hyperv/hv-balloon-our_range_memslots.c
+++ b/hw/hyperv/hv-balloon-our_range_memslots.c
@@ -7,6 +7,7 @@
  * See the COPYING file in the top-level directory.
  */
 
+#include "qemu/osdep.h"
 #include "hv-balloon-internal.h"
 #include "hv-balloon-our_range_memslots.h"
 #include "trace.h"
diff --git a/hw/hyperv/hv-balloon-page_range_tree.c b/hw/hyperv/hv-balloon-page_range_tree.c
index e178d8b413c..dfb14852f42 100644
--- a/hw/hyperv/hv-balloon-page_range_tree.c
+++ b/hw/hyperv/hv-balloon-page_range_tree.c
@@ -7,6 +7,7 @@
  * See the COPYING file in the top-level directory.
  */
 
+#include "qemu/osdep.h"
 #include "hv-balloon-internal.h"
 #include "hv-balloon-page_range_tree.h"
 
diff --git a/hw/hyperv/hv-balloon.c b/hw/hyperv/hv-balloon.c
index 66f297c1d7e..02383657124 100644
--- a/hw/hyperv/hv-balloon.c
+++ b/hw/hyperv/hv-balloon.c
@@ -7,6 +7,7 @@
  * See the COPYING file in the top-level directory.
  */
 
+#include "qemu/osdep.h"
 #include "hv-balloon-internal.h"
 
 #include "exec/address-spaces.h"
-- 
2.34.1


