Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j9cLN-0008Oa-Ro
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2020 17:18:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32937)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j9cLL-0008Mn-Af
 for qemu-trivial@nongnu.org; Wed, 04 Mar 2020 17:18:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j9cLK-0006VC-16
 for qemu-trivial@nongnu.org; Wed, 04 Mar 2020 17:18:18 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:40205
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j9cLJ-0006UQ-Tp
 for qemu-trivial@nongnu.org; Wed, 04 Mar 2020 17:18:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583360297;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rtGLaqsaZvVKv8neLsnCoHMeb27hmi8Np6ey/SFBDes=;
 b=hOBS8B9KFN1DeRSJu4Sox2buPgGKK4gZeBoOyevDsFeXRyFx+MZQ4YPiczvR8TA8oKlFUZ
 HJE/ikO4pmUPU7mbl7IdlxVshXG1mISc4DX/dwZzaPnjTabwp8TgvPOIWAfnjrfgWm2onz
 tfNgIPA+JzUegA1LoC2Pc/glcGrxcZk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-iSCHGqZtOeWiSrNcPuK4rA-1; Wed, 04 Mar 2020 17:18:15 -0500
X-MC-Unique: iSCHGqZtOeWiSrNcPuK4rA-1
Received: by mail-wr1-f72.google.com with SMTP id t14so1436529wrs.12
 for <qemu-trivial@nongnu.org>; Wed, 04 Mar 2020 14:18:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Wqft5lo3Zm47BUbzrIIQxJ61cvphsmqIQUJGbmyNiH4=;
 b=FO2Y6eReYYeUh1gY883xDr3BOdyCRUtOb1ls4I/zEeghqqnDB8ek06JGRbh8Roqeed
 1ZyXb8OFQwFqmCzF7yrY6QrsyZqPgDPjWz7n3ve8SmmpRezjDdwjRXMVLiR9JZ+dvI1r
 Vs7Rrn941+c1oM9iPLkERB7YD1fShtief/Q4ApJOOTYK0ws9L6mxO4RcxGziYRaZWmhc
 iMjwBpEtwF50Nu7JJIidczuW6pMDgmbs8etp/ZO5hkOaLS57OkmvAnmICFhfMwEitD15
 c8hNUkw6Pj7CfH+8x2H3/cVUE45Yg9IgbYmyflSG0z+qiuVL/Oq9o6MIBYqHxLhhmDXh
 bItA==
X-Gm-Message-State: ANhLgQ08iobUjcddzbeYKYOj9nkwjIIlw4Faw2Vcj41vbfWqoMwddthT
 J5x5IwxXH51UYn0vGdFy8r07bLRhEMw9B3vGiFHf9WY57pelaTn0U2U1KZJTjRLNiBzs9IpcwP5
 hSYhXTHprBgvFeta7Ug==
X-Received: by 2002:a05:6000:1246:: with SMTP id
 j6mr4283571wrx.253.1583360294677; 
 Wed, 04 Mar 2020 14:18:14 -0800 (PST)
X-Google-Smtp-Source: ADFU+vsRtmVe+UpthqG+srK5guxiwnqy+NJfe/5y7pjqxGmb4mD83SZz0mvaBII5LFhzV7eC0Fhkxw==
X-Received: by 2002:a05:6000:1246:: with SMTP id
 j6mr4283558wrx.253.1583360294504; 
 Wed, 04 Mar 2020 14:18:14 -0800 (PST)
Received: from localhost.localdomain (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id j5sm6058032wmi.33.2020.03.04.14.18.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2020 14:18:14 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 1/6] hw/audio/fmopl: Fix a typo twice
Date: Wed,  4 Mar 2020 23:18:02 +0100
Message-Id: <20200304221807.25212-2-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200304221807.25212-1-philmd@redhat.com>
References: <20200304221807.25212-1-philmd@redhat.com>
MIME-Version: 1.0
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
X-List-Received-Date: Wed, 04 Mar 2020 22:18:20 -0000

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/audio/fmopl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/audio/fmopl.c b/hw/audio/fmopl.c
index 9f50a89b4a..173a7521f2 100644
--- a/hw/audio/fmopl.c
+++ b/hw/audio/fmopl.c
@@ -1066,7 +1066,7 @@ static void OPLResetChip(FM_OPL *OPL)
 =09}
 }
=20
-/* ----------  Create one of vietual YM3812 ----------       */
+/* ----------  Create one of virtual YM3812 ----------       */
 /* 'rate'  is sampling rate and 'bufsiz' is the size of the  */
 FM_OPL *OPLCreate(int clock, int rate)
 {
@@ -1115,7 +1115,7 @@ FM_OPL *OPLCreate(int clock, int rate)
 =09return OPL;
 }
=20
-/* ----------  Destroy one of vietual YM3812 ----------       */
+/* ----------  Destroy one of virtual YM3812 ----------       */
 void OPLDestroy(FM_OPL *OPL)
 {
 #ifdef OPL_OUTPUT_LOG
--=20
2.21.1


