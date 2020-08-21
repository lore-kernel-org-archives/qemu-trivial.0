Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k991S-0008Fj-Uh
	for mharc-qemu-trivial@gnu.org; Fri, 21 Aug 2020 11:32:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k991R-0008EK-NT
 for qemu-trivial@nongnu.org; Fri, 21 Aug 2020 11:32:05 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:42629
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k991O-0006QP-Nd
 for qemu-trivial@nongnu.org; Fri, 21 Aug 2020 11:32:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598023921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hlkdlpuLwgIna/UKj+y6wdSkzPoctNh3j/Kz+JXFBIU=;
 b=M5KAQM25u4JJLpnwnWUC5T63dZflco5g+XBemdqsN0dLRzupHLL2wdGZeq9D5AIBHceoAQ
 1O9JLxd3qtzbbBOxhkRIW9vKd2R/L7KWsmPYg7y1j7SSlmQ95kwPBS+UN4RGoCB83j5VXr
 3YyaUFfHmeTBqosptz9QgjHf+vUBlXs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-52-pFpGdfIfPAaRjs_8DMs8ew-1; Fri, 21 Aug 2020 11:31:59 -0400
X-MC-Unique: pFpGdfIfPAaRjs_8DMs8ew-1
Received: by mail-wm1-f70.google.com with SMTP id q23so715630wmj.0
 for <qemu-trivial@nongnu.org>; Fri, 21 Aug 2020 08:31:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hlkdlpuLwgIna/UKj+y6wdSkzPoctNh3j/Kz+JXFBIU=;
 b=JtVFXCmKSfh2IJPlSZQ2cLxfO99I7G7/1QheQyc3/hM/8t2ltrH+D+L4tXHYqTX1bz
 qMUCMbkxHvG6zZuTbhAX00jqr5/Wjkzo6oR/ihtCgKvdX/R7Y6eHuLjV5F6BKM6/mEB6
 K6hsIbMX8E4AHEJqSZjeQokFiIfwpyzR+eG8djOTm22M/X/eSzPYIO5OkQ9N5htrqUA9
 c7ZRyRWYVyIHrr9s7s3xmdgt+6EnPQl0e4iU7eBXQGM1iAXuk3Z6O19f0oZ/pzfH40lB
 UcLT0qbZ4VD+OARDaqSQFJSYBYBFrMo3ezqe0LydJF0m0ZuLmC7iNNmidA3gv+r5Lzyv
 LP/g==
X-Gm-Message-State: AOAM533CoSxG6jRo1lNNkrzwmSIhkKcEEBqZ3/JkwVKF3ix/6m4hkgUK
 43gAXj6nQRX+NpZlHg0MCiNZ3QrktAArDpY5Wj1X7xZCi3jNtE5mMY+BjoHcf+ENfetWTKUqTAN
 DdPc3DLxeqaL+0S5+NA==
X-Received: by 2002:a1c:4b17:: with SMTP id y23mr3801290wma.143.1598023918302; 
 Fri, 21 Aug 2020 08:31:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwS0EH8eM4rXMJXMsSUkAdR7TvHqbIoqF8pHhdUYeloX8+IXGvZqSIk6msPeXP9Dhx/ZqR1UQ==
X-Received: by 2002:a1c:4b17:: with SMTP id y23mr3801275wma.143.1598023918095; 
 Fri, 21 Aug 2020 08:31:58 -0700 (PDT)
Received: from localhost.localdomain (121.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.121])
 by smtp.gmail.com with ESMTPSA id y84sm6008112wmg.38.2020.08.21.08.31.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 08:31:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v2] meson: Do not consider qemu-keymap a 'tool'
Date: Fri, 21 Aug 2020 17:31:55 +0200
Message-Id: <20200821153155.1247675-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/21 01:00:15
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
X-List-Received-Date: Fri, 21 Aug 2020 15:32:06 -0000

We need qemu-keymap to generate the keymaps.

This fixes when configuring with --disable-tools:

  Compiling C object qemu-keymap.p/qemu-keymap.c.o
  Compiling C object qemu-keymap.p/ui_input-keymap.c.o
  Compiling C object qemu-edid.p/qemu-edid.c.o
  ../ui/input-keymap.c:7:49: fatal error: ui/input-keymap-atset1-to-qcode.c.inc: No such file or directory
  compilation terminated.
  Makefile.ninja:688: recipe for target 'qemu-keymap.p/ui_input-keymap.c.o' failed
  make: *** [qemu-keymap.p/ui_input-keymap.c.o] Error 1

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
v2: Move to ui/ (Paolo)
---
 meson.build    | 5 -----
 ui/meson.build | 5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meson.build b/meson.build
index 808f50b07ef..709d7e6ccc2 100644
--- a/meson.build
+++ b/meson.build
@@ -1078,11 +1078,6 @@ if have_tools
   subdir('contrib/rdmacm-mux')
   subdir('contrib/elf2dmp')
 
-  if 'CONFIG_XKBCOMMON' in config_host
-    executable('qemu-keymap', files('qemu-keymap.c', 'ui/input-keymap.c'),
-               dependencies: [qemuutil, xkbcommon], install: true)
-  endif
-
   executable('qemu-edid', files('qemu-edid.c', 'hw/display/edid-generate.c'),
              dependencies: qemuutil,
              install: true)
diff --git a/ui/meson.build b/ui/meson.build
index 6f74d30ea06..2b7861073ff 100644
--- a/ui/meson.build
+++ b/ui/meson.build
@@ -96,6 +96,11 @@ keymaps = [
 ]
 
 if have_system
+  if 'CONFIG_XKBCOMMON' in config_host
+  executable('qemu-keymap', files('qemu-keymap.c', 'ui/input-keymap.c'),
+             dependencies: [qemuutil, xkbcommon], install: true)
+  endif
+
   foreach e : keymaps
     output = 'input-keymap-@0@-to-@1@.c.inc'.format(e[0], e[1])
     genh += custom_target(output,
-- 
2.26.2


