Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iGm3v-0003Ws-Ua
	for mharc-qemu-trivial@gnu.org; Sat, 05 Oct 2019 11:33:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43127)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iGm3t-0003U0-8C
 for qemu-trivial@nongnu.org; Sat, 05 Oct 2019 11:33:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iGm3s-0007BA-5d
 for qemu-trivial@nongnu.org; Sat, 05 Oct 2019 11:33:37 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:43149)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iGm3s-0007As-0Z
 for qemu-trivial@nongnu.org; Sat, 05 Oct 2019 11:33:36 -0400
Received: by mail-ot1-x344.google.com with SMTP id o44so7691562ota.10
 for <qemu-trivial@nongnu.org>; Sat, 05 Oct 2019 08:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zcDw5Wojp2disLArdDnJ1udwER4o7kyqmyFawSbiQBs=;
 b=fj+kjyick3KHHVb+Q8zUUt5HsAK9EKXv2H9suI83RB17sHRHhYjR6awi1dnlQnpizJ
 jDUv07cR8SVBnvpaUFgcGuTZMeiYslqRATtC9MdXZHN1UMxbes11Uf6ry7P4od5/LyHL
 9JkGJn7aURTGZ4KRiaQD2ppBpLENSTf+rRxfzmXDdaOKHGYIxj2lSUsPsovUHxJPGtzd
 uzwa2JMxYBorCJ82L4brfB5qTIB3R2hahm+6TNjE1FhMvg6dRCpEyi0RwQPuEUGKW7R9
 jqk0YL0cjfX5ujNTfVXLQd6vnXjv/zB1Yk4YtDH4Ds9J4njINIk4EJCKsW5Y9XeOLTWc
 FxoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zcDw5Wojp2disLArdDnJ1udwER4o7kyqmyFawSbiQBs=;
 b=KQNTL+cSHZDKJ2tlR6/QQ5G6h0Sk5upgqGzUCt4nl0Sdyg2LaA4mfqOZqlqBa9xKJM
 b4bQ0/AFI7y0o/5SFv8Y53FyLtDNp4oZsIApk82hdUM2FVCTgcBEUn24yAHz3YVosx39
 xHH8dzDm0chB4Sh23xngENRiOW6ITesiVPr+8PG/CIraIO2FWNmlHyhoYI+f5/1xnYxS
 li6Q8HphfDiOag/L81ZXCKTlqm7UKC8HUeL6itGfdd9GSVwoTgXR+83sE6I3dxGJvBFm
 evCpazOzn+/AVC4VnmFYt1Yb/XwOr/mfcGXYBQWsmkSIex6/+9gCG7ieU4qrT/18pq+2
 KSmQ==
X-Gm-Message-State: APjAAAWc/ugElG6B6hte+LYKZcUBFVvk0UOWEhfsqMPG34oFTfKGVYsB
 SZVOdAc+jRZe+PnM9LBkQHOG5XuGqnXVVXeNQ/ix/w==
X-Google-Smtp-Source: APXvYqxgXoieFhc4b4sbELf5KJ0aT1aMofhxlPF6X+VnSuBNWfxZS1SBxbPZCBmLCT7ahJWn85StRnbC+vO4fJ4cv34=
X-Received: by 2002:a9d:4615:: with SMTP id y21mr13929748ote.97.1570289615037; 
 Sat, 05 Oct 2019 08:33:35 -0700 (PDT)
MIME-Version: 1.0
References: <20191005150311.16373-1-f4bug@amsat.org>
In-Reply-To: <20191005150311.16373-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 5 Oct 2019 16:33:23 +0100
Message-ID: <CAFEAcA-ZaabfZpaMbAV1zSNqVqzQFCQaJJo3dru7TWcNL-AShQ@mail.gmail.com>
Subject: Re: [PATCH] hw/dma/etraxfs_dma: Simplify using MemoryRegionOps::impl
 access_size
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 05 Oct 2019 15:33:38 -0000

On Sat, 5 Oct 2019 at 16:04, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> This device implementation is clearly restricted to 32-bit
> accesses. Set the MemoryRegionOps::impl min/max access_size
> fields to simplify the code, and remove the hw_error() call.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/dma/etraxfs_dma.c | 25 ++++---------------------
>  1 file changed, 4 insertions(+), 21 deletions(-)
>
> @@ -701,6 +680,10 @@ static const MemoryRegionOps dma_ops =3D {
>         .read =3D dma_read,
>         .write =3D dma_write,
>         .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .impl =3D {
> +        .min_access_size =3D 4,
> +        .max_access_size =3D 4,
> +    },
>         .valid =3D {
>                 .min_access_size =3D 1,
>                 .max_access_size =3D 4

Unless I've forgotten how the memory layer works, doesn't this
mean we'll now try to synthesize 1 and 2 byte accesses by
making 4 byte accesses ? Would it be better to just set the
.valid.min_access_size to 4 ?

(The indent on the change looks a bit suspect but that's
because the whole file is tab-indent.)

thanks
-- PMM

