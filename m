Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e7lzy-0004gk-Mc
	for mharc-qemu-trivial@gnu.org; Thu, 26 Oct 2017 13:31:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43806)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Jason@zx2c4.com>) id 1e7lzw-0004fO-4f
	for qemu-trivial@nongnu.org; Thu, 26 Oct 2017 13:31:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Jason@zx2c4.com>) id 1e7lzv-0004Zn-Ac
	for qemu-trivial@nongnu.org; Thu, 26 Oct 2017 13:31:16 -0400
Received: from frisell.zx2c4.com ([192.95.5.64]:44449)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Jason@zx2c4.com>)
	id 1e7lzr-0004WV-0B; Thu, 26 Oct 2017 13:31:11 -0400
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ad3f57cb;
	Thu, 26 Oct 2017 17:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
	:in-reply-to:references:from:date:message-id:subject:to:cc
	:content-type; s=mail; bh=m7zyTCKeYhXcKhrKSwygWUn07a8=; b=cpo2i/
	sAjAz4xfYH4u84h5N0l5R7F5fd9TA5B2P64OCNCGg2cogKZtrn0upAz+Gx2Tpw6n
	HvhRvnh/bVyhI+g2QDy75BKZ7tPcbzd7H81QFnFYCXqiDnK0abEqC5fbYXOI2qgn
	u4FCPbQCtyW6h98ZPuf9MGhAKCk4AWwRZ3PI+aNxJN8FIGXVFkkDMN1pbfJKs+PA
	V3beCvSYgR9FyLYjkB8A7EonSl+VQV1+is+EKGCEnDgGmSgAPWc3lXh6l1uOWwZI
	lnaL7q8AD2arbWO5W58IRANEdLc5iS68wId3rw67BMnwQoEfWFwP/h5AfhH+bHxs
	ojzlYkCFvY787Ovg==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 0d65ef42
	(TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO); 
	Thu, 26 Oct 2017 17:29:21 +0000 (UTC)
Received: by mail-oi0-f54.google.com with SMTP id m198so6945261oig.5;
	Thu, 26 Oct 2017 10:31:06 -0700 (PDT)
X-Gm-Message-State: AMCzsaXavJCibpn94MDQ2wFaqwCkE6mvPQtHO9QXLS3lDTuk+OFSRd8N
	GedJ4irF4ygbFk9Ns1c3i2YwxY6o6jHGa5F8hpw=
X-Google-Smtp-Source: ABhQp+SY47OzZz+15cTsbT1WCg3IIQZnLalGs0HjWRsUfkOfsN5ofu1ktlJL1lJ3wE4BqsiyuwN6FK7TcdXudCS0STc=
X-Received: by 10.202.93.69 with SMTP id r66mr3203507oib.26.1509039065876;
	Thu, 26 Oct 2017 10:31:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.74.41.205 with HTTP; Thu, 26 Oct 2017 10:31:05 -0700 (PDT)
In-Reply-To: <CAFEAcA-bKPNwJpcny=1azScO8bzHsi0Ou+m3rYPq-=v52Gf26g@mail.gmail.com>
References: <20171023122719.17199-1-Jason@zx2c4.com>
	<CAFEAcA_PM5Fjx2Pk58h75p9vaZwFcusQdXuwy9tbDtc=EaoOJg@mail.gmail.com>
	<10e16ca3-175b-9f34-65e7-031b883b7201@amsat.org>
	<CAHmME9qtBiuAEnkCeuMd7EdeZveTVa4UOf+AQhMCFye0SYJY=Q@mail.gmail.com>
	<20171026133445.kemzfgvpbmtcogsl@kamzik.brq.redhat.com>
	<CAHmME9oyBvAV8FF9QMHyF46n8Ct6KZqThQVih2ipQmivD94Cag@mail.gmail.com>
	<CAFEAcA8O6YyS1tSzaydckFpsqpb8HXgW5PJe-VTWud_5YGdW5A@mail.gmail.com>
	<CAHmME9pE79krWx-zD=VGiScT4c=4TZ1wVxYFiF3m+8wsx9Fqeg@mail.gmail.com>
	<CAFEAcA9XoeXDCQCmRBehntWSo0WGRBsaMDmC8QCqgU1K8jAF_A@mail.gmail.com>
	<CAHmME9qSJSPjANce_cWN6nm=qJsncfczgk7PoPa0xkOHmZjLUA@mail.gmail.com>
	<CAFEAcA-bKPNwJpcny=1azScO8bzHsi0Ou+m3rYPq-=v52Gf26g@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 26 Oct 2017 19:31:05 +0200
X-Gmail-Original-Message-ID: <CAHmME9qNnqYEbW_m8LG0E0HBKUE38YjUodbBihnSi2k0FrZJtw@mail.gmail.com>
Message-ID: <CAHmME9qNnqYEbW_m8LG0E0HBKUE38YjUodbBihnSi2k0FrZJtw@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Andrew Jones <drjones@redhat.com>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 192.95.5.64
Subject: Re: [Qemu-trivial] [Qemu-devel] [Qemu-arm] [PATCH] hw/arm/virt:
 support 4 serial ports
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
X-List-Received-Date: Thu, 26 Oct 2017 17:31:17 -0000

On Thu, Oct 26, 2017 at 6:41 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> Those are primarily about migration compatibility -- you should
> be able to live migrate a guest from QEMU 2.6's virt-2.6 machine to
> QEMU 2.7's virt-2.6 machine. That's a stricter requirement than
> the compatibility we want to keep for non-versioned machines,
> where generally we don't want to break command lines but are OK
> to make changes if they don't break those existing uses.
>
> Command lines get baked into all sorts of scripts and so they're
> effectively part of QEMU's "ABI". People don't like it when we
> break their previously working flows :-)

Fair enough. So in that case, secure=no means serials 1-4 are for
kernel. With secure=yes, serials 1,3-5 are for kernel, with serial 2
being for trustzone. Seems like that's the best of all worlds.

