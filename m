Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j9ptc-0008E5-1E
	for mharc-qemu-trivial@gnu.org; Thu, 05 Mar 2020 07:46:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41797)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j9ptC-0007Ve-Dc
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 07:46:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j9ptB-0001iR-FQ
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 07:46:10 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:20803
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j9ptB-0001hY-CK
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 07:46:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583412369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CFcihQRQW984a0z/mekZG0vNwXsxhiN/8+AlkGU0X9k=;
 b=DPFBJWYCY/+koo0lUYhbkUY7ikG740eE5JVSXmAuHqPEHJFfjb/I8WFdjGybBjOT8TDEzr
 lQStswxzlBbboLt9h1Y+S4FNiNlBzZdN61GFihJae8/SbvOLUSPzz7SNrycAS64YM8A9YJ
 QNEPEOXLJ5oMC5UqMJyREHiqZl/9j/M=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-4ncnzKvVNZW9W5oSivXMNQ-1; Thu, 05 Mar 2020 07:46:07 -0500
X-MC-Unique: 4ncnzKvVNZW9W5oSivXMNQ-1
Received: by mail-wr1-f69.google.com with SMTP id m13so2267398wrw.3
 for <qemu-trivial@nongnu.org>; Thu, 05 Mar 2020 04:46:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NxwSRvf3xC8N2g5o+oXCsfEFodIN9fcThiRrbeywMlg=;
 b=WYqRGv7sfbXz7Ozf/kQwMgOWQC1rFB+e9S8XT1oqHA3yY6Xk+M84MiHRIa3VDLPu2S
 AKarkr/Ljn1wtJD05l0A9mr1vP4k+NxYAQZDvKGd50sFY4inoXGi8ufSCKyd381NL4Ng
 yLaPLG0NDf55r7h/S3buxVhogrmtshpyT1GD5M4jBMKtdxo0aMdWEK2joX9UT/wK1Ddv
 q6fg2RHc5R+L1YoMbFc21DhVQT6sXDD75dpMmygG94oyTDhBdNSx5M42cDfGsInUbV1l
 gkmyA//ckBR8yRo7cyqg9PFajHAMKB3rQxq2ickqoSpalfoWgDhRjaRDNMSBVuZvvtTH
 z90Q==
X-Gm-Message-State: ANhLgQ0zRymQlg570DLWU+AB1DbqVsVkmB2cP1nqRgPWADNZ21HBYtBD
 tugdcHkIfic/zIEKPqNFLEU3HSo5rdg/bzGb0snvRIALRkNmNR6myXFJmc6XMMEvO6D+7MotsX2
 dXudBLf355tGA5RXfdw==
X-Received: by 2002:a7b:c5cd:: with SMTP id n13mr9396187wmk.172.1583412366070; 
 Thu, 05 Mar 2020 04:46:06 -0800 (PST)
X-Google-Smtp-Source: ADFU+vtEolt81viS5nizZiXUpufL+W79KWORVOPU66RVR7yAROIfUMT4WtGb5nf8YINqFgi/mzUU9A==
X-Received: by 2002:a7b:c5cd:: with SMTP id n13mr9396172wmk.172.1583412365912; 
 Thu, 05 Mar 2020 04:46:05 -0800 (PST)
Received: from localhost.localdomain (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id s15sm19858655wrr.45.2020.03.05.04.46.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 04:46:05 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v2 7/9] ui/curses: Make control_characters[] array const
Date: Thu,  5 Mar 2020 13:45:23 +0100
Message-Id: <20200305124525.14555-8-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200305124525.14555-1-philmd@redhat.com>
References: <20200305124525.14555-1-philmd@redhat.com>
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
X-List-Received-Date: Thu, 05 Mar 2020 12:46:11 -0000

As we only use this array as input, make it const.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 ui/curses.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ui/curses.c b/ui/curses.c
index 3a1b71451c..3bafc10c1c 100644
--- a/ui/curses.c
+++ b/ui/curses.c
@@ -529,7 +529,7 @@ static void font_setup(void)
      * Control characters are normally non-printable, but VGA does have
      * well-known glyphs for them.
      */
-    static uint16_t control_characters[0x20] =3D {
+    static const uint16_t control_characters[0x20] =3D {
       0x0020,
       0x263a,
       0x263b,
--=20
2.21.1


