Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQVHi-0006Yq-Jt
	for mharc-qemu-trivial@gnu.org; Wed, 15 Sep 2021 09:49:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQVHf-0006VQ-T5
 for qemu-trivial@nongnu.org; Wed, 15 Sep 2021 09:49:08 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:45685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQVHc-00036c-AB
 for qemu-trivial@nongnu.org; Wed, 15 Sep 2021 09:49:07 -0400
Received: by mail-wr1-x42f.google.com with SMTP id d21so3978628wra.12
 for <qemu-trivial@nongnu.org>; Wed, 15 Sep 2021 06:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=i0+0xOhX9dhCno/WLsEJZHNV498b4wM1+4uRynqwmas=;
 b=nwwMXZr9T4dXiwW+WeLvzb+RAZJ1sFz/B9+aAymusqH6SvTWHQvk/6m2D7ye1ZXp2D
 2i50kRowydApMc5NwQUadxirhGMMrH7lSr0tTid21StyDV19adutZUcX7i75TOrlJeL2
 xpaFEDoGrdTegxzgD38sZSUujAkO+Lpbm4phVbZv7evgLeCinQYRlc7uLIX3fQ6I9cec
 fN13Nev3/4bV6eQt0f9UHCAk6wkSLZgiw5Rh9I2nPSLAcEH3xFkJxqcqcu4+uBIGZdY4
 ODd7X37YuPQdhPVeUiaWKexqAEX1Av4pE7PAadcKgb9g+opE7x2xiFdiNB716zibGEjh
 gh0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=i0+0xOhX9dhCno/WLsEJZHNV498b4wM1+4uRynqwmas=;
 b=QNdakeGdj2ids90uRESh6jUcff26X9DwYthq0rh8sOWY7Vd2Ct3S5YDFbgEa9T51mF
 tHQzlJmelMXO74nT9PaQv/mQnqh3GDruOPaTaZWGpnDAWeAN2OBtqM/EJD0n48s14KuB
 Z8xWJl+SdZLqHzPPom4uQ80SXRWMU6lcVqQ8vX17PA5s9zx3rDJAOLbELOaVNwwxpqpT
 sJFgUedoro3nI5A2sbyeHiqIGBZatcQebHzCnz9N22qUri5EiB+3G9T8FFNrDsJJ35TJ
 MdpIKOT5d2HuMbA5t9kFNh1/fUSXzl/S1KfRBtqYA9IleDXwpPBolY1GXviooiIYWiJ+
 9J+g==
X-Gm-Message-State: AOAM530cqm8K4f8+TfFJ6xaM6YrG6NoTBaOUKxt6ni5fCibV8IMW1zJ0
 0f82hhzgQVelA9FF/Ys2ZUNtLtz9zW/nIgFhDpXHNA==
X-Google-Smtp-Source: ABdhPJxrdTV9h683PXPy5b6/+wHrEi0wPVCJoqv6S/VYengt9vVIVjNCnmq7f8nUvx7YJyYdWvIbwF+nXnbzmcjsTLY=
X-Received: by 2002:adf:fb91:: with SMTP id a17mr9622wrr.376.1631713742652;
 Wed, 15 Sep 2021 06:49:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210901121620.1320-1-programmingkidx@gmail.com>
 <9c8e7273-6b28-8598-f679-92c467fff06a@vivier.eu>
In-Reply-To: <9c8e7273-6b28-8598-f679-92c467fff06a@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 15 Sep 2021 14:48:11 +0100
Message-ID: <CAFEAcA9HCF1FwqsDwwOqYCajAfWQxJBut7aRVoEaNEYDZbo29g@mail.gmail.com>
Subject: Re: [PATCH] Add qemu_vga.ndrv to build/pc-bios folder
To: Laurent Vivier <laurent@vivier.eu>
Cc: John Arbuckle <programmingkidx@gmail.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Wed, 15 Sep 2021 13:49:08 -0000

On Wed, 15 Sept 2021 at 14:31, Laurent Vivier <laurent@vivier.eu> wrote:
>
> CC Mark
> CC qemu-devel
>
> Le 01/09/2021 =C3=A0 14:16, John Arbuckle a =C3=A9crit :
> > Currently the file qemu_vga.ndrv is not copied into the /build/pc-bios =
folder. This makes all video resolution choices disappear from a PowerPC Ma=
c OS guest. This patch has the qemu_vga.ndrv file copied into the build/pc-=
bios folder giving users back their video resolution choices.
> >
> > Signed-off-by: John Arbuckle <programmingkidx@gmail.com>
> > ---
> >  configure | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/configure b/configure
> > index 9a79a004d7..281577e46f 100755
> > --- a/configure
> > +++ b/configure
> > @@ -5056,7 +5056,9 @@ for bios_file in \
> >      $source_path/pc-bios/openbios-* \
> >      $source_path/pc-bios/u-boot.* \
> >      $source_path/pc-bios/edk2-*.fd.bz2 \
> > -    $source_path/pc-bios/palcode-*
> > +    $source_path/pc-bios/palcode-* \
> > +    $source_path/pc-bios/qemu_vga.ndrv
> > +
> >  do
> >      LINKS=3D"$LINKS pc-bios/$(basename $bios_file)"

The code change here is right, but Mark suggested a
commit message rewording:

https://patchew.org/QEMU/20210831165020.84855-1-programmingkidx@gmail.com/

With Mark's rewording, you can have a
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

-- PMM

