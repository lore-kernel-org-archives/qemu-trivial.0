Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iLp8y-0003R3-63
	for mharc-qemu-trivial@gnu.org; Sat, 19 Oct 2019 09:51:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60143)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ash@kambanaria.org>) id 1iLnUT-0006Tf-Ir
 for qemu-trivial@nongnu.org; Sat, 19 Oct 2019 08:05:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ash@kambanaria.org>) id 1iLnUS-0002sG-Gn
 for qemu-trivial@nongnu.org; Sat, 19 Oct 2019 08:05:49 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:35388)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <ash@kambanaria.org>) id 1iLnUS-0002r0-Ba
 for qemu-trivial@nongnu.org; Sat, 19 Oct 2019 08:05:48 -0400
Received: by mail-wr1-x443.google.com with SMTP id l10so8469915wrb.2
 for <qemu-trivial@nongnu.org>; Sat, 19 Oct 2019 05:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kambanaria-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D6rBFCWd7TXy/HRgb/86qSVMzCfvtlb6XwpaugqYJio=;
 b=gPgVTb81Pw3us9IJhAlVxhPES+J2Sl85nnxVQXqggsBUMQNdtCNqhCRcbzDHy7edGe
 aACLUSzrgxJwvqQ30nhdtFlfFVch1Q0+sZpGr07SLr34esmVF6j6M85IzjSj6g20HvP1
 R6mlJpk+07cLJhNOLM/jx8zhmpd8mVO7RHisXLXlXiS26ANxw51eFHI14xcPIuQDP+EI
 O8ROEQtEagGdXlZ2aAHIsKTWdmsfyTxns+1xBQBw6sb8Hx18lcCJOqp/S8chMiIfqm+Q
 2YNX4Qp9hox/Km6uxIuvGSwBtouWV/aAPC3ySE96gSHkiHLwchVo3L+eHqzaI5IVX7mj
 T0dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D6rBFCWd7TXy/HRgb/86qSVMzCfvtlb6XwpaugqYJio=;
 b=OTpu+pCkgK4RAZlfB/5FLyDxoDo62BDCSdUie1vBMnYnHLTSQ+5SnHV7TIHWG4ovEB
 KnG6mx7Fhj1VRpYHRBw5NEbgqkJH81+vau/86iP+LYTYFWrgQEyRWSoi7DamoxYbStaC
 0XrKiHvrsRz/9DNfitMzJcaiBxcudtCiIAjlgYseODIRGdPahmQLh5QdftDbS5jTsayU
 LpNyK9Ps3eCUowpHNZrTozwP8L510xvoUPWJUL/3oL58mbAe9jOUrIq8ug5RFX4s6zw5
 6cZEi+5ef7aFo5elHk0pVnIbmYzCy63nGPrCWTrwouUwg6/3sUk2DxHhjrAoKl6kDIGK
 tC6A==
X-Gm-Message-State: APjAAAV4o6tc02VNH+l95vnc0u3C9sl4jkHEksOg/0m85t3SxENZIYGj
 7cYuMul4nFB5t8QxF2PemrBiiA==
X-Google-Smtp-Source: APXvYqyQel5+wKejBxzlwC+ekLa/M6cOwuskAAo3G3tGR8HRJmTCYAPd0v/I0aNjSAXxs6U2T77JQA==
X-Received: by 2002:a5d:66c1:: with SMTP id k1mr6674234wrw.73.1571486746077;
 Sat, 19 Oct 2019 05:05:46 -0700 (PDT)
Received: from ashopov-C02X544YJHD3.home (ip4da0f75a.direct-adsl.nl.
 [77.160.247.90])
 by smtp.gmail.com with ESMTPSA id z22sm9249550wmf.2.2019.10.19.05.05.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 19 Oct 2019 05:05:45 -0700 (PDT)
From: Alexander Shopov <ash@kambanaria.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Amos Kong <akong@redhat.com>,
 Anthony Liguori <aliguori@us.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Dongsheng Song <songdongsheng@live.cn>, Eric Blake <eblake@redhat.com>,
 Fam Zheng <famz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Pino Toscano <ptoscano@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Thomas Huth <thuth@redhat.com>,
 Wei Huang <wehuang@redhat.com>, Alexander Shopov <ash@kambanaria.org>
Subject: [PATCH 0/1] Update Bulgarian translation
Date: Sat, 19 Oct 2019 14:05:33 +0200
Message-Id: <20191019120534.27479-1-ash@kambanaria.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
X-Mailman-Approved-At: Sat, 19 Oct 2019 09:51:42 -0400
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 19 Oct 2019 12:05:50 -0000

This is the updated Bulgarian translation of Qemu

It has 1 new message translated and corresponds to v 4.1.0 and up
I am sending to the devel list, the trivial patch list and
all people listes as CC, Tested-By, Approved-By in the po dir
Please ping if that is too wide an audience and point me to
the right targets


Alexander Shopov (1):
  Updated Bulgarian translation (19) - 4.1.0

 po/bg.po | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

-- 
2.23.0


