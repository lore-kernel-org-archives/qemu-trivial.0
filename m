Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jRZKk-0001BH-VL
	for mharc-qemu-trivial@gnu.org; Thu, 23 Apr 2020 06:43:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35172)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jRZKj-0001B4-3p
 for qemu-trivial@nongnu.org; Thu, 23 Apr 2020 06:43:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jRZKi-0004I2-IV
 for qemu-trivial@nongnu.org; Thu, 23 Apr 2020 06:43:52 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:40096
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jRZKi-0004Fy-2w
 for qemu-trivial@nongnu.org; Thu, 23 Apr 2020 06:43:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587638631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Bpp6hbr0UrVbS5RqMZ78rxToJ7J2eWO/p7gvEI7VzJc=;
 b=NVKWt3JXYIpG7CuFeN9P6qLosZJNRpqN7BgxeUAScjjNC7KFM2PanU0uwOWbjVzxnr5u/I
 cdro5N995UNV2mQj/5r+eJ917w34i80uVW8mfRPlAuOCLwUQF8wdXzOm3LQuEfb/GgiD6g
 Z5026miGTd0jJb26p06DKu0SctH/q9k=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-55-4mx_KtaMNZuSpWmrdVfm0Q-1; Thu, 23 Apr 2020 06:43:48 -0400
X-MC-Unique: 4mx_KtaMNZuSpWmrdVfm0Q-1
Received: by mail-wr1-f71.google.com with SMTP id r11so2636906wrx.21
 for <qemu-trivial@nongnu.org>; Thu, 23 Apr 2020 03:43:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F39B6Ts+xUlpDBnNeMGvV+UtHlMajEV3NxM0wy/7W20=;
 b=K1MLcBUvxtsXR3629GKB6axptUay14/vlxX+t4bjVyI8oW0qJSBHwMPDEbyzuHnu5Q
 Wf5ggmBQoCYeXkDJLMqOsLQ77LyCGjwTPBZal/m6uX1SSQEfswZt/CPr1LgqqZVh8YBd
 N4rqoqEXtv/5VSpuDB/jIGhrxYdzl2PgzSGo7w+A0xdNAF45p7lmFzmTrxNVCCfu8Dp4
 z2ya7wtoYXxZuohCDgjl+5aQXvbb/f478UVSdKoCl51Cvb8wOv6BBhCAeeWEwSU7k+fj
 6sSK4NlyRyJ07stu4OgkXlPDqH+ZhCdUf698CyGvrcoiglEsDJU9L8hFBlO9ujzjG8bj
 GwBg==
X-Gm-Message-State: AGi0PubmJ7EyvsLgyYnBtk+7B2cHLhr/BRGJ8i18HeTNOC0Rogj5QUDs
 2nsHlZ9dqeeuHAkp3mLvo8rV/nb9Rgn6xc4wzGQBjK2cVnBpHC6buXIihR96vA5270j2/X2tF14
 EWa0yauBbx11YGXsueQ==
X-Received: by 2002:adf:9168:: with SMTP id j95mr4040423wrj.145.1587638627050; 
 Thu, 23 Apr 2020 03:43:47 -0700 (PDT)
X-Google-Smtp-Source: APiQypKqwTXB0xEaJkfSGYJJALGGXeKDFeYOsXKnM28pqZDYAIUacM6QBH4017g4PLDPsPjcuZS25w==
X-Received: by 2002:adf:9168:: with SMTP id j95mr4040403wrj.145.1587638626843; 
 Thu, 23 Apr 2020 03:43:46 -0700 (PDT)
Received: from x1w.redhat.com (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id n9sm3127249wrx.61.2020.04.23.03.43.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2020 03:43:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH] Makefile: Let the 'help' target list the helper targets
Date: Thu, 23 Apr 2020 12:43:45 +0200
Message-Id: <20200423104345.5092-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/23 06:43:51
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Received-From: 207.211.31.120
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
X-List-Received-Date: Thu, 23 Apr 2020 10:43:53 -0000

