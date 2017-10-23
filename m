Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e6kMj-0008Si-5w
	for mharc-qemu-trivial@gnu.org; Mon, 23 Oct 2017 17:34:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35727)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e6kMg-0008Qe-VL
	for qemu-trivial@nongnu.org; Mon, 23 Oct 2017 17:34:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e6kMg-0000Bc-B7
	for qemu-trivial@nongnu.org; Mon, 23 Oct 2017 17:34:30 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:50419)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e6kMc-00008s-5E; Mon, 23 Oct 2017 17:34:26 -0400
Received: by mail-qk0-x243.google.com with SMTP id o187so23863073qke.7;
	Mon, 23 Oct 2017 14:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ntJ3cc8tRLhQB6KgMJnzmmWDn2qi5mnyartuq6n+M84=;
	b=aUQ1+8ACf4kfLBTL5nwndj1iWdNQa13D5fDGVKvGKk4b5ZadUZGHVhK9wFnzidmRPM
	L1macPcpLhy8bFcWnQe0qp0ptrBFtm+BY9yTfApczje+FV6Zd7mGhQ7XlD8IC5DJ6KgX
	e7fpkt/fAGiB2uD1t0wNxRuJfUf3f6sqJYyTWhJnF8t1KRnod/2/YvRNdXZo4Ih+lywx
	TqVncqtvF6sNVVN7G2YphBEuv8beaQ51qKzumz00+Ifa1yLmm1DGo5rA8P75qvn4NfVQ
	pERPqNavqQfOZpSjU2DeFp+lq6pMnvISX2juAHZh9YxZP1yHdwFyXurTmxZt2gb3tXG3
	e5Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=ntJ3cc8tRLhQB6KgMJnzmmWDn2qi5mnyartuq6n+M84=;
	b=oQD8WFJrpRBEQFR6S81ErAE2F8XCeyPfWnT/1oH81R5TVHg0LXYh70oOePfunklBQO
	suRfxOTnrjKHZPHs3EdALtXlunV338PtCBX/PZRegBMXR7x2f6cOQtNXxtT4GBNUShwD
	W/csn8ndxae8Vv4yMkoHkqB/7NUh7m0ZUnr2tVYxaZqmN5ISxRGFetZx3PHzS3RhrxZE
	1ebB5lsqdAkTMEoketm7wBTP679LqdOulunmFDtHY/zRDd045IZKQiRIjGCNp9TsLgD6
	EvCXcFbhxbQo6La2yaQEIkvfGmdmFaShrwbmaxxa/cW+NFarZydKZRC/pA0o5LTezOO3
	j9xA==
X-Gm-Message-State: AMCzsaXP7GZtgj6OPGEvQNEdl7A8wMHU2QK5EnF0SUQ+ypanty/Qa04U
	0/K2k8S+b7HZKGnYQCIQgmSObyg6
X-Google-Smtp-Source: ABhQp+Ses+/h8iFsFOnhtHHgNs0q3w3AKXLuO0xtDHi6dvCYPCf9X6FQrxo3oXox3Edlh95Ezlugdg==
X-Received: by 10.55.111.3 with SMTP id k3mr20100966qkc.332.1508794465648;
	Mon, 23 Oct 2017 14:34:25 -0700 (PDT)
Received: from x1.local ([181.93.89.178]) by smtp.gmail.com with ESMTPSA id
	s51sm5568381qtk.32.2017.10.23.14.34.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Oct 2017 14:34:25 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: BALATON Zoltan <balaton@eik.bme.hu>,
	"Richard W . M . Jones" <rjones@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>
Date: Mon, 23 Oct 2017 18:33:57 -0300
Message-Id: <20171023213359.23025-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc1
In-Reply-To: <20171023213359.23025-1-f4bug@amsat.org>
References: <20171023213359.23025-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-trivial] [PATCH 1/3] tpm: add missing include
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
X-List-Received-Date: Mon, 23 Oct 2017 21:34:31 -0000

else files including "sysemu/tpm.h" fail to compile:

  In file included from qemu/stubs/tpm.c:2:0:
  qemu/include/sysemu/tpm.h:36:19: error: implicit declaration of function ‘object_resolve_path_type’ [-Werror=implicit-function-declaration]
       Object *obj = object_resolve_path_type("", TYPE_TPM_TIS, NULL);
                     ^~~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/sysemu/tpm.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/sysemu/tpm.h b/include/sysemu/tpm.h
index c8afa179e5..d7a2bd8556 100644
--- a/include/sysemu/tpm.h
+++ b/include/sysemu/tpm.h
@@ -13,6 +13,7 @@
 #define QEMU_TPM_H
 
 #include "qemu/option.h"
+#include "qom/object.h"
 
 typedef struct TPMState TPMState;
 
-- 
2.15.0.rc1


