Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4FVE-000606-JI
	for mharc-qemu-trivial@gnu.org; Mon, 16 Oct 2017 20:13:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33163)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FVA-0005vw-Km
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 20:12:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FV9-0003uu-Ri
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 20:12:56 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:45789)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FV5-0003rt-PJ; Mon, 16 Oct 2017 20:12:51 -0400
Received: by mail-qt0-x242.google.com with SMTP id p1so68337qtg.2;
	Mon, 16 Oct 2017 17:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=k5kFfu3fKwWGOW0m8nORyr6nOXyWki7ckl57WIjNbKc=;
	b=Q3B/JA8jtyyF5MLclXHNq9Xtg2TEXB8Dn3fPeo/ddxLJBkPDKlgY3ptNh1b2FkMCXa
	AwMZD3Gq1mrXa2FisZcN4xV7FGsR1vclRNo3d5UfQo0GYQv6TPfftdDsZSpAYGPhIz+q
	lUtUdQ+ZyJZh97J/02SL+2Y6noi1Te5LFgweoAQ/1iIj7sBtQHBMTo7V9V0xKWHgQLJq
	cVc4pGGsB2SX0Vll3wwfTX1GSH2XBY9XFTr3EmetU2mEIi1e8Bqvu8pX+RjIhogNZiTn
	wy66ChxK3RYlL8BPsWQSOON/3Y9oCUvNkQ3pET5OxriIEUuRKgdPTH7RmnQHqN+7d/IP
	NYYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=k5kFfu3fKwWGOW0m8nORyr6nOXyWki7ckl57WIjNbKc=;
	b=RypIQwIku84lWa+s+ZnuaVR9gteoRH79lOjniRytGWqdxOQJ2ixbygDfe2YgTZcZzp
	Rkiz7/g41oojjlFtG5bFwK5muY4QrofkDTjFpEkUdPBmPOShNn33fg7DXlEA1j22IlId
	FwbGXsjYCHjYIUTdQVd6dam6QJ1s6VboiAO+0ilPKdC95ykVgTRpEC1DpVouMJO1fnIf
	3/hY2ek8uml0j/MFCu+LHK4G95j0/pGFQ86HB0Y4A/GilEyJlDzMk4zIRWCBvtel8OUS
	yp/wQREQ646rdQkFqH5wEc+HrAyz/exqHqyOA1KoCL2rdu1uVr73tb0bEBBFjjwuAcxz
	dA2Q==
X-Gm-Message-State: AMCzsaWzyTLKKjUaa7bcWtkhecKnVQ14ITh6hDdOLncnrvUPiz3Yv+Ly
	YM/cG6wqXkTy40rW2683YQM=
X-Google-Smtp-Source: AOwi7QDLrcgeyQOTArJ+TFNnMqPSyBHooWbT5H7pQ1nWaclJb9JmNUl0GPl/dQhMONwC4CIod9m4/A==
X-Received: by 10.200.57.86 with SMTP id t22mr15739816qtb.113.1508199171294;
	Mon, 16 Oct 2017 17:12:51 -0700 (PDT)
Received: from x1.local ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id r6sm5409043qkh.22.2017.10.16.17.12.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Oct 2017 17:12:50 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-trivial@nongnu.org
Date: Mon, 16 Oct 2017 21:11:36 -0300
Message-Id: <20171017001209.32276-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc0
In-Reply-To: <20171017001209.32276-1-f4bug@amsat.org>
References: <20171017001209.32276-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-trivial] [PATCH v2 06/39] MAINTAINERS: add entries for
 timer/m48t59
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
X-List-Received-Date: Tue, 17 Oct 2017 00:12:59 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Hervé Poussineau <hpoussin@reactos.org>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b90a42d823..06ec24912e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -715,6 +715,8 @@ F: hw/pci-host/prep.[hc]
 F: hw/isa/i82378.c
 F: hw/isa/pc87312.[hc]
 F: hw/dma/i82374.c
+F: hw/timer/m48t59-isa.c
+F: include/hw/timer/m48t59.h
 F: pc-bios/ppc_rom.bin
 
 sPAPR
-- 
2.15.0.rc0


