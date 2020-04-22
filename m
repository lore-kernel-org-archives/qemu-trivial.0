Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jRFUO-0006Tw-UP
	for mharc-qemu-trivial@gnu.org; Wed, 22 Apr 2020 09:32:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59312)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jRFUL-0006Pe-1C
 for qemu-trivial@nongnu.org; Wed, 22 Apr 2020 09:32:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jRFU8-0002Xp-N1
 for qemu-trivial@nongnu.org; Wed, 22 Apr 2020 09:32:28 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:56598
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jRFU7-0002Te-Bc
 for qemu-trivial@nongnu.org; Wed, 22 Apr 2020 09:32:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587562334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kbhb8PXc0mO/1TMkYieEGxWYqNfWPp+iXA4REG7HVoQ=;
 b=QKRBY4mBh9w7EE8SmDfgLVDyA1ra+DOurQNVHa+p71yy7i45IXZ/haN/T5CNAmJq87MeCU
 L9N/9B8WXy009As12Nvkw7espvK1l6sQJSaVTwoo6YfjNFQQVCtiSmq7onwWNee6igBX/H
 BoxUiKBt3nZ3XPQYVXf+fwu+9vUyMm4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-J-Fb2wKeOu-OYZc-LpqKoA-1; Wed, 22 Apr 2020 09:32:12 -0400
X-MC-Unique: J-Fb2wKeOu-OYZc-LpqKoA-1
Received: by mail-wr1-f70.google.com with SMTP id y10so1051078wrn.5
 for <qemu-trivial@nongnu.org>; Wed, 22 Apr 2020 06:32:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bCsuLg6l9rCOFqdEp8PJclmAT0RCbEg/PEbjffqRb9A=;
 b=oC8PZlO4ORkcnDSgRtqMwm2UvNfK8mq5ncoirXANZmYxANEhDGOsV4g4lv9r30DFbh
 DWerW4Tjv0SCVCqXXXpbwezZAlkfQBHEnBWgFSWKHD3iViZMNp+FMz44nq1jLJUAmULW
 16/HwmsFT6PZy2yMYcXh+1+BHg8JesRxMitMkzAFBHWQSSzl97uh+bP36MRKMb6xK5ZT
 sdWhIAjXDtOoXHVEO+ZSkZqCHuy9+ccVgYCf2X6mkeiUB/i77toJvH89Mq9UTfusIVsw
 SkRoh7WvTmUUQ7cX42B9+bjbjsG5vOTLUSBSRfkIciFW10knPRCKa3OGwjs3UmIRcqOQ
 DRzg==
X-Gm-Message-State: AGi0PubiU3b2ouTP3wp55eFl+wcSwfs3qGvJpcuB0Yh2K5tmb86/yRF8
 ZIgc4xj8ZsQiWy4ROR+UyXhjGfcbrCmucVGFE873O3DbNV25dPcqXYGARcy6+oQFAForAv6Ttsc
 2eXm/yRoATcD5rhY6SQ==
X-Received: by 2002:a7b:c755:: with SMTP id w21mr10387291wmk.120.1587562330234; 
 Wed, 22 Apr 2020 06:32:10 -0700 (PDT)
X-Google-Smtp-Source: APiQypLYA9+ugGytKHJcVjgqQyyLgri/XnZFg00t/v4mlEVQj2OqPIgxDxR5iT3qfGmXy8rHuq1B6w==
X-Received: by 2002:a7b:c755:: with SMTP id w21mr10387279wmk.120.1587562330041; 
 Wed, 22 Apr 2020 06:32:10 -0700 (PDT)
Received: from x1w.redhat.com (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id u127sm8228653wme.8.2020.04.22.06.32.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2020 06:32:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v3 3/9] hw/i2c/pm_smbus: Remove dead assignment
Date: Wed, 22 Apr 2020 15:31:46 +0200
Message-Id: <20200422133152.16770-4-philmd@redhat.com>
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
X-List-Received-Date: Wed, 22 Apr 2020 13:32:30 -0000

Fix warning reported by Clang static code analyzer:

    CC      hw/i2c/pm_smbus.o
  hw/i2c/pm_smbus.c:187:17: warning: Value stored to 'ret' is never read
                  ret =3D 0;
                  ^     ~

Reported-by: Clang Static Analyzer
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/i2c/pm_smbus.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/i2c/pm_smbus.c b/hw/i2c/pm_smbus.c
index 36994ff585..4728540c37 100644
--- a/hw/i2c/pm_smbus.c
+++ b/hw/i2c/pm_smbus.c
@@ -184,7 +184,6 @@ static void smb_transaction(PMSMBus *s)
                 s->smb_stat |=3D STS_HOST_BUSY | STS_BYTE_DONE;
                 s->smb_data[0] =3D s->smb_blkdata;
                 s->smb_index =3D 0;
-                ret =3D 0;
             }
             goto out;
         }
--=20
2.21.1