List the name of the helper targets when calling 'make help',
along with the tool targets:

  $ make help
  [...]

  Helper targets:
    fsdev/virtfs-proxy-helper      - Build virtfs-proxy-helper
    scsi/qemu-pr-helper            - Build qemu-pr-helper
    qemu-bridge-helper             - Build qemu-bridge-helper
    vhost-user-gpu                 - Build vhost-user-gpu
    virtiofsd                      - Build virtiofsd

  Tools targets:
    qemu-ga                        - Build qemu-ga tool
    qemu-keymap                    - Build qemu-keymap tool
    elf2dmp                        - Build elf2dmp tool
    ivshmem-client                 - Build ivshmem-client tool
    ivshmem-server                 - Build ivshmem-server tool
    qemu-nbd                       - Build qemu-nbd tool
    qemu-storage-daemon            - Build qemu-storage-daemon tool
    qemu-img                       - Build qemu-img tool
    qemu-io                        - Build qemu-io tool
    qemu-edid                      - Build qemu-edid tool

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 configure | 5 +++--
 Makefile  | 9 +++++++--
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/configure b/configure
index 23b5e93752..caf880c38e 100755
--- a/configure
+++ b/configure
@@ -6374,7 +6374,7 @@ if test "$softmmu" =3D yes ; then
   if test "$linux" =3D yes; then
     if test "$virtfs" !=3D no && test "$cap_ng" =3D yes && test "$attr" =
=3D yes ; then
       virtfs=3Dyes
-      tools=3D"$tools fsdev/virtfs-proxy-helper\$(EXESUF)"
+      helpers=3D"$helpers fsdev/virtfs-proxy-helper\$(EXESUF)"
     else
       if test "$virtfs" =3D yes; then
         error_exit "VirtFS requires libcap-ng devel and libattr devel"
@@ -6389,7 +6389,7 @@ if test "$softmmu" =3D yes ; then
       fi
       mpath=3Dno
     fi
-    tools=3D"$tools scsi/qemu-pr-helper\$(EXESUF)"
+    helpers=3D"$helpers scsi/qemu-pr-helper\$(EXESUF)"
   else
     if test "$virtfs" =3D yes; then
       error_exit "VirtFS is supported only on Linux"
@@ -7630,6 +7630,7 @@ else
   QEMU_INCLUDES=3D"-iquote \$(SRC_PATH)/tcg/\$(ARCH) $QEMU_INCLUDES"
 fi
=20
+echo "HELPERS=3D$helpers" >> $config_host_mak
 echo "TOOLS=3D$tools" >> $config_host_mak
 echo "ROMS=3D$roms" >> $config_host_mak
 echo "MAKE=3D$make" >> $config_host_mak
diff --git a/Makefile b/Makefile
index 8a9113e666..021a0cd491 100644
--- a/Makefile
+++ b/Makefile
@@ -336,9 +336,9 @@ $(call set-vpath, $(SRC_PATH))
 LIBS+=3D-lz $(LIBS_TOOLS)
=20
 vhost-user-json-y =3D
-HELPERS-y =3D
+HELPERS-y =3D $(HELPERS)
=20
-HELPERS-$(call land,$(CONFIG_SOFTMMU),$(CONFIG_LINUX)) =3D qemu-bridge-hel=
per$(EXESUF)
+HELPERS-$(call land,$(CONFIG_SOFTMMU),$(CONFIG_LINUX)) +=3D qemu-bridge-he=
lper$(EXESUF)
=20
 ifeq ($(CONFIG_LINUX)$(CONFIG_VIRGL)$(CONFIG_GBM)$(CONFIG_TOOLS),yyyy)
 HELPERS-y +=3D vhost-user-gpu$(EXESUF)
@@ -1255,6 +1255,11 @@ endif
 =09=09$(foreach t, $(TARGET_DIRS), \
 =09=09$(call print-help-run,$(t)/all,Build for $(t));) \
 =09=09echo '')
+=09@$(if $(HELPERS-y), \
+=09=09echo 'Helper targets:'; \
+=09=09$(foreach t, $(HELPERS-y), \
+=09=09$(call print-help-run,$(t),Build $(shell basename $(t)));) \
+=09=09echo '')
 =09@$(if $(TOOLS), \
 =09=09echo 'Tools targets:'; \
 =09=09$(foreach t, $(TOOLS), \
--=20
2.21.1


