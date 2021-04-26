Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lb0z9-00078t-QO
	for mharc-qemu-trivial@gnu.org; Mon, 26 Apr 2021 09:09:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgenfv@gmail.com>) id 1lax5P-0005Kr-VF
 for qemu-trivial@nongnu.org; Mon, 26 Apr 2021 04:59:23 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:38622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgenfv@gmail.com>) id 1lax5O-0005Nj-94
 for qemu-trivial@nongnu.org; Mon, 26 Apr 2021 04:59:23 -0400
Received: by mail-wr1-x433.google.com with SMTP id k14so5051143wrv.5
 for <qemu-trivial@nongnu.org>; Mon, 26 Apr 2021 01:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KilglWAaPsdiXcjfzKmnwxnFdqjFFALhZp4O9A7RhRQ=;
 b=Y41cYuJ+YCWw+tn8skIvocvTGr778GtCANj0gbkJ1lzoAwwB9lO+l12qWEpbnEVjac
 W2yD6yyHbL7d/76cH+A3+OWbUy2J/eaMkDw7Fa1kbf+YMyP2dksGILZBtUQD8+lVDfvq
 AkbcWJjA4l9kwGDjESfzTSDheLoSKoCxU48DBYPOiD0FILfCXohP7rGztiIDYIykaZbX
 YPy8K0WC9fPpbd//w5tIMEaBeQVg67LrWmrD2RQnKEDb1qh0wzNvM4C/MCdQEB4J2ZVb
 Ms/u/K+RkLJWqqVkGXRCpARB/F/aMjQjio6yJHYYM8/BTiEx7ya4OmDWxzgK7uVh0/fg
 prXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KilglWAaPsdiXcjfzKmnwxnFdqjFFALhZp4O9A7RhRQ=;
 b=Yq96FqQODqQWK7PUe5PWXmzW5RJGFVMMc636pwgPRTR1vsEt3WVTBgE51tW6i5mmER
 aQZ7qY7QCQlsYk+RRO1J3VqXXkLkW+TDtPz65xeKvxtV051eB7+mguGTqlo6Fd5gKq/V
 e3GejzrWWqvpynZ/RYcqDHrVk8dtutV0gtwf5zKwp1zoqm/6Bjs+ASxYO0y+kiIwM2/y
 GIr+zNJOWzVbw+QoxgjKYiKP2UzAzUBJSEr9nzyxvTsV1ZICKbeKp4REnOtbN3hkW7kF
 fTwOYboUMRitP6pXluXJqBTbZb3ZNMGsaP27aavSD24V3S1p20itJ+bl16rtfMr4yW/2
 RexQ==
X-Gm-Message-State: AOAM532k2W6REnWwYGh82MAj2oiG0XW4U8vj8K8k3nUPvUjbflxEYYf+
 x22KcQHFKwlAKSZH7zVNP8esvSc0yjWwN9vC
X-Google-Smtp-Source: ABdhPJyyy02UVFvPLpUEZyruR9qm2EriKOjtIyS/pIP7MYNqzOPm6s0z/OOOy0EJPUQoi9GxAulhFA==
X-Received: by 2002:a5d:4a02:: with SMTP id m2mr11379832wrq.188.1619427558035; 
 Mon, 26 Apr 2021 01:59:18 -0700 (PDT)
Received: from ubuntu.localdomain (host-92-0-155-74.as13285.net. [92.0.155.74])
 by smtp.gmail.com with ESMTPSA id j7sm3404605wmi.21.2021.04.26.01.59.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 01:59:17 -0700 (PDT)
From: Edge NFV <edgenfv@gmail.com>
To: qemu-trivial@nongnu.org
Cc: edgenfv@gmail.com
Subject: [PATCH] make vfio and DAX cache work together by skipping virtio fs
 cache section during vfio memory region add
Date: Mon, 26 Apr 2021 01:58:29 -0700
Message-Id: <20210426085829.133859-1-edgenfv@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=edgenfv@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 26 Apr 2021 09:09:08 -0400
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
X-List-Received-Date: Mon, 26 Apr 2021 08:59:24 -0000

Signed-off-by: Edge NFV <edgenfv@gmail.com>
---
 hw/vfio/common.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index ae5654fcdb..83e15bf7a3 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -668,6 +668,15 @@ static void vfio_listener_region_add(MemoryListener *listener,
                 int128_get64(int128_sub(section->size, int128_one())));
         return;
     }
+    
+    /* Do not add virtio fs cache section */                  
+    if (!strcmp(memory_region_name(section->mr), "virtio-fs-cache")) {
+        trace_vfio_listener_region_add_skip(
+                section->offset_within_address_space,
+                section->offset_within_address_space +
+                int128_get64(int128_sub(section->size, int128_one())));
+        return;
+    }  
 
     if (unlikely((section->offset_within_address_space &
                   ~qemu_real_host_page_mask) !=
-- 
2.25.1


