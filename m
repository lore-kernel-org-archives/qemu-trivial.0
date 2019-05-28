Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hVcrU-0002aN-2C
	for mharc-qemu-trivial@gnu.org; Tue, 28 May 2019 10:13:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45157)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hVcrS-0002Zc-Ph
	for qemu-trivial@nongnu.org; Tue, 28 May 2019 10:13:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hVcrD-00016T-Jd
	for qemu-trivial@nongnu.org; Tue, 28 May 2019 10:13:43 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:40119)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hVcr1-0000kk-Fc
	for qemu-trivial@nongnu.org; Tue, 28 May 2019 10:13:29 -0400
Received: by mail-ot1-x341.google.com with SMTP id u11so17866725otq.7
	for <qemu-trivial@nongnu.org>; Tue, 28 May 2019 07:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=v/m2uRfH+cSnyzahDf7B4swuBDM+bQU5sl6/jcQh0Og=;
	b=OPqTKcS0G698YeXpnPf1cbRnADm3phWX2aPXwh7nIWNgWAkYsGg54dPM2ZQlkSEhaZ
	vXnb99zepogy61aERIsRmGJz/nQUQUfe/o+Prk8XCsp25zvOMXSb3NTBXk/mbEuv9Wrs
	zCj6aw3Bt8Y1fELkh2sB+6321JXVQG5uK+Gmu1ohqECC8GuzbZqRzLmRcXbhY0RKweIJ
	zVVWQA+lzSyLERpcCVFYbedarmkj666L2NaeMWfp9boQYTkx1yTacfxg8Sq97Mm+DxJ/
	5IFv41m5aGhw6aJl8GJWNFIfdgY36wXPt9l9wry0ekUT3q+JnKF+dhm5zgOJZ6l3ByUr
	s1uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=v/m2uRfH+cSnyzahDf7B4swuBDM+bQU5sl6/jcQh0Og=;
	b=Wp90p+ZyNgrxc5rInvcc57iiggVHddT+yxBhgNEPRmc6mUBYErMyMQ1b3+DXmQ1a1G
	/OEtxRY2ACiS+nO3xRdfLbwX8rriNFHBXOqGvW8LJMO1bOqUTNBJNv0Rl7INlYT3pYJK
	b7jjpQuCdahjcPTZ7/QTH0R+1x58jPh4AjRPOmJke6N/CWjC1ekVFtbkPYY5ZOsG4kDB
	8cs5SHL3OoULd8/2aPLT4Ho7KhfUC/Ok1vT5WewONX7qlMacsCAXMYfmgiAMChWaAAE7
	9B7JLEZxlm77NfiRvNeNsuS5KyD5bwRy63/CX3X+XbfzxIeoP9bTfOdepjEDQzILOUIy
	DIUw==
X-Gm-Message-State: APjAAAUSqkLCMz65mILSDTB3eiicNbo5IIoHJEOv/hnfW0du4EmiaPlH
	Ue/zvqs5QiSfQNE+DXkvfUNvY1KTB1khWYx/GrGY3w==
X-Google-Smtp-Source: APXvYqwSkkhpv6A1njd+sa7l79FnKwFhEI1njWNOxcyNUuCcWB2a8Llgrnwl1iLL3E18dPJ69Cz5fenuhAciri/I0Zc=
X-Received: by 2002:a05:6830:149a:: with SMTP id
	s26mr110651otq.221.1559052784894; 
	Tue, 28 May 2019 07:13:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190528140750.28036-1-philmd@redhat.com>
In-Reply-To: <20190528140750.28036-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 May 2019 15:12:53 +0100
Message-ID: <CAFEAcA8PmF-y8-RH6gC2mZQpUdOUEfHWp0aW_hwEDFHK7+QxwA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, 
	Fam Zheng <fam@euphon.net>, Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-trivial] [PATCH] hw/scsi/vmw_pvscsi: Use qbus_reset_all()
 directly
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
X-List-Received-Date: Tue, 28 May 2019 14:13:55 -0000

On Tue, 28 May 2019 at 15:08, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> Since the BusState is accesible from the SCSIBus object,
> it is pointless to use qbus_reset_all_fn.
> Use qbus_reset_all() directly.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> One step toward removing qbus_reset_all_fn()
> ---
>  hw/scsi/vmw_pvscsi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/scsi/vmw_pvscsi.c b/hw/scsi/vmw_pvscsi.c
> index 584b4be07e..6f571d0d19 100644
> --- a/hw/scsi/vmw_pvscsi.c
> +++ b/hw/scsi/vmw_pvscsi.c
> @@ -440,7 +440,7 @@ static void
>  pvscsi_reset_adapter(PVSCSIState *s)
>  {
>      s->resetting++;
> -    qbus_reset_all_fn(&s->bus);
> +    qbus_reset_all(&s->bus.qbus);

I thought our QOM style prefers using "BUS(&s->bus)"
rather than looking inside the definition of the
SCSIBus struct with "s->bus.qbus" ? (Compare preferring
"DEVICE(s)" to "s->qdev".)

thanks
-- PMM

