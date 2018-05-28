Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fNRZW-0007xf-Se
	for mharc-qemu-trivial@gnu.org; Mon, 28 May 2018 19:29:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33344)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNRZV-0007vh-3j
	for qemu-trivial@nongnu.org; Mon, 28 May 2018 19:29:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNRZU-0001rA-Cz
	for qemu-trivial@nongnu.org; Mon, 28 May 2018 19:29:01 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:44861)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNRZS-0001oL-6M; Mon, 28 May 2018 19:28:58 -0400
Received: by mail-qt0-x241.google.com with SMTP id d3-v6so16549707qtp.11;
	Mon, 28 May 2018 16:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=g0InmfQ5j/ssrjex/NLIB/couSgFJu9yQ1HtT53SDsI=;
	b=nTc3j3WPcuWUIzpZVLgMKSnE6ZyRRCEBPO+RwaLlgH34BMpsKIrUq6QITvRy20G071
	7lY2mjfNf/AMMtnRcFyQ6X+EkrAKajDxNFbrsDNnzyrKsgpGH254n4mJzYXmZWmNnmHp
	xDBHgU7PO6NmRz7THab5jKoDN1x4A+rh6FpFmJ++C2jH1LVHCvRjtH/dpGkhoiU/IZ+u
	PTBCMh55lZWxe+EnNS0riFNAUJ/BAg/hpX7C0K4kTV5wOCnxSEYmiflJcPrBCE7YgWaC
	hcC4HKKzskwD28NBSWGJz6n0XrHRIcJTNlvvH75IbOW7WatetpmPWnjrH2xkUj/+kc8/
	X73Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=g0InmfQ5j/ssrjex/NLIB/couSgFJu9yQ1HtT53SDsI=;
	b=DyfDnwUH1clDAw+CjvtL6MLMNu80PeW1VIZthlQztGMDBhPbQQ20K+r9wxP7N6FCkY
	ooW4ANaz1k/LuDJhpEF9cshetSuhHBMsZgAURyiLKQi/EHp0GQ53oyIL2xup7JfdDSde
	y7Kxw5jAlQCjy4HpOWU3zdlMarbxOHsg677DTe/kGf0ZLODM/HdpM7/gV9eAhuqvMVEA
	mbDStWWEfFohhJAHFVdJpOViecmnB4qymYqioZ3aKbFt5bxXuEAKpiNLwd8sC7OMmaNT
	rKWIjmOTqV2rVW4cXhhsgZzG22pqH3Pg4+I+HVpUB/qlopNvYJXGc0WV9MUYNAyDzzMz
	dTjw==
X-Gm-Message-State: ALKqPwdsgl+qxskELySf9ZO6boFSatWt4R9at9pmNu1E22ct0notO5cM
	cwPafQzrSi02RnyeRxA80j0=
X-Google-Smtp-Source: ADUXVKKahmEZXSJfHZjTWqHAfmHoT4d+k27r2wwUizlxMrW5mYqo/FH96ZFOCnw4Gzl+jktZgcL0Ew==
X-Received: by 2002:ac8:5293:: with SMTP id
	s19-v6mr13725324qtn.311.1527550137773; 
	Mon, 28 May 2018 16:28:57 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	s19-v6sm23756182qki.62.2018.05.28.16.28.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 May 2018 16:28:57 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Date: Mon, 28 May 2018 20:27:16 -0300
Message-Id: <20180528232719.4721-19-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180528232719.4721-1-f4bug@amsat.org>
References: <20180528232719.4721-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-trivial] [PATCH v4 18/21] hw/hppa: Remove unused include
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
X-List-Received-Date: Mon, 28 May 2018 23:29:02 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/hppa/hppa_sys.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/hppa/hppa_sys.h b/hw/hppa/hppa_sys.h
index a182d1f34e..3f6c145120 100644
--- a/hw/hppa/hppa_sys.h
+++ b/hw/hppa/hppa_sys.h
@@ -3,7 +3,6 @@
 #ifndef HW_HPPA_SYS_H
 #define HW_HPPA_SYS_H
 
-#include "target/hppa/cpu-qom.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_host.h"
 #include "hw/ide.h"
-- 
2.17.0


