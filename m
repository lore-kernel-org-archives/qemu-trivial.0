Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fWMJU-0006Lc-0Z
	for mharc-qemu-trivial@gnu.org; Fri, 22 Jun 2018 09:41:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59924)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWMJR-0006JB-Qc
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2018 09:41:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWMJR-0003eC-2b
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2018 09:41:17 -0400
Received: from mail-qk0-x22e.google.com ([2607:f8b0:400d:c09::22e]:44607)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWMJL-0003Y6-Sa; Fri, 22 Jun 2018 09:41:11 -0400
Received: by mail-qk0-x22e.google.com with SMTP id 185-v6so3661475qkk.11;
	Fri, 22 Jun 2018 06:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=KhQeiHbv2jQeMnU8i4jHe6xMTLfXjGUU7tfSsxgUwrA=;
	b=CwvMWg5yg3st5XiqqasivnnCWxphTUYDIR9NxTnw4EMGFVzp4758ulXG8mybdwrJA3
	ovsBnVJzM69J67UcgUPjHucLV6R+73kNJilMFYGljH8RusO68TaFpxR9SeflpG/aea03
	IVlA/UrVbzV+x9K0NyL6CBz/ECJIjv3S1WPRz/zAsQdJ65O68MvmR/xM33NvGqKRErAO
	0I3QwUHvztDJ4V7UKaLi8H+t/WZy1XwKHPKXVo6ayarxsdlb/uJBdq1iLLdOj4KmiX3c
	SkgHrLsdx0OKA59/YMA/7znirWLFAQ+Y+LDaM41au3edXvwe/47WVD+bV1QHv27ZJNYJ
	8O0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=KhQeiHbv2jQeMnU8i4jHe6xMTLfXjGUU7tfSsxgUwrA=;
	b=Bb/o34tDvwC8HHdK6l+QEExeV0FCKVLGG6v55k3SCe16a+pzmNT0j4RrYIwWRAO9mv
	e08W0kC0/RFJwi41ySGzHyHm0e8bkm9PBQDQq6yMfx30gU5RthJrPe1ZqjXHUTHUbMlY
	upWb+EqDOZyXfMnbA1vM2rGz9j5kBFzXs/6Wqj6+jOC3sTYebq8issjM+74bBaB46UcV
	NRYemfDAhG5tOx0t/zIzmZLtg+wXVg+V99P9c2EfioHgDjiuIpzwqpyNRO0yd0Jj67rP
	K4Rqz9kTweM4DzYDG/RQb5iwcnFPR1bB6c18BibsuwXvojh7we3DHE1SIqnzUQ+ttjC6
	3knQ==
X-Gm-Message-State: APt69E2qD9tABk5Sp/HT++qmRZFeOrEOoAIwlKk7PSm7beEuvCdOtiAm
	8KgQJATUklzRtii9Q+mJ3Ig=
X-Google-Smtp-Source: AAOMgpdxxPHo0qdH0d6bAgk3IBCuv69Qkbnqhpm3xCypaWsd/oYj1yr8TMn8hujrO6mQPqyxn1Vesw==
X-Received: by 2002:a37:a0c8:: with SMTP id
	j191-v6mr1305069qke.387.1529674871311; 
	Fri, 22 Jun 2018 06:41:11 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	s39-v6sm6006629qts.42.2018.06.22.06.41.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Jun 2018 06:41:10 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-arm@nongnu.org
Date: Fri, 22 Jun 2018 10:40:32 -0300
Message-Id: <20180622134036.23182-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0.rc2
In-Reply-To: <20180622134036.23182-1-f4bug@amsat.org>
References: <20180622134036.23182-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::22e
Subject: [Qemu-trivial] [PATCH v2 10/14] hw/arm/stellaris: Use
 qemu_log_mask(UNIMP) instead of fprintf
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
X-List-Received-Date: Fri, 22 Jun 2018 13:41:18 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/stellaris.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index a8f1f6a912..d06e366402 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -560,7 +560,7 @@ static void ssys_write(void *opaque, hwaddr offset,
     case 0x040: /* SRCR0 */
     case 0x044: /* SRCR1 */
     case 0x048: /* SRCR2 */
-        fprintf(stderr, "Peripheral reset not implemented\n");
+        qemu_log_mask(LOG_UNIMP, "Peripheral reset not implemented\n");
         break;
     case 0x054: /* IMC */
         s->int_mask = value & 0x7f;
-- 
2.18.0.rc2


