Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pgqXp-0002tT-53
	for mharc-qemu-trivial@gnu.org; Mon, 27 Mar 2023 13:22:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <casantos@redhat.com>)
 id 1pgqXn-0002tJ-4h
 for qemu-trivial@nongnu.org; Mon, 27 Mar 2023 13:22:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <casantos@redhat.com>)
 id 1pgqXl-00025k-Im
 for qemu-trivial@nongnu.org; Mon, 27 Mar 2023 13:22:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679937724;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=AYvkhTSkuOljNyDAJTHjUcD90OjB4ORw+krVEGstItw=;
 b=Mbs6gFo1zeiZu0dN+ikZ01f22Ad6B4tin7KiTfLxaYB4JI7nKNNGRDt2wY9i2fAblXvNji
 L3DXKG6MUrTcDKTFoRM/FF3PXh71HieSooPlbUsNZxA7O1rb64JCAgUnyqlFTXSl5UQM9R
 ADq0qNQ9IjlkuosN35hoyA6Mk6ywiLw=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-507-Mute0-i_PJS2fKor7c7mHQ-1; Mon, 27 Mar 2023 13:21:55 -0400
X-MC-Unique: Mute0-i_PJS2fKor7c7mHQ-1
Received: by mail-oo1-f72.google.com with SMTP id
 u16-20020a4ad0d0000000b005374bfedd1fso2172795oor.11
 for <qemu-trivial@nongnu.org>; Mon, 27 Mar 2023 10:21:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679937714;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AYvkhTSkuOljNyDAJTHjUcD90OjB4ORw+krVEGstItw=;
 b=sOyQEZ1ceSvRdTOhdKraCLtYb/3nX2U4BLXC2/R1Vlpgk+4JIRNZRyQZkCVxjpCKlc
 5N+ZX4cXeRm/6PwM/TamQItd9tAbJoDHlDVHCtls5pyqeTm5d2daWAtCaKdbtxFTqvBE
 Nni9j+4zvQilmahWwP5WRzIX3lXdnESNUrRfjUN/aY3CnRv8tAp61QdZRRpSQqwlYLaE
 4tMOktx2UpCmZtDl/+wO399Hz4oft8XWVSgJRuclMycwHy31SRYSdzl6pEyevZ7BCrYU
 58yu+zzG3eT+DMQtS/aB7WN/5w1qJILnxGhE+LvwGoLmgWwnrV7gAjxSGG+YuxDuptmI
 1+7Q==
X-Gm-Message-State: AO0yUKXCOufG95vD/ae46FUjzakK0DqrBJx+lkGATbJoqZGCIWuU9YZa
 Wis5P6uPeTB8CIMN5IDP+J6hfLNG1u7mO7//laM4L7P5k7zQ/5uVT/6vJG1YJHrduGorKJvIdOB
 DvABvnMTuyrUgd2fP8Q==
X-Received: by 2002:a9d:5e0a:0:b0:698:77ed:2bd3 with SMTP id
 d10-20020a9d5e0a000000b0069877ed2bd3mr5058613oti.28.1679937714752; 
 Mon, 27 Mar 2023 10:21:54 -0700 (PDT)
X-Google-Smtp-Source: AK7set84gUdKvqnKkzCm0mlgDPCk9/Ua2VJVobXrmBEtdAsQwjnfOnzC5RW6QBnRa/magra6z1Eulg==
X-Received: by 2002:a9d:5e0a:0:b0:698:77ed:2bd3 with SMTP id
 d10-20020a9d5e0a000000b0069877ed2bd3mr5058607oti.28.1679937714525; 
 Mon, 27 Mar 2023 10:21:54 -0700 (PDT)
Received: from casantos.remote.csb ([177.158.139.132])
 by smtp.gmail.com with ESMTPSA id
 e26-20020a05683013da00b0069df7242a08sm4339687otq.26.2023.03.27.10.21.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 10:21:54 -0700 (PDT)
From: casantos@redhat.com
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: Carlos Santos <casantos@redhat.com>
Subject: [PATCH V3] meson: install keyboard maps only if necessary
Date: Mon, 27 Mar 2023 14:21:47 -0300
Message-Id: <20230327172147.196607-1-casantos@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=casantos@redhat.com;
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
X-List-Received-Date: Mon, 27 Mar 2023 17:22:07 -0000

From: Carlos Santos <casantos@redhat.com>

They are required only for system emulation (i.e. have_system is true).

Signed-off-by: Carlos Santos <casantos@redhat.com>
---
Changes v1->v2:
  Remove stray --{enable,disable}-install-keymaps addition to scripts/meson-buildoptions.sh

Changes v2->v3:
  Reset submodules (synchronize to origin/master)
---
 pc-bios/keymaps/meson.build | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/pc-bios/keymaps/meson.build b/pc-bios/keymaps/meson.build
index 158a3b410c..bff3083313 100644
--- a/pc-bios/keymaps/meson.build
+++ b/pc-bios/keymaps/meson.build
@@ -47,7 +47,7 @@ if native_qemu_keymap.found()
                        build_by_default: true,
                        output: km,
                        command: [native_qemu_keymap, '-f', '@OUTPUT@', args.split()],
-                       install: true,
+                       install: have_system,
                        install_dir: qemu_datadir / 'keymaps')
   endforeach
 
@@ -56,4 +56,6 @@ else
   install_data(keymaps.keys(), install_dir: qemu_datadir / 'keymaps')
 endif
 
-install_data(['sl', 'sv'], install_dir: qemu_datadir / 'keymaps')
+if have_system
+  install_data(['sl', 'sv'], install_dir: qemu_datadir / 'keymaps')
+endif
-- 
2.31.1


