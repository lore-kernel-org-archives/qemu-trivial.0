Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ePgjU-00035S-L4
	for mharc-qemu-trivial@gnu.org; Thu, 14 Dec 2017 22:32:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35146)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgjR-00032b-Re
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:32:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgjO-0005sd-ML
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:32:17 -0500
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:42480)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgjM-0005oN-ND; Thu, 14 Dec 2017 22:32:12 -0500
Received: by mail-qk0-x243.google.com with SMTP id a193so160341qkc.9;
	Thu, 14 Dec 2017 19:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Y7P0SdBA/H6Jy9wMy8/C8fnlXQXixlzmhflRjg2+ePI=;
	b=ilbf9brgf57HmVKPZknE7KvheKSRnQATgneTphz9u4INlZwH5MHR73ritLAkDWrBPJ
	ySOiG0wMuQZV9nu2/PqHvrOgW2gpTWqdjuf4XIz96mYY5YvS09WvgbhfJueM1cYn82ri
	eVkRMcQOKgjnJnHlia6fYN/Swb22pKGLRPC5tGOYmWD0hwR7R9Oqp5xZxIIneTBLzESm
	ud1vg5wdkydps9k0sAz6TJMjbfL0CB+VWhRXO3IG0wt6KMvHRu4/PsiqEqqojF/7KmM3
	1McHgGQywz6DOevYTGqd+EwTCoLqKSJ9aQ0dYr/3lG1tv7wLrQbQvtqkUbUbscjkMMfq
	mTzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=Y7P0SdBA/H6Jy9wMy8/C8fnlXQXixlzmhflRjg2+ePI=;
	b=pA2l76shvE0agFg0ZLTUgS4B1LIFNMsRya18eVJ7+xmu2Uh8vjtrnlin7+HeT/FPQm
	A1Rp576MvZvn5Tl5ndJ59qefCPtBtZpHOX4C//Y8B2JypCToSrWZriLImHjv4x9qwEdh
	bIvSIq+ySUwQ6aY7zJs3mcWbxq+velVpSd7qeFb7K7a9iihr2A14nCtguPTyw0MZqgcz
	M5T2RTHeBe9d3MnOoltaGOmGJTqw7BAnpubYKjjJiQNqJMhyogorBnwo23surdDxyJLl
	3nhkL4ANk1dECWQsUelHRugAv7KGGl5uOcEaB3D22rEm8z5iWmyYKwcbLvnF7lPFH0cf
	PUVw==
X-Gm-Message-State: AKGB3mJeq/PRBlcqJtIUdkGbkWnO6PiN4WwGwVQohYX2TrQ9sWer8np8
	y506AnJvLk1Nz+1MF1CcaFoOkQcj38E=
X-Google-Smtp-Source: ACJfBovhCrOZdZdLse4qIe+Hixk+yEOvjCvDez9HMzjlF8IBrMeWiDwHNpeQT+4LEzDFDSAj7cnHFQ==
X-Received: by 10.55.104.198 with SMTP id d189mr18899262qkc.190.1513308732245; 
	Thu, 14 Dec 2017 19:32:12 -0800 (PST)
Received: from x1.local ([181.91.222.165]) by smtp.gmail.com with ESMTPSA id
	q24sm3794605qkq.63.2017.12.14.19.32.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 19:32:11 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org
Date: Fri, 15 Dec 2017 00:30:01 -0300
Message-Id: <20171215033015.738-30-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171215033015.738-1-f4bug@amsat.org>
References: <20171215033015.738-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-trivial] [PATCH v4 29/43] hw/virtio-balloon: remove old i386
 dependency
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
X-List-Received-Date: Fri, 15 Dec 2017 03:32:18 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 hw/virtio/virtio-balloon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
index 37cde38982..14e08d20d0 100644
--- a/hw/virtio/virtio-balloon.c
+++ b/hw/virtio/virtio-balloon.c
@@ -18,7 +18,7 @@
 #include "qemu/timer.h"
 #include "qemu-common.h"
 #include "hw/virtio/virtio.h"
-#include "hw/i386/pc.h"
+#include "hw/mem/pc-dimm.h"
 #include "sysemu/balloon.h"
 #include "hw/virtio/virtio-balloon.h"
 #include "sysemu/kvm.h"
-- 
2.15.1


