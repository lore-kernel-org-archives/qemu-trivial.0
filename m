Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4Uzj-0001Im-UK
	for mharc-qemu-trivial@gnu.org; Tue, 17 Oct 2017 12:45:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46263)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4Uzg-0001Dc-HF
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:45:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4Uzf-00032d-RV
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:45:28 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:53498)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4Uzb-00030P-E7; Tue, 17 Oct 2017 12:45:23 -0400
Received: by mail-qk0-x243.google.com with SMTP id y23so2826739qkb.10;
	Tue, 17 Oct 2017 09:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=/6GRT6oeVo5/ncjqxvz/mIUNbhYCIU+zuvWF76PnT8A=;
	b=dUTLSZZ/vND+ObsFQKOpDESpwJ0jc32Q/DqmL10hJmomR8nOXuXA4RwzhbGdfYEou+
	FQ8qt0Z1U5OoxM0Z4mYzYQ42JcBOItIQtzbUO7VlUNj12pVL4c2k+iEd5EiHzYX0OhH2
	Ce4q6rhPNAMAwlpTPDR9DJjQwfM2r+98JSBQagAgdVAXwc4+qIMVlFEc493nvcywminz
	hU/ZU5QKG/cGj3/CQZTJIJxAZ7nogOoTeeydlr1wmoc2ERD2QeQwwj440wadLGapukBB
	WRz7Fq6FhowWfUIeDk4Mp55RNgnfzjGs3p/U+wEeM/tkvMZ4e092q8WKICyX9ZYJisNY
	ISTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=/6GRT6oeVo5/ncjqxvz/mIUNbhYCIU+zuvWF76PnT8A=;
	b=YKauGtafIGTZxlSeuCBIKrPjsAqzTQXZ0PcHq95sMc146vB5JF3VbFQTLWajkaixqs
	jrzU5kbgYBeSUfFmmsgiXcMgM0zBQx8l02SPGf5NtrpAm3geICNMsedp/+fBWhElL1ga
	8JvA/CiN8FkJ/wkRk8f5Vg9dccwHyE4W9I53CE8E2VehOfzzCOj6SdCBJEi30sEJepkt
	mA45U1H2lqGKQNpEVH3RYPYj/viEi8nsgkJ0btmcJoe8Ytm+M9NoGRsavxr2mE3MuOSx
	+WLxEmV30lYKUwTCoJNY9aOdFzIqeJGb4t4A0j4qPQpDrNB0lQ1f5FrjCgULDyg0sBdS
	Q+fg==
X-Gm-Message-State: AMCzsaXnCu3mHrZwrGqPMwdBZtw6yY4vpc/JeHJAoecSivkupwAUcgJb
	KO9/l6uJg4F1UtoFOD0jUm0=
X-Google-Smtp-Source: ABhQp+QB8pXdrC9j/02q23hBJvdtPNXX2ITun20czRaw0uyNGDCvRmGlcGB59Rc3zDHPnmlqV6yWOg==
X-Received: by 10.55.22.132 with SMTP id 4mr15060456qkw.39.1508258722846;
	Tue, 17 Oct 2017 09:45:22 -0700 (PDT)
Received: from x1.local ([181.93.89.178]) by smtp.gmail.com with ESMTPSA id
	q49sm6687653qtq.80.2017.10.17.09.45.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Oct 2017 09:45:22 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, Eduardo Otubo <otubo@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-trivial@nongnu.org
Date: Tue, 17 Oct 2017 13:43:46 -0300
Message-Id: <20171017164426.25277-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc0
In-Reply-To: <20171017164426.25277-1-f4bug@amsat.org>
References: <20171017164426.25277-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-trivial] [PATCH v3 02/42] MAINTAINERS: add an entry for the
 i82374 (southbridge)
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
X-List-Received-Date: Tue, 17 Oct 2017 16:45:29 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6f56c1349b..331f7391c1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -713,6 +713,7 @@ F: hw/ppc/prep_systemio.c
 F: hw/ppc/rs6000_mc.c
 F: hw/pci-host/prep.[hc]
 F: hw/isa/pc87312.[hc]
+F: hw/dma/i82374.c
 F: pc-bios/ppc_rom.bin
 
 sPAPR
-- 
2.15.0.rc0


