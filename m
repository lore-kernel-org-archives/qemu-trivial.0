Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j9ehK-000693-1K
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2020 19:49:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36815)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j9ehH-00065i-80
 for qemu-trivial@nongnu.org; Wed, 04 Mar 2020 19:49:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j9ehG-0002zN-3Z
 for qemu-trivial@nongnu.org; Wed, 04 Mar 2020 19:49:07 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:50511)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j9ehF-0002yq-Vk
 for qemu-trivial@nongnu.org; Wed, 04 Mar 2020 19:49:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583369345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r1/u9iZXVbyJdSt5JGwMZWiEEl8OjY1RWbys83kQVoQ=;
 b=EiurY1+04uDnrFT4Fve9hOY2SDNLeeuijthXhsHTdgyWluUBXPBJZHEw8x1mGB3p5WGOd9
 6VLQejXBBOIY8VbmkkZYeSw1BnEmdMnTMByoUgdRYzSsSIMj+Gu8B7l8wmzCHtg5uIh2MR
 c5l5oyZSEWGfORJ1N0MTK2ZdyL4H/ts=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-Mi_A8CWfO_yv_rALOTiEYA-1; Wed, 04 Mar 2020 19:49:03 -0500
X-MC-Unique: Mi_A8CWfO_yv_rALOTiEYA-1
Received: by mail-wr1-f71.google.com with SMTP id 72so1613491wrc.6
 for <qemu-trivial@nongnu.org>; Wed, 04 Mar 2020 16:49:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9cJi/qVXGYuD7j1Z1sfWwdwoowKBROLKn5uwHYNB34c=;
 b=YgdRlIljdpYJK8RqpTZdGUM4LWZP8pMjFS3cE7snFgkInzCYhDIlBTgLAyjx7cI8lG
 ReZvvpJr68sdGcwWLo6uyEs9CHvuHqqGuvf7PwdcZ80D3SRElS5XREEulVivyHq/vvjp
 g+onBeTBQ/YoFSMqxvFEMXcbLLgHT9F7QchxurCGP7LFPUXSZZTeEo0c+5MgOwjbieEA
 tuR9AKpEVGVr3F29WnptJN3aXKc3MtrFFNxR5qoxJzMTGteIc+xkK3XvLOoT48j0ULz5
 mAxX0tBvPqsjH3/vzvOSDSNfgC1NK10UnqtBoFJZLyAqnrNNbj0z4TnNQl3BhIVW6CyM
 46zg==
X-Gm-Message-State: ANhLgQ1Rh8OkrBykcLaVqPuKn/PHTQik8PfvINANYS6eLWJWJtip7iCp
 4tc0P8PvbcRB63pwexycXNDIQkWj4CUwH14SyO41Qa97JvLU+Zt5/mP14igJTWyMHBR2BafnLFz
 JVivTo+84FoEo4sYB9w==
X-Received: by 2002:a1c:4e03:: with SMTP id g3mr5989079wmh.22.1583369342574;
 Wed, 04 Mar 2020 16:49:02 -0800 (PST)
X-Google-Smtp-Source: ADFU+vtfaLza6tjpbZQ2CFPR9ze5EPsiwwV2hfbKUtQ0xS1aQmtJlTyRBWY/yTNEZCNjp+E65QoD4w==
X-Received: by 2002:a1c:4e03:: with SMTP id g3mr5989054wmh.22.1583369342319;
 Wed, 04 Mar 2020 16:49:02 -0800 (PST)
Received: from localhost.localdomain (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id r19sm6422422wmh.26.2020.03.04.16.49.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2020 16:49:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 1/2] Makefile: Align 'help' target output
Date: Thu,  5 Mar 2020 01:48:54 +0100
Message-Id: <20200305004855.9665-2-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200305004855.9665-1-philmd@redhat.com>
References: <20200305004855.9665-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
X-List-Received-Date: Thu, 05 Mar 2020 00:49:08 -0000

The 'help' target is displayed unaligned. Add a print-help
function and use it. Now if someone want to change the
indentation, there is a single place to modify.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 Makefile | 44 +++++++++++++++++++++++---------------------
 1 file changed, 23 insertions(+), 21 deletions(-)

