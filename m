Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j3071-0002G0-Tw
	for mharc-qemu-trivial@gnu.org; Sat, 15 Feb 2020 11:16:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47687)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j306z-0002Bf-H5
 for qemu-trivial@nongnu.org; Sat, 15 Feb 2020 11:16:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j306y-0005ds-Jp
 for qemu-trivial@nongnu.org; Sat, 15 Feb 2020 11:16:09 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:33514
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j306y-0005dd-GE
 for qemu-trivial@nongnu.org; Sat, 15 Feb 2020 11:16:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581783368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pthG4sX1WmuDcM1pYL7nuZk6uLcNUXuiJV60qYY0Cuc=;
 b=akrmNUWI5h02lM9R76ygewTCbKc3uLce7csB7MhloCnaLmY3odme+1q6Wkwr9UZCD15jHh
 ukqvDj2XeltBMzA+shGrJacMtEwAiQqf6YTe6Y/eI2GMHyVEL0uW21UNG4Ch/YS5jW8ySa
 JbW58eoylgX/qUVcPnnhg8BrXiNgtVQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-96-LxmZD0J9MRuuMUi9WDv0ng-1; Sat, 15 Feb 2020 11:16:06 -0500
Received: by mail-wm1-f69.google.com with SMTP id z7so5484824wmi.0
 for <qemu-trivial@nongnu.org>; Sat, 15 Feb 2020 08:16:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FnvdgJ+pULlElBjPbypj5ZtQBic6wsKotYOG0wxZcb4=;
 b=bOldT+sXN1EUO4UCkd5d4YwHKOPpfaFQCterVy1teZ4/v9C7VlibFgUG3xJMj3cALU
 2n9HhHN1nuiDVZel8X8/ldXGsqWT8k4n8lEETg2jxlhh/1mLX76FgL2AvzEqjORo5qeI
 0MFOw4ZDSHl5ixxa5UIJ7dpAV9N052OHSHd0zrIMzX83S9ENjpRSFrnlF9nU6dAj1ejX
 D3pE7C21ZsmUcqpwvnPxeq4mQqdVGJddse55jk9UBczhW5yYRdD7fYDVAHwwKqwO9qOf
 D4ogTtCnxukry+ql26owdX6SCb8CnqFwHPta6nx5O6Oy0FKoVfETkJTO41BpGDLQKujI
 6+gw==
X-Gm-Message-State: APjAAAXeWBlk3VbbN29SD1Mo9hzIAcuuoaPnghU/JjMJQbQZ5IkRJwjw
 k29N6HBWbudhLp6Zfj4JUGgJOKZb+PvlHvp7fuZvfhEHp7hjPCPvWzjOplsqjVHCllCjsa/CL54
 FbPL8v8bsj0QXHkqf/w==
X-Received: by 2002:adf:fd0e:: with SMTP id e14mr10590720wrr.127.1581783364858; 
 Sat, 15 Feb 2020 08:16:04 -0800 (PST)
X-Google-Smtp-Source: APXvYqy/QDpZRjslcyFsFHRjtLnaMikvruJ3gCZAD8x7auXnoxru3hRQh1UJq8R17PhP9hIZE7mF9A==
X-Received: by 2002:adf:fd0e:: with SMTP id e14mr10590704wrr.127.1581783364655; 
 Sat, 15 Feb 2020 08:16:04 -0800 (PST)
Received: from localhost.localdomain (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id w26sm11855872wmi.8.2020.02.15.08.16.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Feb 2020 08:16:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 John Snow <jsnow@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>
Subject: [PATCH 3/3] hw/block/pflash_cfi02: Remove unneeded variable assignment
Date: Sat, 15 Feb 2020 17:15:57 +0100
Message-Id: <20200215161557.4077-4-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200215161557.4077-1-philmd@redhat.com>
References: <20200215161557.4077-1-philmd@redhat.com>
MIME-Version: 1.0
X-MC-Unique: LxmZD0J9MRuuMUi9WDv0ng-1
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
X-List-Received-Date: Sat, 15 Feb 2020 16:16:10 -0000

Fix warning reported by Clang static code analyzer:

    CC      hw/block/pflash_cfi02.o
  hw/block/pflash_cfi02.c:311:5: warning: Value stored to 'ret' is never re=
ad
      ret =3D -1;
      ^     ~~

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/block/pflash_cfi02.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index 7c4744c020..12f18d401a 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -308,7 +308,6 @@ static uint64_t pflash_read(void *opaque, hwaddr offset=
, unsigned int width)
     hwaddr boff;
     uint64_t ret;
=20
-    ret =3D -1;
     /* Lazy reset to ROMD mode after a certain amount of read accesses */
     if (!pfl->rom_mode && pfl->wcycle =3D=3D 0 &&
         ++pfl->read_counter > PFLASH_LAZY_ROMD_THRESHOLD) {
--=20
2.21.1


