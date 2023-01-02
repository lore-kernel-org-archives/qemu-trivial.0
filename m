Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pCNcJ-0001qq-LF
	for mharc-qemu-trivial@gnu.org; Mon, 02 Jan 2023 11:24:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <casantos@redhat.com>)
 id 1pCNXx-0008KX-MZ
 for qemu-trivial@nongnu.org; Mon, 02 Jan 2023 11:20:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <casantos@redhat.com>)
 id 1pCNXv-0008BS-QY
 for qemu-trivial@nongnu.org; Mon, 02 Jan 2023 11:20:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672676418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=CdAO3V5czTy0X88W7hYG5g3peA7hf+xDXphD1iqfGHM=;
 b=dvhlAJi0yk7j8W9XYS7RWvUW//i9NgOJHx78YRwWkqeDegtuKV9H2t4N+80wSHm67k+hHD
 TZoo/VKzKPToxjv+ydEEewN5qhzfLxvfDslq9Flm36SRhoRuDTZJ6KOVwHA+AVM9Fg8Ona
 8BbmiuMjrGw2fbOXmg1mZMjCKB+KRNE=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-107-vAiLNaPfObKuuxblVoIrZg-1; Mon, 02 Jan 2023 11:19:12 -0500
X-MC-Unique: vAiLNaPfObKuuxblVoIrZg-1
Received: by mail-ot1-f70.google.com with SMTP id
 by2-20020a056830608200b00683e3e829d5so10479963otb.17
 for <qemu-trivial@nongnu.org>; Mon, 02 Jan 2023 08:19:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CdAO3V5czTy0X88W7hYG5g3peA7hf+xDXphD1iqfGHM=;
 b=spqPMxYxMCsTnp/Myx+9WA8caeWqRGc6FRUdnaJLJNO+Zpwg+JLlttk+zXKFHAarnK
 GXdOk8kvigPheh1De0D6M/RxOEael7xv5snNcLLK1N+hsIqeHxurRUEf5kIvk1Nf8KHB
 OAqCuTQMT91OCuIGzjvTGcs2AdsDrYwpQAbqUu5oouCClQv0k1sT5oWH0igf3bJiu5ff
 2Qy0ZmStcN5yJ7T1Ske8SidXT4OSz8gKCvB6V+ddGwEcUrmOB2GWWaqz1FYYIu8G10Vx
 zlPWPmQqwjn2OeOFAKVzI6UtMR/Js1bS7bGv7GTZ4zcGHQZXe/1UyWJjNbuiSPkqs8l4
 31OA==
X-Gm-Message-State: AFqh2kpGUk0I1jR6QYQmS2JzQnYcsFC6kA0YRu3/vMb2mPlKoGz1+vrD
 rrBVAq4uZOJc+NVQQAXMqTtpGBfUS4zje/F2yUugLj0pxEOXwGTwGGo4KhN57VHO7IdZPQqsPpS
 enQ6943xqBiXC0Q/8/g==
X-Received: by 2002:a05:6870:ed4e:b0:144:c097:dc14 with SMTP id
 ex14-20020a056870ed4e00b00144c097dc14mr19911105oab.4.1672676352133; 
 Mon, 02 Jan 2023 08:19:12 -0800 (PST)
X-Google-Smtp-Source: AMrXdXul5p/kJRS2oQvbLM3fVX2Sa29GUMBG9x2mKKR5G87wP85+VsqoJlyIypXcus02BNGpMEQHzQ==
X-Received: by 2002:a05:6870:ed4e:b0:144:c097:dc14 with SMTP id
 ex14-20020a056870ed4e00b00144c097dc14mr19911098oab.4.1672676351871; 
 Mon, 02 Jan 2023 08:19:11 -0800 (PST)
Received: from casantos.remote.csb ([179.181.73.41])
 by smtp.gmail.com with ESMTPSA id
 cy4-20020a056870b68400b0013bc40b09dasm13086446oab.17.2023.01.02.08.19.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jan 2023 08:19:11 -0800 (PST)
