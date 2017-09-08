Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dqNE7-0007CH-3Y
	for mharc-qemu-trivial@gnu.org; Fri, 08 Sep 2017 13:37:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38953)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dqNE5-0007AF-7Z
	for qemu-trivial@nongnu.org; Fri, 08 Sep 2017 13:37:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dqNE0-0007NB-Uo
	for qemu-trivial@nongnu.org; Fri, 08 Sep 2017 13:37:57 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:33281)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dqNE0-0007Mu-R3; Fri, 08 Sep 2017 13:37:52 -0400
Received: by mail-qt0-x241.google.com with SMTP id h15so1960970qta.0;
	Fri, 08 Sep 2017 10:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:mime-version:content-transfer-encoding;
	bh=0aGMKTal5oQIXsWcNr7OOQIZENCVSdrjkRHTrKlb/HM=;
	b=tXiq0nYGRBsXVMAajlsFJpW7J5ojtVr151ZDA6XScBNdSAEArQBbi6CM/deWY1cFW4
	jLzV3YxBcdj8Xcl7dUzBEoFiF/qYbZR56yw8HyFzZWYLWx/mvoZ7+MMaqNaAx7PBYsM3
	j43JBdGFqt7vK0seOErq+AJRwr2Ny+uLhLCobLgZ0lY3L1541YetOpcm1yu7IInns3xG
	M2k6Z3XYEHeWMwwkk36Dzqk+LpXsCJo44XIruOw8C4zVQPze1cCxDUnR0DBOEZc7AB/v
	GdaAisd1sDlvvFR70CGjdzFS/fZJv+o5YDPhtjbGGzVXXHIsvpI63CsQVgdK0xpUxOBO
	3Rbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:in-reply-to:mime-version
	:content-transfer-encoding;
	bh=0aGMKTal5oQIXsWcNr7OOQIZENCVSdrjkRHTrKlb/HM=;
	b=LUDpt8FK4O/3Bex9qCTMF4Pb+RoeK+8HLFUset+AafVMJgvl0Elf1/T3R4uUWGBIMQ
	rZHtg14Ia+iWb++KHlyYOUDsHh3k0OnUeGBPG632JjsmN5Ugca8G6ZOeGBSUU07U8o3/
	I6SfQ6XBa8KpgESZpy2OMHLjgTI2DPNPHvppEq9FnHTM25FNV8de3aPYhqB+PJ8F12Ob
	+CMvI3cBmypqHxFHd65SV4Wy2lZo+yEjiX6XIU0NiiEclu349rYcBGKtEwjDZFSeNvwO
	rU94yu4ah06bvu/Xev/wyU6i5nDHpLB0cyVGc4ieMYC02c+uFToxN2SkzIT0kpeIpyDE
	TeRA==
X-Gm-Message-State: AHPjjUha5Cb8Grn5O5wSEWZirtu5h03SkRVHCsyhqfqKUjIpx+9EyCny
	0tHRbQA/7spGdsP3g2WfjA==
X-Google-Smtp-Source: AOwi7QC4KByOXtW7WpfuKih0j3V2jyuDcNjiE7JVqTaPdRJVxMsdWbNYMpnwaABdQS9j09fw5CLXfg==
X-Received: by 10.200.57.130 with SMTP id v2mr5077067qte.101.1504892272133;
	Fri, 08 Sep 2017 10:37:52 -0700 (PDT)
Received: from yoga.offpageads.com ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id f4sm1605859qtg.35.2017.09.08.10.37.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Sep 2017 10:37:51 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>
Date: Fri,  8 Sep 2017 14:36:24 -0300
Message-Id: <20170908173632.6711-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170908173632.6711-1-f4bug@amsat.org>
References: <20170908173632.6711-1-f4bug@amsat.org>
In-Reply-To: <20170908173146.6446-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-trivial] [PATCH v3 07/15] MAINTAINERS: add missing USB entry
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
X-List-Received-Date: Fri, 08 Sep 2017 17:37:58 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 39ac5d132a..04cc35cc3a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1004,6 +1004,7 @@ F: docs/usb2.txt
 F: docs/usb-storage.txt
 F: include/hw/usb.h
 F: include/hw/usb/
+F: default-configs/usb.mak
 
 USB (serial adapter)
 M: Gerd Hoffmann <kraxel@redhat.com>
-- 
2.14.1


