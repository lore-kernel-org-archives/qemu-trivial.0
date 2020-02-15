Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j307U-000319-7s
	for mharc-qemu-trivial@gnu.org; Sat, 15 Feb 2020 11:16:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47800)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j307S-0002wj-5y
 for qemu-trivial@nongnu.org; Sat, 15 Feb 2020 11:16:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j307Q-00069n-Vw
 for qemu-trivial@nongnu.org; Sat, 15 Feb 2020 11:16:38 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:23972
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j306y-0005dY-BK
 for qemu-trivial@nongnu.org; Sat, 15 Feb 2020 11:16:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581783368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z2UBuAZivxQ/t2LSYWdCfVvdvGAny5juqMvDOKi7+08=;
 b=Y7XKb4dQfVlD50LPH1gS2bMzGokjvRjxM1VLR/8RRTRpj3NWvTamL8/SzonRtOp9u4Pt3r
 8gJ+V/ZdX4wKNZQIMvk9VKirY0KlbjOeAgl/O3Xp/FIL07QBCxUAGRLsNmAHVyoLxYPoH+
 nqPNSoDz6bq6/YxlBDyHirFxoXWjAPI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-HHSAe34yPHiH9sKRaOnIjg-1; Sat, 15 Feb 2020 11:16:03 -0500
Received: by mail-wm1-f70.google.com with SMTP id z7so5484762wmi.0
 for <qemu-trivial@nongnu.org>; Sat, 15 Feb 2020 08:16:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1vNqWmtTfqRpFkSvpFeliBtBQdDhN9OVYIDlRsAhO9E=;
 b=ijrJj41EipGD4+ehUAJ1xpxf6A7Blr5bgpC0+SoaEwf6vOCYWzwJM4NyRlrHmOd3xi
 gnZnN4iLYt9PQTrr0+aNINrqr4enOxO13ri98xF1SzyP+1mLqV5yyMQR4yoab3oBSdDs
 Z6uIEu16PI1BqUkvEJZR+p5xnDjXBpyxGI6ffquoLcAlOAcu5UH4oTzFjKC6899BVDb2
 9x/OSMIHzDWLcLrsw3v01d+rbGg5dRNg4fk5r1tvRko8HPDFMg6t0d+T6a0tSdaEM9Wd
 39606eaEb267fdICg/eVqAMieptJJpfpPT0mAXyJxqG+Ox33OHenqw7Oj1E1n7p5isM3
 dHwA==
X-Gm-Message-State: APjAAAUZpn42OXTWY3fKyiDk8EL4jnLhIFesOFlyNH0D06Yjz29emXy6
 6ngUJGwno8ROin7y7oShDcWFFqjIU+noXXtINhyR/2JSF/sAfYnTsyDthIeHGhu7xjq5KvYwyax
 //+JSotxGqLlAgeAJ8w==
X-Received: by 2002:a1c:f60e:: with SMTP id w14mr11469969wmc.188.1581783361889; 
 Sat, 15 Feb 2020 08:16:01 -0800 (PST)
X-Google-Smtp-Source: APXvYqyHKeFfmpvOVz4HkZc7Il/FeQ6MQBGmlkbYvmqQyW1P76z6ZX7+OATJk6WrR8Udh7QO5nTWmA==
X-Received: by 2002:a1c:f60e:: with SMTP id w14mr11469954wmc.188.1581783361731; 
 Sat, 15 Feb 2020 08:16:01 -0800 (PST)
Received: from localhost.localdomain (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id w26sm11855872wmi.8.2020.02.15.08.16.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Feb 2020 08:16:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 John Snow <jsnow@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>
Subject: [PATCH 1/3] block/qcow2-bitmap: Remove unneeded variable assignment
Date: Sat, 15 Feb 2020 17:15:55 +0100
Message-Id: <20200215161557.4077-2-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200215161557.4077-1-philmd@redhat.com>
References: <20200215161557.4077-1-philmd@redhat.com>
MIME-Version: 1.0
X-MC-Unique: HHSAe34yPHiH9sKRaOnIjg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
X-List-Received-Date: Sat, 15 Feb 2020 16:16:39 -0000

Fix warning reported by Clang static code analyzer:

    CC      block/qcow2-bitmap.o
  block/qcow2-bitmap.c:650:5: warning: Value stored to 'ret' is never read
      ret =3D -EINVAL;
      ^     ~~~~~~~

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 block/qcow2-bitmap.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/block/qcow2-bitmap.c b/block/qcow2-bitmap.c
index d41f5d049b..8cccc2c9f3 100644
--- a/block/qcow2-bitmap.c
+++ b/block/qcow2-bitmap.c
@@ -647,7 +647,6 @@ static Qcow2BitmapList *bitmap_list_load(BlockDriverSta=
te *bs, uint64_t offset,
     return bm_list;
=20
 broken_dir:
-    ret =3D -EINVAL;
     error_setg(errp, "Broken bitmap directory");
=20
 fail:
--=20
2.21.1


