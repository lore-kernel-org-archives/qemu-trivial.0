Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1daxxT-0004Qq-6g
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 01:37:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47953)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxxO-0004Mx-7U
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:37:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxxK-0003T2-TW
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:37:02 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:38459)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxxI-0003MW-0E; Fri, 28 Jul 2017 01:36:56 -0400
Received: by mail-qt0-x242.google.com with SMTP id p3so11916800qtg.5;
	Thu, 27 Jul 2017 22:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=RQ07ZokKeFbys/ZjInTx/+PnZq4dTWpq9vuhcBwEUTI=;
	b=NoGOpxI1T68fgRz3VgOk/OclTbfJq5FySU6x4RnMbMkYA6e0Ebpm5rFU/5v1ljvSBX
	GAwpNUiHDHcSL86NCV9jV/QHO0FWY+hzpSvCgPoQ+vh7jqN0TeFSnmjwi/WU3BW80SlV
	2OIhqWza3slnTGNN9dna0TBWXcs3wrA0y1yEQlt/ibdMnwR9Zl7V99wmjY3DKeGUDYig
	zlwGxVuig2gTwtWHnC1YONC1xfGdH9brNA9T/WDUBYxvOh6DXA9vjK8/Kqxm/1jCPN7w
	g/euGApcQtlPYcOOPPbtvm6YymmA/Q7PWMYnAD9GDodvwIg6r1CVKJuuQ+iTgct8DWLH
	lsSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=RQ07ZokKeFbys/ZjInTx/+PnZq4dTWpq9vuhcBwEUTI=;
	b=AnrcQBTcLLYrCZtCmMs03HQx5EZKAJ0rJeNu6XWpi6mGlRAEo7KyU/TXE/F1F2yNHa
	a7Hj81oQ5KkdPhdi+mL+UMB131fYCsnxTSrqqzNGGO4RC0RisGyBE6aUsLwqKEUdynh0
	pnehWjoaU9UxFb1CkYBoTY+0wCtkFHvGQEvOgBgcU1aw83LdNy1dHyuJ4gJct+5GPx56
	lJ/A0Tni6dyLux2YZXW0H/VOO8FpP9OxmGgxy9Dr2QxSjQuxPypzL6ioNBvcorABzRrT
	n17H09qAEj9PlW7KX5r8XjutDR39enBjdCDNDgFRLDAwMDDdOZs6JrxP8JY/elA61o9A
	g5XA==
X-Gm-Message-State: AIVw112TUcilbL+1QUc4VSiM0VCnV+2v8lTccj1mcGkD/ledVYeGrIoo
	yM8T9HaQxqGmZXRNvWa+Bw==
X-Received: by 10.200.38.234 with SMTP id 39mr8622063qtp.252.1501220215453;
	Thu, 27 Jul 2017 22:36:55 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	h41sm12129560qta.45.2017.07.27.22.36.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jul 2017 22:36:54 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Gonglei <arei.gonglei@huawei.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri, 28 Jul 2017 02:35:37 -0300
Message-Id: <20170728053610.15770-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170728053610.15770-1-f4bug@amsat.org>
References: <20170728053610.15770-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-trivial] [PATCH 14/47] MAINTAINERS: add missing entry for
 virtio/crypto
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
X-List-Received-Date: Fri, 28 Jul 2017 05:37:05 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 842c66c325..d8aef164ca 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1111,6 +1111,7 @@ S: Supported
 F: hw/virtio/virtio-crypto.c
 F: hw/virtio/virtio-crypto-pci.c
 F: include/hw/virtio/virtio-crypto.h
+F: include/standard-headers/linux/virtio_crypto.h
 
 nvme
 M: Keith Busch <keith.busch@intel.com>
-- 
2.13.3


