Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dpClC-0001bs-LZ
	for mharc-qemu-trivial@gnu.org; Tue, 05 Sep 2017 08:15:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43329)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1dpCl5-0001Wx-Ix
	for qemu-trivial@nongnu.org; Tue, 05 Sep 2017 08:15:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1dpCkv-00070c-Vz
	for qemu-trivial@nongnu.org; Tue, 05 Sep 2017 08:15:11 -0400
Received: from mail-oi0-x236.google.com ([2607:f8b0:4003:c06::236]:36211)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
	id 1dpCke-0006pV-C3; Tue, 05 Sep 2017 08:14:44 -0400
Received: by mail-oi0-x236.google.com with SMTP id x190so7516912oix.3;
	Tue, 05 Sep 2017 05:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=cY5hRczZCcApUoUFFhtEv3ZbLgK164PzRFxH7dcxCvE=;
	b=dMFVp4cEGJExSGjTI4Qi8qn2X3nFzvDjrprIwzUly8iMEx8v88baaNnQ2b1Zpp4qm2
	16wOX3Yvw7SdjVbA4UOAqoCdl61fwUo/Zou28NuzSrq9CpJT0/cvPNd/4k984LPJnB45
	2pYOL1+OQ3RcZNIeakzlRqTRPA4ZiJ3//rRi9m5OJ3PqRDgaqAHuStd6EetIeHv0QmzW
	DzTySx3dC6SN7VzQ5z2Y1OtPgNgIfBX/QZDtCqzezCL3tib52v+ZO6EOFjH8xWySoMFc
	RBAy2NQzPoTRq01d4zhYEkNdZl8K3X17ZqKYjJRO2aXFZ82WE016edNRpQmwIdm4+tg3
	/OqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=cY5hRczZCcApUoUFFhtEv3ZbLgK164PzRFxH7dcxCvE=;
	b=myc+8zYBTqbSdYqotJ9knb46K6lwSjcEB/DzHpZeCcHwb74lmKtHUDDrZcq+1rsPEU
	Oma61NYFyY111AQ/8h2m3BYYbh/zFpQI1q584K/ErWVht33nHiqLJq6w4IPgRl3mLy+D
	98o4ESiVgwWL8TbEL7XiIJYC4QaSqax0iUSKT9LC///6YnZZtJh/ognuFTt2P3lZVY7p
	h8qgNoihgbE7grZW9IwKAiYSsQvB9GCtQn6222MBFw40pkoS0MDxMN9z1vk26wF2D64z
	7u4zMxPj0KCWcrrSBrbMLyYQOSCZnr8ypPgpRDWiL65l9tXPoAwIAIce428x2rBsxSNv
	6Ypw==
X-Gm-Message-State: AHPjjUi0xa4pSJTg41tCtb0iEnG3p7kDssVdkpFiQxstU5/iAMP4vUft
	iw7dIS+UwOPIGce2N6na0ek9hO9vVww5J0A=
X-Google-Smtp-Source: ADKCNb7kTJIzyb2rifhzOvTUA4EhRymRxaP/EZvmY5+ie6mXBLQjHpa+Ek2Y/1zUNO/HEQfZgI77d0e1ndD7+PNXV2U=
X-Received: by 10.202.86.211 with SMTP id k202mr3134073oib.122.1504613683430; 
	Tue, 05 Sep 2017 05:14:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.39.139 with HTTP; Tue, 5 Sep 2017 05:14:42 -0700 (PDT)
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 5 Sep 2017 14:14:42 +0200
Message-ID: <CAJ+F1C+mPu9ftXwgs4UrGTQp4f65-thhvmWoB-kuRmu0=vnFFw@mail.gmail.com>
To: QEMU <qemu-devel@nongnu.org>, qemu trival <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::236
Subject: [Qemu-trivial] clang-tidy: use g_new() family of functions
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
X-List-Received-Date: Tue, 05 Sep 2017 12:15:17 -0000

Hi,

I have a series of changes generated with clang-tidy qemu [1] pending
for review [2].

It translates calloc/*malloc*/*realloc() calls to
g_new/g_newa/g_new0/g_renew() where the argument is a sizeof(T) [* N].

This is the first commit to give you an idea:

diff --git a/hw/timer/arm_timer.c b/hw/timer/arm_timer.c
index 98fddd7ac1..75affcb8a6 100644
--- a/hw/timer/arm_timer.c
+++ b/hw/timer/arm_timer.c
@@ -166,7 +166,7 @@ static arm_timer_state *arm_timer_init(uint32_t freq)
     arm_timer_state *s;
     QEMUBH *bh;

-    s =3D (arm_timer_state *)g_malloc0(sizeof(arm_timer_state));
+    s =3D g_new0(arm_timer_state, 1);
     s->freq =3D freq;
     s->control =3D TIMER_CTRL_IE;

g_new() advantages (from glib doc):
- the returned pointer is cast to a pointer to the given type.
- care is taken to avoid overflow when calculating the size of the
allocated block.

But it is also shorter&nicer :)

I have not included in the first batch the opportunity to also
translate: alloc(sizeof(*p) * x) to g_new(typeof(*p), x), since it is
arguably not much nicer. But for consistency, I think it would be good
to use g_new(). What do you think?

I splitted the changes amont the various MAINTAINERS entries, but it
is still about 70 patches (without the typeof() changes).


[1] https://github.com/elmarco/clang-tools-extra/
[2] https://github.com/elmarco/qemu/commits/gnew


--=20
Marc-Andr=C3=A9 Lureau

