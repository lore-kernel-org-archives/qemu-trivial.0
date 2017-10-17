Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4Uzs-0001Qy-Gc
	for mharc-qemu-trivial@gnu.org; Tue, 17 Oct 2017 12:45:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46375)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4Uzp-0001Nm-9R
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:45:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4Uzo-00037O-Ic
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:45:37 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:55308)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4Uzh-00033Y-Kn; Tue, 17 Oct 2017 12:45:29 -0400
Received: by mail-qk0-x241.google.com with SMTP id x82so2826794qkb.12;
	Tue, 17 Oct 2017 09:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ls1dptIf2tNlYttA26VhPMzRZ/QMi9fjCPd+v2MW8wY=;
	b=HebehbkXvQD7yyagLQ5oAXo2kS1JrnIfmVMqcdaKivnfpB1gIcc/0Sy0PaffjzQx4d
	0QKXWV+sce82kHDl7CyfoX+1SE90yitKashOwLX87XumNOwsSBunuQ5NK44o+HDO1/od
	qI+KyXsAy1WMbdCLlItqJSH+4GtvGEbKgk5R72irAFVT3tV8251F9AvsQ1uTDMut0oOm
	6E/4BkhjFjI7tl0UIpgMdlM/m/1Hgb7UEEB2k/JKpdpHj82YDljEl7831QhItplwyKxF
	8Gowt2fU5oS6Li7UV4lwq9zJ+MWz9Y2IFbhNKdHDE6XCXMfg2VKAU7+T3FNHP//crHkU
	6zBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=ls1dptIf2tNlYttA26VhPMzRZ/QMi9fjCPd+v2MW8wY=;
	b=cAhxHrDSgHUqsuCL0WTF441jq0piuXOdFkKdXpdfmLD+VbOEX3lzADAxjW8t9HcKIw
	GXUqA3XZDTTVC4IOQ9Ei5COGha1yqy0PYswtfi6MzmHvjGdDElFZjVKuKgx3idvEKUhO
	4F0Rv6Dauf1QZSWcytfJgcQib/P1stG7i6KHZAuvfWUJw/t4zSDhEHv2W24O+rU0zMfa
	5KUwSN9xeQhMRmjQWvvb11kIg/2w+ezh+D36esThFBTB5eozCocWL2eZgCqA51um72Im
	W2b381LtEDUDgNsTeGSEdADXhQxQ7EQ8UUy3pyx8cpZPEceZGsuO9e27USx0uT+DFE7z
	A7Qg==
X-Gm-Message-State: AMCzsaV7hPHdzE1CMPQ4BrCME9UnKjMQtAIBtE7dW6lCS2ozgmhMLgth
	CFRkMYM+BsJjDXZIXVakktIpG5KH
X-Google-Smtp-Source: ABhQp+Sqm8rPfo+O0E8tit72dS4HMi05PubVZ3VbSjVHJuDKLTqUJQgV0bvo3OTr67kmdrg3Yu61tA==
X-Received: by 10.55.149.70 with SMTP id x67mr19637222qkd.62.1508258729091;
	Tue, 17 Oct 2017 09:45:29 -0700 (PDT)
Received: from x1.local ([181.93.89.178]) by smtp.gmail.com with ESMTPSA id
	q49sm6687653qtq.80.2017.10.17.09.45.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Oct 2017 09:45:28 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-trivial@nongnu.org,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
Date: Tue, 17 Oct 2017 13:43:48 -0300
Message-Id: <20171017164426.25277-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc0
In-Reply-To: <20171017164426.25277-1-f4bug@amsat.org>
References: <20171017164426.25277-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-trivial] [PATCH v3 04/42] MAINTAINERS: add an entry for the
 i82378 (superio)
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
X-List-Received-Date: Tue, 17 Oct 2017 16:45:38 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Hervé Poussineau <hpoussin@reactos.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0706b474e7..510505b2f3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -712,6 +712,7 @@ F: hw/ppc/prep.c
 F: hw/ppc/prep_systemio.c
 F: hw/ppc/rs6000_mc.c
 F: hw/pci-host/prep.[hc]
+F: hw/isa/i82378.c
 F: hw/isa/pc87312.[hc]
 F: hw/dma/i82374.c
 F: pc-bios/ppc_rom.bin
-- 
2.15.0.rc0


