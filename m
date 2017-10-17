Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4V1W-0003IT-0j
	for mharc-qemu-trivial@gnu.org; Tue, 17 Oct 2017 12:47:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47751)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V1U-0003GK-0c
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:47:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V1T-0003xj-7W
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:47:20 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:55442)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V1O-0003ul-9U; Tue, 17 Oct 2017 12:47:14 -0400
Received: by mail-qt0-x244.google.com with SMTP id v41so4894920qtv.12;
	Tue, 17 Oct 2017 09:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=DjXa8d7nZQ+LPbYXAYNYSU/ZU6klNBQavp02xYS+Sx8=;
	b=ZSGh+s7vB9kQ7WXNfb2WCZEkOBSSX96fFyQew7jl0Xup56omK0mn1TbTuPRTPTBxAT
	2h8h3epct0A4dYNnSPSvODVZVxw00SI8s/vj/vMFzgju/IVx78SzfArzqg9V6GSoyQNk
	KvJv+gEje+pJBrNrqIGVxdh/yzZ0AUG8T3z3cVRsilgjIij2JryFg15NYM4J6P8ZsWxC
	vSPHXVZpRVHZ9YlKBPaOFG1cISqCqD9/mppt2pQJPY3oEJZcf4/SWClZXhRX9YOyTJjm
	1rHwsAEUmR8HOOWmTTdov+5k5EXVgWeKob9q1L9uyGmoW6oZm7JPC1S14Kqh6u/f5hCG
	blCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=DjXa8d7nZQ+LPbYXAYNYSU/ZU6klNBQavp02xYS+Sx8=;
	b=HAO1gkka5O6uDpsEEmreHBNZIBu6svBhaNeDOejW/eR+IH11V5zO/qquOQWW0z8q27
	HD1ooRHm2QpYTYSAf+mfnDaX/cy0ntQSju7uDCDeMi+ZSCUsQQhf6QI6s9bYZls/zzfl
	svtjv5Zpd7sXtzcu86W1RJdp5pVzQpaNRpqeg3C8OUpdTgzly5kwVSEWE6uST2Q96swX
	Iz5PVhK8VytJ/Xve4fIqGQBraWXVKk3N5PW1pjkewROqa4/mH5qMNPZPQA5jJ2FITb1p
	LvicVYv2w6yNdPL5OBXT/dDOU/S2a4tbKgRLqQ3B/t8IuM/WiYl9yk9hIIbhUXzdqU5N
	uSxA==
X-Gm-Message-State: AMCzsaWjw8XFp9Zz5InYxeTMICLa96A6IrhutUDe2bDtjVSV4pt31O3p
	y1U+XLSUyMbqRyoqjr19Ve8=
X-Google-Smtp-Source: AOwi7QBp9DaR0AadGdL7Ico6sTWkZj8ZOKluuzYhxCm5w9+wiOu9RW7tj/O1IFP3vUPG4kT6jvnN2w==
X-Received: by 10.200.44.203 with SMTP id 11mr19364351qtx.194.1508258833784;
	Tue, 17 Oct 2017 09:47:13 -0700 (PDT)
Received: from x1.local ([181.93.89.178]) by smtp.gmail.com with ESMTPSA id
	q49sm6687653qtq.80.2017.10.17.09.47.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Oct 2017 09:47:13 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Tue, 17 Oct 2017 13:44:25 -0300
Message-Id: <20171017164426.25277-42-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc0
In-Reply-To: <20171017164426.25277-1-f4bug@amsat.org>
References: <20171017164426.25277-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [PATCH v3 41/42] i386/pc: move vmmouse.c to hw/i386/
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
X-List-Received-Date: Tue, 17 Oct 2017 16:47:21 -0000

It's a x86-only device, so it does not make sense to keep it
in the shared misc folder.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/{input => i386}/vmmouse.c | 0
 hw/i386/Makefile.objs        | 1 +
 hw/input/Makefile.objs       | 1 -
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename hw/{input => i386}/vmmouse.c (100%)

diff --git a/hw/input/vmmouse.c b/hw/i386/vmmouse.c
similarity index 100%
rename from hw/input/vmmouse.c
rename to hw/i386/vmmouse.c
diff --git a/hw/i386/Makefile.objs b/hw/i386/Makefile.objs
index 64a461c929..e15f26291e 100644
--- a/hw/i386/Makefile.objs
+++ b/hw/i386/Makefile.objs
@@ -6,6 +6,7 @@ obj-y += x86-iommu.o intel_iommu.o
 obj-y += amd_iommu.o
 obj-$(CONFIG_XEN) += ../xenpv/ xen/
 obj-$(CONFIG_VMPORT) += vmport.o
+obj-$(CONFIG_VMMOUSE) += vmmouse.o
 
 obj-y += kvmvapic.o
 obj-y += acpi-build.o
diff --git a/hw/input/Makefile.objs b/hw/input/Makefile.objs
index 7715d7230d..636f794b6b 100644
--- a/hw/input/Makefile.objs
+++ b/hw/input/Makefile.objs
@@ -6,7 +6,6 @@ common-obj-$(CONFIG_PL050) += pl050.o
 common-obj-y += ps2.o
 common-obj-$(CONFIG_STELLARIS_INPUT) += stellaris_input.o
 common-obj-$(CONFIG_TSC2005) += tsc2005.o
-common-obj-$(CONFIG_VMMOUSE) += vmmouse.o
 
 common-obj-$(CONFIG_VIRTIO) += virtio-input.o
 common-obj-$(CONFIG_VIRTIO) += virtio-input-hid.o
-- 
2.15.0.rc0


