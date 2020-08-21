Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k99aK-00010G-Ao
	for mharc-qemu-trivial@gnu.org; Fri, 21 Aug 2020 12:08:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k99aJ-0000yB-69
 for qemu-trivial@nongnu.org; Fri, 21 Aug 2020 12:08:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k99aH-0003ci-58
 for qemu-trivial@nongnu.org; Fri, 21 Aug 2020 12:08:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598026083;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RP5sPC0tUjDqZWFgnQ62rHS0udPhxfzeGhIvY/Ua/6Q=;
 b=eqRJs4zPDKZEFCRBEOGhP9tKiGO8uMI7VP5SkXml91Uj/cv+mYF5JqZF3gx1K7zsh75ZAm
 tVwitsm9n42HqHUfUN2lc6RcEFKbM1ulJKc2DxzprHWQUNkNmwOx/9Mpf9I4f23VSmShL0
 /gft/4ZnXHouX/lwJzKGK7BxPEMpbNo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-443-Tbop06qOOLKR-0PZDIV68Q-1; Fri, 21 Aug 2020 12:08:02 -0400
X-MC-Unique: Tbop06qOOLKR-0PZDIV68Q-1
Received: by mail-wm1-f69.google.com with SMTP id t26so971881wmn.4
 for <qemu-trivial@nongnu.org>; Fri, 21 Aug 2020 09:08:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RP5sPC0tUjDqZWFgnQ62rHS0udPhxfzeGhIvY/Ua/6Q=;
 b=CX5SboMRxLm95OiT296mHdoeERpPEKrOATGeQqoY+CMXZnOBjt7A2uvZQCJauOdr/D
 DKmV3J1J5rR7mEptRmEeiUkQjn4/9LdqvEgqmN9YndfUIzupny5iNdZy4UEYaXG35rrv
 z3cm8NBEps0L9IHUvE35K675TQirjVcN3soQ8ipxoWDtLexVVpU9gUodZz7HmgLms8BL
 0opNBh5KRTS7fk/1c528LqpPNExdeqW2eDImShKE3dNkP1LHVZyNUu9M+shbGFw0SaIm
 jPYFPQlxGSX9qKwx/MEfncJFCV4cEat2Qp2Yhtx1SYscpQ7XkKwbk/SGLNmAQpxs2xuX
 bwZQ==
X-Gm-Message-State: AOAM533B2tiFS4Pb145o4esFT9ZkjvczdIH/OtbOR6OE2Y4kEy6XiY6v
 husBR/YLANcWvb+G3yOgRRUfgkhx/8rFLzT+zn4PkN1MXuYxuc0p0Plo7CN5cwJTGD8vL9R2Vpv
 p0MqqbHpfy7/TSc1kUQ==
X-Received: by 2002:a1c:e302:: with SMTP id a2mr4670014wmh.110.1598026080797; 
 Fri, 21 Aug 2020 09:08:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyA2Oc5bGbW3zMjp5IOoRtpgyX0fmAw7kXwa+aFRtjvEJu1oqMVaVvblfjqWUK2YGxaFfdq+g==
X-Received: by 2002:a1c:e302:: with SMTP id a2mr4669994wmh.110.1598026080577; 
 Fri, 21 Aug 2020 09:08:00 -0700 (PDT)
Received: from localhost.localdomain (121.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.121])
 by smtp.gmail.com with ESMTPSA id z207sm7143815wmc.2.2020.08.21.09.07.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 09:07:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v3 1/2] meson: convert pc-bios/keymaps/Makefile
Date: Fri, 21 Aug 2020 18:07:51 +0200
Message-Id: <20200821160752.1254102-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200821160752.1254102-1-philmd@redhat.com>
References: <20200821160752.1254102-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/21 04:26:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 21 Aug 2020 16:08:07 -0000

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 Makefile                    |  8 ------
 pc-bios/keymaps/Makefile    | 56 -------------------------------------
 pc-bios/keymaps/meson.build | 56 +++++++++++++++++++++++++++++++++++++
 pc-bios/meson.build         |  1 +
 4 files changed, 57 insertions(+), 64 deletions(-)
 delete mode 100644 pc-bios/keymaps/Makefile
 create mode 100644 pc-bios/keymaps/meson.build

diff --git a/Makefile b/Makefile
index 8373ddccc93..ef28ce0361d 100644
--- a/Makefile
+++ b/Makefile
@@ -229,11 +229,6 @@ distclean: clean ninja-distclean
 	rm -f linux-headers/asm
 	rm -Rf .sdk
 
-KEYMAPS=da     en-gb  et  fr     fr-ch  is  lt  no  pt-br  sv \
-ar      de     en-us  fi  fr-be  hr     it  lv  nl         pl  ru     th \
-de-ch  es     fo  fr-ca  hu     ja  mk  pt  sl     tr \
-bepo    cz
-
 ifdef INSTALL_BLOBS
 BLOBS=bios.bin bios-256k.bin bios-microvm.bin sgabios.bin vgabios.bin vgabios-cirrus.bin \
 vgabios-stdvga.bin vgabios-vmware.bin vgabios-qxl.bin vgabios-virtio.bin \
@@ -298,9 +293,6 @@ endif
 	$(INSTALL_DATA) $(SRC_PATH)/ui/qemu.desktop \
 		"$(DESTDIR)$(qemu_desktopdir)/qemu.desktop"
 	$(INSTALL_DIR) "$(DESTDIR)$(qemu_datadir)/keymaps"
-	set -e; for x in $(KEYMAPS); do \
-		$(INSTALL_DATA) $(SRC_PATH)/pc-bios/keymaps/$$x "$(DESTDIR)$(qemu_datadir)/keymaps"; \
-	done
 
 ifdef CONFIG_WIN32
 
