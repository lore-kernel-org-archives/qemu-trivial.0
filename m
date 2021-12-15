Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mxPai-0005MR-1D
	for mharc-qemu-trivial@gnu.org; Wed, 15 Dec 2021 03:24:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mxPad-0005Jr-18
 for qemu-trivial@nongnu.org; Wed, 15 Dec 2021 03:24:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mxPaS-0003AY-Ac
 for qemu-trivial@nongnu.org; Wed, 15 Dec 2021 03:24:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639556669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=p07RHNvWzcBrZLANCifZrsrSFZCVpN3ffkhLC49rsmk=;
 b=J6rlVBopKpKI4ibq/zxcVrrSdPFWfqw7GOERsVcU7jUfSv+GE3i3a9vISmSieWmnPVDIDz
 Sxwf+U3DUegFYAILEOL78LPM34VEPD5lzshPW/trdWI9WYXKtu1cJpcG57I1yZBETRqgLV
 EedH9B49kNhsjVvGhh+s15APmuapOrw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-124-dm6_btJrOti4zJOz2HuW9g-1; Wed, 15 Dec 2021 03:24:28 -0500
X-MC-Unique: dm6_btJrOti4zJOz2HuW9g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 86FF439391;
 Wed, 15 Dec 2021 08:24:27 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C325F2AA9D;
 Wed, 15 Dec 2021 08:24:18 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 libvir-list@redhat.com, Gerd Hoffmann <kraxel@redhat.com>,
 John Snow <jsnow@redhat.com>
Subject: [PATCH] qemu-options: Remove the deprecated -no-quit option
Date: Wed, 15 Dec 2021 09:24:17 +0100
Message-Id: <20211215082417.180735-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 15 Dec 2021 08:24:43 -0000

This option was just a wrapper around the -display ...,window-close=off
parameter, and the name "no-quit" is rather confusing compared to
"window-close" (since there are still other means to quit the emulator),
so let's remove this now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/about/deprecated.rst       | 6 ------
 docs/about/removed-features.rst | 7 +++++++
 qemu-options.hx                 | 8 --------
 softmmu/vl.c                    | 8 +-------
 4 files changed, 8 insertions(+), 21 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 7f12f53713..6f85afdee4 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -134,12 +134,6 @@ specified.
 Use ``-display sdl,window-close=...`` instead (i.e. with a minus instead of
 an underscore between "window" and "close").
 
-``-no-quit`` (since 6.1)
-''''''''''''''''''''''''
-
-The ``-no-quit`` is a synonym for ``-display ...,window-close=off`` which
-should be used instead.
-
 ``-alt-grab`` and ``-display sdl,alt_grab=on`` (since 6.2)
 ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
 
diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
index f92b8bd738..380a1b30ea 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -330,6 +330,13 @@ RISC-V firmware not booted by default (removed in 5.1)
 QEMU 5.1 changes the default behaviour from ``-bios none`` to ``-bios default``
 for the RISC-V ``virt`` machine and ``sifive_u`` machine.
 
+``-no-quit`` (removed in 7.0)
+'''''''''''''''''''''''''''''
+
+The ``-no-quit`` was a synonym for ``-display ...,window-close=off`` which
+should be used instead.
+
+
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
 
diff --git a/qemu-options.hx b/qemu-options.hx
index ae2c6dbbfc..e2b73f6e5d 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2002,14 +2002,6 @@ SRST
     ``-display sdl,grab-mod=rctrl`` instead.
 ERST
 
-DEF("no-quit", 0, QEMU_OPTION_no_quit,
-    "-no-quit        disable SDL/GTK window close capability (deprecated)\n", QEMU_ARCH_ALL)
-SRST
-``-no-quit``
-    Disable window close capability (SDL and GTK only). This option is
-    deprecated, please use ``-display ...,window-close=off`` instead.
-ERST
-
 DEF("sdl", 0, QEMU_OPTION_sdl,
     "-sdl            shorthand for -display sdl\n", QEMU_ARCH_ALL)
 SRST
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 620a1f1367..163ab355f5 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -1938,7 +1938,7 @@ static void qemu_create_early_backends(void)
                      "for SDL, ignoring option");
     }
     if (dpy.has_window_close && !use_gtk && !use_sdl) {
-        error_report("-no-quit is only valid for GTK and SDL, "
+        error_report("window-close is only valid for GTK and SDL, "
                      "ignoring option");
     }
 
@@ -3298,12 +3298,6 @@ void qemu_init(int argc, char **argv, char **envp)
                 warn_report("-ctrl-grab is deprecated, please use "
                             "-display sdl,grab-mod=rctrl instead.");
                 break;
-            case QEMU_OPTION_no_quit:
-                dpy.has_window_close = true;
-                dpy.window_close = false;
-                warn_report("-no-quit is deprecated, please use "
-                            "-display ...,window-close=off instead.");
-                break;
             case QEMU_OPTION_sdl:
                 warn_report("-sdl is deprecated, use -display sdl instead.");
 #ifdef CONFIG_SDL
-- 
2.27.0


