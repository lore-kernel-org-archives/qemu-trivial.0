Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fSBQu-0004ge-0X
	for mharc-qemu-trivial@gnu.org; Sun, 10 Jun 2018 21:15:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42538)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBQq-0004cX-Ej
	for qemu-trivial@nongnu.org; Sun, 10 Jun 2018 21:15:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBQp-0002SE-HV
	for qemu-trivial@nongnu.org; Sun, 10 Jun 2018 21:15:40 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:42569)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBQm-0002Pz-KN; Sun, 10 Jun 2018 21:15:36 -0400
Received: by mail-qt0-x243.google.com with SMTP id y31-v6so18836657qty.9;
	Sun, 10 Jun 2018 18:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Sr6gykSw3TIOiZeaWEqovnrkHbG8qrT1Qjj3S16jXWQ=;
	b=EEPPaG6sA4Pvdm0PIK/gK1NfCOur/BY3eiN2nbAFuHau6DI5EWE/88zl6miTNDcXIe
	KOezmAsD+Ftx4eI48Isbj6tF53egSd5W4zNWUivhW3EoLNAY1nlzMOG0ZBf9wdmCVe8+
	eCkgXQRWh/8gHoCZaHJf9ILJ4JOh4tu/TOnaWZFzqZflhm95bZ6hF9uDCxhJbABMETnS
	yy5XpVQOWxfZ1I6eKG9I9NdMj9DxCrwH4VqiRN8+X7wMM/EZ1NcuttGBHTV/fI3TDiPo
	2AD6jDSOGu2OCdwVkLNG46lsEmPxmVE2Md4l5H3CpWfoAiu/kVDHAObs5T0BHK2dYwnB
	2NQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=Sr6gykSw3TIOiZeaWEqovnrkHbG8qrT1Qjj3S16jXWQ=;
	b=EELTK6a/23wplZnLwt4etzBQCiDhUzGIbLr3yx7OhXVaZNtoJYMlX5u8Yft9kMRSLJ
	7t2xkB1p2Ul6UaetlPeZO76vlS7o45uvrF0l/gEruavVv5sUgOLVh04lTcUM0jDGW9F5
	d4g8HCgV3A85YniF/a4BFa3G+03iymY2cQ+nfJLYutQvtUGmDSj907zVYNqENz44O8ly
	tFapBADRxtGvqEqVWHsQb4UfmNjMwiwhNBnGDTZ/bkz3yOJ6h9XeIWI+fq9Dt7bqedsv
	enKKknEY1S9kNlsCR8AIkkX+DV7Sb150BJRHk3h3MFjaUxP95VNbzjBeGVcc4ORrhvT2
	1gRg==
X-Gm-Message-State: APt69E06HLATsTDYMhAnPgeG7cpTJsJYZY6p2rntvuWovaRorfIRZuOV
	hbdD8UubNI0ghF/L+mNE2yc=
X-Google-Smtp-Source: ADUXVKKVXJs7XFrJkd4lVnkwicHUOaz+o3ACKqjzaVecsUWr1tRqTmmIAwLUSj1q4qcVwqINWYt/1Q==
X-Received: by 2002:a0c:91b5:: with SMTP id
	n50-v6mr13514156qvn.130.1528679736262; 
	Sun, 10 Jun 2018 18:15:36 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	o5-v6sm28237223qtm.60.2018.06.10.18.15.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Jun 2018 18:15:35 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Eric Blake <eblake@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Sun, 10 Jun 2018 22:14:25 -0300
Message-Id: <20180611011501.10235-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180611011501.10235-1-f4bug@amsat.org>
References: <20180611011501.10235-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-trivial] [PATCH v4 04/40] checkpatch: Recognize IEC binary
 prefix definitions
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
X-List-Received-Date: Mon, 11 Jun 2018 01:15:41 -0000

This fixes:

    ERROR: "foo * bar" should be "foo *bar"
    #310: FILE: hw/ppc/ppc440_uc.c:564:
    +        size = 8 * MiB * sh;
    total: 1 errors, 0 warnings, 433 lines checked

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 scripts/checkpatch.pl | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index e3d8c2cdfc..4923674c71 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -322,6 +322,7 @@ sub build_types {
 				(?:${all}\b)
 			)
 			(?:\s+$Modifier|\s+const)*
+			(?:[KMGTPE]iB)
 		  }x;
 	$Type	= qr{
 			$NonptrType
-- 
2.17.1


