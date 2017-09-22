Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dvQPS-0006q0-QX
	for mharc-qemu-trivial@gnu.org; Fri, 22 Sep 2017 12:02:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52531)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQPP-0006ml-FR
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 12:02:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQPH-0000Tn-NW
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 12:02:31 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:36455)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQPA-0000MK-Kp; Fri, 22 Sep 2017 12:02:16 -0400
Received: by mail-qt0-x244.google.com with SMTP id t46so921282qtj.3;
	Fri, 22 Sep 2017 09:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=NMGOcApUVqTQ4IGibQCfL666b3JC73dhF5axZeVSTgk=;
	b=hhpXlq35+lc7YklNyl+RVe5gOnoEbF3Ka90BkyfE5ijx/qtDeYBZs1ZqcqJYbzilIt
	9ZYoF1Ts538ruikGqTg7mmHhshyiMTK0FCuqqTBj0vniiX2sReXKv1ZdjIG5sRYbxDZE
	xfP4oeRYmhAv/rpJYj8a7xNY6CyZlfqXJHEn2SE9YNyXg2lMXP7fGdTgZKKrh5l4yl4R
	JZKZ9p/vCbZmfXImuprfK2tIbP7AFLNRC5kO7SpJ559icvaX1vmHPVUeNZFqUkIJ/DjA
	0DehIeZoZF8nQqep1AXRYSGBzWKKSy+AyaQrQdkEtGhdbs6uXG8eppB+32+u964Ds5Yh
	a2PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=NMGOcApUVqTQ4IGibQCfL666b3JC73dhF5axZeVSTgk=;
	b=ktROJd0/81Dl4x2ZdpLDlFNDOFPX55dpx9h5gW8fHTF28un2J3R0C0DZ/d1eLxdCTj
	HJoovX21jz9bBEYyaBMfdEKcZ2poDUweUW72FVcsM2LKxuY4UA047jZ5rIcy+ognVvHo
	5xI2pFP6Lttrf0JDiZohAnltRGvTm7F1UN4xs7nQNOIhcERtAHUgJEHllkp/6AhPyPRl
	uOjwTO7DtpnmrNNUh9/+dqoodz25cxAAhYs/xn1M6NB9OpjbPbBu8vX5VqSPq/oe89DT
	BKLmIWgvU1kRYkwpaznpXq9D0k0Pp0CuN90tnIW80iNNPkdeLsD/6hJBSgv/p+H5cSlF
	hoUQ==
X-Gm-Message-State: AHPjjUi5h/4ad2FCKxIAolWtlGRiOIwsoqxH3kuYdqgBLY48Zf9ECx2t
	tQz7SvIOaigr5GMmvakq7Jo=
X-Google-Smtp-Source: AOwi7QBnGrndxWXT1oTuq+KrOjqR0Pf1VrJtPpOSZWVA7wS3sa8cQoxUqCDv0EHISORiby5mxcxIdg==
X-Received: by 10.200.15.13 with SMTP id e13mr8988994qtk.295.1506096135998;
	Fri, 22 Sep 2017 09:02:15 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id y31sm108325qta.83.2017.09.22.09.02.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Sep 2017 09:02:15 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri, 22 Sep 2017 13:01:10 -0300
Message-Id: <20170922160111.31885-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170922154014.29350-1-f4bug@amsat.org>
References: <20170922154014.29350-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [PATCH 33/34] hw/alpha: remove old i386 dependency
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
X-List-Received-Date: Fri, 22 Sep 2017 16:02:32 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/alpha/alpha_sys.h | 2 --
 hw/alpha/pci.c       | 2 ++
 hw/alpha/typhoon.c   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/alpha/alpha_sys.h b/hw/alpha/alpha_sys.h
index b6d8369ed7..ac685c1c46 100644
--- a/hw/alpha/alpha_sys.h
+++ b/hw/alpha/alpha_sys.h
@@ -5,8 +5,6 @@
 
 #include "target/alpha/cpu-qom.h"
 #include "hw/pci/pci.h"
-#include "hw/pci/pci_host.h"
-#include "hw/ide.h"
 #include "hw/i386/pc.h"
 #include "hw/irq.h"
 
diff --git a/hw/alpha/pci.c b/hw/alpha/pci.c
index 8dde637bfe..c370762ea6 100644
--- a/hw/alpha/pci.c
+++ b/hw/alpha/pci.c
@@ -8,6 +8,8 @@
 
 #include "qemu/osdep.h"
 #include "qemu-common.h"
+#include "hw/pci/pci.h"
+#include "hw/pci/pci_host.h"
 #include "alpha_sys.h"
 #include "qemu/log.h"
 #include "sysemu/sysemu.h"
diff --git a/hw/alpha/typhoon.c b/hw/alpha/typhoon.c
index ae11e012c7..75ac4ed354 100644
--- a/hw/alpha/typhoon.c
+++ b/hw/alpha/typhoon.c
@@ -11,9 +11,9 @@
 #include "cpu.h"
 #include "hw/hw.h"
 #include "hw/devices.h"
+#include "hw/pci/pci_host.h"
 #include "sysemu/sysemu.h"
 #include "alpha_sys.h"
-#include "exec/address-spaces.h"
 
 
 #define TYPE_TYPHOON_PCI_HOST_BRIDGE "typhoon-pcihost"
-- 
2.14.1


