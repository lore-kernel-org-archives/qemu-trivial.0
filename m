Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0i1J-0002pt-Fm
	for mharc-qemu-trivial@gnu.org; Sat, 07 Oct 2017 01:51:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47687)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <th.huth@gmail.com>) id 1e0i1G-0002o8-MT
	for qemu-trivial@nongnu.org; Sat, 07 Oct 2017 01:51:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <th.huth@gmail.com>) id 1e0i1F-00066T-Ud
	for qemu-trivial@nongnu.org; Sat, 07 Oct 2017 01:51:26 -0400
Received: from mail-wm0-f65.google.com ([74.125.82.65]:35316)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <th.huth@gmail.com>)
	id 1e0i1B-00064I-J4; Sat, 07 Oct 2017 01:51:21 -0400
Received: by mail-wm0-f65.google.com with SMTP id b189so13260713wmd.2;
	Fri, 06 Oct 2017 22:51:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=+hf1hMuUAy0TCCsz5aqK6M4/3MLog3djH2ajCCa55Hs=;
	b=IbQF9CtseNmaJ5HQn0xDgDAKAH3sTd+17CG3FzRVHP8EChcm26wiXcX/mEQBnu+/W1
	hg3V+6BHs82icKRuJ1NXy/Ebuons+pR2YBXyoKuCFxa9U5Xo6zKQotgDKfjGVd0NYfZV
	fbaNcNOlF+ghs3ylZWqguSNiRGFZ3W0UjICBxNa/LlCXW/XNJtxLbPynQsCp3hYy0hNg
	rc/RFGuczCpbXz4mCt2k1MFigHY4Wm21wV1MDPaZl63NEkzvrShpAWj1wFTU6GnbeFqC
	Oo7XCchIW0vakGKUVaMW0/vqqBg0HipbVsfw4xkKzwuu7yTcVP1Itzlndfm+tEBci8F+
	DT4A==
X-Gm-Message-State: AMCzsaXltOHknsaqlaTyPaudqF4I3sfM6Yjxc9yWBZnJnU3ALRxfW8Cm
	EB8Z3GBJyNa8mwE/Jfw3tCI=
X-Google-Smtp-Source: AOwi7QAF9S1bEiDr8emEXb1GY3oJ41L/Iwtau3cslrVW4XQaqcv0fnMblIU8FT6epjZ6J0BlG2isvA==
X-Received: by 10.80.173.37 with SMTP id y34mr5857296edc.193.1507355480170;
	Fri, 06 Oct 2017 22:51:20 -0700 (PDT)
Received: from thl530.SpeedportEntry2090126200030
	(p200300C11BDBC401867AA81B31A1B577.dip0.t-ipconnect.de.
	[2003:c1:1bdb:c401:867a:a81b:31a1:b577])
	by smtp.gmail.com with ESMTPSA id f9sm3776657ede.38.2017.10.06.22.51.17
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 06 Oct 2017 22:51:18 -0700 (PDT)
Date: Sat, 7 Oct 2017 07:51:08 +0200
From: Thomas Huth <huth@tuxfamily.org>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Cc: =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@gmail.com>, Markus
	Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	=?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>, qemu trival
	<qemu-trivial@nongnu.org>
Message-ID: <20171007075108.00c82288@thl530.SpeedportEntry2090126200030>
In-Reply-To: <20171006235023.11952-24-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
	<20171006235023.11952-24-f4bug@amsat.org>
X-Mailer: Claws Mail 3.15.1-dirty (GTK+ 2.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.65
Subject: Re: [Qemu-trivial] [PATCH 23/88] M68K: use g_new() family of
 functions
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
X-List-Received-Date: Sat, 07 Oct 2017 05:51:27 -0000

Am Fri,  6 Oct 2017 20:49:18 -0300
schrieb Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>=20
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> [PMD: squashed commits]
> ---
>  hw/m68k/mcf5206.c | 4 ++--
>  hw/m68k/mcf5208.c | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Thomas Huth <huth@tuxfamily.org>

