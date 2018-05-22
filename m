Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fLCnF-0000jX-9i
	for mharc-qemu-trivial@gnu.org; Tue, 22 May 2018 15:17:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57967)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1fLCnC-0000gi-6q
	for qemu-trivial@nongnu.org; Tue, 22 May 2018 15:17:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1fLCnB-0002FW-BC
	for qemu-trivial@nongnu.org; Tue, 22 May 2018 15:17:54 -0400
Received: from mail-pl0-x22b.google.com ([2607:f8b0:400e:c01::22b]:32807)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
	id 1fLCn4-0002Az-9n; Tue, 22 May 2018 15:17:46 -0400
Received: by mail-pl0-x22b.google.com with SMTP id n10-v6so11476995plp.0;
	Tue, 22 May 2018 12:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=VqdE+j2PEF9zEvybUhQrlXHDqOPV7i8p/UUJDo5XFUw=;
	b=bgLVgfBLyX4eZWEuuGDY8CIrFyD3SagkIid5Wwb9+wlcLIckHoGr+viQHeu0+r7V6K
	MH4n9HV+TltCbMgAjQnr8kVeywkJaJlV0zKBhUyRokDUtqTQ0T6m1CTaZtO2sBBN3ck2
	mWPJCYF7O46plYnP12/x8b3wpm9D96UI3Y88zeqIW3rjg6pzEMSqCdhFOzR9O+VH9Boy
	1iZYwtit4yz21cxRjzbBK68fH8RonFHF47+Ud8HGCkrU9ooV2jc19v1iWWBwplbJ6e/g
	gGeD2Nq4Vk6jiP5qjC0qaGtzRIqdug6GFp78Vxko6b58twqbU4WX9ZAS0km6WY59rwFM
	CnPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=VqdE+j2PEF9zEvybUhQrlXHDqOPV7i8p/UUJDo5XFUw=;
	b=jgxluaHTN+8GxfvAazv7BXQrdz7/+0CXBHxMhxXg6r6fuZJaOrBZJyJHU0Z44SGVC9
	T1Z/aCRG+GMzZqugYh7GcjMxAUm4GKvuIxxlvNQR9fTULh28o55Fz3SN2lCIrNtBPfJn
	EMlWPZDyxQgswqgzqeB4mGg24LAmRHUezv21djN1nEd3X0I0kk1g27NmIQ0Ts1W3tUCi
	qawENt5pCYimNpdERN7P3l+I+X/S0Y31BEdqfhGcStp93bxV3/D8+sqV4xwsV1qiqNs5
	VWJrA3AHqnJCuZ5dz3ebeGQqTpshMps9BLMKhJmL5mvOvpdBdplqqK5xyzWy3Z0uZA/b
	pOJQ==
X-Gm-Message-State: ALKqPwcJF2C1ite2dv041teO0XjtAq3VqC7MN9EKAtfKcVoky07qdajL
	ySSNh3XzUVJoZb0M8T4/Qb3UjmL4
X-Google-Smtp-Source: AB8JxZqqKJjyb85Vmm8OGiCTU0kdDihAX+NYeYXh6aRQoMhHgqkX79qYUB+iI/TPQ07l7L/CikImaw==
X-Received: by 2002:a17:902:74c7:: with SMTP id
	f7-v6mr47787plt.385.1527016664741; 
	Tue, 22 May 2018 12:17:44 -0700 (PDT)
Received: from donizetti.event.priv ([72.28.93.232])
	by smtp.gmail.com with ESMTPSA id
	n5-v6sm27094617pff.134.2018.05.22.12.17.43
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 22 May 2018 12:17:44 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	qemu-trivial@nongnu.org
Date: Tue, 22 May 2018 21:17:43 +0200
Message-Id: <20180522191743.12872-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.17.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::22b
Subject: [Qemu-trivial] [PATCH] ppc: move at24c to its own CONFIG_ symbol
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 22 May 2018 19:17:55 -0000

AT24c EEPROM is currently gated by CONFIG_I2C, and as such it is
being included in all emulators that use I2C, even if they do not
really need it.  Separate it and, since it was added for the e500
machines, add it to qemu-system-ppc and qemu-system-ppc64.
---
 default-configs/ppc-softmmu.mak | 1 +
 hw/nvram/Makefile.objs          | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/default-configs/ppc-softmmu.mak b/default-configs/ppc-softmmu.mak
index 4d7be45ac5..c57e568121 100644
--- a/default-configs/ppc-softmmu.mak
+++ b/default-configs/ppc-softmmu.mak
@@ -26,6 +26,7 @@ CONFIG_USB_EHCI_SYSBUS=y
 CONFIG_SM501=y
 CONFIG_IDE_SII3112=y
 CONFIG_I2C=y
+CONFIG_AT24C=y
 
 # For Macs
 CONFIG_MAC=y
diff --git a/hw/nvram/Makefile.objs b/hw/nvram/Makefile.objs
index a912d25391..b318e53a43 100644
--- a/hw/nvram/Makefile.objs
+++ b/hw/nvram/Makefile.objs
@@ -1,6 +1,6 @@
 common-obj-$(CONFIG_DS1225Y) += ds1225y.o
 common-obj-y += eeprom93xx.o
-common-obj-$(CONFIG_I2C) += eeprom_at24c.o
+common-obj-$(CONFIG_AT24C) += eeprom_at24c.o
 common-obj-y += fw_cfg.o
 common-obj-y += chrp_nvram.o
 common-obj-$(CONFIG_MAC_NVRAM) += mac_nvram.o
-- 
2.17.0


