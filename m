Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dnAxz-0005bc-7c
	for mharc-qemu-trivial@gnu.org; Wed, 30 Aug 2017 17:56:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48924)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnAxw-0005WS-3S
	for qemu-trivial@nongnu.org; Wed, 30 Aug 2017 17:56:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnAxv-0007mj-B8
	for qemu-trivial@nongnu.org; Wed, 30 Aug 2017 17:56:04 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:35398)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnAxt-0007jQ-7g; Wed, 30 Aug 2017 17:56:01 -0400
Received: by mail-qt0-x241.google.com with SMTP id u11so6270002qtu.2;
	Wed, 30 Aug 2017 14:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Gtjaan22qx6wDs40lDSNGCLNDIYxIc5Zyr3d9QJvtBc=;
	b=RhmoelgRL1WeUEnl07uMRvd0Bwig0sewuKayYxkrHQdaCWlYOKyTJtP81z4b8xKQVn
	WSkO734ipVYBRwKAlhVPIfSB67qJl3ipgiVEXwYXpbQ3c8jcnBpq+4oy+L++fbYw3y9L
	IowKKls362lRe8uUdG7CdAeK0ENGp+kpuwx4Vvr1uYMH1MIEx/+qzyNckzwazfjSEOWL
	0h6G3BMA5jxp2CGmfeaMnlE1EuqjzGoyNDoUgBHdf7gErhmBrID6NRRXyAqNwKqskYGs
	MLa6yExv9GAW1BJO3M6wLnix/nWCkgZhacnRjGMdpzP2OHQ3glJthrDMBrxCDyZRtXXw
	zY5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=Gtjaan22qx6wDs40lDSNGCLNDIYxIc5Zyr3d9QJvtBc=;
	b=jKLFHKfvi/nOyXaCB+KV2UTFw9hkJbRTw2aMwqgCCMr0PKX2DBlNAB0hX34O85pwhw
	qDl39NZp3be+rOxelcx9C4tH9EZ7PYZXkehrO2VnR+knDlvH9oaU6ReKMGAgLIBMM2VF
	CnF9hIgbxGrC0AwtiXy/6GjhEdM9cLeGEPTqqOc7XMpGsX3VCDHJuN2CydPQZOvLc1JI
	PsQCTCclRPm2OMPKHT1wWB8i+MuHTtqOIJhdcZsmYh5As1arcN6nTA7fUqTUmCeQp/c2
	tUK5C3xYAHW/6muhDFp/Po++4rUEgsqYSAxq/bLemGW3HBML01Atvu9Wd3s2ID012Qoj
	0nbQ==
X-Gm-Message-State: AHPjjUhJLsNAHEBIgSuzt9ahzzx7ctYtifDGalp64X8/Jqt6upBy+TU8
	8OaDpNsCrhJ4kw==
X-Received: by 10.200.58.193 with SMTP id x59mr4079288qte.261.1504130160671;
	Wed, 30 Aug 2017 14:56:00 -0700 (PDT)
Received: from yoga.offpageads.com ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	w131sm4298690qkb.85.2017.08.30.14.55.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Aug 2017 14:56:00 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Gerd Hoffmann <kraxel@redhat.com>,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Wed, 30 Aug 2017 18:55:14 -0300
Message-Id: <20170830215523.25278-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170830215523.25278-1-f4bug@amsat.org>
References: <20170830215523.25278-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-trivial] [PATCH v2 08/17] MAINTAINERS: add missing USB entry
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
X-List-Received-Date: Wed, 30 Aug 2017 21:56:05 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index eb20365fbb..dd5e2c2b6b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1004,6 +1004,7 @@ F: docs/usb2.txt
 F: docs/usb-storage.txt
 F: include/hw/usb.h
 F: include/hw/usb/
+F: default-configs/usb.mak
 
 USB (serial adapter)
 M: Gerd Hoffmann <kraxel@redhat.com>
-- 
2.14.1


