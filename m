Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jAGIT-0000XO-5q
	for mharc-qemu-trivial@gnu.org; Fri, 06 Mar 2020 11:58:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34661)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jAGIQ-0000Tz-5O
 for qemu-trivial@nongnu.org; Fri, 06 Mar 2020 11:57:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jAGIP-0003GF-2c
 for qemu-trivial@nongnu.org; Fri, 06 Mar 2020 11:57:58 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:48668
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jAGIO-0003Dd-VV
 for qemu-trivial@nongnu.org; Fri, 06 Mar 2020 11:57:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583513876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=JbZPd/wLu/MyMkULqdcDuthR6H2vGP8ZBti5hBogKwE=;
 b=IROZEM5nfpQfQija7YYNyxNStirrO+OQvzPJBnI4siL10E/FE3LQ26TBldgdFnxdzvepH/
 nKI4ijZ76l2Q2AyKjlVtqGIlch7/QhXvkS3GUtegUqorCPU7VtCeLY+IbB8fNMJPDOTbSP
 JHKeFhg0oV3bZhvTV0bsOn9uUdqN94E=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-HkYH6uoUN3SLlNaBvdneBA-1; Fri, 06 Mar 2020 11:57:54 -0500
X-MC-Unique: HkYH6uoUN3SLlNaBvdneBA-1
Received: by mail-wr1-f70.google.com with SMTP id s10so1262525wrr.21
 for <qemu-trivial@nongnu.org>; Fri, 06 Mar 2020 08:57:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F7l/j/GIgvrAnGNmwDhjdQAQtKm/wVAbt56hHo9kdzs=;
 b=NTFnASyKVq6e/maV1rSjPgvrIs/Y6o9u+S+iAWpPZmwD6+u+HeFRo5wDjQyswo646O
 9nsuFMzzpnt2RKa9rVnZCKkWGLNhuUai4vVJ74749fafpVGBrewz+ESgHlnaiFiDlb60
 WQTBwpqDmbQuFl5GbaGWUbUVwfCS0lM8d2T0zWP8b7wO0v3JfdouG2615nwFlSdNumdx
 l63gm/U4afKPtGFZlME9w2WQlODR5XcOt6RieWNo9qlaOWY9YyabNODjgK0bgBpIJNGj
 Ddd9k9sIGsQPyY8h0lDNmXWzo1V6t1urPwPuA9DaqfZgzedMpFkczRyTAPGWSBiiXf5b
 6sfw==
X-Gm-Message-State: ANhLgQ33OcmuvSCv3fdPZud8HlJY1hFdKH62Lb+b08vRviO/0iDhS1tv
 gWMl1TWzkg76ejM80rn7YjMmVqDbRhJclrtOAWoiOcrnyARzK0KjEpLFWYoHciIHCQJ7rEkTicb
 QU3aEbBpmd9TcwF11Yw==
X-Received: by 2002:a1c:35c6:: with SMTP id c189mr4696238wma.108.1583513873579; 
 Fri, 06 Mar 2020 08:57:53 -0800 (PST)
X-Google-Smtp-Source: ADFU+vtbpBPWvC5539slMSpRFgjb23xZMihyVbGAnueCyZrDt4qDbsdvADaxjoC6HLWmoM/0V6loJQ==
X-Received: by 2002:a1c:35c6:: with SMTP id c189mr4696220wma.108.1583513873276; 
 Fri, 06 Mar 2020 08:57:53 -0800 (PST)
Received: from x1w.redhat.com (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id q16sm34511293wrj.73.2020.03.06.08.57.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2020 08:57:52 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Thomas Huth <thuth@redhat.com>,
 qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH] tests/qemu-iotests: Fix socket_scm_helper build path
Date: Fri,  6 Mar 2020 17:57:51 +0100
Message-Id: <20200306165751.18986-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
X-List-Received-Date: Fri, 06 Mar 2020 16:57:59 -0000

The socket_scm_helper path got corrupted during the mechanical
refactor moving the qtests files into their own sub-directory.

Fixes: 1e8a1fae7 ("test: Move qtests to a separate directory")
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 tests/Makefile.include       | 1 +
 tests/qtest/Makefile.include | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index edcbd475aa..67e8fcddda 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -589,6 +589,7 @@ include $(SRC_PATH)/tests/qtest/Makefile.include
 tests/test-qga$(EXESUF): qemu-ga$(EXESUF)
 tests/test-qga$(EXESUF): tests/test-qga.o $(qtest-obj-y)
 tests/vhost-user-bridge$(EXESUF): tests/vhost-user-bridge.o $(test-util-ob=
j-y) libvhost-user.a
+tests/qemu-iotests/socket_scm_helper$(EXESUF): tests/qemu-iotests/socket_s=
cm_helper.o
=20
 SPEED =3D quick
=20
diff --git a/tests/qtest/Makefile.include b/tests/qtest/Makefile.include
index 383b0ab217..76672990a7 100644
--- a/tests/qtest/Makefile.include
+++ b/tests/qtest/Makefile.include
@@ -287,7 +287,6 @@ tests/qtest/usb-hcd-ehci-test$(EXESUF): tests/qtest/usb=
-hcd-ehci-test.o $(libqos
 tests/qtest/usb-hcd-xhci-test$(EXESUF): tests/qtest/usb-hcd-xhci-test.o $(=
libqos-usb-obj-y)
 tests/qtest/cpu-plug-test$(EXESUF): tests/qtest/cpu-plug-test.o
 tests/qtest/migration-test$(EXESUF): tests/qtest/migration-test.o tests/qt=
est/migration-helpers.o
-tests/qtest/qemu-iotests/qtest/socket_scm_helper$(EXESUF): tests/qtest/qem=
u-iotests/qtest/socket_scm_helper.o
 tests/qtest/test-netfilter$(EXESUF): tests/qtest/test-netfilter.o $(qtest-=
obj-y)
 tests/qtest/test-filter-mirror$(EXESUF): tests/qtest/test-filter-mirror.o =
$(qtest-obj-y)
 tests/qtest/test-filter-redirector$(EXESUF): tests/qtest/test-filter-redir=
ector.o $(qtest-obj-y)
--=20
2.21.1


