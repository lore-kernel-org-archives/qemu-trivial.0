Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j3zQl-0002FX-IY
	for mharc-qemu-trivial@gnu.org; Tue, 18 Feb 2020 04:44:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43761)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j3zQj-0002AT-Ll
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 04:44:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j3zQh-000690-JH
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 04:44:36 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:40415
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j3zQh-00068Y-EI
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 04:44:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582019075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xoqi0ftXRFYJhu37T0Dgt5lu+ZSvSZSENltlLvBq3/Y=;
 b=Rnx875TctDJciB66R6ccgeN5tSUUcJBl95pMtVBnwFpia6JLv0UhwelitG2ULUfPVZ5tGZ
 m1V1brnG8TtnWsD32ZIrheB6Tp6l7pLjVLfa/SM7UrugthsjEe2BOV3OLlpicuyIgLpeXS
 P39ZthqJM//zEVbBfpiOolpwelK+BtY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-wL81eC3zMDWNeUhTKREFYQ-1; Tue, 18 Feb 2020 04:44:33 -0500
Received: by mail-wm1-f72.google.com with SMTP id p2so881136wma.3
 for <qemu-trivial@nongnu.org>; Tue, 18 Feb 2020 01:44:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ro3XhYqIaHVGzILEuv36nU5CQfCJ3/xXhyZLIOGXLvI=;
 b=QhYMlxGWYq3bbToyTpYH/rA58CHV9H68Q0s4pKD/MNVX0Tv2/i8cyasv/CQURbTMs/
 nB049pn3ZpPowoIIqf32Jzz7KDecCajV0m1y6MmqE+tmYmx2PUcM7VP0InnRwHKDpv3J
 MO4WI+GzkoK+dUd6L/7gq09EJZ5iJJdbL1YXdvEOc4fop+EFZCL6Zp/knwUauVTMfZRL
 93GxhbWkmVdPyV+ivuoIt5647dhV1zYGYsZRVhjLk88Lm2oU0wesSwUg9Jl2H7iVoDpX
 EuKqvqPaDnBEK3H9MExuOypFvyF1M8k/AYliwQ/ixrFcj1veZfI9iMgcKOp4zwVnCvzJ
 K/TQ==
X-Gm-Message-State: APjAAAUfzJpBSbJNMVF4mEkiLcS86q3Hxb+JJ7Q4MulBcXY7/B9QNwed
 DfYvsV/Pj0Ue5q1HvvEaV+RoTSh2hq5oKrkT1HVJqxFHgFLBBDQRERHJQcx2M1Sw6Mkum/Qe+05
 jcl2tGMKknNorBGqPWQ==
X-Received: by 2002:adf:ed09:: with SMTP id a9mr28611357wro.350.1582019071901; 
 Tue, 18 Feb 2020 01:44:31 -0800 (PST)
X-Google-Smtp-Source: APXvYqya+zpW/vUmislY11k6LSMsxvRy1DxyMqWM3G2WICj/hpS/OZsN9IvFspogUYDC3vJfiONy9Q==
X-Received: by 2002:adf:ed09:: with SMTP id a9mr28611329wro.350.1582019071762; 
 Tue, 18 Feb 2020 01:44:31 -0800 (PST)
Received: from x1w.redhat.com (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id z10sm2735588wmk.31.2020.02.18.01.44.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 01:44:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Max Reitz <mreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Fam Zheng <fam@euphon.net>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <rth@twiddle.net>, Julia Suvorova <jusual@redhat.com>,
 Thomas Huth <huth@tuxfamily.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>, qemu-trivial@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Gerd Hoffmann <kraxel@redhat.com>, Luc Michel <luc.michel@greensocs.com>,
 Laurent Vivier <lvivier@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Shamir Rabinovitch <shamir.rabinovitch@oracle.com>
Subject: [PATCH RESEND 13/13] contrib/rdmacm-mux: Remove superfluous semicolon
Date: Tue, 18 Feb 2020 10:44:02 +0100
Message-Id: <20200218094402.26625-14-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200218094402.26625-1-philmd@redhat.com>
References: <20200218094402.26625-1-philmd@redhat.com>
MIME-Version: 1.0
X-MC-Unique: wL81eC3zMDWNeUhTKREFYQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
X-List-Received-Date: Tue, 18 Feb 2020 09:44:38 -0000

Fixes: a5d2f6f8773
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
Cc: Shamir Rabinovitch <shamir.rabinovitch@oracle.com>
---
 contrib/rdmacm-mux/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/contrib/rdmacm-mux/main.c b/contrib/rdmacm-mux/main.c
index de53048f06..bd82abbad3 100644
--- a/contrib/rdmacm-mux/main.c
+++ b/contrib/rdmacm-mux/main.c
@@ -490,7 +490,7 @@ static int read_and_process(int fd)
=20
 static int accept_all(void)
 {
-    int fd, rc =3D 0;;
+    int fd, rc =3D 0;
=20
     pthread_rwlock_wrlock(&server.lock);
=20
--=20
2.21.1


