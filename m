Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1flZsI-00074D-4Q
	for mharc-qemu-trivial@gnu.org; Fri, 03 Aug 2018 09:12:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49034)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dracc@dracc.se>) id 1flZeW-0002da-9e
	for qemu-trivial@nongnu.org; Fri, 03 Aug 2018 08:57:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dracc@dracc.se>) id 1flZeS-0002bA-FQ
	for qemu-trivial@nongnu.org; Fri, 03 Aug 2018 08:57:56 -0400
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:35582)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <dracc@dracc.se>) id 1flZeS-0002ad-4l
	for qemu-trivial@nongnu.org; Fri, 03 Aug 2018 08:57:52 -0400
Received: by mail-lf1-x143.google.com with SMTP id f18-v6so4002464lfc.2
	for <qemu-trivial@nongnu.org>; Fri, 03 Aug 2018 05:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dracc-se.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:cc:subject:message-id:mime-version:content-disposition
	:user-agent; bh=dGyKQP5n/BkB3ZLey5H5EmtZk72hYhvBmiV8cHMI2Kw=;
	b=N0Ro9UJlG1kQzNe/9YaKKghPm2BflICU0VBQxqhcg/jB8g1zi/nGXVY1w1NnyfaJ8M
	VYdmySlVHGzKay0hQkC8+rDd5QhwEPM6acNpBM3SkQWIm4ZOFPWlaXVbEhXMA6l65X9P
	/wEeqaEzPOHITwcRrccR5UyFamixSBHGCoP9u+OfJ/dxLMFmmbp6YDAxfL227SPRgvQN
	/2pCAK4BfR/NONufCOscWCaMvQmIcC2X7sczCxqNUqZbyZrNQ98WFYM04wHGpo5IT+x3
	OTeib887Ism2D1MVuL/HcHb683wrgmBWhSHqXwFUCFECw/xBg6IJRzKe1jB/cQYXEYqm
	Dwvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=dGyKQP5n/BkB3ZLey5H5EmtZk72hYhvBmiV8cHMI2Kw=;
	b=nDF5SPhUABJB0JDa3MySUeTUH08WI4U2Zub3K6Qn8TyV3k8qXFkNFM2VUoxiRCIaYJ
	TLVxKvkzulR7k2iaQrDcVR0ThKUAIHRTCyTSB+SXPmnjIwJaXvknXsinvHT5OSBND+RC
	Uwtw/KElfmAJaIz1UhTjPIrlfKYSUeTSwqLrntfEn5gsrEdwACDqliIShbjduNDGJtHh
	/eVVxzA3Gqli4ubxRORxppVulq6bUMOHqKk3Vza7MrmTncRln1ckerNI3cHSji1trry9
	ydEf1hJDdTsL38el3Qb4ditt7SdEKbW1F+q0sbN4W9CBfES6lxVyG7l1m7ULyLUR7RCY
	ND0A==
X-Gm-Message-State: AOUpUlFnBSCr711GzBzmF2MPgGCEtINgRTAN9LsMp8H/T+vjUIoMqqAl
	yVl8P9RBOBrlP8E4/Ikgy1vuLQ==
X-Google-Smtp-Source: AAOMgpcJy1HrrtUZd6JuD3FWzdMhL1e7iSrwQzdj0wzbkKqv+g3nNsuppve+inKW1/Yadm2BE0y0ow==
X-Received: by 2002:a19:4a03:: with SMTP id
	x3-v6mr4883709lfa.136.1533301064563; 
	Fri, 03 Aug 2018 05:57:44 -0700 (PDT)
Received: from SEJKG-L-LAN04.air5.flaktwoods.net (static-74-253.wetternet.net.
	[92.42.74.253]) by smtp.gmail.com with ESMTPSA id
	x65-v6sm704866lfa.77.2018.08.03.05.57.43
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 03 Aug 2018 05:57:44 -0700 (PDT)
Date: Fri, 3 Aug 2018 14:57:42 +0200
From: Lucas Eriksson <dracc@dracc.se>
To: qemu-devel@nongnu.org
Cc: eblake@redhat.com, marcandre.lureau@redhat.com, qemu-trivial@nongnu.org
Message-ID: <20180803125736.GA3476@SEJKG-L-LAN04.air5.flaktwoods.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.0 (2018-05-17)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::143
X-Mailman-Approved-At: Fri, 03 Aug 2018 09:12:07 -0400
Subject: [Qemu-trivial] [PATCH] Makefile: Don't add -dirty to pkgversion
 when tree is not dirty
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
X-List-Received-Date: Fri, 03 Aug 2018 12:57:57 -0000

On a clean just-cloned repo, git-diff-index has no local index to
compare with, leading to all files being marked as new on some systems.
git-diff on the other hand actually compares the files contents with the
repository tree and then updates said local index.
This problem was found when trying to automate xqemu builds (an xbox
emulator based on qemu) through the use of AppVeyor.

Signed-off-by: Lucas Eriksson <dracc@dracc.se>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 2da686be33..7b48c43734 100644
--- a/Makefile
+++ b/Makefile
@@ -446,7 +446,7 @@ qemu-version.h: FORCE
 		else \
 			if test -d .git; then \
 				pkgvers=$$(git describe --match 'v*' 2>/dev/null | tr -d '\n');\
-				if ! git diff-index --quiet HEAD &>/dev/null; then \
+				if ! git diff --quiet HEAD >/dev/null 2>&1; then \
 					pkgvers="$${pkgvers}-dirty"; \
 				fi; \
 			fi; \
--
2.18.0

