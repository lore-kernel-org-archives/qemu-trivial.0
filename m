Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e73SZ-0008CU-L0
	for mharc-qemu-trivial@gnu.org; Tue, 24 Oct 2017 13:57:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44088)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Jason@zx2c4.com>) id 1e73SW-0008AK-Nu
	for qemu-trivial@nongnu.org; Tue, 24 Oct 2017 13:57:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Jason@zx2c4.com>) id 1e73SV-0004V8-V4
	for qemu-trivial@nongnu.org; Tue, 24 Oct 2017 13:57:48 -0400
Received: from frisell.zx2c4.com ([192.95.5.64]:43191)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Jason@zx2c4.com>)
	id 1e73SQ-0004TP-3r; Tue, 24 Oct 2017 13:57:42 -0400
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c6704c79;
	Tue, 24 Oct 2017 17:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
	:in-reply-to:references:from:date:message-id:subject:to:cc
	:content-type; s=mail; bh=OcGsuoH1dtq8eG0pq0nFb3yafyQ=; b=iJmTmq
	GWYXYBviHY8lbHgvk/NTAtSPi8X7oL5wZO2tGCj6OFVsbtFqEraWOjQxwf+f2rcI
	L5klHLYPQrtIE/koh/8Lvufe3DQnE+PKIA3unq9tUEp18gq/Z9SsTV2gksiQtGCZ
	8nY/XOs71wMTTKsiQKQQz+Mxo2p0S31uVh4RTAhwKmpvHMoHBfv9XCZy1J+VMyX3
	y2h6E8G6yosG5uQWupK8eh3Hu0itQoXFleaWiGjEsp2npM2Dhsf+ieXPcH0G8PM8
	Cgy/ZWGf+rccRcg1owY7w0D6vjYPEs9ww3ZAqC93E9FNAl38sYmpIHlu5RBgaL2D
	mSurA8Z0rj07O8rw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a8498c7a
	(TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO); 
	Tue, 24 Oct 2017 17:56:08 +0000 (UTC)
Received: by mail-oi0-f48.google.com with SMTP id a132so38780138oih.11;
	Tue, 24 Oct 2017 10:57:38 -0700 (PDT)
X-Gm-Message-State: AMCzsaVh02wnI/CVzCp6O+dHf58d7t9kH2zQ51kpVHqUn+Yay8IcsHu5
	V/j3qcJ7pDdxxQk/c8NPjisW+tvsBh0YmPXKd3Q=
X-Google-Smtp-Source: ABhQp+QIEuzdGSNlGwYTwxWKbj+Sw+fE01Bx/n7ljAJfej0fhWcwJGBlizHHuvGPjSMJM8hRmfZYNzULjHtWUKXTGRg=
X-Received: by 10.157.1.164 with SMTP id e33mr10560055ote.469.1508867857593;
	Tue, 24 Oct 2017 10:57:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.74.41.205 with HTTP; Tue, 24 Oct 2017 10:57:37 -0700 (PDT)
In-Reply-To: <10e16ca3-175b-9f34-65e7-031b883b7201@amsat.org>
References: <20171023122719.17199-1-Jason@zx2c4.com>
	<CAFEAcA_PM5Fjx2Pk58h75p9vaZwFcusQdXuwy9tbDtc=EaoOJg@mail.gmail.com>
	<10e16ca3-175b-9f34-65e7-031b883b7201@amsat.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 24 Oct 2017 19:57:37 +0200
X-Gmail-Original-Message-ID: <CAHmME9qtBiuAEnkCeuMd7EdeZveTVa4UOf+AQhMCFye0SYJY=Q@mail.gmail.com>
Message-ID: <CAHmME9qtBiuAEnkCeuMd7EdeZveTVa4UOf+AQhMCFye0SYJY=Q@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 192.95.5.64
Subject: Re: [Qemu-trivial] [Qemu-arm] [PATCH] hw/arm/virt: support 4 serial
 ports
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
X-List-Received-Date: Tue, 24 Oct 2017 17:57:49 -0000

Hey folks,

In case you're curious, this is the kind of hideous workaround
required until this is fixed:

https://git.zx2c4.com/WireGuard/commit/?id=2456a56729f7247bf88476317fed0ac822a31e92

Please let me know if you intend to fix this or if you will accept
working patches from me for it, or if you simply don't care.

Thanks,
Jason

