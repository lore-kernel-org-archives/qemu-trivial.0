Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1daxxd-0004a7-RL
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 01:37:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48195)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxxZ-0004XC-5W
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:37:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxxY-0003lx-9S
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:37:13 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:37976)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxxW-0003j1-8X; Fri, 28 Jul 2017 01:37:10 -0400
Received: by mail-qk0-x244.google.com with SMTP id v76so8644197qka.5;
	Thu, 27 Jul 2017 22:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Aps6mnArRN+PHyP6u0fte6ITTySRert2EFFEiw2FN0U=;
	b=FUHm0JSg04DuLZ03FPx50Wgo56Arx/vl3+h98vimZ/o4ZiJzDI335VewX39ghNBGu8
	EAhto7OVXalDEj6reHTxZujDXRJguRSIGH2ZxK6Zn5FlMYn6m+sI8yFLCulXZXsUflmY
	pJRwluTW7qGMagYBp3Rt+170RQ/9iX9U4kX55kq1x+Cpa8NvqR95OivcchxPNFAj0p9+
	MiWFX8Nbdz3queUntiwFcGwQrSCwuVVLJxUyTPjfCEeYmfeVHsnr8NgG27o5A4Nq+789
	hstATZCj/4VXMG8N7vKGKalBVKwI30od7+Tk/Zol5IN9icWOuGTHLbJC/Hkn+gRZ9sE9
	PpLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=Aps6mnArRN+PHyP6u0fte6ITTySRert2EFFEiw2FN0U=;
	b=JSoiCPxNSFpoLncsNhE5vLgLAHbbgt7/p9N8ACyzO95AA7lWWI2TXlKpTPNu2Upsmx
	ZNrdYdNMQqCg4Hs8A3xZ8xeQA6Ki5fxvY4G8k9MNpBqqe+UQE+NrSG6mVh2X1YHFzf/k
	9Bi6iir3fwXNxYAduBo4JT0ddNnj0Eq+pFmZz6PyZkmkCJmWRGPV+6I0aTfw/fFbdrxR
	c8Zr5nkKwqlDm6rHOPniMC4lWhUxww5zzG90m4Vif943uoZTDtEGwNbSed/NM+4W6dOE
	OH9em9XSbDpSnc9h5XavW1kmYbkwhUMg5jYYvWIr/79WitkNb8EHwBFBztxenDyyNnoA
	e4KA==
X-Gm-Message-State: AIVw112/5+aIGoge2iv1whjXSBvsOabCuHG0h8ytwrb7iTeyYs4Xv5Pu
	MttxzVwAIIKR3g==
X-Received: by 10.55.121.66 with SMTP id u63mr8387724qkc.314.1501220229825;
	Thu, 27 Jul 2017 22:37:09 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	h41sm12129560qta.45.2017.07.27.22.37.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jul 2017 22:37:09 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: "Michael S . Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri, 28 Jul 2017 02:35:43 -0300
Message-Id: <20170728053610.15770-21-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170728053610.15770-1-f4bug@amsat.org>
References: <20170728053610.15770-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [PATCH 20/47] MAINTAINERS: add missing PCI entries
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
X-List-Received-Date: Fri, 28 Jul 2017 05:37:14 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2dcdda4cd5..286ff7e509 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -933,6 +933,9 @@ F: include/hw/pci/*
 F: hw/misc/pci-testdev.c
 F: hw/pci/*
 F: hw/pci-bridge/*
+F: default-configs/pci.mak
+F: docs/pci*
+F: docs/specs/*pci*
 
 ACPI/SMBIOS
 M: Michael S. Tsirkin <mst@redhat.com>
-- 
2.13.3


