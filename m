Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ePgkO-0003xe-DD
	for mharc-qemu-trivial@gnu.org; Thu, 14 Dec 2017 22:33:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36019)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgkG-0003rs-01
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:33:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgkB-00073n-FW
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:33:08 -0500
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:35322)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgk7-0006wz-6V; Thu, 14 Dec 2017 22:32:59 -0500
Received: by mail-qk0-x241.google.com with SMTP id c13so8871062qke.2;
	Thu, 14 Dec 2017 19:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=3n+IO9RrrkWYEkZnQzWc/cyt48cm4Vi+1kuKSlrnAiw=;
	b=A2i5gkK0rND9vVkt4MVRRoXVzgw/dWWmakPXwzuZD2kGwuUhc0OBf7b+gx0hojrpZD
	918W/SGvTEmgBqjNhbl4j0sQN1cfTuu1MyHiXTjpdKEQv8r1j1kOdC73rzTn+wJErZLS
	niJ7lPMgvRPLNO/x4rjtsb/11t/LlSSboWkzVkGvbQpg+DbuLmdbdmDfMRQLOMPu8ASp
	HDKHGvAkFoeE0plA98mJvM6YONiAnCfB0XT3Ji/6hT2WXBQQot45ATTuBrlYPVuMLSOS
	zs4lG3HMlKSBaVrtNnHcrHdp+rRQ2hymLgXrwi9ERB1W9PPmegIY6yUJvivLATRQSKsJ
	w4QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=3n+IO9RrrkWYEkZnQzWc/cyt48cm4Vi+1kuKSlrnAiw=;
	b=cXQMCsvSJqKf+qlLGhFR/dx005wQSUIuIgJNPuofmFDxZmPfl/Ua1Ed3pMyugWWBVy
	t68D9DKPeHH9LSo1aCjnBqIkYErQthj7G3Ky4yl6IH0NFd/R4OgZ/JfUdsyMIOCgZbkk
	C6DPiBE51cq0bzmF70KeDSUXl9KBuUkD6B7OpTm1Hu7boHU1I7A7WRs0SJNNvTwj7s26
	y9T0dNB4qnccAHJozOhy+gIM3mmANmicqwA2BkvJMjWJTK7IR+OVIXZ81MWTR6o+Yxsx
	a8zoKi0c2UwteKhlpDfE+YsqDNXkZ2lDZMZPpogA1kOYfLq8FUHbn/aswEQVoL1QzqF5
	x95A==
X-Gm-Message-State: AKGB3mJpTCtHVnwbxU1jimNo1KmO5tLVYUr6o0G1uCSmzIYEuVJXGifR
	r8ZUueXSM+R1N89aS4iqOI/Ui+joryo=
X-Google-Smtp-Source: ACJfBosaNVOV/wqrrSkWbxwbFCrWZXCjFZPjfuR90OVTbLZ1NPhrzryU1R587q2OYu095bhir3Y5NA==
X-Received: by 10.55.1.76 with SMTP id 73mr20139128qkb.80.1513308778726;
	Thu, 14 Dec 2017 19:32:58 -0800 (PST)
Received: from x1.local ([181.91.222.165]) by smtp.gmail.com with ESMTPSA id
	q24sm3794605qkq.63.2017.12.14.19.32.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 19:32:58 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org,
	Richard Henderson <rth@twiddle.net>
Date: Fri, 15 Dec 2017 00:30:13 -0300
Message-Id: <20171215033015.738-42-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171215033015.738-1-f4bug@amsat.org>
References: <20171215033015.738-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-trivial] [PATCH v4 41/43] i386/pc: move vmmouse.c to hw/i386/
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
X-List-Received-Date: Fri, 15 Dec 2017 03:33:15 -0000

It's a x86-only device, so it does not make sense to keep it
in the shared misc folder.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
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
index 1548ad1ad0..fd279e7584 100644
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
2.15.1


