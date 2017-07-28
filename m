Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1daxyT-0005N7-If
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 01:38:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49099)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxyR-0005Jy-9I
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:38:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxyQ-0004sq-Km
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:38:07 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:33208)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxyM-0004nw-KE; Fri, 28 Jul 2017 01:38:02 -0400
Received: by mail-qk0-x243.google.com with SMTP id d145so17727243qkc.0;
	Thu, 27 Jul 2017 22:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=y056DDS/yZ9nLQ9PomVF6HE4GASgVVQFbl6tXVingeY=;
	b=J5lTd4Mdf3BEFIJTM/wb4MLZTQPqDT1VDS6eZN4QBBwDIrckpfsNV9NQntbR65Kn9F
	mW50AyR9Ppc7sfz5WrL9TM2JoA6uXDKi5J5DxJVwfSEPxnwXlQhpbYtz3X27ejHsZQCb
	xzzQ7WKaVCl9B2KnzdV4WmZkQll9IuPoBmMUySdeq++9idH1h51loNbINLaRRb8jqQwr
	/5k7gegfI52aki8E7eGnx2B89kVSLUqvBX5bes8uRemoPvmUBunHZv5NxCl1aVLGtZQv
	lEnnk1l8vMjEE6lPOj8SuqLIo1OVvujd3LGoZQCS848XPCHCfnvS9C9tRTTIyND7DsOj
	WJTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=y056DDS/yZ9nLQ9PomVF6HE4GASgVVQFbl6tXVingeY=;
	b=AF+RvwdVSCCXkgVlrHd5h34RaTcTy61SY49B0vbqAQNUOmhNX/5PXQJV5as8zUOVRf
	j4V0UzhulOPhU6sCkdlzh8X8TysvxWrizqAWigiRl7kav250PLt9bawxUnvstHNBP0gA
	TV6vRTr6e5MVMikq9Q9VqYCp1ZmcDsrkmpo3dwFSIGGgiaQlJMW8/RTpeQCis+Yr515A
	2JRlrPDZLDlTHO04dkWSkzA2f06Th0hQakFPV2Zq5wt3NEk7YLBm3UTF3bgrmHDFdDla
	5GJtQWV+jyqvH0VZoFTpXTLwCF2LctuNRR6z7L1ndPDpz8EMDSOmPm0zmt7aQZqnbNiB
	iU3A==
X-Gm-Message-State: AIVw11274Xc/prutxoMkjCkUylPF1i99LEl8qzIVTQuZTkOYzlz93u10
	xkUHDpWQJyOagQ==
X-Received: by 10.55.174.133 with SMTP id x127mr9603106qke.286.1501220282217; 
	Thu, 27 Jul 2017 22:38:02 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	h41sm12129560qta.45.2017.07.27.22.38.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jul 2017 22:38:01 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Miroslav Rezanina <mrezanin@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri, 28 Jul 2017 02:36:05 -0300
Message-Id: <20170728053610.15770-43-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170728053610.15770-1-f4bug@amsat.org>
References: <20170728053610.15770-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-trivial] [RFC PATCH 42/47] MAINTAINERS: add missing Bluetooth
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
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 46807decf5..10c34f2d6d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1636,6 +1636,12 @@ F: hw/i2c/core.c
 F: include/hw/i2c/i2c.h
 F: tests/libqos/i2c.?
 
+Bluetooth
+S: Orphan
+F: bt-*.c
+F: hw/bt/
+F: include/hw/bt.h
+
 Usermode Emulation
 ------------------
 Overall
-- 
2.13.3


