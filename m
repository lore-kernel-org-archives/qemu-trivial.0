Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j7esr-00043b-Mf
	for mharc-qemu-trivial@gnu.org; Fri, 28 Feb 2020 07:36:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48128)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j7esp-000436-17
 for qemu-trivial@nongnu.org; Fri, 28 Feb 2020 07:36:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j7esn-0005Vf-12
 for qemu-trivial@nongnu.org; Fri, 28 Feb 2020 07:36:46 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:59123
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j7esm-0005VN-Qf
 for qemu-trivial@nongnu.org; Fri, 28 Feb 2020 07:36:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582893404;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=FIlmTMpu0TR3Jm42CC0ZHrTElMZFcdsAoFIuBStU0bM=;
 b=BtKEm3Oo31He0Xq0ChSPfD91lYE32wEvVVVX5bCxlY2FbCOl+ceB+kKnHa+g3rpabTByKU
 qvtgkz11yN8B9miJ5l197S3xYrgW1cnb+fibc9nnxU8z9TQTgFZXsbGcRPtYFfCIEI9yPf
 PyDUqhcBqwlFbEsTKY46zNNf77PMvkU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-2L9DqctFN5eDSGOISXggBw-1; Fri, 28 Feb 2020 07:36:42 -0500
X-MC-Unique: 2L9DqctFN5eDSGOISXggBw-1
Received: by mail-wr1-f71.google.com with SMTP id u18so1262860wrn.11
 for <qemu-trivial@nongnu.org>; Fri, 28 Feb 2020 04:36:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ui2X/d9KJvnejpVIJRlUZq/jpmWowgwNnjLdKR9edYk=;
 b=SdvrFK+MrL8fPk6zyofA9uDayzKYWKzeMoae8BfJt2wHbEW/mFh3ZBmLntAeQQUbbf
 mg5cLrMZLsbuRirv4i9zYgE6vqzfgClsTGQ0w7CHpkSWDjulSNFQ3wL5cCf3LjaBRxqC
 17xk4dSFZx3zkX1zA/eahf/a1VNkoB5dJ+RMAHGhgHAM++xfDhENbQKyq/bnJHOxKLKz
 CfpHeBhnYzG3JJEpdjw/L3+dktbV/q161kkjLn5Y4IZ66hrFTVQDyDgOIJv09vxqYAUw
 uEdAiMyFXP47cRpSQ3C9f0Yk9xFGqJQvhjSqVlWV5AgLEspF3+1VfMSMr5E7MVavLiva
 juEQ==
X-Gm-Message-State: APjAAAXwFte6gtoKiedPCnaUVB53hrncCU7WNw4k6Vnl+5V5keoNKMpr
 9vA0HSZJ8Vqr3oc1GkizroelkVW+2QGFh/TGNB6t4FWH4HeLhF505vZPWJjnCOz3Z1vjjvaUxD7
 Lu7yoL9wQBt3hhR1ClQ==
X-Received: by 2002:a05:600c:34d:: with SMTP id
 u13mr4767674wmd.77.1582893401141; 
 Fri, 28 Feb 2020 04:36:41 -0800 (PST)
X-Google-Smtp-Source: APXvYqyH9w9R1EfBb7gx62CPkXsPJGhW+QUb0FJZX6k84o0bpSaaMRTVkDvWwWncpDj+9faUVbshng==
X-Received: by 2002:a05:600c:34d:: with SMTP id
 u13mr4767656wmd.77.1582893400978; 
 Fri, 28 Feb 2020 04:36:40 -0800 (PST)
Received: from x1w.moovbox.local ([185.102.219.36])
 by smtp.gmail.com with ESMTPSA id f11sm2032593wml.3.2020.02.28.04.36.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 04:36:40 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH] block: Remove trailing newline in format used by error_report
 API
Date: Fri, 28 Feb 2020 13:36:37 +0100
Message-Id: <20200228123637.15160-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
X-List-Received-Date: Fri, 28 Feb 2020 12:36:48 -0000

The error_report API doesn't want trailing newline characters.
Remove it, to avoid and error when moving the code around:

  ERROR: Error messages should not contain newlines

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 block.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block.c b/block.c
index 1bdb9c679d..e466d15914 100644
--- a/block.c
+++ b/block.c
@@ -5994,7 +5994,7 @@ void bdrv_img_create(const char *filename, const char=
 *fmt,
             /* Couldn't open BS, but we have a size, so it's nonfatal */
             warn_reportf_err(local_err,
                             "Could not verify backing image. "
-                            "This may become an error in future versions.\=
n");
+                            "This may become an error in future versions."=
);
             local_err =3D NULL;
         } else if (!bs) {
             /* Couldn't open bs, do not have size */
--=20
2.21.1


