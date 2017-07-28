Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1daxxm-0004iB-D2
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 01:37:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48397)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxxi-0004ff-Od
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:37:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxxi-0003yB-0b
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:37:22 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:38495)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxxe-0003ue-ME; Fri, 28 Jul 2017 01:37:18 -0400
Received: by mail-qt0-x241.google.com with SMTP id p3so11917459qtg.5;
	Thu, 27 Jul 2017 22:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Ylnuo2kNdtb0obXHUgwYqeJOxntETvftgSfo+MWn+lA=;
	b=GBDQ2Vfjx3kO7b4uK/RDNiInIrM0lN5bCPC4dJboJjx+tP8uoeVBJ5s0+6MyvfRpN+
	RMDvt7K5pZSELyAb1QmgaVTJQBVd9dgKNttV4fG+GN79vA/ZHRX5+LwuVRO2C+Ji33yX
	AIvXdpUnpk9MTfTWATKsiIKqlyEUrNns82yTjTt0QIk6puD2RDLI0uK2/9BSrkemMLNC
	TarECgmGdlwA0H+K0DcFO3jARZ9hs0jBJCuV6oSibFFcCzZshwyTMIVmgpjrNTAvm0CE
	4YGIchsbhZBznw/txYiOE2TPKH0pCiHQOgTOYjk4Xd+1NWkhUefhh09eHy7oq4VSCfnp
	FgYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=Ylnuo2kNdtb0obXHUgwYqeJOxntETvftgSfo+MWn+lA=;
	b=k6hiVi+8EaHy6GSMMYleZfcFVy2/p+TdJzHWlvG0MQvj8WGXBbJ+pP2Fci2cQYQidZ
	znHMGlwRIhnfGtD5A6+hXn0d7srcfC81ei/KZYfcRBFCU0q+hBsOKVzF6z7OgT5PpTNt
	zsgvGfVRXLMyr69lqIMwTJBBb1kux+zLiIBgpsfeBycJfmYdAFywM74M/2lDDZ/dh2rd
	XcE1CbskbeL51BaSyDKkkm/N5KGpslQhl80Yvo+ZXVXUBtGt+auvGa69fCzXKTBtQPwO
	Ow9320A+9T7ueFjsMbgl6Ifh4xj4oFz/ekctWy8lSqwCGehZJRipArJu29/DO4X70Stc
	da/A==
X-Gm-Message-State: AIVw113ETp9URQZ8Et1XLd6hpN+NwfvWuTour+97UpBckXWw9ImldGtF
	6StnINrkfxdJ2Q==
X-Received: by 10.200.46.194 with SMTP id i2mr9449145qta.89.1501220238308;
	Thu, 27 Jul 2017 22:37:18 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	h41sm12129560qta.45.2017.07.27.22.37.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jul 2017 22:37:17 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri, 28 Jul 2017 02:35:47 -0300
Message-Id: <20170728053610.15770-25-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170728053610.15770-1-f4bug@amsat.org>
References: <20170728053610.15770-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-trivial] [PATCH 24/47] MAINTAINERS: add missing MicroBlaze
 entry
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
X-List-Received-Date: Fri, 28 Jul 2017 05:37:25 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1424788a9d..fa6b0d189a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -165,6 +165,7 @@ S: Maintained
 F: target/microblaze/
 F: hw/microblaze/
 F: disas/microblaze.c
+F: default-configs/microblaze*-softmmu.mak
 
 MIPS
 M: Aurelien Jarno <aurelien@aurel32.net>
-- 
2.13.3


