Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dXLsd-0001pR-Vj
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jul 2017 02:21:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60308)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLsZ-0001le-GN
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 02:21:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLsX-0000sY-MA
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 02:21:07 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:35765)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLsX-0000rx-He; Tue, 18 Jul 2017 02:21:05 -0400
Received: by mail-qt0-x241.google.com with SMTP id p25so253541qtp.2;
	Mon, 17 Jul 2017 23:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=r3Z39XvXYzdciMJ3wRAorPfYTGtm7iY/XDss8whpXnU=;
	b=DlI087X98u8rv0dDMJEs6EyZbLRuIxxclVCM9nd7Es5l/ypVmoON3dkDTuiuxT7RqZ
	2s4PmS9E8BV9HT9rysO16BhAvsIUz/Fni9uR4nzCj9Gu5HcB3rTT1XkAkTqr9vzwjNgP
	YGTQftKWp+hIVr3gTJCLoI7eMu+D3SWzh7GUeAPOggnNHAuTS1+IR13f78LAaXOVlqQQ
	0QW+1zuOMKhxlcuD4JOVno+fUxkipzG92B+JzZdZKAYdVttqR/nVvgZ/wqlzVjzc1Rcr
	U2ymAeY+0731QrkcIITSe8Db+XiRcxs3+p4h2n+ZxllIBN1d4/r7NueU0259DakikP/H
	rDfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=r3Z39XvXYzdciMJ3wRAorPfYTGtm7iY/XDss8whpXnU=;
	b=VsfGq5osAyEyeDGaK2hSp9ukjlTEvBKWHg9OPMQ/iH/uLZilYPtfR4AqiUjU7rkc/a
	z3BLsFQXkqaiRJDODVqNjSjEbRBpQsZCMi6a871wNi3HiN2s20p07XupLl0BvebyBAW+
	ehRp9LZNmzVLDwanTgKd+/qoZ1obiTU47Qa7S5a8hcaW6WN8R4n+EX+LBln5EEb2/WNv
	+U2LiSlIXQZ8K3KChAMFn97aijzmKKUaibRMdKYjqyOy/2aH9u5huxnKDVwTHJf9waTp
	UvhHxP/sCNrEd9CD5WQbP5r6ur6BIo/h2wFY68OT15fe/3qQflYFbiQIL71krGm36Epm
	iL+A==
X-Gm-Message-State: AIVw110enwkwMsd7aC3FyRTPS6Mt++5Nm+xfKyGY3eH6TFPD/S0rc7un
	Sc6rdDcsDhFoVTUthkccKA==
X-Received: by 10.237.32.141 with SMTP id 13mr91364qtb.41.1500358864861;
	Mon, 17 Jul 2017 23:21:04 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	l31sm1099862qtc.64.2017.07.17.23.21.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Jul 2017 23:21:04 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Richard Henderson <rth@twiddle.net>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>
Date: Tue, 18 Jul 2017 03:09:49 -0300
Message-Id: <20170718061005.29518-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170718061005.29518-1-f4bug@amsat.org>
References: <20170718061005.29518-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-trivial] [PATCH 13/29] tcg: use QEMU_IS_ALIGNED macro
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
X-List-Received-Date: Tue, 18 Jul 2017 06:21:08 -0000

Applied using the Coccinelle semantic patch scripts/coccinelle/use_osdep.cocci

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 accel/tcg/translate-all.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 4e1831cbb9..9011618157 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -151,7 +151,7 @@ static void page_table_config_init(void)
     v_l2_levels = v_l1_shift / V_L2_BITS - 1;
 
     assert(v_l1_bits <= V_L1_MAX_BITS);
-    assert(v_l1_shift % V_L2_BITS == 0);
+    assert(QEMU_IS_ALIGNED(v_l1_shift, V_L2_BITS));
     assert(v_l2_levels >= 0);
 }
 
-- 
2.13.2


