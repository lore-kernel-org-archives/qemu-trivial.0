Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dvQ58-00058F-F0
	for mharc-qemu-trivial@gnu.org; Fri, 22 Sep 2017 11:41:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41821)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQ55-00055B-Os
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 11:41:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQ54-0003Si-Sd
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 11:41:31 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:33080)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQ50-0003PK-8y; Fri, 22 Sep 2017 11:41:26 -0400
Received: by mail-qt0-x243.google.com with SMTP id b1so894551qtc.0;
	Fri, 22 Sep 2017 08:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=5ijSi0UUShfRXKPILyfq4mBsuuloWZVx8m1aliCpzzA=;
	b=K0I4B1OIsGckHHSs/oYXujS3jsqeMISEzg0fIRUC31x/d/tRtRYPMge9y0iYXZuNeb
	neUlmdvNEVLR2WOPJlzZuFEb/2sR6+ZZaKsm9Jj+SMfYZALoS0EObZV/kp3QCXkbHOY3
	HUdv6ECCLugC/gLCL90FNgM2dxPxnzL++PgmEYKQs0RlE4e91fxuJogzzUzB66XC9KtW
	SaVg9gCHN9+GSWZp6MiyMCBUUCekRY3cunE5UlCKO9G8F6oeuqA1FG6/yV5unYTOud5U
	xmoyNAh5P8aq4Juq80E+d4WN0DUhf3hAsQEab8GDt6P/K8Um4VB5taPyKepGdNTYDFD9
	Z1pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=5ijSi0UUShfRXKPILyfq4mBsuuloWZVx8m1aliCpzzA=;
	b=LOJP2MWA9FhGNpjGXQ9dGRRORGSHWHWK7zoYAhR+ujfrFOfIm3uurogEZ2IvYSEKVi
	aM7UdfhiQmfxu2meDQiHyuwlys59ddfSiaee88wNsXKc0u3Q+Qwu3jS75SNpjXpvGTFr
	wSK92L/NrV5+xlYnSilq+XciyXAby0B0Wz0bSA1AirVHGSno/oYANf3XfSipXcFDJO0m
	xUiImIJvdsEwFzt3U1lwMzWGR0cefO5PEokX1qEVz4B4fwaNgd3TZHRBJ/9Aki24LNmM
	b4Y1iPEPApwd+jlCkPq/YazGVpMTMMMLsJp7HIiAq6ckXXf8spmopYqoJYw5eNR2en0k
	K5dw==
X-Gm-Message-State: AHPjjUihlbC0BF17NefH+w/j+sHyGvtn7GmCOplXacDaslIJZC/TK0MX
	uG827sHdt1WDJImEIJPePBg=
X-Google-Smtp-Source: AOwi7QATGvE6TRQsK7vmZgUroEbhNFoPLv+DA8u+BXemHJSlzniQjaWt9zMqlLeklNerGdN3oLb30A==
X-Received: by 10.237.60.101 with SMTP id u34mr8607428qte.153.1506094885725;
	Fri, 22 Sep 2017 08:41:25 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id z75sm71742qkb.71.2017.09.22.08.41.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Sep 2017 08:41:25 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Amarnath Valluri <amarnath.valluri@intel.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri, 22 Sep 2017 12:39:56 -0300
Message-Id: <20170922154014.29350-17-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170922154014.29350-1-f4bug@amsat.org>
References: <20170922154014.29350-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-trivial] [PATCH 16/34] hw/tpm: remove old i386 dependency
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
X-List-Received-Date: Fri, 22 Sep 2017 15:41:32 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/tpm/tpm_passthrough.c | 1 -
 hw/tpm/tpm_tis.c         | 1 -
 2 files changed, 2 deletions(-)

diff --git a/hw/tpm/tpm_passthrough.c b/hw/tpm/tpm_passthrough.c
index 9234eb3459..461f551a0c 100644
--- a/hw/tpm/tpm_passthrough.c
+++ b/hw/tpm/tpm_passthrough.c
@@ -29,7 +29,6 @@
 #include "sysemu/tpm_backend.h"
 #include "tpm_int.h"
 #include "hw/hw.h"
-#include "hw/i386/pc.h"
 #include "sysemu/tpm_backend_int.h"
 #include "tpm_tis.h"
 #include "tpm_util.h"
diff --git a/hw/tpm/tpm_tis.c b/hw/tpm/tpm_tis.c
index a6440fef91..a3a93f7229 100644
--- a/hw/tpm/tpm_tis.c
+++ b/hw/tpm/tpm_tis.c
@@ -28,7 +28,6 @@
 #include "sysemu/block-backend.h"
 #include "exec/address-spaces.h"
 #include "hw/hw.h"
-#include "hw/i386/pc.h"
 #include "hw/pci/pci_ids.h"
 #include "tpm_tis.h"
 #include "qapi/error.h"
-- 
2.14.1


