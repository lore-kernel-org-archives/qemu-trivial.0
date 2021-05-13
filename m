Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lhE4Q-0005ha-BU
	for mharc-qemu-trivial@gnu.org; Thu, 13 May 2021 12:20:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhE4O-0005cd-Tv
 for qemu-trivial@nongnu.org; Thu, 13 May 2021 12:20:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhE4M-0006DR-4G
 for qemu-trivial@nongnu.org; Thu, 13 May 2021 12:20:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620922813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nmblD/IV3Gv2eK11z3q3zt0LycvGlgfOv6QbUmJ389k=;
 b=Vogzqi8CeBPOhNYuVhWaGhevq/mxRHFESqitGHMqf3JZNWmw7XxNm7ukZfeMAF0RFxY6Ly
 k38F0QS4+8hXO9NzJWfihOkfsq6txR3ugkZs3mDJglQn3Sz3UQz7mo1ezWOPpfldg79sBL
 PNL/jH4u/vLh6rr/3tDIqVd5N+POV6I=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-a55ngpYwOASs6jP_xrM21Q-1; Thu, 13 May 2021 12:20:11 -0400
X-MC-Unique: a55ngpYwOASs6jP_xrM21Q-1
Received: by mail-ed1-f70.google.com with SMTP id
 i17-20020a50fc110000b0290387c230e257so14908752edr.0
 for <qemu-trivial@nongnu.org>; Thu, 13 May 2021 09:20:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nmblD/IV3Gv2eK11z3q3zt0LycvGlgfOv6QbUmJ389k=;
 b=dd5y2B09nzzjfWaazc+j7TZspwsR/L6/H4nGu0o0F3Ves++2QfQK32dQnbsNTXHDg+
 cDumrfYEUiFvZJeKCtqaweMDpJwtnQa5T7EQRpmQ85PpBU3NFEfWiwODqMLuVvwFs9Jj
 gMl4fqjhTDq6NOjQcSP4t0tUgpTF/Cc56cSRWwrLA89795HzP/G+zfIdPsuelHvx7gwr
 9YMS3182iTQMY1qDXe80rlgWGAs39KAbYEZDDPXufSjWvofQWRmBB299CXJT6cKZNOW0
 fhCD7vA7CDMgpFfnlablRWjqJJY4c1qDSrxQi0p4bUXnnbdiGAiWOXCPELObyEftgamQ
 SOcA==
X-Gm-Message-State: AOAM532ShMHciYCF0mdehVxACQbFgLmTcLms52CCs38bzDVnfa0Zjdyz
 /CfsIjvQMv16IfzWzItf9KDDptEzofWP8BWDLCA0MIpFXp3u6lAZeglWS95EZMw6wX9+yXYTPfa
 bcrZWljG4dOOOpQq3HQ==
X-Received: by 2002:a17:906:31c6:: with SMTP id
 f6mr44798529ejf.446.1620922810236; 
 Thu, 13 May 2021 09:20:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkCju0LJndMLsl/q9gO1Rv3uWoIpOwiAZBV5Yu0WCSLQBwfC1+4EiZStJXM2MexC4rTwp29g==
X-Received: by 2002:a17:906:31c6:: with SMTP id
 f6mr44798512ejf.446.1620922810099; 
 Thu, 13 May 2021 09:20:10 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id r15sm2515434edp.62.2021.05.13.09.20.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 09:20:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, qemu-trivial@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Bandan Das <bsd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH] tests/qtest/fuzz: Fix build failure
Date: Thu, 13 May 2021 18:20:08 +0200
Message-Id: <20210513162008.3922223-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 13 May 2021 16:20:17 -0000

On Fedora 32, using clang (version 10.0.1-3.fc32) we get:

  tests/qtest/fuzz/fuzz.c:237:5: error: implicit declaration of function 'qemu_init' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
      qemu_init(result.we_wordc, result.we_wordv, NULL);
      ^

qemu_init() is declared in "sysemu/sysemu.h", include this
header to fix.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/qtest/fuzz/fuzz.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qtest/fuzz/fuzz.c b/tests/qtest/fuzz/fuzz.c
index 04b70e114bf..5f77c849837 100644
--- a/tests/qtest/fuzz/fuzz.c
+++ b/tests/qtest/fuzz/fuzz.c
@@ -16,6 +16,7 @@
 #include <wordexp.h>
 
 #include "qemu/datadir.h"
+#include "sysemu/sysemu.h"
 #include "sysemu/qtest.h"
 #include "sysemu/runstate.h"
 #include "qemu/main-loop.h"
-- 
2.26.3


