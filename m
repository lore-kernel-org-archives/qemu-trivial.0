Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h2LPG-00069i-QV
	for mharc-qemu-trivial@gnu.org; Fri, 08 Mar 2019 14:43:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37709)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mehta.aaru20@gmail.com>) id 1h2LPE-00066x-RU
	for qemu-trivial@nongnu.org; Fri, 08 Mar 2019 14:43:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mehta.aaru20@gmail.com>) id 1h2LPE-0002g0-52
	for qemu-trivial@nongnu.org; Fri, 08 Mar 2019 14:43:44 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:37490)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mehta.aaru20@gmail.com>)
	id 1h2LP9-0002dv-PE; Fri, 08 Mar 2019 14:43:39 -0500
Received: by mail-pg1-x541.google.com with SMTP id q206so14923404pgq.4;
	Fri, 08 Mar 2019 11:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:cc:date:mime-version
	:content-transfer-encoding;
	bh=wCAaStBBwd5X/88madxMJNslg8ak6XCLaDuhuksRoKU=;
	b=bU6vKWF11eLCtPiXfAhv10aiFdv+02XNYiSc/hG+LhNUuJm/b3f0cluGHwf4doIYeJ
	p9z+5OOJdQGX47JIotgn3oo1JWN5iqm8IWpZSRs2AFRUE03QElIL5tiX1HOqNdpXiNOT
	uNu3Zqthqec5zvT8ejz4greXAz6lheC6B6cGm6zE/dM+3aaHxb+d7Ha6JyAyb2bfUnXO
	kgKsivfiHrtuKGfG8W7PgdrjoG8I7w6HrFEvfHEw9NfRyRXlJ2wjyVaWz/D9HHPwhZDA
	2DaogPsyqhNSJLc2KfFt4OZ8x0bkqbp5X2afe0+ig8e52lLgB9gMmzGXWTfWRRwjrbOB
	ACdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:mime-version
	:content-transfer-encoding;
	bh=wCAaStBBwd5X/88madxMJNslg8ak6XCLaDuhuksRoKU=;
	b=Cipx3VJLCHAssVzv/Rc3TpZnKRWlLumRaeGGoe7zpS6Kb/NO9yYjyvyo0FlJi8Pl3h
	Ru0/3Mjtowbe/I9yvizbK1zo+iak0SjA9qC2pwbK6frZiC/5KAnZZwXF0zB3AgxThMUP
	W3YWk11oIT1fjhcGOyooOTnSV6z11fSsVibLbMpGPm0cT3aMNPYYeSgViF5Mwxb0mIV1
	yso/AHkXPlirer/SZbcorG7CI8KafuJbndqO75HnRMP7JY440cCX9SRFLPu+oxGnu+6p
	i+VrwTrgrvf9oVG/svnTB5siJDw6rTsNdJ2qnrdpgopywhmQ8SAaVaWwk6o0GbwmC7gR
	TDsg==
X-Gm-Message-State: APjAAAW6R3VZ33hWE9K2jCFB7ZT1VoZxkZ+jzvs1CHSZ9pPXQAXblnhy
	zqGWLG+Bzsd5f4RUjrtlDGn5peXP
X-Google-Smtp-Source: APXvYqz/WLXXCYnsw83TI0/Xfsq6XQApn/7EaEb4fM9I7zQI8z0R+Fu1Al9tMXuWYVuA0uK5UW9Vsw==
X-Received: by 2002:a17:902:f01:: with SMTP id 1mr20145398ply.41.1552074217854;
	Fri, 08 Mar 2019 11:43:37 -0800 (PST)
Received: from am-swift ([2401:4900:25fd:18ad:5d:551a:103a:5839])
	by smtp.gmail.com with ESMTPSA id
	l79sm20280310pfb.102.2019.03.08.11.43.34
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 08 Mar 2019 11:43:36 -0800 (PST)
Message-ID: <a09acf9e093c09a70896bb9886370cf7f049f941.camel@gmail.com>
From: Aarushi Mehta <mehta.aaru20@gmail.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>, Julia Suvorova
	<jusual@mail.ru>, Stefan Hajnoczi <stefanha@gmail.com>
Date: Sat, 09 Mar 2019 01:13:19 +0530
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: [Qemu-trivial] [PATCH] thunk: improve readability of allocation loop
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
X-List-Received-Date: Fri, 08 Mar 2019 19:43:45 -0000

Signed-off-by: Aarushi Mehta <mehta.aaru20@gmail.com>
---
 thunk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/thunk.c b/thunk.c
index 17f3d320bb..7f31cffe09 100644
--- a/thunk.c
+++ b/thunk.c
@@ -86,7 +86,7 @@ void thunk_register_struct(int id, const char *name, const argtype *types)
 #endif
     /* now we can alloc the data */
 
-    for(i = 0;i < 2; i++) {
+    for (i = 0; i < ARRAY_SIZE(se->field_offsets); i++) {
         offset = 0;
         max_align = 1;
         se->field_offsets[i] = g_new(int, nb_fields);
-- 
2.17.1



