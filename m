Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gpckW-0007mf-Ih
	for mharc-qemu-trivial@gnu.org; Fri, 01 Feb 2019 12:37:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56921)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gpckS-0007kT-0f
	for qemu-trivial@nongnu.org; Fri, 01 Feb 2019 12:37:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gpckP-0004wm-LN
	for qemu-trivial@nongnu.org; Fri, 01 Feb 2019 12:37:02 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:40150)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gpckN-0004v2-Mo
	for qemu-trivial@nongnu.org; Fri, 01 Feb 2019 12:37:01 -0500
Received: by mail-wr1-x441.google.com with SMTP id p4so7966260wrt.7
	for <qemu-trivial@nongnu.org>; Fri, 01 Feb 2019 09:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=zG/22zAbByh1Zdg0XyvVwChCzzHJP4pVhW4VnRsp3y8=;
	b=fOiXLIohiizzfpgvyfYsh5ngF9+g7V/4hPDrZTuVwyVDhgtBA9/o/3Xxx+hAyUxYq0
	SerWnNTZmByZ9fnBqz/WkFXs8nI5MR9gVK1eG4JBX8Ffo2wVVB4qtW5tfwYjnsluSFYX
	h+DXGU8DxWhKlTMsaub475gVdDC518P5eIa7E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=zG/22zAbByh1Zdg0XyvVwChCzzHJP4pVhW4VnRsp3y8=;
	b=AJkUgfZTz6POn0ahiWZt6exgjqyDY6z3g3K9jXHBcyo3/y14wRdoxmvtFP2aoVAcSh
	RB83IRF1f5JiWXZq2VWcpBa0f0jU4Ok2kNXLb47Bwsh7Qob5n4bauAnQFy/H/lQiLN2H
	l7jm0TKg8GZG4FEVeqYobd94xMS1nsT8YGhAoNnDYkauPZutTRePBE16oU03tpO3gO/K
	eZXumN221bzmi8PwwAPu9sADpIAUQk/Vfz5GCNl6vyf8eGlDJ/pej0kgZVZAdbYA/wgU
	DsZf19eJcEtOQPfd9xWVy6scfOJDx6ssa+TJFuVtoQc2hkcwjkrWgV+ubjfSGBBlfpDe
	4YxQ==
X-Gm-Message-State: AHQUAuZ5X2KPpjY9LqGtaM83rxIBvcCyg9BjN2jWmsKS9qaa79higGx0
	wUvSPm6Tpi7r87vfmrJx9wClfg==
X-Google-Smtp-Source: AHgI3IaLsR4VAGTUloeUWrx0yORkPJRlrxj17YzJrLFt5ZyuTokL5G07tBnRlZxMGrqrPIg7+N5x7g==
X-Received: by 2002:adf:fc51:: with SMTP id e17mr3989921wrs.268.1549042618189; 
	Fri, 01 Feb 2019 09:36:58 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	i186sm5043391wmd.19.2019.02.01.09.36.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Feb 2019 09:36:57 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Date: Fri,  1 Feb 2019 17:36:55 +0000
Message-Id: <20190201173655.4567-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: [Qemu-trivial] [PATCH] qemu-common.h: Update copyright string for
 2019
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
X-List-Received-Date: Fri, 01 Feb 2019 17:37:05 -0000

Update the copyright string we use in version/help output,
since we're well into the new year now.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Better than last year, where we didn't get round to doing
the year bump until September :-)
---
 include/qemu-common.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/qemu-common.h b/include/qemu-common.h
index ed60ba251d8..a1022455199 100644
--- a/include/qemu-common.h
+++ b/include/qemu-common.h
@@ -17,7 +17,7 @@
 #define TFR(expr) do { if ((expr) != -1) break; } while (errno == EINTR)
 
 /* Copyright string for -version arguments, About dialogs, etc */
-#define QEMU_COPYRIGHT "Copyright (c) 2003-2018 " \
+#define QEMU_COPYRIGHT "Copyright (c) 2003-2019 " \
     "Fabrice Bellard and the QEMU Project developers"
 
 /* Bug reporting information for --help arguments, About dialogs, etc */
-- 
2.20.1


