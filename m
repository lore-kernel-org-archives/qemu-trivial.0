Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j3zQf-00020S-7G
	for mharc-qemu-trivial@gnu.org; Tue, 18 Feb 2020 04:44:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43594)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j3zQc-0001sv-Gw
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 04:44:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j3zQb-00063o-KQ
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 04:44:30 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:45999
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j3zQb-00063W-Gx
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 04:44:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582019069;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=40zqfghgSnOWp3sxm5Gs0HxCk7BfBA2vJWHYVREX1q4=;
 b=GoFpPQkb6UheF1vOCcgeQGCiipnhAw+2DrgLRBUBiIPi1gxW/aoj18sB5vhJdKX7xgIDUM
 qHrgGsqB8MqsS6xEHrHAt5I/lyz1YtOwmZeIJeLqR8YkZQIkEtr3UwVXhrXdxO7xMt9c6z
 TFpqrXk2Ze7WIpHpQx8cds15hT+Um7M=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-thZyJin3P0Gcs2RdJrWzyw-1; Tue, 18 Feb 2020 04:44:26 -0500
Received: by mail-wm1-f71.google.com with SMTP id m4so878736wmi.5
 for <qemu-trivial@nongnu.org>; Tue, 18 Feb 2020 01:44:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bfCwsKB+QGICVw4yPnq5z2hHQ+37s3RqO+sYab9kkJ4=;
 b=ufvWXl7r+U86KSC8smfy1wgSRLuQ3by/RutHsonVbQ9r7n4hiNxZZHKwQCxcB9xmq+
 VLWqpCORKczInE4c79dwx26+Xge3BSRElJbFNF03SqRHn4d4WRpwTEQrMwoq3R9TQzD5
 1vrXSQH/htuLm1ADmlSKmgCTSHpnRJjs/spkI6HaUFJCfqqXkqpBfAlTjoyYk8RwVhN/
 DpcmktuvziaVNigQGyBgkuUdEpF10wfauMlQVAL7BA7cXo+DMEMKdaZh/KOZfoZLk7Ks
 Aq0iDSaTycQYQXZE6+qrimSW8ZmdsTl5FOCbkoCUNIMe/VBLSWy2caWE2fce0mfoL9Cs
 8d3w==
X-Gm-Message-State: APjAAAWHOm/3cJNF1c9hNaAvATm9Pjdbcj+EvfA7oAyfvT1bo3eE1jUS
 hRWwYTneIDX3WhN1vtZdUaN76FBriuHWos4QZQVnh7us22IWfPllHGKYdjHa+GdmUuPzolpRcRv
 KBa+GdrkafKFzxSgGUQ==
X-Received: by 2002:adf:8b54:: with SMTP id v20mr28936769wra.390.1582019065688; 
 Tue, 18 Feb 2020 01:44:25 -0800 (PST)
X-Google-Smtp-Source: APXvYqxyiqZGixY74dt7rvy2/XkLF8pR4v15It2iHhUudf3pLbbos0wkdDFg4OcP8GN5Io4KyVOXhQ==
X-Received: by 2002:adf:8b54:: with SMTP id v20mr28936743wra.390.1582019065492; 
 Tue, 18 Feb 2020 01:44:25 -0800 (PST)
Received: from x1w.redhat.com (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id z10sm2735588wmk.31.2020.02.18.01.44.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 01:44:25 -0800 (PST)
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH RESEND 10/13] ui/input-barrier: Remove superfluous semicolon
Date: Tue, 18 Feb 2020 10:43:59 +0100
Message-Id: <20200218094402.26625-11-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200218094402.26625-1-philmd@redhat.com>
References: <20200218094402.26625-1-philmd@redhat.com>
MIME-Version: 1.0
X-MC-Unique: thZyJin3P0Gcs2RdJrWzyw-1
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
X-List-Received-Date: Tue, 18 Feb 2020 09:44:31 -0000

Fixes: 6105683da35
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
Cc: Laurent Vivier <laurent@vivier.eu>
---
 ui/input-barrier.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ui/input-barrier.c b/ui/input-barrier.c
index fe35049b83..527c75e130 100644
--- a/ui/input-barrier.c
+++ b/ui/input-barrier.c
@@ -455,7 +455,7 @@ static gboolean writecmd(InputBarrier *ib, struct barri=
erMsg *msg)
         break;
     default:
         write_cmd(p, barrierCmdEUnknown, avail);
-        break;;
+        break;
     }
=20
     len =3D MAX_HELLO_LENGTH - avail - sizeof(int);
--=20
2.21.1


