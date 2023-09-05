Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qdSye-0004vz-50
	for mharc-qemu-trivial@gnu.org; Tue, 05 Sep 2023 06:08:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1qdSyc-0004vi-85
 for qemu-trivial@nongnu.org; Tue, 05 Sep 2023 06:08:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1qdSya-00068e-82
 for qemu-trivial@nongnu.org; Tue, 05 Sep 2023 06:08:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693908482;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=458i95STMVj0xZ58IBgIeQG9A3svePa5DHdd5rQPov0=;
 b=MFX12eZkfgnGaCipBoNByr42EDkn798nykr/quqZsqvQOLvrx7Vo8JifJm8v/PLpdrAFhU
 /uLYLpkE+iH88w5NUQUpPvDCzW1mw8Y24Yrv7kPjTMUPWTDHxgeChM3ckZ4UJ2ZPv9Ub/A
 2iO4Jh4vhJdHzys/h7vO8x1qQ+xWIJc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-369-QtwmNIOnOHKo8u1NO0hmiQ-1; Tue, 05 Sep 2023 06:08:01 -0400
X-MC-Unique: QtwmNIOnOHKo8u1NO0hmiQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-31aca0c0d63so1226288f8f.0
 for <qemu-trivial@nongnu.org>; Tue, 05 Sep 2023 03:08:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693908480; x=1694513280;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=458i95STMVj0xZ58IBgIeQG9A3svePa5DHdd5rQPov0=;
 b=TIsTEOp9D4nV9w9UyqzzluJhn5GzF8gByjF/v+y5lIK4Pmc5OI4C0WODDH/WvuLYmx
 4+fF+Zk/n4QS/F/c3M+X4UG5HxgMjaR1SHVdvT+2OmY2cVd+PdBwyBrT6SJw7t5/CU5i
 lkwKkb5aS94a/q4vRyKcvFOzkDeJOQYmX0PT4N8ifAJAlobOHtiB8fyPExHFHLi0Lq70
 OPqcMZTRB5nLxIlOcgS/U8JTfuvLTKEc8XnFohtK+wSuFoMAFgw/rOyw94I3q7FOnAbX
 xMN6SjAcu/nf9jElntKO/0hR5t3xEDxtgsg3ociILyJjBSpt3ZP/FBOYiNjLpQWCp0OG
 K2Hg==
X-Gm-Message-State: AOJu0YyJa0vmuEKGrxAy5ZHqlbBH1YqgqsYNrbWft4g+n452OcOD8Xqt
 mNJwhyEwV3J4gufIxbLRQ5fheeRLr5MY2J8ZDXG7nFxiglqroeYxPowbnFeDAlAfAjjJoXr7VT2
 5afvhFa0Af9Fxp75B4w4GOln4qw==
X-Received: by 2002:a5d:490a:0:b0:314:1270:8fc with SMTP id
 x10-20020a5d490a000000b00314127008fcmr8984896wrq.0.1693908480007; 
 Tue, 05 Sep 2023 03:08:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVfr6NpavIVMsBt5v+M+9Bhmty10ZViSW14k67eljROvof2M9i2TSAaWWnPL4zBOXX6lBt9g==
X-Received: by 2002:a5d:490a:0:b0:314:1270:8fc with SMTP id
 x10-20020a5d490a000000b00314127008fcmr8984883wrq.0.1693908479689; 
 Tue, 05 Sep 2023 03:07:59 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 y8-20020adff148000000b00317c742ca9asm16781575wro.43.2023.09.05.03.07.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Sep 2023 03:07:58 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Subject: [PATCH] docs/system/replay: do not show removed command line option
Date: Tue,  5 Sep 2023 12:07:57 +0200
Message-ID: <20230905100757.298689-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 05 Sep 2023 10:08:06 -0000

Cc: qemu-trivial@nongnu.org
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/system/replay.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/system/replay.rst b/docs/system/replay.rst
index 3105327423c..ca7c17c63da 100644
--- a/docs/system/replay.rst
+++ b/docs/system/replay.rst
@@ -181,7 +181,7 @@ Audio data is recorded and replay automatically. The command line for recording
 and replaying must contain identical specifications of audio hardware, e.g.:
 
 .. parsed-literal::
-    -soundhw ac97
+    -audio pa,model=ac97
 
 Serial ports
 ------------
-- 
2.41.0


