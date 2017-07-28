Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dbE1p-0005Gs-I9
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 18:46:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32931)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dbE1n-0005F5-O7
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 18:46:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dbE1j-0002ND-9z
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 18:46:38 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:38262)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dbE1f-0002Kn-2e; Fri, 28 Jul 2017 18:46:31 -0400
Received: by mail-qk0-x244.google.com with SMTP id v76so10700308qka.5;
	Fri, 28 Jul 2017 15:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=YTsIV9oFZiiJGLixPhcWUg2QCD9HgQHaou3eAneChIA=;
	b=pCw57cYInC10jVdK/pkkrPrP0zcpkwSQqxFL0oowDeGo+SsuCMADCMQGqVHp81e8gD
	WV/WxLPn222iy2m/j0U3xrPGQnEtcw+rdmB4hCsnO4meogQXNBqk4yGHq/vALKrORGw+
	DyZ29S8rFJTzckbaElPiLnZu1w3/3iZ0lb8DqvP5sIt+xztzUAmL8x2povTjQkRaNQGd
	+7/+YB6DOOHMKe/+SmGRZEy8326XT8DVLmNGzkCuTWn1RqaLJi7O2L+MvElCrlLGPVBV
	DuS4OB9kpQ35iXIJhBY9kcjAlZqEWrQn9d8UL8EHHtD9VbvdewqKyUBLsBe/UXkw7nbS
	58rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=YTsIV9oFZiiJGLixPhcWUg2QCD9HgQHaou3eAneChIA=;
	b=ZH+5HLo5TBoxHI8Bk13JDRhHpAwr4vcVIU2N/8vgrRgdgKM4K6/yXCmBNMvVGYW2o4
	Rz6dRb0C3c8urspDVpJiXNi/t89VqorX0rx23GDSL52fPZv0bQBlIh7n3Hzayhd7uoxx
	ZO0tjyMvnogc+uvCGAnP6yL6v9st5/ZZ45g5ScEqVzRG64NEKiB2ZxTM+3WR0W+8+2qB
	nplTkXfqa0qnvQvcDP7AT3dXde+LO05kZegDHo8A2/DxhqiADWJIwEv3rQeWL/vJnV2P
	7bjLyxTGKzdzRrZ618PFM9wKcUTne7gUo5yQfJLYocnBVXkgj2e/Zq8UERJE3Tg+zBWy
	m5qg==
X-Gm-Message-State: AIVw111qO/EBxz/0MUTj8/OhPXyl+6zEta6aJjI2UiQ0FW4krAF1G+0b
	sIsbn7vm/oc9BQ==
X-Received: by 10.55.100.67 with SMTP id y64mr12827650qkb.246.1501281990470;
	Fri, 28 Jul 2017 15:46:30 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	m129sm15831970qkc.2.2017.07.28.15.46.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Jul 2017 15:46:29 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri, 28 Jul 2017 19:46:06 -0300
Message-Id: <20170728224608.3598-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170728224608.3598-1-f4bug@amsat.org>
References: <20170728224608.3598-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [PATCH v2 for 2.10 6/8] docs: fix broken paths to
 docs/config/ich9-ehci-uhci.cfg
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
X-List-Received-Date: Fri, 28 Jul 2017 22:46:40 -0000

With the move of some docs/ to docs/devel/ on ac06724a71, a reference path was
not updated.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 docs/usb2.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/usb2.txt b/docs/usb2.txt
index b9e7548073..09df45b5b1 100644
--- a/docs/usb2.txt
+++ b/docs/usb2.txt
@@ -50,7 +50,7 @@ companion controllers with two ports each.
 There is a config file in docs which will do all this for you, just
 try ...
 
-    qemu -readconfig docs/ich9-ehci-uhci.cfg
+    qemu -readconfig docs/config/ich9-ehci-uhci.cfg
 
 ... then use "bus=ehci.0" to assign your usb devices to that bus.
 
-- 
2.13.3


