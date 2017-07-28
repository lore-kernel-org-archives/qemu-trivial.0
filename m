Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1daxxY-0004WS-Ez
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 01:37:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48103)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxxU-0004S0-8G
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:37:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxxT-0003gP-EJ
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:37:08 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:37969)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxxR-0003ch-CW; Fri, 28 Jul 2017 01:37:05 -0400
Received: by mail-qk0-x244.google.com with SMTP id v76so8644101qka.5;
	Thu, 27 Jul 2017 22:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=p+aubmVt3jmwrpUIoCVH0SPPTu+CLqbRylS3+kLVciI=;
	b=STJ07aLhO15p83lCVyKc43dmC8tUuEvMWp3hX03W5iHOLYZWfk2dllgFsPXC0o5DjY
	aOaMksof9uh/AlQ9oPM9nm1g2/fcifio2cZFmGP7zvj0abBixsc/WGbKXqjlZSjQV1/7
	/olp1CXdrAxzgXLmqD2VJ6k4vOZYcOTK771dDAIV1fq5vlpXfjq77r/PswdtoRVEMT7c
	Y0pt8kqVuc3+Ujo1OvVgbCyspgoLFALlsl9h7MH9aNFSbf1ei1zKzmg5uWi+bKt53ECz
	PtMdhY1kKJh02xptT5mvHZIZCF0UyhyKf4tHb/5wHJCwSQP0dz7IVCZvT2KvqXt9/Q0Y
	nS4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=p+aubmVt3jmwrpUIoCVH0SPPTu+CLqbRylS3+kLVciI=;
	b=ozH4CmZqBgQ0mlRux5C/SUtSY2xrR4Y1Fdag+z1EsCKDO56Vd509HnhtF+kk+LNpjM
	D/NA5NPoXOVqFCC8xwetDdY2B74+hDj/I81biKUWOAqk8yBSVknOCTgEeY05XPrHFssn
	BOzVDd6VxgfGB1FTU453Vnha3todzDiFgegRHwB0vDuuE0SMFhP/yl94so1QUj3NSN3r
	YTslzaa9wub/tno7TpgNTGA9OC/36uZoaC77+rh0jU9p6txQKqXfyKemIsH+0YWYwdHt
	6ZsYTmNSidfNJD0ITjcFOxnE2hdy38BWKUlmmNkR+YU/WrTSfH5EaBGmnpF7qFEr8X5U
	8uOg==
X-Gm-Message-State: AIVw113mX7bYJiN6G83Yb+FjQbrfhME0vzhWZ4JgCsRclpP6flfd6B0v
	mpxF2g3x1BZlpFpLlUsI+g==
X-Received: by 10.55.180.198 with SMTP id d189mr8178083qkf.103.1501220224938; 
	Thu, 27 Jul 2017 22:37:04 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	h41sm12129560qta.45.2017.07.27.22.37.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jul 2017 22:37:04 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Richard Henderson <rth@twiddle.net>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri, 28 Jul 2017 02:35:41 -0300
Message-Id: <20170728053610.15770-19-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170728053610.15770-1-f4bug@amsat.org>
References: <20170728053610.15770-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [PATCH 18/47] MAINTAINERS: add missing TCG entry
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
X-List-Received-Date: Fri, 28 Jul 2017 05:37:11 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8cb94af6c5..6b83dac812 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1633,6 +1633,7 @@ Common code
 M: Richard Henderson <rth@twiddle.net>
 S: Maintained
 F: tcg/
+F: disas.c
 
 AArch64 target
 M: Claudio Fontana <claudio.fontana@huawei.com>
-- 
2.13.3


