Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ePXJk-0007Cv-NO
	for mharc-qemu-trivial@gnu.org; Thu, 14 Dec 2017 12:29:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38672)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ePXJi-0007BF-Qu
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 12:29:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ePXJh-0008IT-U6
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 12:29:06 -0500
Received: from mail-wr0-x242.google.com ([2a00:1450:400c:c0c::242]:37743)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1ePXJh-0008HI-MT; Thu, 14 Dec 2017 12:29:05 -0500
Received: by mail-wr0-x242.google.com with SMTP id k61so5803893wrc.4;
	Thu, 14 Dec 2017 09:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=tFVYU+Xo66KyRUXUKdYJeS3CYA1u73JJO6/MlDqPtt0=;
	b=KRblUZbB/tIBtupd2HwrBKcXHedAgfGHZlPg+amnPg02fyQ7xDncFNeRgaqP5/cf2y
	0AmIFD6WpXyrMcogOEqrKIqUgqC9Fuse2rMtO7VSLblB7FSt95gdBGrBj+2SFvoYNEB5
	cr5cRs1NxBgrS9BLfrHoxft4l29jGVgHmTVAh30KId6mj2qMR+FMtciiCrpfbude3xiu
	Mf4Wm6U88tNqmNSbD1jn5Dq15A2IO5cb9eAlj2VbHOtq4y5yyV53eae/4y5rs4g65mX/
	0eOnGDNc1rJJB8/YxHrFcKHk2r4zIBCiSVbd/E0B/t/Q4wzHhiRXs5fMlv2dnCGV1QFN
	jCJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=tFVYU+Xo66KyRUXUKdYJeS3CYA1u73JJO6/MlDqPtt0=;
	b=Mc08NgANA7I+jr6XRxR4AqKmpDiGipaQZDBzxl0cz7VTQDOhM9XdV5R0xGCtxZRQ62
	et9vi7Df5GfqzFGaOpfeAuUJ74YoogInF96hcdOjM07BhMl6xRMWTrkP1D4wepdTrg0v
	6oL6AhLL8s3Fj1ritTrUvSrT8O1rK/x51MxijixENLhfGyr7GQ+UC47+8g7OFsl28aJo
	DiTbgTPSiCWn6JhvZC2ZNQ1j3faFjR6mc/z2orbxhrd51zsrNv6k7fN5Tz1KCi5eEvVT
	2d7RaeWYfkBeHqabrN3srLZPHvhut9ATqzXOWPwdd3tCF+JoGYg9lWtATMJddBroUuHt
	6gRg==
X-Gm-Message-State: AKGB3mLvqWWyAGIAcVEplFvOrQOUk2P+1NVwY7sxHF7nGCWrK3CHeikV
	/5M1TK5PrM7YRY2aLb9AYZ8Suqu/of/H35z4wwc=
X-Google-Smtp-Source: ACJfBovGC7uxBIBOLpN8lM+6Gkk3fmWyDrcN4e8JhOdAAHjWqoQRZtTbxrKp0TCWEk7kgu4uz+/7zg/XVg/6mqNBP7M=
X-Received: by 10.223.160.125 with SMTP id l58mr6749832wrl.56.1513272544623;
	Thu, 14 Dec 2017 09:29:04 -0800 (PST)
MIME-Version: 1.0
Sender: alistair23@gmail.com
Received: by 10.28.164.69 with HTTP; Thu, 14 Dec 2017 09:28:34 -0800 (PST)
In-Reply-To: <20171213195852.30439-5-f4bug@amsat.org>
References: <20171213195852.30439-1-f4bug@amsat.org>
	<20171213195852.30439-5-f4bug@amsat.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Thu, 14 Dec 2017 09:28:34 -0800
X-Google-Sender-Auth: eUn0O3yNd1RYFQWgmemTrJ2sYV8
Message-ID: <CAKmqyKPvAL3+LAqMBtUOc=0igkSwg4Jmf+Q0ySL7C+oech7AMw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Alistair Francis <alistair.francis@xilinx.com>, 
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Prasad J Pandit <pjp@fedoraproject.org>, 
	Peter Maydell <peter.maydell@linaro.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>, 
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Andrey Yurovsky <yurovsky@gmail.com>, 
	QEMU Trivial <qemu-trivial@nongnu.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, 
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::242
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 04/14] sdhci: use deposit64()
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
X-List-Received-Date: Thu, 14 Dec 2017 17:29:07 -0000

On Wed, Dec 13, 2017 at 11:58 AM, Philippe Mathieu-Daud=C3=A9
<f4bug@amsat.org> wrote:
> This makes the code slightly safer, also easier to review.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/sd/sdhci.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
> index e39623baba..295a89e5d3 100644
> --- a/hw/sd/sdhci.c
> +++ b/hw/sd/sdhci.c
> @@ -1123,12 +1123,10 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t=
 val, unsigned size)
>          MASKED_WRITE(s->admaerr, mask, value);
>          break;
>      case SDHC_ADMASYSADDR:
> -        s->admasysaddr =3D (s->admasysaddr & (0xFFFFFFFF00000000ULL |
> -                (uint64_t)mask)) | (uint64_t)value;
> +        s->admasysaddr =3D deposit64(s->admasysaddr, 32, 0, value);

This doesn't look right.

Originally we were masking admasysaddr with (mask and
0xFFFFFFFF00000000). Then ORing in the value.

Now we are depositing value into a bit field that starts at bit 32 and
has 0 length. I don't see how value will be deposited at all with a 0
length.

Alistair

>          break;
>      case SDHC_ADMASYSADDR + 4:
> -        s->admasysaddr =3D (s->admasysaddr & (0x00000000FFFFFFFFULL |
> -                ((uint64_t)mask << 32))) | ((uint64_t)value << 32);
> +        s->admasysaddr =3D deposit64(s->admasysaddr, 0, 32, value);
>          break;
>      case SDHC_FEAER:
>          s->acmd12errsts |=3D value;
> --
> 2.15.1
>
>

