Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1daxxf-0004be-8g
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 01:37:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48198)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxxZ-0004XI-8S
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:37:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxxY-0003mA-En
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:37:13 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:34085)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxxT-0003gq-RP; Fri, 28 Jul 2017 01:37:07 -0400
Received: by mail-qk0-x242.google.com with SMTP id q66so20242094qki.1;
	Thu, 27 Jul 2017 22:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=AYA4e93G+k29HR7RTw1B6aYW5/q+lDfuK/XDZjH2TN4=;
	b=sg0KhTYP+LtBBd9oOJwx2JYfHXMRXShtBA/VzTH1hk9P4xSqsS5WIZT+RePjPg0cCY
	0Dhxk0ufoG3xpCRd2uCLMeorz4t43/9TY1eH+le7tqob3Axs14v0QyrLtbiaiUN8cmhX
	a7IOgYjzOthzlVbTc1X7piTtRGsbFqkMu4o9aYQiWIijXmRkI+N1JXZ1dSWa/1NX3oIm
	FGGpU/ksOwbO/HsPb8i2RaLZQKa2FGols/zPu1VB8JgXiv3/J8jogktqUbthh5EGrL4q
	1IgTF17aTV0BDuniG154zS8HxHsckJX5ncQAcfpe1mGuw+1EcbumB9p5XjS9WBDokkBb
	Qh8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=AYA4e93G+k29HR7RTw1B6aYW5/q+lDfuK/XDZjH2TN4=;
	b=ryNszjDmTEYSPLVN8zMsszWIJYneh2CgJToRv14N4OXrHBkXQTcQajc7Exg27zWWFg
	YuZ6cfV4VFdpv04jEkUZt+J2KG/YrEIF4GxSZ0UIuICPjSeVds9WcdGVwFe0TtjeLYZa
	DdX2yR+Pilz/Gwi/aZPFF/HzkPO6smxGfsYyU1gXSih1UKEQXar+YlAg1ABy0QQX1kCR
	/4Ke6zCrSK4FTEa3r4b76H2fIPd5B8gcmViK7gOFOS4ErX8eKGoKVN4f3GMvE8pcmF9q
	o+o8BhOJns5pzo5ACSo8yGSnFNJ/HG74kq+viP2LC5h0iMBE7aJ3Fmb1dLPfxl4UHh8H
	kcZA==
X-Gm-Message-State: AIVw1131v41rbyZzXRBNqVjn/GjtD6W7C4KCEoFC9NOa9+ltqTJaIs7Y
	HT83xxle1tB2Bg==
X-Received: by 10.55.177.133 with SMTP id a127mr8203068qkf.303.1501220227454; 
	Thu, 27 Jul 2017 22:37:07 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	h41sm12129560qta.45.2017.07.27.22.37.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jul 2017 22:37:06 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Kevin Wolf <kwolf@redhat.com>,
	Max Reitz <mreitz@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-block@nongnu.org
Date: Fri, 28 Jul 2017 02:35:42 -0300
Message-Id: <20170728053610.15770-20-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170728053610.15770-1-f4bug@amsat.org>
References: <20170728053610.15770-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-trivial] [PATCH 19/47] MAINTAINERS: add missing qcow2 entry
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
X-List-Received-Date: Fri, 28 Jul 2017 05:37:14 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6b83dac812..2dcdda4cd5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1856,6 +1856,7 @@ M: Max Reitz <mreitz@redhat.com>
 L: qemu-block@nongnu.org
 S: Supported
 F: block/qcow2*
+F: docs/interop/qcow2.txt
 
 qcow
 M: Kevin Wolf <kwolf@redhat.com>
-- 
2.13.3


