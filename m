Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pgqgd-0004f9-PQ
	for mharc-qemu-trivial@gnu.org; Mon, 27 Mar 2023 13:31:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <casantos@redhat.com>)
 id 1pgqgc-0004ef-HM
 for qemu-trivial@nongnu.org; Mon, 27 Mar 2023 13:31:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <casantos@redhat.com>)
 id 1pgqga-0002KK-NS
 for qemu-trivial@nongnu.org; Mon, 27 Mar 2023 13:31:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679938270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kLJs/LntwkI3fZ7wZCv1pPKK30p3YvBZrS7+9RPXSG4=;
 b=GE3WfGkjFRdehimeMwvqIZY3Cc1sxhD62M5ueGZ2ZLEqoVbxMZkbaxAN3Uha+AQe/5/uuX
 Foi0ckrUzt8vxYZaN4X5CmmSCr3l9oWnraSa3UXf+za8d1QqWfWGKoNZlVZIwWC1y7oPdA
 F7/z+9Oib2sMWfEAEJpGVgbaQ0TyKZA=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-284-LYbcqSt4O0eSfaUtuYexag-1; Mon, 27 Mar 2023 13:31:06 -0400
X-MC-Unique: LYbcqSt4O0eSfaUtuYexag-1
Received: by mail-oi1-f197.google.com with SMTP id
 z129-20020aca3387000000b0038710ae0033so1910114oiz.8
 for <qemu-trivial@nongnu.org>; Mon, 27 Mar 2023 10:31:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679938266;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kLJs/LntwkI3fZ7wZCv1pPKK30p3YvBZrS7+9RPXSG4=;
 b=PlNw0LCbXIiQPnb2EG3PM2fK/T2zuhJnHn1xRVJJtEfoScMygdoHgh9MaJVgpz0zqz
 PsworKd3h5MMGPiTGMrCGw8kK0Ava4DEFy0iNQ6u5rCrbnyTzdMyQK9LhMWnor6nkdNd
 9cEsPb7Y94u4XPQ4ZB9lDxv0v8DdeZ9TsEqkwll6DdGkLhAfZAyMpmu3DUZCmSm5LwlG
 cI79kNIv5TQ0tR8hhkHJkVHzR6p9wnprXtSdiJyxcMVWNw23+Gire99HX7CGQEsEStLV
 A+VE/oO24GG4jTr/OtsWL3BwRRuZ0ZJrYQj+L360Ci2kBX3qorIe9Qoqx4USviS2dxpY
 7V7w==
X-Gm-Message-State: AO0yUKXBtluPZ9NOYjKEllVmf2PwozFZ7YUVOGldQxLRVRhNURMbMMy0
 XekwRkt/g/2uNW8pKIOVKH2WX4oDXDpyJaWu/t9kFBsmfjWETGQEb5mr/06sheK6yqEVdyc38q2
 +MAMBPgre5BqQ8veEVw==
X-Received: by 2002:a4a:2ccf:0:b0:52b:bab5:eba2 with SMTP id
 o198-20020a4a2ccf000000b0052bbab5eba2mr5530624ooo.0.1679938264463; 
 Mon, 27 Mar 2023 10:31:04 -0700 (PDT)
X-Google-Smtp-Source: AK7set8YeEiZFpb7Xi8M7+r2YNG6tQQdpT0NPDITMb11AJS7NXPYS7Doy8s5vxf+/4caNg0RvdQFGg==
X-Received: by 2002:a4a:2ccf:0:b0:52b:bab5:eba2 with SMTP id
 o198-20020a4a2ccf000000b0052bbab5eba2mr5530607ooo.0.1679938263950; 
 Mon, 27 Mar 2023 10:31:03 -0700 (PDT)
Received: from casantos.remote.csb ([177.158.139.132])
 by smtp.gmail.com with ESMTPSA id
 c192-20020a4a4fc9000000b0053b88b03e24sm5790768oob.18.2023.03.27.10.31.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 10:31:03 -0700 (PDT)
From: casantos@redhat.com
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: Carlos Santos <casantos@redhat.com>
Subject: [PATCH V2] tracing: install trace events file only if necessary
Date: Mon, 27 Mar 2023 14:30:58 -0300
Message-Id: <20230327173058.199027-1-casantos@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=casantos@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 27 Mar 2023 17:31:14 -0000

From: Carlos Santos <casantos@redhat.com>

It is not useful when configuring with --enable-trace-backends=nop.

Signed-off-by: Carlos Santos <casantos@redhat.com>
---
Changes v1->v2:
  Install based on chosen trace backend, not on chosen emulators.
---
 trace/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/trace/meson.build b/trace/meson.build
index 8e80be895c..3d96b4eea0 100644
--- a/trace/meson.build
+++ b/trace/meson.build
@@ -64,7 +64,7 @@ trace_events_all = custom_target('trace-events-all',
                                  input: trace_events_files,
                                  command: [ 'cat', '@INPUT@' ],
                                  capture: true,
-                                 install: true,
+                                 install: get_option('trace_backends') != 'nop'
                                  install_dir: qemu_datadir)
 
 if 'ust' in get_option('trace_backends')
-- 
2.31.1


