Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dPcdB-00071r-TZ
	for mharc-qemu-trivial@gnu.org; Mon, 26 Jun 2017 18:37:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35149)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dPcd9-0006yq-Kq
	for qemu-trivial@nongnu.org; Mon, 26 Jun 2017 18:37:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dPcd8-00017Z-QR
	for qemu-trivial@nongnu.org; Mon, 26 Jun 2017 18:37:15 -0400
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241]:35968)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1dPcd6-00016K-S0; Mon, 26 Jun 2017 18:37:12 -0400
Received: by mail-wm0-x241.google.com with SMTP id y5so2742007wmh.3;
	Mon, 26 Jun 2017 15:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=oZcse519rwGnXlWo8AEhiViS3tTMduPcareO5H+F8wA=;
	b=ihLLuF8U/j45m6LhrYhHQ3N29NieG3jmm/7nKm0vDPMfso09EsKMGvglXQzUp/giy6
	eEXfPXg1d+ffVs9XFqLsa2rr3ZEsBTMpRg7GLS5VwwpDOHo/6dsVmLJXFmso8vZsL+DE
	KBmNf4VJtm5cBP0/tHPIdTvozL7yQLwg0B+rPbvPrJbpUVf4mWUt41kuPeOR4Uo/epLV
	61ogeWxO3SZuK3RUho8kE2nsWEmK8SlLJ7bfZq0XoknC2g/FkwSVitukNvcXSEHEsCSt
	TMO7RAdK9J+CjCOSWOa5GuYu7hs6c8X2Fgz3tXtMf670/f52hLIdgiDdXatV5bSnWCbT
	9JRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=oZcse519rwGnXlWo8AEhiViS3tTMduPcareO5H+F8wA=;
	b=EceQtR1KMjfze++nkDPMCtD87HFM2srXP5/QyKRyDu8QS6JCG9qgtFTzGmsQu8QvuY
	dtlxqiW98Y2vzonFuMNIHOV1p88RP3FCOLz7X15z8s2fT5cpzcq4xqaZThvYCWwt8RcX
	z1D+8SZr6CB735vRJ3tkAnSCBY4o4xK8T+yPR39luVPA6ayzXA5ayI91yMoFdjMxm5gh
	Z1o0Vbetli+e2UmC+rrkjhWaP5di+kkdhXNE/jzvUxcnf3nC4J6xKIZEb/X+GbUSrBF1
	HPB37ukefuayRPO2MT5EntMKRCmF/AaRl1IkQIOoFNu7QtERF1elbCRPqeZ5zqhsI/XD
	nD8Q==
X-Gm-Message-State: AKS2vOw7SWjUnyIM0dOlUAAU3FzcZM2sRR4eMwb4aRLHQr1iwWx3fUnJ
	uMD/Rte1UeJdRhzYCKmhU0NiXodylg==
X-Received: by 10.28.213.205 with SMTP id m196mr1120937wmg.61.1498516631601;
	Mon, 26 Jun 2017 15:37:11 -0700 (PDT)
MIME-Version: 1.0
Sender: alistair23@gmail.com
Received: by 10.28.191.88 with HTTP; Mon, 26 Jun 2017 15:36:41 -0700 (PDT)
In-Reply-To: <20170623164557.11636-3-f4bug@amsat.org>
References: <20170623164557.11636-1-f4bug@amsat.org>
	<20170623164557.11636-3-f4bug@amsat.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Mon, 26 Jun 2017 15:36:41 -0700
X-Google-Sender-Auth: vQReYjXUqpt2iAT4Q-efFDHx91o
Message-ID: <CAKmqyKN7QXYQrP1_LgDoRe6SFkrx=Ogvt2N9CgW8QOaZ5RkMrA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>, 
	QEMU Trivial <qemu-trivial@nongnu.org>, Eric Blake <eblake@redhat.com>, 
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, 
	Laszlo Ersek <lersek@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>, Alexander Graf <agraf@suse.de>,
	David Gibson <david@gibson.dropbear.id.au>, 
	Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/3] hw/core: fix missing
 return value in load_image_targphys_as()
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
X-List-Received-Date: Mon, 26 Jun 2017 22:37:16 -0000

On Fri, Jun 23, 2017 at 9:45 AM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks,
Alistair

> ---
>  hw/core/loader.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/hw/core/loader.c b/hw/core/loader.c
> index 094f24627f..e137e772ae 100644
> --- a/hw/core/loader.c
> +++ b/hw/core/loader.c
> @@ -150,7 +150,9 @@ int load_image_targphys_as(const char *filename,
>          return -1;
>      }
>      if (size > 0) {
> -        rom_add_file_fixed_as(filename, addr, -1, as);
> +        if (rom_add_file_fixed_as(filename, addr, -1, as) < 0) {
> +            return -1;
> +        }
>      }
>      return size;
>  }
> --
> 2.13.1
>
>

