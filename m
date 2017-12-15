Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ePgi9-0001qM-H0
	for mharc-qemu-trivial@gnu.org; Thu, 14 Dec 2017 22:30:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33609)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgi7-0001oj-MK
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:30:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgi4-0003jH-I3
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:30:55 -0500
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:34756)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgi2-0003e3-CQ; Thu, 14 Dec 2017 22:30:50 -0500
Received: by mail-qk0-x243.google.com with SMTP id d66so8877723qkg.1;
	Thu, 14 Dec 2017 19:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=5Pw4Np50dn9QasiSF5WwRufKEYn0jeLcynVIx7cYN7s=;
	b=N+PUyLe3SdsD3AWOTwM1alOFF7udBYjpvaw+4bB5ERUUz7ihkerAk2X06jVXFfA7xU
	lRbtUioDpHkhiOCd4xZNoUawc+JPz/3o7GCxVjK21797MI5/n3g587PoxCN+rDGJBGJB
	SZCUIyX4TpJzWgZs941myAyFwBqdT59dgIG3hPkmLbANs2RKvtau2G4jMxWrLRTw0qs/
	rNfFZ0LZFB46UX6LK+w2ZbrMlccYdm8wBv4bH8quljXYX7kLhRrwkaFv5ASww3mXypc1
	K8UyuSfg3Vi0+lJWMtgRr7vLJJx99nYtyYFbolYZxvWmwCnBbuNZb+KSjZAOl3aiplHU
	DLXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=5Pw4Np50dn9QasiSF5WwRufKEYn0jeLcynVIx7cYN7s=;
	b=VpPv+nz2hQgxwEUYlcjam/dj+Haq13R0ZgZIKYHu0V/FCSrDaZ03vf/kxEHtJjmYvC
	8hzTgWrDwpt5PwzPku4pN6apWP9D+f6T7nT/IFoLzPdmQBXGTY1yC9ENWQ925JJKTQXW
	q1zofpRO9GQ4uveJKVgajGMJqRdF/8E30o2swXAUTgPWQzjjz/rDNFhsMBef5LN7YkKJ
	7apMjEf9GgRJz81VuRQFzrgJBCpCRbBE0Jc74ruiyaqoEwrkYdSJr0+FXbT+oWHJqzpW
	ly/FVuZ0k6QdTI0T0uTORa7rkyfeHC935Oqfe+VOpcGwuofDzPp/Hq3+rW/NG7uqVKP+
	ogkQ==
X-Gm-Message-State: AKGB3mLaG44SIHIRWBq6flwvqX35WUpiRX4suuRYAh1lzbPdcREl1Vf6
	1q9/cmFCeLY7BtEJ9+Q4lU8=
X-Google-Smtp-Source: ACJfBov8isDXBMXHphLGMw2bTBp6vFPnOkfvqCcRCXL/NuPWeHYAqMmXrY0Y5mx9AQyFnIfN7uxkgA==
X-Received: by 10.233.216.67 with SMTP id u64mr18173471qkf.220.1513308649961; 
	Thu, 14 Dec 2017 19:30:49 -0800 (PST)
Received: from x1.local ([181.91.222.165]) by smtp.gmail.com with ESMTPSA id
	q24sm3794605qkq.63.2017.12.14.19.30.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 19:30:49 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org
Date: Fri, 15 Dec 2017 00:29:40 -0300
Message-Id: <20171215033015.738-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171215033015.738-1-f4bug@amsat.org>
References: <20171215033015.738-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-trivial] [PATCH v4 08/43] MAINTAINERS: add missing entry for
 include/hw/net/
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
X-List-Received-Date: Fri, 15 Dec 2017 03:30:57 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Hervé Poussineau <hpoussin@reactos.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9505c3f90a..f299dc2c19 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1004,6 +1004,7 @@ Network devices
 M: Jason Wang <jasowang@redhat.com>
 S: Odd Fixes
 F: hw/net/
+F: include/hw/net/
 F: tests/virtio-net-test.c
 T: git git://github.com/jasowang/qemu.git net
 
-- 
2.15.1


