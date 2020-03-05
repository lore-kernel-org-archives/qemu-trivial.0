Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j9psj-0006GV-Q6
	for mharc-qemu-trivial@gnu.org; Thu, 05 Mar 2020 07:45:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41601)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j9psg-00066o-KA
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 07:45:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j9psf-0001Kz-IR
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 07:45:38 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:24573
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j9psf-0001Kh-Er
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 07:45:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583412337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g8JgHjC2tXoZAEY+Z+QWQFzxkwOUopjQLXjv3/2fagw=;
 b=cYbt7cqW9R+N8FRMetQI4rjqmheKWItPO+D+gtYww75G6p1WAQGSFLLhVYp0UU2nDrlX6E
 Z3jlOaHKVOZMbMQ+8H85X1igUSC47FFGIBKoWWM8lmjPUTEyGZjXze5pc5tkXGR72YLdwZ
 hAVQSZi9FzbiJN1BTaBnaEQBxKnteJI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-ZSBEMCQJP8iaQF1HnRP1Ag-1; Thu, 05 Mar 2020 07:45:35 -0500
X-MC-Unique: ZSBEMCQJP8iaQF1HnRP1Ag-1
Received: by mail-wr1-f72.google.com with SMTP id j14so2250397wru.8
 for <qemu-trivial@nongnu.org>; Thu, 05 Mar 2020 04:45:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e8/VptnNWOgnx0RgaFPk1+9lrGqKzxjndWbawBpy4oA=;
 b=bc/StC3LGA0ie4tQDKOPzt/19tsm/6i6LDK4nbQ4uFx6Bzt2widjBc/jb+277uIdfe
 1EFwPCyU9QgIVmdRm5SJ7yiQFzkZf6FauEyBnLO6C8n+Or4VGWQYSchsYTajRT68G9E8
 I3YLbqHGgTz/gvgJuBbpItJFycqIsf5DgLd2F+dArmSI+lVycLXof0+hw+NT3sRGsMDe
 ylSwRtLUO/b00Z5pBIH/QAKUvllrZK1mV50c0uOsamamozRI3WduP6ruf1pJXVEt39n2
 3s9VUF9IHXdBKjigxxI28nlsHplUN8t6awivh5IDeKoZWLgo9IQp5zvQvLcEvN0xfXDx
 K7PA==
X-Gm-Message-State: ANhLgQ13TBvBb24NK8Sfo4/mGKHbik3BWJI4DOVOk8V6ZkX6zR1YLp4M
 +rFRNkLfhT5GR9I4EsVb1cQdRNYCLvTumtBV/bEcPizRx3AIYp6fIWYfIsB4tZ5Stjr/8Dp+7Dh
 piqqHDYqGfym/WdByLQ==
X-Received: by 2002:adf:f041:: with SMTP id t1mr9555759wro.98.1583412334058;
 Thu, 05 Mar 2020 04:45:34 -0800 (PST)
X-Google-Smtp-Source: ADFU+vvBJX4eBPj6deoHJ3R1XiuP/1oQusUpv01W1MI5QD8pSRm/PrjA2JhtMn33wjd9Ey+mMm3Npg==
X-Received: by 2002:adf:f041:: with SMTP id t1mr9555734wro.98.1583412333897;
 Thu, 05 Mar 2020 04:45:33 -0800 (PST)
Received: from localhost.localdomain (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id w16sm10556707wrp.8.2020.03.05.04.45.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 04:45:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH v2 1/9] hw/audio/fmopl: Fix a typo twice
Date: Thu,  5 Mar 2020 13:45:17 +0100
Message-Id: <20200305124525.14555-2-philmd@redhat.com>
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
X-Received-From: 205.139.110.120
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
X-List-Received-Date: Thu, 05 Mar 2020 12:45:40 -0000

Reviewed-by: Laurent Vivier <laurent@vivier.eu>
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


