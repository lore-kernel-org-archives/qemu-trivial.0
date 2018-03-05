Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1esoI1-00043v-1q
	for mharc-qemu-trivial@gnu.org; Mon, 05 Mar 2018 06:28:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41726)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoHt-0003iZ-RT
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2018 06:28:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoHs-0007Cc-VP
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2018 06:28:13 -0500
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244]:40312)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoHs-0007BX-O1; Mon, 05 Mar 2018 06:28:12 -0500
Received: by mail-wm0-x244.google.com with SMTP id t6so14784231wmt.5;
	Mon, 05 Mar 2018 03:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=3GAm440F+gjyiS2MzGN5ELlJ3TGKQ4EfRWh3v0Iv+HY=;
	b=mDkdNHqvGMRYRHV4PVPCEs29V+5ElPvmaazzl5//8yZg7/mpoQZRbBPSltXlfxpCuY
	ANGsxdT8YzYvrBWaWfzStOLw99rn71OMSpZma7gPbViVRNwEm7GHoVWZuurP3a3Byntx
	RN4kV3R/bIkhUira1MZDeBW9PBGT3Co0m+OV8kN80KaRtkTDClv8bM6z3enS3LkgLqp0
	zjPZl8gZ/kEdeL3P6GeYLzqXM13XM0uoldXRJ5WY3SHVlY9+yt0At+BDjc904aXmt4zS
	rTlTSVxKmxL1o/QMhN1H0eaPJsqUouMJqa4GLUhMiXw/VnZVUyJgtKZYlqdqIDYhk79D
	R/2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=3GAm440F+gjyiS2MzGN5ELlJ3TGKQ4EfRWh3v0Iv+HY=;
	b=RynEoesLhUc9TovH2HY47If+3RqColo++3MPCGLiwcJ6SlFTwxyU56HVy4RM1vWDIl
	Gc8iDON/VRfLTMrUezsaSpsWwNapY4ry4xf6OiAOcwCStfdh9A9CgolFJqAd/xUbrBLx
	IUI4eQIftjPUyOYLq4K6vrOEPBXwTJ/vvfAllVEnofYPE5/1/UgyxKjWC6St9R3UOJ4v
	ByVEBPr0Hs3DveAhi9BkNoBuJfaocFEaPBuyIy35n8nUuKUnRgQVZlGNQy4x8D8tEsP5
	uSA3YZayd0ibfSo1zbVbHRUMR+8NTphCvpB3U1mkeklUmXQSXzu55iIcJ5392tXE5xWv
	7akQ==
X-Gm-Message-State: AElRT7F+kZVmaSgYgaufUExvvKKuKT4bR8lThZG3hpiWBrezOz8KGaVq
	XSjJ9V+1W9wvuQwSHGwLkzxuHEbt
X-Google-Smtp-Source: AG47ELuf4dYXuMZKwrdf572D0ZiClokBeFZCUV8vh4AxmSgI3pF2A16GtAqZILgsPZKbVVq2nIHZsQ==
X-Received: by 10.28.69.93 with SMTP id s90mr7896912wma.29.1520249291611;
	Mon, 05 Mar 2018 03:28:11 -0800 (PST)
Received: from x1.local (ABayonne-654-1-79-224.w86-222.abo.wanadoo.fr.
	[86.222.222.224]) by smtp.gmail.com with ESMTPSA id
	k45sm11744388wrf.62.2018.03.05.03.28.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Mar 2018 03:28:11 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Alberto Garcia <berto@igalia.com>
Date: Mon,  5 Mar 2018 08:27:26 -0300
Message-Id: <20180305112732.26471-25-f4bug@amsat.org>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180305112732.26471-1-f4bug@amsat.org>
References: <20180305112732.26471-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::244
Subject: [Qemu-trivial] [PATCH v2 24/30] hw/ipack: use the BYTE-based
 definitions
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
X-List-Received-Date: Mon, 05 Mar 2018 11:28:19 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alberto Garcia <berto@igalia.com>
---
 hw/ipack/tpci200.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/ipack/tpci200.c b/hw/ipack/tpci200.c
index da05c8589d..56c0ad8932 100644
--- a/hw/ipack/tpci200.c
+++ b/hw/ipack/tpci200.c
@@ -597,9 +597,9 @@ static void tpci200_realize(PCIDevice *pci_dev, Error **errp)
     memory_region_init_io(&s->las1, OBJECT(s), &tpci200_las1_ops,
                           s, "tpci200_las1", 1024);
     memory_region_init_io(&s->las2, OBJECT(s), &tpci200_las2_ops,
-                          s, "tpci200_las2", 1024*1024*32);
+                          s, "tpci200_las2", 32 * M_BYTE);
     memory_region_init_io(&s->las3, OBJECT(s), &tpci200_las3_ops,
-                          s, "tpci200_las3", 1024*1024*16);
+                          s, "tpci200_las3", 16 * M_BYTE);
     pci_register_bar(&s->dev, 0, PCI_BASE_ADDRESS_SPACE_MEMORY, &s->mmio);
     pci_register_bar(&s->dev, 1, PCI_BASE_ADDRESS_SPACE_IO,     &s->io);
     pci_register_bar(&s->dev, 2, PCI_BASE_ADDRESS_SPACE_MEMORY, &s->las0);
-- 
2.16.2


