Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j9cLo-0000tA-Su
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2020 17:18:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33110)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j9cLf-0000Ue-2Y
 for qemu-trivial@nongnu.org; Wed, 04 Mar 2020 17:18:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j9cLe-0006v7-1M
 for qemu-trivial@nongnu.org; Wed, 04 Mar 2020 17:18:39 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:60515
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j9cLd-0006un-UK
 for qemu-trivial@nongnu.org; Wed, 04 Mar 2020 17:18:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583360317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CFcihQRQW984a0z/mekZG0vNwXsxhiN/8+AlkGU0X9k=;
 b=O0hbwbrkQGA9KSuSzguEuNMP71KKEXXg4iqmXmx9QAQkvl3NpO+9YjUGQA3DbPjaWYqan5
 NmFzX6H3JSN32BmYEtwYNatjY+3Qw4nax/0sfwF1L+s5R+URI7qgrda7ltP3PHtV+sD/yn
 FURiTLtVHU6aoqjYtiqq7YLUIdasOqg=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-287-LNwJoC3JNQ6E3nIBl_ud7Q-1; Wed, 04 Mar 2020 17:18:36 -0500
X-MC-Unique: LNwJoC3JNQ6E3nIBl_ud7Q-1
Received: by mail-ed1-f69.google.com with SMTP id l5so2664681eds.23
 for <qemu-trivial@nongnu.org>; Wed, 04 Mar 2020 14:18:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NxwSRvf3xC8N2g5o+oXCsfEFodIN9fcThiRrbeywMlg=;
 b=WfJun3G9rmUSCix2Cns/gTCTjkfvQRdxg/rF2GMGFqSdmGIuFqxe+jiYQrz5l4lyvI
 MY/O7I8JtMfM/0ntGkC0SwBFTvVbwAXdbK4W0bKyAfoVaiGD4/hsYRS0BXazxHDgS7X/
 Z17B7FKzZDfsOaCK9fGfLFM7etPfeVbpFkrrIVvNZ+2iFekyMRKZqjV7f9EaseDuRjia
 sYteWwRkNwWCEq0hQBpHkqAP1JuFJeAl7QP4iVxPUUCVvzyfSdFZC6TE4TSHaq0gqh3m
 WmoaL6yOo5W67Wgr5tozyCtnts0rJdxKNcYcqaWAV6JaNV9Z9EhzawfKtGcxo+EDg7S/
 JmhQ==
X-Gm-Message-State: ANhLgQ1O84+ByiX8JboObndiwpqmT1jBYviRYP9WYxUgu3uqbAkdpgz4
 8q/qIlkkxFmeKVmODLuXuO187G+806v5F6yNl2v3JUI2eJcDeVBaymeiAyhiXYfHrKRYBULzsaR
 CzA8+sDUZE6tve/HIGA==
X-Received: by 2002:aa7:c247:: with SMTP id y7mr4714024edo.376.1583360315009; 
 Wed, 04 Mar 2020 14:18:35 -0800 (PST)
X-Google-Smtp-Source: ADFU+vsCGvKZw64GnBwnakygOFTqcpNPa/Q3gqpp7wrdeUodsHHy6zRbfAFju5NyQpibcxt/UU0/iw==
X-Received: by 2002:aa7:c247:: with SMTP id y7mr4713988edo.376.1583360314628; 
 Wed, 04 Mar 2020 14:18:34 -0800 (PST)
Received: from localhost.localdomain (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id a10sm1714629edt.50.2020.03.04.14.18.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2020 14:18:34 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 5/6] ui/curses: Make control_characters[] array const
Date: Wed,  4 Mar 2020 23:18:06 +0100
Message-Id: <20200304221807.25212-6-philmd@redhat.com>
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
X-List-Received-Date: Wed, 04 Mar 2020 22:18:40 -0000

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


