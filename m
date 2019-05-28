Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hVfFv-0005gZ-GX
	for mharc-qemu-trivial@gnu.org; Tue, 28 May 2019 12:47:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58219)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hVfFt-0005ed-Es
	for qemu-trivial@nongnu.org; Tue, 28 May 2019 12:47:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hVfFn-00069U-M3
	for qemu-trivial@nongnu.org; Tue, 28 May 2019 12:47:13 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:43491)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hVfFn-00054l-Fj
	for qemu-trivial@nongnu.org; Tue, 28 May 2019 12:47:11 -0400
Received: by mail-ot1-x341.google.com with SMTP id i8so18379004oth.10
	for <qemu-trivial@nongnu.org>; Tue, 28 May 2019 09:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=f6uPhcbzc3DGZEUHWi2LR+ruO0xWV4ctUDghO+B7y18=;
	b=dwG1SZBxq0Tiqd632YAxcmV4FIs939mIbEzcBiu/bFssMKeGlFdMlXoZeuOHNRtS+K
	+kxpg37Rq5P/2i7A2jh6D8A6qiTrXvTUNxyNmlagH8Lv4QW8KXObOfA3hkHHNWa5ikZF
	fI4Hrrc4PTo4TEnseNnyrB72b//zzErJ8TDX004RzRPIcvez4/3MDu+4X0z59RkrNgrj
	oO9nYq8DUsVx42dGU5BAVk1OAZ440XthR+zeOd0lGMZ9QRsmzmHCq/vdp1OkYIw/AbYJ
	UjpzE7Da1C+VOnsQwhW/Q5j7omAVolY1AdLxTvUkMmrlN5PnxTHj1Q0KH639IqXpgoef
	6srQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=f6uPhcbzc3DGZEUHWi2LR+ruO0xWV4ctUDghO+B7y18=;
	b=bkc3V3DrLCZPtpVaASL6F3NC8de/LcUlAtrvGtOzKCeO8dkSaB5H0LYMEAD5RZB+LX
	Yj7fwulA/B2rQbXQBYiDWa/57M0wUrbEfU1xY8EgU9m+FqMTqj3fp3li8bj3XV2wVA7K
	yW91bJUc0LWS+5B3p6KUTnYiQ4FYHekYfJof4vgbW/afwALj+ukdUu7HHGlcgiKIdFmA
	R9pGT0dSF5Ofu/SELaBmVat5p4mB1XKiLo97i7bHVwB8SuN7SmPrJ3nqBcy0mEjZq0yg
	stLoyV8FNz/Y8aseeenEpKkub+361ojpPr/e42pTBWKpC2BdWB56lyMY6WKlCKz3+rwX
	aw/A==
X-Gm-Message-State: APjAAAWiJN4786k0+IOkEl7iXYX267iDDqoN+QsU5V7NazJ5VI5LVAlv
	ZnNGruOb7Bx5k+fXTp1uiuWscxvRxdSXPHocv6v0Hw==
X-Google-Smtp-Source: APXvYqwg4QBMnd0xwsxxrLWAMF5gZIyx4nL5uKGxdpOPiQBWJ+dtfH7tacG0hCW/vkYh9Sq2SS9WXXVmDQEYB3NBk6k=
X-Received: by 2002:a05:6830:209a:: with SMTP id
	y26mr47405395otq.232.1559061977945; 
	Tue, 28 May 2019 09:46:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190528164020.32250-1-philmd@redhat.com>
	<20190528164020.32250-7-philmd@redhat.com>
In-Reply-To: <20190528164020.32250-7-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 May 2019 17:46:06 +0100
Message-ID: <CAFEAcA-eGUW096e2Y6vinPHvF74ogwXBaP+orxYEoRhB-mhGFw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, 
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	Aleksandar Rikalo <arikalo@wavecomp.com>, 
	Halil Pasic <pasic@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Michael Walle <michael@walle.cc>, Richard Henderson <rth@twiddle.net>,
	Aleksandar Markovic <amarkovic@wavecomp.com>, 
	Cornelia Huck <cohuck@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>, 
	Fam Zheng <fam@euphon.net>, qemu-s390x <qemu-s390x@nongnu.org>, 
	Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-trivial] [PATCH v2 06/10] hw/audio/ac97: Use the QOM
 DEVICE() macro to access DeviceState.qdev
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
X-List-Received-Date: Tue, 28 May 2019 16:47:18 -0000

On Tue, 28 May 2019 at 17:42, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> Rather than looking inside the definition of a DeviceState with
> "s->qdev", use the QOM prefered style: "DEVICE(s)".
>
> This patch was generated using the following Coccinelle script
> (with a bit of manual fix-up, removing an extra space to please
> checkpatch.pl):
>
>     // Use DEVICE() macros to access DeviceState.qdev
>     @use_device_macro_to_access_qdev@
>     expression obj;
>     identifier dev;
>     @@
>     -&obj->dev.qdev
>     +DEVICE(obj)
>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/audio/ac97.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/audio/ac97.c b/hw/audio/ac97.c
> index 2265622d44..a4e8d99e77 100644
> --- a/hw/audio/ac97.c
> +++ b/hw/audio/ac97.c
> @@ -1388,7 +1388,7 @@ static void ac97_realize(PCIDevice *dev, Error **er=
rp)
>      pci_register_bar (&s->dev, 0, PCI_BASE_ADDRESS_SPACE_IO, &s->io_nam)=
;
>      pci_register_bar (&s->dev, 1, PCI_BASE_ADDRESS_SPACE_IO, &s->io_nabm=
);
>      AUD_register_card ("ac97", &s->card);
> -    ac97_on_reset (&s->dev.qdev);
> +    ac97_on_reset(DEVICE(s));
>  }

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>.

As an aside, this function has a lot of uses of "&s->dev" to
get the PCIDevice* given an AC97LinkState*. This isn't
necessary as the function has been passed the PCIDevice*
as its argument, so all the uses of "&s->dev" here could
just be written as "dev".

thanks
-- PMM

