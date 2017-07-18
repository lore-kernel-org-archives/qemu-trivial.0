Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dXQgQ-0005iW-Uj
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jul 2017 07:28:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37516)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1dXQgP-0005hF-3d
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 07:28:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1dXQgO-0008Lv-9v
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 07:28:53 -0400
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241]:35082)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
	id 1dXQgO-0008Ka-20; Tue, 18 Jul 2017 07:28:52 -0400
Received: by mail-lf0-x241.google.com with SMTP id z78so1463524lff.2;
	Tue, 18 Jul 2017 04:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=6d6nSkfZYy7C4sL02I3jrIN2nfhKbnP9QrgK9LNvkFk=;
	b=svTNAcJTjhDHc/6WOli96/EHRfSIWqeFGWuxchN+6MQD3Xi3Y6wNHA06U4lHJhy19l
	yNazOerp0GwMGOi/PJOUJXutt8IC5OpuDfQrnLSf27CSKWtPsQDkvMg9XKO520DimREa
	7hfs6QGYw+qvv4DKc8qvTHfXcKgMW2Ryt0EPrPDL+TGBOCFNMvUnM6TATibwOLgCtjWF
	AL17vUGUGO65DDZNJIpVIvP2lbuXyMkuJp8CFPoEsuErunovZxcflv08cTb8OIY27nwA
	7CCBd/YoIhxIv5Od87OUjG6zw67wF++Ed6RFPImttF+lfeWDPlGRKkdF/qH3fv5T7rZk
	1JHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=6d6nSkfZYy7C4sL02I3jrIN2nfhKbnP9QrgK9LNvkFk=;
	b=RmDwNJyiKXJ08CWcrZtIqokILR1+9kG0xMgDKQnY+Guf0CBrmnHv2aAOban9qXQte7
	B97DRTFue/bdE8LPwhnHdeM7D8iaCPYNMIDURq7HjBVnSwbeHSnWGMxT8JAIcHZd8Ies
	yG9r7S3eFAaGY5IsexyeEh2uRpqBmn2V9Z7VxgC1MkfSCaLnsjUjZ0UGLcih53pp7pt4
	3mBLicglCkCUGvl+bskpargD42wKTrvkfmsnLAv4DI0DttGlzPWFxAqQoarWm9IPtO1d
	olhsWvr6IS+UPvBllxo1h4klvTgC8sLw8+4eLAP3A3we457xw0PaxxXivGk6pa6ikFu8
	/r2w==
X-Gm-Message-State: AIVw111Dw/HbHObsGzhhJYOC9BD2nmPny2nQ10L9BJNy1DVVWQa5IbXG
	/ugueNRn0+JxNya52mYj1Rg/z57p6g==
X-Received: by 10.25.104.19 with SMTP id d19mr503716lfc.139.1500377329262;
	Tue, 18 Jul 2017 04:28:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.59.145 with HTTP; Tue, 18 Jul 2017 04:28:48 -0700 (PDT)
In-Reply-To: <20170718061005.29518-23-f4bug@amsat.org>
References: <20170718061005.29518-1-f4bug@amsat.org>
	<20170718061005.29518-23-f4bug@amsat.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 18 Jul 2017 04:28:48 -0700
Message-ID: <CAJ+F1CJV5eMt0rTTzCKrEAH0vk7w3OrRNr4kz7jcYEquRCxXkA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: qemu trival <qemu-trivial@nongnu.org>, Dmitry Fleytman <dmitry@daynix.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, QEMU <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 22/29] vmsvga: use
 ARRAY_SIZE macro
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
X-List-Received-Date: Tue, 18 Jul 2017 11:28:54 -0000

On Mon, Jul 17, 2017 at 11:09 PM, Philippe Mathieu-Daud=C3=A9
<f4bug@amsat.org> wrote:
> Applied using the Coccinelle semantic patch scripts/coccinelle/use_osdep.=
cocci
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>
> No entry in MAINTAINERS, should it go under Graphics or Vmware?
>
>  hw/display/vmware_vga.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/hw/display/vmware_vga.c b/hw/display/vmware_vga.c
> index 4a64b41259..ff8130ff70 100644
> --- a/hw/display/vmware_vga.c
> +++ b/hw/display/vmware_vga.c
> @@ -679,10 +679,9 @@ static void vmsvga_fifo_run(struct vmsvga_state_s *s=
)
>              if (cursor.width > 256
>                  || cursor.height > 256
>                  || cursor.bpp > 32
> -                || SVGA_BITMAP_SIZE(x, y)
> -                    > sizeof(cursor.mask) / sizeof(cursor.mask[0])
> +                || SVGA_BITMAP_SIZE(x, y) > ARRAY_SIZE(cursor.mask)
>                  || SVGA_PIXMAP_SIZE(x, y, cursor.bpp)
> -                    > sizeof(cursor.image) / sizeof(cursor.image[0])) {
> +                    > ARRAY_SIZE(cursor.image)) {
>                      goto badcmd;
>              }
>
> --
> 2.13.2
>
>



--=20
Marc-Andr=C3=A9 Lureau

