Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dQayn-0001VC-W2
	for mharc-qemu-trivial@gnu.org; Thu, 29 Jun 2017 11:03:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57966)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dQayl-0001Sm-3R
	for qemu-trivial@nongnu.org; Thu, 29 Jun 2017 11:03:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dQayk-0006hV-8g
	for qemu-trivial@nongnu.org; Thu, 29 Jun 2017 11:03:35 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:35171)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dQayf-0006g2-RQ; Thu, 29 Jun 2017 11:03:29 -0400
Received: by mail-qt0-x243.google.com with SMTP id w12so11594447qta.2;
	Thu, 29 Jun 2017 08:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=mtzrAPjLYDwKmVilBncnMZUnzwiiuzEhyDHHxJMhjl8=;
	b=txHSVaI+6BLYr5+G28wUBgo0toILKFDE/3yaWIGbyrt8GkyJC7DHaTKoPVfEz1V+Su
	2YORzBVtkGi1Shp3FLY/lHhtbo8oUb1dwo7exqu4IdpaAjx4gtYJ3eMYClYzfcGVQ/XS
	f7/GGB6n2zBFhU2mpd0mhMnPJVKTI4sWZrzCzo8FDk8/qUq5oEMIAe51FNuwc7773sqx
	W/SZwQzeuankbYbdkACI2r2DsSpLxxSKa5xrmiDrbhXWd3vnlghr2tW/4t2F04qc4lYi
	C2OVfF4yL0UDPWCgYu4MP50AjpiF5vd4uKGpokHwRW/4pmbJ77iBP+1bYu0+KiLLexiw
	wdOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=mtzrAPjLYDwKmVilBncnMZUnzwiiuzEhyDHHxJMhjl8=;
	b=L2NM3RznMb2pEbaKWAbMK2fSmDN94+zLWUtB+R/uILtno+NrVkqqC/BqD08RY+OZ9l
	vb7zu7wHLAaiwJ/xikoX5tYMKZg1m7NkKs7jUfwkY6CAs6JNxAJxzYsIsCEnVOcT3LTT
	Dkufztut73K8npJy4/Fq/OsCRN/x7KKTbpvZgCaS1/EhU9F4nc4ZZNzfEZEvwlxnjeZ1
	P6raKtdeww7265KeJJO6A2+i5pOo9qeu3avTCpUIhkqTjCk1GkNs6DqbxI4OGluULyAW
	ACWmf+6eXIPB2HQvlBH47wKv7qlxCBpzEje+WOdQ7Fzu8VkXHKPRvI6vuOk2j5P4/fut
	aqwg==
X-Gm-Message-State: AKS2vOxLE535CWl64Bbp2EMevQV4/5S9jmSwoor4UAt64+weyj3Txrl5
	iHB01t6r+Utby7laDF/xMA==
X-Received: by 10.200.41.85 with SMTP id z21mr15287622qtz.238.1498748608709;
	Thu, 29 Jun 2017 08:03:28 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id z1sm3873349qkb.37.2017.06.29.08.03.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 29 Jun 2017 08:03:27 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Emilio G . Cota" <cota@braap.org>, Stefan Weil <sw@weilnetz.de>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Anthony Xu <anthony.xu@intel.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-trivial@nongnu.org
Date: Thu, 29 Jun 2017 12:03:06 -0300
Message-Id: <20170629150308.22766-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.1
In-Reply-To: <20170629150308.22766-1-f4bug@amsat.org>
References: <20170629150308.22766-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-trivial] [PATCH v2 3/5] MAINTAINERS: update Xen entries
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
X-List-Received-Date: Thu, 29 Jun 2017 15:03:36 -0000

moved in 56e2cd24..28b99f47 to hw/xen/ and hw/i386/xen/

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Anthony PERARD <anthony.perard@citrix.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 86a08c5aac..530293044b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -323,7 +323,6 @@ M: Stefano Stabellini <sstabellini@kernel.org>
 M: Anthony Perard <anthony.perard@citrix.com>
 L: xen-devel@lists.xenproject.org
 S: Supported
-F: xen-*
 F: */xen*
 F: hw/9pfs/xen-9p-backend.c
 F: hw/char/xen_console.c
-- 
2.13.1


