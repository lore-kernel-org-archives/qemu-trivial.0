Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lEsz4-0003Oe-Vb
	for mharc-qemu-trivial@gnu.org; Wed, 24 Feb 2021 07:09:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEsz1-0003OL-U3
 for qemu-trivial@nongnu.org; Wed, 24 Feb 2021 07:09:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEsyx-0002k0-KX
 for qemu-trivial@nongnu.org; Wed, 24 Feb 2021 07:09:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614168570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8BFURTx2FHMKRCb53xpPHrRIq4KIxDw9TuSbhZUYBGg=;
 b=HVnhxF+uJ8McBJck3d37G2q7z2YomsP4b6IvF9bPmcS88/TTIGjLj6ELYUbVxJ+wEnq4Fg
 eNsksYrmUNx+7/5XLCjWzgOjcYuqbSBrc4iU79Lp9RI19RcIpAQWxE6dBLynsAiI2FyUle
 wt3iQ1GrpS88UY8BUvzGlchAQbB2Qz8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-30-SsCLg5JvNBim4qnzdSEh2A-1; Wed, 24 Feb 2021 07:09:27 -0500
X-MC-Unique: SsCLg5JvNBim4qnzdSEh2A-1
Received: by mail-wm1-f69.google.com with SMTP id h16so469414wmq.8
 for <qemu-trivial@nongnu.org>; Wed, 24 Feb 2021 04:09:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8BFURTx2FHMKRCb53xpPHrRIq4KIxDw9TuSbhZUYBGg=;
 b=tWocb12PG27Okf4SAKVpqTIBRYIKc1wUeBIZcV5kd7HUnRJEfbK3yZTRHqQO4WdR/6
 m/VpDNo0ca8on2GlkAKoteVlcqG+0sSPOfnXotGvCym4UoK8GZx6/9flmMrkX0gIIVSQ
 ecRRT9tezZxRRwkS0fYv4KUBk9+QXINDr2C3x1c024qLeNY6Ha2UUJLuZov5Z6eWaa0D
 J8UB4B1cabv9la8IVLrwSgeaQujRaxvsB7AY0IME9E2Dp+Kt0oh0OOxwpJZMcHF4GKHz
 ogsnmoQnEU1Qf7rVq7+9LApZf+CSx0G8Emu9tm9I+1euZnfYygZBuFfJ9qjPSP9X3wr0
 7o9g==
X-Gm-Message-State: AOAM5315NCZYlVp5ZMN9hUndMxAmP39moimaGS9kQUP5esmawXGTuBKq
 ae277zSkD95YSgYiNBALy4Eiwu0XfUnuRQZ2gVMLWm5IjYBGp3+7oKbLCmPblVrr9DZpKjx7AiT
 0kfs/SeaVI5MbLzBkXg==
X-Received: by 2002:a05:600c:3511:: with SMTP id
 h17mr3518690wmq.2.1614168565893; 
 Wed, 24 Feb 2021 04:09:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzmKKNnhVJTRD2E5tCg0eMI5t8kEobGYyhwtcozVZow0b4xuKuxMsEpxYVfeVgaB0Z/AAyGmQ==
X-Received: by 2002:a05:600c:3511:: with SMTP id
 h17mr3518675wmq.2.1614168565725; 
 Wed, 24 Feb 2021 04:09:25 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id h17sm2426926wrt.74.2021.02.24.04.09.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 04:09:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-trivial@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH] meson: Only generate trace files for selected targets
Date: Wed, 24 Feb 2021 13:09:23 +0100
Message-Id: <20210224120923.3154325-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
X-List-Received-Date: Wed, 24 Feb 2021 12:09:36 -0000

We don't need to generate trace files for targets we
are not building. Restrict the the ones selected.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 meson.build | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/meson.build b/meson.build
index 05a67c20d93..c9b0433667d 100644
--- a/meson.build
+++ b/meson.build
@@ -1826,15 +1826,6 @@
   trace_events_subdirs += [
     'accel/tcg',
     'hw/core',
-    'target/arm',
-    'target/hppa',
-    'target/i386',
-    'target/i386/kvm',
-    'target/mips',
-    'target/ppc',
-    'target/riscv',
-    'target/s390x',
-    'target/sparc',
   ]
 endif
 
@@ -2166,6 +2157,7 @@
   t = target_arch[arch].apply(config_target, strict: false)
   arch_srcs += t.sources()
   arch_deps += t.dependencies()
+  trace_events_subdirs += ['target' / arch]
 
   target_common = common_ss.apply(config_target, strict: false)
   objects = common_all.extract_objects(target_common.sources())
-- 
2.26.2


