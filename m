Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k99aP-0001Be-55
	for mharc-qemu-trivial@gnu.org; Fri, 21 Aug 2020 12:08:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k99aN-00017X-Ew
 for qemu-trivial@nongnu.org; Fri, 21 Aug 2020 12:08:11 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:58341
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k99aL-0003dI-Lf
 for qemu-trivial@nongnu.org; Fri, 21 Aug 2020 12:08:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598026089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QNLCUycU+nWEXithWdbVY34QeWXma92nS9kZQp9Eokg=;
 b=Ou4I0+AQzxUXDhtYRKdPk0yigzhCflbQRH3Z8P3Ty7k/hwfR4bF+UYMgd+ZwtXxIFtuikE
 sGrMPjAGN0OBCGoUyKb6fRQjHUm42NE+klf/N2AGdT7uouT7d6aYG8xvl0ho8oXRYxyexf
 3VucyQWquaXTW4WrqG+bKO7310Mp08U=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-fHZm1TA7PXO0495nDmlx1Q-1; Fri, 21 Aug 2020 12:08:06 -0400
X-MC-Unique: fHZm1TA7PXO0495nDmlx1Q-1
Received: by mail-wr1-f70.google.com with SMTP id 5so679426wrc.17
 for <qemu-trivial@nongnu.org>; Fri, 21 Aug 2020 09:08:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QNLCUycU+nWEXithWdbVY34QeWXma92nS9kZQp9Eokg=;
 b=TFKJnC0nP89tB2KqfEbMJ/21KpIoNNER+W8dDSuiQpUN+hNTdPk+lVwIsqcAUkrd2l
 l+XCAT+7THFfDqaWXrrjAjz44dWhNO2uboaQJiJiZJg6awQaY3Z+CjjvmglaxYu7WCx6
 f8fkXuuOZntahVH84kmqrk5Lft9esbMXpdDH+hU+qyie9BlKRmwqEBoF/EWgXe3iOoqe
 UcPg6Y2XZR9rCU7N8h/GzMqwQ3sQkoI7nLY5b598p5j9vUrDrbC3sc3jcLO2bimQTevH
 02EQDY6PPpMwRDTVcccufWYr7X6xxTSPzRPbI/gcyRr5gskhEIFiEwJ5UZFXNhu/5A8N
 KgsQ==
X-Gm-Message-State: AOAM533pd/H9syuR6YEbSHxo7ffnDhekU/SP3UBWlLovlD0YJxal7NwF
 cEc7Jj5Sffs6tPfFJSoz+YW67nr4cZrKDOrLaADMnYjVhY0ZsRCwIIFm5NqL8kWzHKH8kBYiBzB
 CeMkvWqPExvmEWD+5tA==
X-Received: by 2002:adf:df85:: with SMTP id z5mr3244733wrl.267.1598026085697; 
 Fri, 21 Aug 2020 09:08:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJybqY1gGLQxCIOVCTy4zsJkdmERZpYNG0uZJ2XZkMC5DYJEPlK0QBmd9Ywe/7r5THwGFp64pg==
X-Received: by 2002:adf:df85:: with SMTP id z5mr3244718wrl.267.1598026085481; 
 Fri, 21 Aug 2020 09:08:05 -0700 (PDT)
Received: from localhost.localdomain (121.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.121])
 by smtp.gmail.com with ESMTPSA id v7sm5873634wmj.28.2020.08.21.09.08.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 09:08:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v3 2/2] meson: Do not consider qemu-keymap a 'tool'
Date: Fri, 21 Aug 2020 18:07:52 +0200
Message-Id: <20200821160752.1254102-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200821160752.1254102-1-philmd@redhat.com>
References: <20200821160752.1254102-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/21 04:55:47
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
X-List-Received-Date: Fri, 21 Aug 2020 16:08:11 -0000

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
v3: Rebased on Marc-André keymap patch

Paolo feel free to improve the subject if qemu-keymap is a tool :)
---
 meson.build    | 11 ++++++-----
 ui/meson.build |  2 +-
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/meson.build b/meson.build
index 808f50b07ef..dd8016c9da3 100644
--- a/meson.build
+++ b/meson.build
@@ -1062,6 +1062,12 @@ if 'CONFIG_GUEST_AGENT' in config_host
   subdir('qga')
 endif
 
+if 'CONFIG_XKBCOMMON' in config_host
+  # used for the update-keymaps target, so include rules even if !have_tools
+  qemu_keymap = executable('qemu-keymap', files('qemu-keymap.c', 'ui/input-keymap.c') + genh,
+                           dependencies: [qemuutil, xkbcommon], install: have_tools)
+endif
+
 if have_tools
   qemu_img = executable('qemu-img', [files('qemu-img.c'), hxdep],
              dependencies: [authz, block, crypto, io, qom, qemuutil], install: true)
@@ -1078,11 +1084,6 @@ if have_tools
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
index 6f74d30ea06..6bf398213f3 100644
--- a/ui/meson.build
+++ b/ui/meson.build
@@ -95,7 +95,7 @@ keymaps = [
   ['osx', 'qcode'],
 ]
 
-if have_system
+if have_system or have_tools
   foreach e : keymaps
     output = 'input-keymap-@0@-to-@1@.c.inc'.format(e[0], e[1])
     genh += custom_target(output,
-- 
2.26.2