diff --git a/pc-bios/keymaps/Makefile b/pc-bios/keymaps/Makefile
deleted file mode 100644
index 76217b06896..00000000000
--- a/pc-bios/keymaps/Makefile
+++ /dev/null
@@ -1,56 +0,0 @@
-
-KEYMAP	:= $(shell which qemu-keymap 2>/dev/null)
-
-MAPS	:= ar bepo cz da de de-ch en-us en-gb es et fi fo \
-	   fr fr-be fr-ca fr-ch \
-	   hr hu is it ja lt lv mk nl no pl pt pt-br ru th tr
-
-ar	: MAP_FLAGS :=	-l ar
-bepo	: MAP_FLAGS :=	-l fr -v dvorak
-cz	: MAP_FLAGS :=	-l cz
-da	: MAP_FLAGS :=	-l dk
-de	: MAP_FLAGS :=	-l de -v nodeadkeys
-de-ch	: MAP_FLAGS :=	-l ch
-en-us	: MAP_FLAGS :=	-l us
-en-gb	: MAP_FLAGS :=	-l gb
-es	: MAP_FLAGS :=	-l es
-et	: MAP_FLAGS :=	-l et
-fi	: MAP_FLAGS :=	-l fi
-fo	: MAP_FLAGS :=	-l fo
-fr	: MAP_FLAGS :=	-l fr -v nodeadkeys
-fr-be	: MAP_FLAGS :=	-l be
-fr-ca	: MAP_FLAGS :=	-l ca -v fr
-fr-ch	: MAP_FLAGS :=	-l ch -v fr
-hr	: MAP_FLAGS :=	-l hr
-hu	: MAP_FLAGS :=	-l hu
-is	: MAP_FLAGS :=	-l is
-it	: MAP_FLAGS :=	-l it
-ja	: MAP_FLAGS :=	-l jp -m jp106
-lt	: MAP_FLAGS :=	-l lt
-lv	: MAP_FLAGS :=	-l lv
-mk	: MAP_FLAGS :=	-l mk
-nl	: MAP_FLAGS :=	-l nl
-no	: MAP_FLAGS :=	-l no
-pl	: MAP_FLAGS :=	-l pl
-pt	: MAP_FLAGS :=	-l pt
-pt-br	: MAP_FLAGS :=	-l br
-ru	: MAP_FLAGS :=	-l ru
-th	: MAP_FLAGS :=	-l th
-tr	: MAP_FLAGS :=	-l tr
-
-ifeq ($(KEYMAP),)
-
-all:
-	@echo "nothing to do (qemu-keymap not found)"
-
-else
-
-all: $(MAPS)
-
-clean:
-	rm -f $(MAPS)
-
-$(MAPS): $(KEYMAP) Makefile
-	$(KEYMAP) -f $@ $(MAP_FLAGS)
-
-endif
diff --git a/pc-bios/keymaps/meson.build b/pc-bios/keymaps/meson.build
new file mode 100644
index 00000000000..06fc79b9b3f
--- /dev/null
+++ b/pc-bios/keymaps/meson.build
@@ -0,0 +1,56 @@
+keymaps = {
+  'ar': '-l ar',
+  'bepo': '-l fr -v dvorak',
+  'cz': '-l cz',
+  'da': '-l dk',
+  'de': '-l de -v nodeadkeys',
+  'de-ch': '-l ch',
+  'en-gb': '-l us',
+  'en-us': '-l gb',
+  'es': '-l es',
+  'et': '-l et',
+  'fi': '-l fi',
+  'fo': '-l fo',
+  'fr': '-l fr -v nodeadkeys',
+  'fr-be': '-l be',
+  'fr-ca': '-l ca -v fr',
+  'fr-ch': '-l ch -v fr',
+  'hr': '-l hr',
+  'hu': '-l hu',
+  'is': '-l is',
+  'it': '-l it',
+  'ja': '-l jp -m jp106',
+  'lt': '-l lt',
+  'lv': '-l lv',
+  'mk': '-l mk',
+  'nl': '-l nl',
+  'no': '-l no',
+  'pl': '-l pl',
+  'pt': '-l pt',
+  'pt-br': '-l br',
+  'ru': '-l ru',
+  'sl': '',
+  'sv': '',
+  'th': '-l th',
+  'tr': '-l tr',
+}
+
+if meson.is_cross_build() or 'CONFIG_XKBCOMMON' in config_host
+  native_qemu_keymap = find_program('qemu-keymap', required: false, disabler: true)
+else
+  native_qemu_keymap = qemu_keymap
+endif
+t = []
+foreach km, args: keymaps
+  t += custom_target(km,
+                     build_by_default: true,
+                     output: km,
+                     command: [native_qemu_keymap, '-f', '@OUTPUT@', args.split()],
+                     install_dir: config_host['qemu_datadir'] / 'keymaps')
+endforeach
+if t.length() > 0
+  alias_target('update-keymaps', t)
+else
+  # install from the source tree
+  install_data(keymaps.keys(), install_dir: config_host['qemu_datadir'] / 'keymaps')
+endif
diff --git a/pc-bios/meson.build b/pc-bios/meson.build
index 6e3bfe3ca4e..b6389f5148d 100644
--- a/pc-bios/meson.build
+++ b/pc-bios/meson.build
@@ -25,3 +25,4 @@ if 'DECOMPRESS_EDK2_BLOBS' in config_host
 endif
 
 subdir('descriptors')
+subdir('keymaps')
-- 
2.26.2


