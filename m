Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dZi7C-0001Y5-I8
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jul 2017 14:29:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50968)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi78-0001UG-64
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 14:29:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi77-000671-EC
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 14:29:54 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:36323)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi75-00065o-GC; Mon, 24 Jul 2017 14:29:51 -0400
Received: by mail-qt0-x244.google.com with SMTP id l55so12887791qtl.3;
	Mon, 24 Jul 2017 11:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=AfCcZSJYqRZF6Ur+KvtsZ+H8mfSHGJUablw83XGMtwE=;
	b=qeJYMYjv8gBz/6lD5HmHKL8rV7bgDgzhWE5JpnfAvzz4Ov4xwBnm8CGs5yrg5MsIFZ
	LM2143JKKNo0YTMUgqspdBtd/xCrEP7xguIhDx8mS+919aVgOuxfPpXQGCNPmKWLjG8X
	pT3ioHug/vjL9NqErNhmyxSMl8yS+yYsFUnpcE4Psf177pDOgdH1FbLY0vKtkK4RaKcQ
	8Vli74GfzV5b7GZmU2F9uRKlPkDrYOsfSlIRZ6prh5FSi94DsGeB+Jbv9CHqsTFFdmvL
	FDXUyl+Fpi/NizMq2aGB0JjnaLMs2s5eiCd6AjDxQttBIqYecf8bd78COZ1QjE8zKMvb
	UJMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=AfCcZSJYqRZF6Ur+KvtsZ+H8mfSHGJUablw83XGMtwE=;
	b=H2BplDxLLYEc5lbEyBXRbG3II0UVHKYR4I+B51GixRp2JpVwh9cVfNigGpzZc/gNSo
	howxTM9y7lWOrKf4SyJbluBYsZ837oe3l71p3O2gmeFKF9ei7SLVlICQOHC/KKc1dD9D
	XNmuRPJXZZE1K1cxZmpJsahJ5nfvdZVuAZg055jc6Bx9Wr/7H6xEdBpZ4/FP3XJf6f4G
	iMepvv7FvGWZxLDJwK/7QZYfxlN/gv9HnHF0fx6UNomf5tyGOUu1+ki2vfxnrDy2prKl
	DBpfrJ6+b4uWC2WxEtDilrrO+27RtAnj2qq2wGJ1B2Wy7D08QYCE8QYi9SYO3W6mYG+k
	agmw==
X-Gm-Message-State: AIVw1132y3lsdwMYDtUgreRktzyX3TMsivE5z4JSylrwa+4MGYtM7UN0
	pWBBVHBd72VCGg==
X-Received: by 10.200.9.27 with SMTP id t27mr21058235qth.107.1500920991061;
	Mon, 24 Jul 2017 11:29:51 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	t57sm9033799qtt.18.2017.07.24.11.29.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Jul 2017 11:29:50 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Fam Zheng <famz@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Mon, 24 Jul 2017 15:27:51 -0300
Message-Id: <20170724182751.18261-36-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170724182751.18261-1-f4bug@amsat.org>
References: <20170724182751.18261-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [RFC PATCH for 2.10 35/35] script to run docker image
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
X-List-Received-Date: Mon, 24 Jul 2017 18:29:57 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 scripts/dockershell | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100755 scripts/dockershell

diff --git a/scripts/dockershell b/scripts/dockershell
new file mode 100755
index 0000000000..f6a2276172
--- /dev/null
+++ b/scripts/dockershell
@@ -0,0 +1,30 @@
+#! /bin/sh
+
+# This script starts a docker shell with QEMU directory mounted
+#
+# Copyright (C) 2017 Philippe Mathieu-Daudé. GPLv2+.
+#
+# Usage:
+# ./scripts/dockershell qemu:debian-bleeding-dev
+
+if [ $# -lt 1 ]; then
+    echo
+    echo "error: missing image name"
+    echo
+    docker images qemu --no-trunc --format="- {{.Repository}}:{{.Tag}}"
+    exit 1
+fi
+
+SDIR=$(cd "$(dirname "$0")/.." && pwd -P)
+CDIR=$(pwd -P)
+
+VOLS="-v /tmp:/tmp"
+if [ "${SDIR}" = "${CDIR}" ]; then
+    VOLS="${VOLS} -v ${SDIR}:${SDIR} -w ${SDIR}"
+else
+    VOLS="${VOLS} -v ${SDIR}:${SDIR}:ro -v ${CDIR}:${CDIR} -w ${CDIR}"
+fi
+
+docker run --rm -it ${VOLS} \
+    -u $(id -u) \
+    $1
-- 
2.13.3


