Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j9ehP-0006JD-G5
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2020 19:49:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36854)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j9ehM-0006D5-Q6
 for qemu-trivial@nongnu.org; Wed, 04 Mar 2020 19:49:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j9ehK-00034X-Pw
 for qemu-trivial@nongnu.org; Wed, 04 Mar 2020 19:49:12 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:58069
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j9ehK-00033n-Mk
 for qemu-trivial@nongnu.org; Wed, 04 Mar 2020 19:49:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583369350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PjETIBQNzsyZ+xRKKECdXFIBvuCR8b8nsZGdNL5G0cQ=;
 b=SGcIXsWFx38Rw9p3RdgS5rlMvU7HNrupyB2bOdVuXpsygYPuLUyCrVl6/1C0h27SunKwpO
 WhO5n4JfR/iBnUPrG4MabQrB/8QWe/sq2XL4/Fx5j0SWE6t44WuXVjfwauJjDRMtBD6RBQ
 8uiImk2mgo4UU5fk8zMIEJoCtsKx04s=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-R2TYC92FPouWQrVcqcyGmA-1; Wed, 04 Mar 2020 19:49:08 -0500
X-MC-Unique: R2TYC92FPouWQrVcqcyGmA-1
Received: by mail-wm1-f70.google.com with SMTP id c5so1440338wmd.8
 for <qemu-trivial@nongnu.org>; Wed, 04 Mar 2020 16:49:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ix/W8AfQRhp1de4p5m7tRDcjdb+HvfRtvsCyJ6jZ204=;
 b=mUU0gcNeogaJBAUz4G1Q02oCaj0Goixx9bY12E35JTICHLTMQQJhpqDEK0pgEjOBbm
 ptVR1pv6SX5Dp+FtQ2CGh0oDcurvrTWIL04VkZry0Z3XuPNAAh/KGDnRpkByeV6qsgTE
 5AcWGNhJYbYKTe1Om0U2q6407NgWGWctbIPcF3DUjbTnoxG0ta+4jhs5wvcMZhjYDT+X
 aOkSH5ql/SPgglx3O6Db7xZDShqAEHECZZotb+c8CRpfwSc/6JBei7mIB7K9vK3p0N+a
 eMAcT6VI/obbdY8pmwLbmMCPE5UfpC8ThnIiLhB44kv+EyZ7GPLyh3mGOS47DrAorrHa
 FGFA==
X-Gm-Message-State: ANhLgQ1dFWmdsN6zE9u/H/hSNRH8rvQ14Krc3I7dO+fAnHVEnOc2C++R
 Q+wKQbB9fyohj1LZ8Btib4VOLbaTRUNMDZwHzTlabuO4Ru3sOEzuOE8ftyeSIEjJQG7kPMKld7l
 irDYMQ3Yl6m28jaoWGQ==
X-Received: by 2002:adf:aa9e:: with SMTP id h30mr6965774wrc.288.1583369347613; 
 Wed, 04 Mar 2020 16:49:07 -0800 (PST)
X-Google-Smtp-Source: ADFU+vuXDgM4HSebXJGn832stjAWZU4tJW+9+FOFNtO829vUKDOFLVxkA8AQPdRL8cceKajnF7zyZg==
X-Received: by 2002:adf:aa9e:: with SMTP id h30mr6965754wrc.288.1583369347474; 
 Wed, 04 Mar 2020 16:49:07 -0800 (PST)
Received: from localhost.localdomain (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id w9sm3321715wrn.35.2020.03.04.16.49.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2020 16:49:07 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 2/2] Makefile: Let the 'help' target list the tools targets
Date: Thu,  5 Mar 2020 01:48:55 +0100
Message-Id: <20200305004855.9665-3-philmd@redhat.com>
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
 [fuzzy]
X-Received-From: 207.211.31.81
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
X-List-Received-Date: Thu, 05 Mar 2020 00:49:13 -0000

List the name of the tool targets when calling 'make help':

  $ make help
  [...]
  Tools targets:
    qemu-ga                        - Build qemu-ga tool
    qemu-keymap                    - Build qemu-keymap tool
    elf2dmp                        - Build elf2dmp tool
    ivshmem-client                 - Build ivshmem-client tool
    ivshmem-server                 - Build ivshmem-server tool
    qemu-nbd                       - Build qemu-nbd tool
    qemu-img                       - Build qemu-img tool
    qemu-io                        - Build qemu-io tool
    qemu-edid                      - Build qemu-edid tool
    fsdev/virtfs-proxy-helper      - Build virtfs-proxy-helper tool
    scsi/qemu-pr-helper            - Build qemu-pr-helper tool

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 Makefile | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Makefile b/Makefile
index a9ede4f428..4a1d3e2a79 100644
--- a/Makefile
+++ b/Makefile
@@ -1240,6 +1240,11 @@ endif
 =09=09$(foreach t, $(TARGET_DIRS), \
 =09=09$(call print-help-run,$(t)/all,Build for $(t));) \
 =09=09echo '')
+=09@$(if $(TOOLS), \
+=09=09echo 'Tools targets:'; \
+=09=09$(foreach t, $(TOOLS), \
+=09=09$(call print-help-run,$(t),Build $(shell basename $(t)) tool);) \
+=09=09echo '')
 =09@echo  'Cleaning targets:'
 =09$(call print-help,clean,Remove most generated files but keep the config=
)
 ifdef CONFIG_GCOV
--=20
2.21.1


