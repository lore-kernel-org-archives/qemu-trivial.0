Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ePDBl-0002oL-Di
	for mharc-qemu-trivial@gnu.org; Wed, 13 Dec 2017 14:59:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57636)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePDBi-0002lO-CX
	for qemu-trivial@nongnu.org; Wed, 13 Dec 2017 14:59:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePDBh-0005V8-Cc
	for qemu-trivial@nongnu.org; Wed, 13 Dec 2017 14:59:30 -0500
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:34684)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePDBf-0005TL-Bo; Wed, 13 Dec 2017 14:59:27 -0500
Received: by mail-qk0-x243.google.com with SMTP id d66so3516297qkg.1;
	Wed, 13 Dec 2017 11:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=z6E5+U1ACwg79U4SK3UoRK21uWO/5CThallkdd8lB0g=;
	b=eza7hK9oQmN1N2AUmnM9/WvmqOwbyPqsh9PXNEuYyF419INmag3taezBMLIqB1jamM
	BPC8wKsMYkXi2fZl3iVZTn8zz5MRJ1BEsYdet02euyKPZhD855myTCZ7vZ02vvAUuBO4
	ilVBY4XllUaU3BYgPtZszy4H7VkzvNpc4crdSkFnCXh20uEmKA42CrDGyvjFRWRYplFg
	UrhUsN7DGT6+gyrJCypK63m1na3zlGcx4+JSGaUgxneF2ms6iW+VAhZcB1an46EYPFhL
	gNhaNSjepHfMjlqktj7Xq2JuUhPVB+AIdGdF04xGFmP8e4GYcpu2I06oYH4EVppa8tZt
	POOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=z6E5+U1ACwg79U4SK3UoRK21uWO/5CThallkdd8lB0g=;
	b=bkGX1oKDG7ZypzhRpJupiDPcmkEVQqAodBU/BctA9G99zzCAM8mN0EUXbxMhgWa7MG
	retWE/aS+ab3TfQwGLsOtano/JWScsP24aMxU2BnyMjVIdCgNmrq4PkjKL9CRGV+ihYg
	qwBzB4Cb8/Z4JYvCjhBDaReHSzCm1z/VRrfUZsK51OhqEG2CGhG9pKeBwYbI/fM3yN7Z
	LGbn86wdw7K4/Okt+zpFX5QyrSq2QVwFaSXaGqKlpzSRNQd9LZXtAqyJEG1hyDZJvJ3k
	xnRk2FDEjhI/m/VL7BW9c/kRBUFifwhJ5KEExUEmCyaAsVqrVHHr1X0xK7IFinOEjHF3
	LNAg==
X-Gm-Message-State: AKGB3mKUZnsctaXWgGs6NTL2pa3t4aI+bP/H42oPT5eReWu6N6Od3ZF+
	+NPRK4wX23Jntj6D3SJzunw=
X-Google-Smtp-Source: ACJfBotKguSq54TZEhN+Ku6fJQ6eNWckT2HmwDf8EiIYBebIzvDbAHxQBn+U568NRuQEKJ2aUaFpyw==
X-Received: by 10.55.200.129 with SMTP id t1mr12214596qkl.198.1513195166816;
	Wed, 13 Dec 2017 11:59:26 -0800 (PST)
Received: from x1.local ([138.117.48.211])
	by smtp.gmail.com with ESMTPSA id o5sm1518876qtc.72.2017.12.13.11.59.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Dec 2017 11:59:26 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Andrey Yurovsky <yurovsky@gmail.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Sai Pavan Boddu <saipava@xilinx.com>
Date: Wed, 13 Dec 2017 16:58:42 -0300
Message-Id: <20171213195852.30439-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171213195852.30439-1-f4bug@amsat.org>
References: <20171213195852.30439-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-trivial] [PATCH 04/14] sdhci: use deposit64()
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
X-List-Received-Date: Wed, 13 Dec 2017 19:59:31 -0000

This makes the code slightly safer, also easier to review.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sdhci.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index e39623baba..295a89e5d3 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -1123,12 +1123,10 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
         MASKED_WRITE(s->admaerr, mask, value);
         break;
     case SDHC_ADMASYSADDR:
-        s->admasysaddr = (s->admasysaddr & (0xFFFFFFFF00000000ULL |
-                (uint64_t)mask)) | (uint64_t)value;
+        s->admasysaddr = deposit64(s->admasysaddr, 32, 0, value);
         break;
     case SDHC_ADMASYSADDR + 4:
-        s->admasysaddr = (s->admasysaddr & (0x00000000FFFFFFFFULL |
-                ((uint64_t)mask << 32))) | ((uint64_t)value << 32);
+        s->admasysaddr = deposit64(s->admasysaddr, 0, 32, value);
         break;
     case SDHC_FEAER:
         s->acmd12errsts |= value;
-- 
2.15.1