diff --git a/Makefile b/Makefile
index aa9cc0b584..a9ede4f428 100644
--- a/Makefile
+++ b/Makefile
@@ -1220,50 +1220,52 @@ endif
 include $(SRC_PATH)/tests/docker/Makefile.include
 include $(SRC_PATH)/tests/vm/Makefile.include
=20
+print-help-run =3D printf "  %-30s - %s\\n" "$1" "$2"
+print-help =3D $(quiet-@)$(call print-help-run,$1,$2)
+
 .PHONY: help
 help:
 =09@echo  'Generic targets:'
-=09@echo  '  all             - Build all'
+=09$(call print-help,all,Build all)
 ifdef CONFIG_MODULES
-=09@echo  '  modules         - Build all modules'
+=09$(call print-help,modules,Build all modules)
 endif
-=09@echo  '  dir/file.o      - Build specified target only'
-=09@echo  '  install         - Install QEMU, documentation and tools'
-=09@echo  '  ctags/TAGS      - Generate tags file for editors'
-=09@echo  '  cscope          - Generate cscope index'
+=09$(call print-help,dir/file.o,Build specified target only)
+=09$(call print-help,install,Install QEMU, documentation and tools)
+=09$(call print-help,ctags/TAGS,Generate tags file for editors)
+=09$(call print-help,cscope,Generate cscope index)
 =09@echo  ''
 =09@$(if $(TARGET_DIRS), \
 =09=09echo 'Architecture specific targets:'; \
 =09=09$(foreach t, $(TARGET_DIRS), \
-=09=09printf "  %-30s - Build for %s\\n" $(t)/all $(t);) \
+=09=09$(call print-help-run,$(t)/all,Build for $(t));) \
 =09=09echo '')
 =09@echo  'Cleaning targets:'
-=09@echo  '  clean           - Remove most generated files but keep the co=
nfig'
+=09$(call print-help,clean,Remove most generated files but keep the config=
)
 ifdef CONFIG_GCOV
-=09@echo  '  clean-coverage  - Remove coverage files'
+=09$(call print-help,clean-coverage,Remove coverage files)
 endif
-=09@echo  '  distclean       - Remove all generated files'
-=09@echo  '  dist            - Build a distributable tarball'
+=09$(call print-help,distclean,Remove all generated files)
+=09$(call print-help,dist,Build a distributable tarball)
 =09@echo  ''
 =09@echo  'Test targets:'
-=09@echo  '  check           - Run all tests (check-help for details)'
-=09@echo  '  docker          - Help about targets running tests inside con=
tainers'
-=09@echo  '  vm-help         - Help about targets running tests inside VM'
+=09$(call print-help,check,Run all tests (check-help for details))
+=09$(call print-help,docker,Help about targets running tests inside contai=
ners)
+=09$(call print-help,vm-help,Help about targets running tests inside VM)
 =09@echo  ''
 =09@echo  'Documentation targets:'
-=09@echo  '  html info pdf txt'
-=09@echo  '                  - Build documentation in specified format'
+=09$(call print-help,html info pdf txt,Build documentation in specified fo=
rmat)
 ifdef CONFIG_GCOV
-=09@echo  '  coverage-report - Create code coverage report'
+=09$(call print-help,coverage-report,Create code coverage report)
 endif
 =09@echo  ''
 ifdef CONFIG_WIN32
 =09@echo  'Windows targets:'
-=09@echo  '  installer       - Build NSIS-based installer for QEMU'
+=09$(call print-help,installer,Build NSIS-based installer for QEMU)
 ifdef QEMU_GA_MSI_ENABLED
-=09@echo  '  msi             - Build MSI-based installer for qemu-ga'
+=09$(call print-help,msi,Build MSI-based installer for qemu-ga)
 endif
 =09@echo  ''
 endif
-=09@echo  '  $(MAKE) [targets]      (quiet build, default)'
-=09@echo  '  $(MAKE) V=3D1 [targets]  (verbose build)'
+=09$(call print-help,$(MAKE) [targets],(quiet build, default))
+=09$(call print-help,$(MAKE) V=3D1 [targets],(verbose build))
--=20
2.21.1


