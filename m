Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jRFUL-0006Pw-Dw
	for mharc-qemu-trivial@gnu.org; Wed, 22 Apr 2020 09:32:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59126)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jRFU2-0006GW-Ue
 for qemu-trivial@nongnu.org; Wed, 22 Apr 2020 09:32:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jRFTz-0002B9-So
 for qemu-trivial@nongnu.org; Wed, 22 Apr 2020 09:32:10 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:47373
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jRFTz-00026x-FV
 for qemu-trivial@nongnu.org; Wed, 22 Apr 2020 09:32:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587562326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EddQPcYtdLgHdxZ2GiPc2DPPevSFRzd+HN7v8HerO6Q=;
 b=DjTedRQM2b1TdvcLhnjXFp/fNmfkETkQ/lUV77tw3TkRmmzZQ2/jSfJ9oIbjR9T06pjKoV
 3oYH6F8xx3B1nV+4H5HjXUCl3KsM9Smnqi69hSdV+/n04yIBAMJYT0MBYgoYvkekawMBUZ
 BMNLvqauZ2DM7w3jPNaQTy3HzmIPkoE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-q1sVwsPgNZGQ8rhpJHt2PQ-1; Wed, 22 Apr 2020 09:32:01 -0400
X-MC-Unique: q1sVwsPgNZGQ8rhpJHt2PQ-1
Received: by mail-wm1-f72.google.com with SMTP id h184so804206wmf.5
 for <qemu-trivial@nongnu.org>; Wed, 22 Apr 2020 06:32:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W1lYGStJLCIwnYjiuY8mcwIaZ71ZmPjavSPH5JD14Mc=;
 b=BbR6wDz0SHYjoZpJy8H7qrrye54YRGk3vg8F5M0PFWFxvqos5ObKfA3kGkd69wPYZ5
 uNaIz+jGqd5VdrRhoLbvlY+4Av70lgchXlNu67KbPCjUt1ON4fTXEJOMPf6DhiEvuyhZ
 Ch3M5jxuNwzphrWdi/eS2ytyOOImnnwq4DC/Hngd/SYSizoLJu4vuuuszBg6bVf7LJBt
 wHlUCeP+HZI/0b6gcJwnu19ogPGQhAFwl92qoMp58FFGaa6Z2WWm/ySn/EOX+TvvmxqE
 nogr02aZ5SkZ/2PT6ReXLwbUhKpD7oq/Ugp7Q6ZAghaJh4Dl8nlB+uLuGYAeo+ZS3g0c
 KLTA==
X-Gm-Message-State: AGi0PuYRNBr/9oAyZRDeuRqOVD8aRasWobrwPydqhUtQHvSneNLsOnhH
 zBqUIvN52+OvQDogKzqCcKC0Nxw014ATO4QOlaQ+2EBEulRmWBY2PsPxFobLUF0Eg+k1AB/Il5b
 B+Sf+665T8nASa92V2g==
X-Received: by 2002:adf:f0cb:: with SMTP id x11mr30143985wro.266.1587562320628; 
 Wed, 22 Apr 2020 06:32:00 -0700 (PDT)
X-Google-Smtp-Source: APiQypLQNZoYRve3BMh/BCsvwykR4XDFWol49DCJ0F1Tpd1HazAVoxGAfH3vkEkcxaX/yVgFs4TCUA==
X-Received: by 2002:adf:f0cb:: with SMTP id x11mr30143935wro.266.1587562319974; 
 Wed, 22 Apr 2020 06:31:59 -0700 (PDT)
Received: from x1w.redhat.com (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id u12sm8166030wmu.25.2020.04.22.06.31.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2020 06:31:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 qemu-block@nongnu.org (open list:Block layer core)
Subject: [PATCH v3 1/9] block: Avoid dead assignment
Date: Wed, 22 Apr 2020 15:31:44 +0200
Message-Id: <20200422133152.16770-2-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200422133152.16770-1-philmd@redhat.com>
References: <20200422133152.16770-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/22 02:57:52
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
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
X-List-Received-Date: Wed, 22 Apr 2020 13:32:26 -0000

Fix warning reported by Clang static code analyzer:

  block.c:3167:5: warning: Value stored to 'ret' is never read
      ret =3D bdrv_fill_options(&options, filename, &flags, &local_err);
      ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fixes: 462f5bcf6
Reported-by: Clang Static Analyzer
Suggested-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 block.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block.c b/block.c
index 2e3905c99e..27e7e0e3ab 100644
--- a/block.c
+++ b/block.c
@@ -3171,7 +3171,7 @@ static BlockDriverState *bdrv_open_inherit(const char=
 *filename,
     }
=20
     ret =3D bdrv_fill_options(&options, filename, &flags, &local_err);
-    if (local_err) {
+    if (ret < 0) {
         goto fail;
     }
=20
--=20
2.21.1


