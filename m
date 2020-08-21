Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k98cL-0002AN-FG
	for mharc-qemu-trivial@gnu.org; Fri, 21 Aug 2020 11:06:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k98cK-00028c-HX
 for qemu-trivial@nongnu.org; Fri, 21 Aug 2020 11:06:08 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:57006
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k98cG-0003Ov-IT
 for qemu-trivial@nongnu.org; Fri, 21 Aug 2020 11:06:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598022363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Qus6fiddFzAKKm0LdJubRUv/SENFgdRTO2lacblbVgc=;
 b=PpqWQr0LJ3NFBpm5xv3f4qZnP+lL3fQ9IZzRDfQO4PWdU88A/wtGJEqFCM+p5cFUPwY8yr
 qbxpWUBPD/D69Wr3ESsHKGhv/5mkIuFCe5SNrez0zLfeZ4fausytW1G2i8AorLtd4Uhgxn
 nHXxK7e6aC96c/wSO0QRCKxgOk9ATUI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-w5JLZTrnOb-dWXoTcowN6Q-1; Fri, 21 Aug 2020 11:06:00 -0400
X-MC-Unique: w5JLZTrnOb-dWXoTcowN6Q-1
Received: by mail-wr1-f70.google.com with SMTP id o10so625814wrs.21
 for <qemu-trivial@nongnu.org>; Fri, 21 Aug 2020 08:06:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Qus6fiddFzAKKm0LdJubRUv/SENFgdRTO2lacblbVgc=;
 b=Uk/54KceOal5ej5oj32yLX92oM/ZbTmSKul4/mpd+KVLJ7bhLxCaohoWvY/l1OF0eW
 3Z10BkSkHdME32pt5wLMNSbalgtvHsgg9emynyb6HxLnJGjxfMs92nN4fco59arBBzVX
 4NPXUhXBZpyomRvRJCw0bsDIUivCB8Lxcp4ki5QiwVigAtNIyAGwT74uQ8amsIi3Oze1
 FriX1VlJbhufLiWL/GVB3WruqNtUUFrSF3fEwbpYgx1wTE7ZxebuQoVBl1lEK/URw9YO
 36qCvbE9PIQwkIxTBA8dAs2Y5G4rP+N+GaNCDE6I0Pz25V9k3SCcMVVzyGgI1FbpwMFk
 BqLQ==
X-Gm-Message-State: AOAM533iL0Wn7lo/VxMcSeeJLGd7eLXK4VgMm/IR71APoIiXMokhEG4V
 ehSFSq6cmSgewltGL5W59tvE4jhyFBjFC6Rigj5izkT1cHQ/fl5nDgzn5c/KhykRPlyKahVdyXA
 /OWSWrd8eYepxUN3LGQ==
X-Received: by 2002:a1c:23c4:: with SMTP id j187mr3708863wmj.58.1598022359416; 
 Fri, 21 Aug 2020 08:05:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwtOrtIyy/ch39NtBFYQ11yTa5712V4QHzKIOANQmUltIP7zbq/a25ZK3Jie0IzTwPxQTIfIQ==
X-Received: by 2002:a1c:23c4:: with SMTP id j187mr3708832wmj.58.1598022359028; 
 Fri, 21 Aug 2020 08:05:59 -0700 (PDT)
Received: from localhost.localdomain (121.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.121])
 by smtp.gmail.com with ESMTPSA id v8sm2728914wrm.53.2020.08.21.08.05.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 08:05:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH] meson: Fix --disable-tools --enable-system builds
Date: Fri, 21 Aug 2020 17:05:56 +0200
Message-Id: <20200821150556.1235625-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/20 23:41:39
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 21 Aug 2020 15:06:08 -0000

Fixes:

 $ ../configure --disable-tools --disable-user
 ../tests/qemu-iotests/meson.build:7:0: ERROR: Unknown variable "qemu_block_tools".

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 meson.build | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 808f50b07ef..e76f8f6d084 100644
--- a/meson.build
+++ b/meson.build
@@ -1062,12 +1062,13 @@ if 'CONFIG_GUEST_AGENT' in config_host
   subdir('qga')
 endif
 
+qemu_block_tools = []
 if have_tools
   qemu_img = executable('qemu-img', [files('qemu-img.c'), hxdep],
              dependencies: [authz, block, crypto, io, qom, qemuutil], install: true)
   qemu_io = executable('qemu-io', files('qemu-io.c'),
              dependencies: [block, qemuutil], install: true)
-  qemu_block_tools = [qemu_img, qemu_io]
+  qemu_block_tools += [qemu_img, qemu_io]
   if targetos == 'linux' or targetos == 'sunos' or targetos.endswith('bsd')
     qemu_nbd = executable('qemu-nbd', files('qemu-nbd.c'),
                dependencies: [block, qemuutil], install: true)
-- 
2.26.2


