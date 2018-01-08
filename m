Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eYczU-0001hd-QS
	for mharc-qemu-trivial@gnu.org; Mon, 08 Jan 2018 14:21:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34324)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dmitry.fleytman@gmail.com>) id 1eYczS-0001fu-M7
	for qemu-trivial@nongnu.org; Mon, 08 Jan 2018 14:21:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dmitry.fleytman@gmail.com>) id 1eYczO-0000q9-KN
	for qemu-trivial@nongnu.org; Mon, 08 Jan 2018 14:21:46 -0500
Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242]:45783)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <dmitry.fleytman@gmail.com>)
	id 1eYczO-0000pM-F4; Mon, 08 Jan 2018 14:21:42 -0500
Received: by mail-wm0-x242.google.com with SMTP id 9so16110918wme.4;
	Mon, 08 Jan 2018 11:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=axYoAkga08odIFsdXQzJP5OQDETNs9SJ26xTuIjQQQI=;
	b=K8puijfOT47QLd41aS57PrM9EYghLzlVaT+xtq06Rassa80UR8UQQk8N0lxNjKognX
	T3aXaXnWSdTaW1kEWcV+MW1PGgsT62uZO65jULV5mCoBqZt7sAKg/TmRrjQhW5IwJK5B
	CV+PWe96Y7EyZkVJiRdY7+Hs3wK+y0ctfaBOrKwt4oEgRG2ExGQMmy0eXmVmJPhcrmq8
	5iLT6cOUJk/2r/h3DZAY646cgFYLiZo8tmG26VhSA7gZDQcwDokKknn7r/jxKpofcSlu
	WkZ5XL9B4MM5Y4+/KKAz2bzHdiuDakK5aaWWFgt9xAHbSnEYtr3aGb/kSN5JgJEGt4FS
	Q8TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=axYoAkga08odIFsdXQzJP5OQDETNs9SJ26xTuIjQQQI=;
	b=obu2uI0J96SHwezlt3/OgO/QsQiw9QGlo8dtzmKI2RQkYbfHVGA5WIaMLFpENy/E9V
	t0xJ2ODfDrRZZwMTQ1lbdYNaYgv0sCT8Cz5hOQ5JkqDJpNa73QpvQd4NdNF0Wiip3No7
	AOUhUWwBF5f14gwsmAxwQEY0xyJJet0h2nfv7lWv0raOy7Yoy4kD69qhe3SwLkzig1Xl
	ceZNTyj1eXqTaZCQe910rJG+Y684bDYR6rmjhWHclsmntjGuYO4CuflsLiI3vgE25rf4
	u4aQ7Gk6PVxagy6RJOWyhRzFDVPPG7lB0GYl1aG7HIuJeZuX7oA0eQV7RYTnDgGoAuRt
	puwQ==
X-Gm-Message-State: AKGB3mL+YNO1LA5YYyr3TVX7ledtcnAGh9PnNWmJ3iRIx5diP6ZxCUxP
	hzLmurqbZBZH3Ml6cZg1LzA=
X-Google-Smtp-Source: ACJfBov+4lYsn2hwOI/YXoDCONcRZ3PEnmMAuioXLzf9hdjHcLbJ0Osr5bvw5ZLY0/6+bPLieRGLBQ==
X-Received: by 10.28.198.78 with SMTP id w75mr9333160wmf.157.1515439301160;
	Mon, 08 Jan 2018 11:21:41 -0800 (PST)
Received: from [10.0.1.26] ([141.226.29.227])
	by smtp.gmail.com with ESMTPSA id h2sm4257559wrf.54.2018.01.08.11.21.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Jan 2018 11:21:40 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 11.2 \(3445.5.20\))
From: Dmitry Fleytman <dmitry.fleytman@gmail.com>
In-Reply-To: <20180108183406.17623-1-f4bug@amsat.org>
Date: Mon, 8 Jan 2018 21:21:38 +0200
Cc: qemu trival <qemu-trivial@nongnu.org>,
	Qemu Developers <qemu-devel@nongnu.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <40FDE9D4-5C84-4734-A50A-9F9C8CC63D9E@gmail.com>
References: <20180108183406.17623-1-f4bug@amsat.org>
To: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
X-Mailer: Apple Mail (2.3445.5.20)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::242
Subject: Re: [Qemu-trivial] [PATCH] MAINTAINERS: update Dmitry Fleytman email
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
X-List-Received-Date: Mon, 08 Jan 2018 19:21:47 -0000

Thanks Philippe,

My patch is hanging on the list for some time already: =
http://lists.nongnu.org/archive/html/qemu-trivial/2017-12/msg00189.html

~Dmitry.

> On 8 Jan 2018, at 20:34, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>=20
> gently asked by his automatic reply :)
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> MAINTAINERS | 8 ++++----
> 1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 73a5555735..8050499ec5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1157,7 +1157,7 @@ F: hw/scsi/mfi.h
> F: tests/megasas-test.c
>=20
> Network packet abstractions
> -M: Dmitry Fleytman <dmitry@daynix.com>
> +M: Dmitry Fleytman <dmitry.fleytman@gmail.com>
> S: Maintained
> F: include/net/eth.h
> F: net/eth.c
> @@ -1165,7 +1165,7 @@ F: hw/net/net_rx_pkt*
> F: hw/net/net_tx_pkt*
>=20
> Vmware
> -M: Dmitry Fleytman <dmitry@daynix.com>
> +M: Dmitry Fleytman <dmitry.fleytman@gmail.com>
> S: Maintained
> F: hw/net/vmxnet*
> F: hw/scsi/vmw_pvscsi*
> @@ -1186,12 +1186,12 @@ F: hw/mem/nvdimm.c
> F: include/hw/mem/nvdimm.h
>=20
> e1000x
> -M: Dmitry Fleytman <dmitry@daynix.com>
> +M: Dmitry Fleytman <dmitry.fleytman@gmail.com>
> S: Maintained
> F: hw/net/e1000x*
>=20
> e1000e
> -M: Dmitry Fleytman <dmitry@daynix.com>
> +M: Dmitry Fleytman <dmitry.fleytman@gmail.com>
> S: Maintained
> F: hw/net/e1000e*
>=20
> --=20
> 2.15.1
>=20


