Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e6yCv-0006Us-Iz
	for mharc-qemu-trivial@gnu.org; Tue, 24 Oct 2017 08:21:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42388)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e6yCk-0006Op-TD
	for qemu-trivial@nongnu.org; Tue, 24 Oct 2017 08:21:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e6yCh-00076l-NZ
	for qemu-trivial@nongnu.org; Tue, 24 Oct 2017 08:21:10 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:55920)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e6yCa-000716-Nn; Tue, 24 Oct 2017 08:21:00 -0400
Received: by mail-qk0-x241.google.com with SMTP id x82so25918614qkb.12;
	Tue, 24 Oct 2017 05:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=nBfUTueMTs25sanuU9F4anRAVy/kTjYzVlXWe9AqUqc=;
	b=gYN2j8QWoe3amQ6X7a4V8dfpYd1bA9HixyAN9nhwllCWYoDgoD6uTTq0/+34iRgGL1
	QIQEEgNyPvarT3g5jcwyvottbS44/honbCLR6aoEYAk5Wx84pi17PBpiCMw3gqoTwMMg
	nr8y7B83pjC+nEgtkCcBD/l5qxnsz/BEShIid5Z+F03vy1eMJ58QHCYrrZgsBK8Yp1Kj
	AMYrWa6Ay/5p2XEEUWCALg1AZJ/5Fb4qEDV4RRBrrDsWg4elPW5NsBxqLQcL7CUHhnPE
	Dk3iGjt5q4WGhVMi7kqfeRABV2uSWBgYAhA7325/tEQZ9ZuyC/NtPeai4JR6kGj4T0d7
	bsZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=nBfUTueMTs25sanuU9F4anRAVy/kTjYzVlXWe9AqUqc=;
	b=eCIPtLM4EvVAO1vb1rrAKWVX0ZHeLUQhSIenX4XOt4Gwmz4/BoQbe9MS/RBkdYTovz
	XNk8xnNVUkJ33iLT5T2P3pjK661MZIH8vZ9E1D67jj9YXZidkMyN0t9RAi01RMZQeBkK
	L90Wokp7MDiQzIkDaLb8WpsBqSb5lTpowd4CVKp1oNMh72+JEPYexmKO7+9wdFROyRbV
	RC1acAXe0RO7Wd3u4x7eVKlQ3ubMM40hVnWYabWfJgHEFuGZoEQ+kChjI3IjP7AwKeL/
	yDIOMMPk5YLNUR3UflDl4dBSR1mfcdktaeLDHPOoPFZJpB3W1ygJzMd/fj8ww27t59gZ
	I3zg==
X-Gm-Message-State: AMCzsaUeIt+Nmr/be32MSIXTLTWCX8nLa3cSOiZOt8W9wEybRocUkU+Q
	SGMOcWMWijBTC7UO7SrBQRc=
X-Google-Smtp-Source: ABhQp+RLFGuvD5QCTHJT46cs+X8UBAApeIAAR1eoq+N7HPWO0tF6VcknarcO6vqdlgkRZ2WA23Jeyg==
X-Received: by 10.233.237.193 with SMTP id c184mr21607929qkg.265.1508847660255;
	Tue, 24 Oct 2017 05:21:00 -0700 (PDT)
Received: from x1.local ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id n76sm103983qkn.85.2017.10.24.05.20.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 24 Oct 2017 05:20:59 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: BALATON Zoltan <balaton@eik.bme.hu>,
	"Richard W . M . Jones" <rjones@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Amarnath Valluri <amarnath.valluri@intel.com>,
	Juan Quintela <quintela@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	Peter Xu <peterx@redhat.com>
Date: Tue, 24 Oct 2017 09:20:42 -0300
Message-Id: <20171024122045.30072-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc1
In-Reply-To: <20171024122045.30072-1-f4bug@amsat.org>
References: <20171024122045.30072-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-trivial] [PATCH v2 1/4] tpm: add missing include
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
X-List-Received-Date: Tue, 24 Oct 2017 12:21:20 -0000

else file including "sysemu/tpm.h" fails to compile:

  In file included from qemu/stubs/tpm.c:2:0:
  qemu/include/sysemu/tpm.h:36:19: error: implicit declaration of function ‘object_resolve_path_type’ [-Werror=implicit-function-declaration]
       Object *obj = object_resolve_path_type("", TYPE_TPM_TIS, NULL);
                     ^~~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Richard W.M. Jones <rjones@redhat.com>
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


