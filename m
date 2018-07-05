Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fb6eU-0004SS-TO
	for mharc-qemu-trivial@gnu.org; Thu, 05 Jul 2018 11:58:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53010)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fb6eS-0004Pv-FT
	for qemu-trivial@nongnu.org; Thu, 05 Jul 2018 11:58:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fb6eR-00056O-LC
	for qemu-trivial@nongnu.org; Thu, 05 Jul 2018 11:58:36 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:38812)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fb6eR-00056A-H3; Thu, 05 Jul 2018 11:58:35 -0400
Received: by mail-qk0-x243.google.com with SMTP id y4-v6so4736058qka.5;
	Thu, 05 Jul 2018 08:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Vyd9xd4yjHQkxOMLpxcd7OUXKly3wfT11X6sCU5zf0g=;
	b=swLI27bCFmSb6N1jPvcaLvJPEKIkgHFDMViqoJmsOUUVXvfAQi1HnvLMIq/BDdtRe2
	ItLXLjQb0Dyw7uME7Swbf0TEZlzRVe+P0hSs3Vnc8nrKFv32OTrAQV1VHea4vnsBpF13
	h/zehrWW8QmFFsR9IU0tINjpyW4ZJGnmhQhOKHsheaudb3A/khS80z64L2u45Dvxmi36
	ZnF9nCFJXovBM335mSwP485O+Rr+HKLhO02CSnw3HFhOVPlP5pRY82rWQZ9oLmNlPPFo
	q7nKeJjqntoaLfVjvyZxjSX8E16H8hCoW14x8TOg3hjhw+5GaRmnGk0crODhUn6GEnUC
	9C8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=Vyd9xd4yjHQkxOMLpxcd7OUXKly3wfT11X6sCU5zf0g=;
	b=l3lUON0tz8HKX1W0Sx4O3dPoZrBLMz+rrhj+sWPPbmeME8SvZfswxxn7pNYi73wO45
	AX0BaO0/QJ9Xz19eQ351yfIazKiGsYZerLjTsK18l6Ad6XNmjA0Xmxsz4THvHw1MXS+v
	SJO8G4+YFZ9eTtjHTUgwaAoReVT5z2gwIOBFoB6Qm+IJzQGU0U5Eus2Jxq6cdTIZjXmB
	tWZlQvdltG4sPWOJDukTcHJ4aqUFczfWkOvlUHWsgmN94dePy6eYeU1hZ1W+GWaSDyt6
	e79n7YtYKBPN+K9oCv13HLqDrRgfo7aV8h/h9F7AjoHN5tr8Mi+d4f+8wDnz6gM2MRgn
	Z8yg==
X-Gm-Message-State: APt69E2SWgfzz+qq9EeQlMM+BPGqYCEJZSe+DTmgH6Z/dGh6aloibQcF
	Z4jfcJVklFSB5HM5wiK/s/Mw8mRa
X-Google-Smtp-Source: AAOMgpfDGJNwjHseBg8Mf+GSlTAD+V4w8hKhrxBf0KS6CQDG2XAWRKHIOU2B8G4wjcqt27dZQPTr5w==
X-Received: by 2002:a37:d683:: with SMTP id
	p3-v6mr5704160qkl.424.1530806314804; 
	Thu, 05 Jul 2018 08:58:34 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	k66-v6sm4049403qkc.86.2018.07.05.08.58.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Jul 2018 08:58:34 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>
Date: Thu,  5 Jul 2018 12:58:08 -0300
Message-Id: <20180705155811.20366-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180705155811.20366-1-f4bug@amsat.org>
References: <20180705155811.20366-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-trivial] [PATCH v2 4/7] tests/bios-tables-test: Remove an
 useless cast
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Jul 2018 15:58:37 -0000

Patch created mechanically by rerunning:

  $  spatch --sp-file scripts/coccinelle/typecast.cocci \
            --macro-file scripts/cocci-macro-file.h \
            --dir . --in-place

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/bios-tables-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/bios-tables-test.c b/tests/bios-tables-test.c
index 4e24930c4b..c1ad1b3470 100644
--- a/tests/bios-tables-test.c
+++ b/tests/bios-tables-test.c
@@ -319,7 +319,7 @@ static bool load_asl(GArray *sdts, AcpiSdtTable *sdt)
     ret = g_spawn_command_line_sync(command_line->str, &out, &out_err, NULL, &error);
     g_assert_no_error(error);
     if (ret) {
-        ret = g_file_get_contents(sdt->asl_file, (gchar **)&sdt->asl,
+        ret = g_file_get_contents(sdt->asl_file, &sdt->asl,
                                   &sdt->asl_len, &error);
         g_assert(ret);
         g_assert_no_error(error);
-- 
2.18.0


