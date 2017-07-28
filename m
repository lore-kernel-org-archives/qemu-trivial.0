Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1daxyT-0005Nb-V0
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 01:38:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49103)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxyR-0005KD-E8
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:38:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxyQ-0004sz-P4
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:38:07 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:34117)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxyO-0004pq-Mx; Fri, 28 Jul 2017 01:38:04 -0400
Received: by mail-qk0-x243.google.com with SMTP id q66so20243012qki.1;
	Thu, 27 Jul 2017 22:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=n+oFGM00UDGYKJPYGz8ECjI9NFGveE4eeXEckLsK8BI=;
	b=siBv+vHZ2vaawAh6bXumFyWniFZ3QHND09qbCKOZksx3jUg9bMQnR6bg0JFaRwErei
	I6ooUbzjiXUYRRRCRlSnW6JypTU31Ar5xsjo8Tc5GRF2W7lt1Jgw3Nndk6Kj4LD9VhYc
	Tx6AoTqPcF1m+sY/y1bG7PmFkfoBoxIrJJMfyjAA0VEcOXWe5aNc2/+QuAu+OB+2Dd4Q
	NUQmv+9KEam8+bWiWkPZPmMNczHLq+yDX1CJROkXKQHOzrwPFm2R032RjIRwvTnEvuTT
	aSk8oLg557i0untGxaQ8gfDGJWZgA+TJKD2hl+HAKp1NyjArdkF81Mym7hXBX8zXkDIL
	sw5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=n+oFGM00UDGYKJPYGz8ECjI9NFGveE4eeXEckLsK8BI=;
	b=CwmDD+MgSxuWfF1zqJmwfG6Ws3aNzKUBA+yTPDcIDnjClrVi3Q+KN4aWiny+IvM1mj
	LDef6juVRxx7imKQuyewNcNp4FYUdJ1jiEipHJ+o09x8+khGzuqB/GFxGLJ1KCiJVZb6
	xe7QO4brXFAf4kr1DADP0yJMQ7FCCvqdCwNDMYEhFxKbXOnuuSyygGUb5NzLAX6VpCui
	q3EZtatxdu0xxVY5dduFMN+Uc2kjQldaQRMGBbJ68b/vRYbD2b8MKVvDKbh8ATX/k6lv
	5BJxKa2szLFMpTLlcD7KfhnOmoDvXDRua33tSqGEZvaqsB9mj7GWVdg6AeztWDSYQ/oU
	u0jA==
X-Gm-Message-State: AIVw113zCLpkNSWf2SlBFP7nu4sLE7aZrQiM5evhHtIQVmr6Thrcz5Bm
	KePsZRidYvZiPt1AepkU0g==
X-Received: by 10.55.122.68 with SMTP id v65mr8335601qkc.225.1501220284275;
	Thu, 27 Jul 2017 22:38:04 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	h41sm12129560qta.45.2017.07.27.22.38.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jul 2017 22:38:03 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Stefan Berger <stefanb@linux.vnet.ibm.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri, 28 Jul 2017 02:36:06 -0300
Message-Id: <20170728053610.15770-44-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170728053610.15770-1-f4bug@amsat.org>
References: <20170728053610.15770-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-trivial] [RFC PATCH 43/47] MAINTAINERS: add missing TPM
 entries
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
X-List-Received-Date: Fri, 28 Jul 2017 05:38:08 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 10c34f2d6d..453f5fb3d7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1642,6 +1642,13 @@ F: bt-*.c
 F: hw/bt/
 F: include/hw/bt.h
 
+TPM:
+S: Orphan
+F: tpm.c
+F: hw/tpm/
+F: include/sysemu/tpm*.h
+F: backends/tpm.c
+
 Usermode Emulation
 ------------------
 Overall
-- 
2.13.3