From: casantos@redhat.com
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Carlos Santos <casantos@redhat.com>
Subject: [PATCH] meson: allow disablind the installation of keymaps
Date: Mon,  2 Jan 2023 13:19:03 -0300
Message-Id: <20230102161903.3857354-1-casantos@redhat.com>
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 02 Jan 2023 11:24:50 -0500
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
X-List-Received-Date: Mon, 02 Jan 2023 16:20:21 -0000

From: Carlos Santos <casantos@redhat.com>

There are situatuions in which the keyboard maps are not necessary (e.g.
when building only tools or linux-user emulator). Add an option to avoid
installing them, as already possible to do with firmware blobs.

Signed-off-by: Carlos Santos <casantos@redhat.com>
---
 configure                     | 2 ++
 meson_options.txt             | 2 ++
 pc-bios/keymaps/meson.build   | 6 ++++--
 scripts/meson-buildoptions.sh | 4 ++++
 4 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 789a4f6cc9..c6ed6a23d0 100755
--- a/configure
+++ b/configure
@@ -889,6 +889,8 @@ for opt do
   ;;
   --disable-blobs) meson_option_parse --disable-install-blobs ""
   ;;
+  --disable-keymaps) meson_option_parse --disable-install-keymaps ""
+  ;;
   --enable-vfio-user-server) vfio_user_server="enabled"
   ;;
   --disable-vfio-user-server) vfio_user_server="disabled"
diff --git a/meson_options.txt b/meson_options.txt
index 559a571b6b..be27137e98 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -48,6 +48,8 @@ option('module_upgrades', type : 'boolean', value : false,
        description: 'try to load modules from alternate paths for upgrades')
 option('install_blobs', type : 'boolean', value : true,
        description: 'install provided firmware blobs')
+option('install_keymaps', type : 'boolean', value : true,
+       description: 'install provided keyboard maps')
 option('sparse', type : 'feature', value : 'auto',
        description: 'sparse checker')
 option('guest_agent', type : 'feature', value : 'auto',
diff --git a/pc-bios/keymaps/meson.build b/pc-bios/keymaps/meson.build
index 06c75e646b..7d80c23005 100644
--- a/pc-bios/keymaps/meson.build
+++ b/pc-bios/keymaps/meson.build
@@ -47,7 +47,7 @@ if native_qemu_keymap.found()
                        build_by_default: true,
                        output: km,
                        command: [native_qemu_keymap, '-f', '@OUTPUT@', args.split()],
-                       install: true,
+                       install: get_option('install_keymaps'),
                        install_dir: qemu_datadir / 'keymaps')
   endforeach
 
@@ -56,4 +56,6 @@ else
   install_data(keymaps.keys(), install_dir: qemu_datadir / 'keymaps')
 endif
 
-install_data(['sl', 'sv'], install_dir: qemu_datadir / 'keymaps')
+if get_option('install_keymaps')
+  install_data(['sl', 'sv'], install_dir: qemu_datadir / 'keymaps')
+endif
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index aa6e30ea91..f17d9c196e 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -11,6 +11,8 @@ meson_options_help() {
   printf "%s\n" '  --datadir=VALUE          Data file directory [share]'
   printf "%s\n" '  --disable-coroutine-pool coroutine freelist (better performance)'
   printf "%s\n" '  --disable-install-blobs  install provided firmware blobs'
+  printf "%s\n" '  --disable-install-keymaps'
+  printf "%s\n" '                           install provided keyboard maps'
   printf "%s\n" '  --docdir=VALUE           Base directory for documentation installation'
   printf "%s\n" '                           (can be empty) [share/doc]'
   printf "%s\n" '  --enable-block-drv-whitelist-in-tools'
@@ -291,6 +293,8 @@ _meson_option_parse() {
     --includedir=*) quote_sh "-Dincludedir=$2" ;;
     --enable-install-blobs) printf "%s" -Dinstall_blobs=true ;;
     --disable-install-blobs) printf "%s" -Dinstall_blobs=false ;;
+    --enable-install-keymaps) printf "%s" -Dinstall_keymaps=true ;;
+    --disable-install-keymaps) printf "%s" -Dinstall_keymaps=false ;;
     --interp-prefix=*) quote_sh "-Dinterp_prefix=$2" ;;
     --enable-jack) printf "%s" -Djack=enabled ;;
     --disable-jack) printf "%s" -Djack=disabled ;;
-- 
2.31.1


