Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gk9gR-0001Vi-Bs
	for mharc-qemu-trivial@gnu.org; Thu, 17 Jan 2019 10:34:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38892)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1gk9gP-0001U9-MF
	for qemu-trivial@nongnu.org; Thu, 17 Jan 2019 10:34:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1gk9gL-0006fQ-Fd
	for qemu-trivial@nongnu.org; Thu, 17 Jan 2019 10:34:15 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:39495)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
	id 1gk9gH-0006Ke-Nw
	for qemu-trivial@nongnu.org; Thu, 17 Jan 2019 10:34:11 -0500
Received: by mail-wm1-x341.google.com with SMTP id y8so1502832wmi.4
	for <qemu-trivial@nongnu.org>; Thu, 17 Jan 2019 07:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=x/JUxxg+Tes0uELIGrrEOZ68D61E2JARy/q6EiccMBE=;
	b=JsFgo82PhHoZiRpsRPX6VMZHJw1bMqwAYydhi6xr5J0wHv/C3EoPdhtU26XGb76zzH
	9wwF/XbYe5mQtgFeBTQmJ3j86QAPlht1dmicO/ucOdbazTvboxfMLbnHLiDDM5yerNgk
	YZsCDHt0zrkZPPDxk+gz0z/j/Z7Wpusqe1eCs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=x/JUxxg+Tes0uELIGrrEOZ68D61E2JARy/q6EiccMBE=;
	b=neJ8YKebHvYacnVae032CZ+dDkoG2cv+KbojOmqgtuFZFJyyYZWb3EiC9rrGzHVEIt
	eAfJVp0wiEif1wLrZ3fmbqusak+phHc616oBUVItYy2F2WRO+8Osl1coZhJXFsxSGMWO
	EFtS0g25pkCWZDT7uHav2EanTywKv2AK0z/MYlpmRdF19CvVrfcr2kb+FpOtIpBhzBoG
	2Ua6IBpP/HH0+SId0KLPtWH0w6n0wYbq9kyR5Sjil1fGgCLuMr8TEKuBz7GVqayQfK9Z
	zRDF7YHGl3f8N0qMxrkwC0RBjWq3UYz1HqaN6lDBzcM+P2+AmmxxoNLhyaowAw7zlXhd
	13xQ==
X-Gm-Message-State: AJcUukfSOucU+GyaCAJq4mAqALWCFVsQ3Br1W5Urd6J0xgLgxZ6kIrVm
	aCpuNNYPAn0x/8LVMHRfWDIuKw==
X-Google-Smtp-Source: ALg8bN5+t001Ptk9Gx5JKmlrcf4SWRcknVl55/l6wI5s/I0YKHSxjus0jQEhjM7DngQI78ukBm4qJg==
X-Received: by 2002:a1c:cbc7:: with SMTP id b190mr13050480wmg.13.1547739245995;
	Thu, 17 Jan 2019 07:34:05 -0800 (PST)
Received: from zen.linaro.local ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id
	q9sm124341098wrp.0.2019.01.17.07.34.05
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 17 Jan 2019 07:34:05 -0800 (PST)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id EA5DD3E0335;
	Thu, 17 Jan 2019 15:34:04 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-trivial@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>,
	qemu-devel@nongnu.org (open list:All patches CC here)
Date: Thu, 17 Jan 2019 15:33:38 +0000
Message-Id: <20190117153338.11820-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: [Qemu-trivial] [PATCH] scripts/replay-dump.py: fix utf-8 mangling
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
X-List-Received-Date: Thu, 17 Jan 2019 15:34:18 -0000

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 scripts/replay-dump.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/replay-dump.py b/scripts/replay-dump.py
index 5ae77c8a92..ee7fda2638 100755
--- a/scripts/replay-dump.py
+++ b/scripts/replay-dump.py
@@ -3,7 +3,7 @@
 #
 # Dump the contents of a recorded execution stream
 #
-#  Copyright (c) 2017 Alex BennÃ©e <alex.bennee@linaro.org>
+#  Copyright (c) 2017 Alex Bennée <alex.bennee@linaro.org>
 #
 # This library is free software; you can redistribute it and/or
 # modify it under the terms of the GNU Lesser General Public
-- 
2.17.1


