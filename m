Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gR3Fl-0001OC-C7
	for mharc-qemu-trivial@gnu.org; Sun, 25 Nov 2018 17:51:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43526)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gR3Fg-0001N6-HQ
	for qemu-trivial@nongnu.org; Sun, 25 Nov 2018 17:51:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gR3Ff-0001Yd-Ro
	for qemu-trivial@nongnu.org; Sun, 25 Nov 2018 17:51:44 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:32904)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gR3Fe-0001Xb-G5
	for qemu-trivial@nongnu.org; Sun, 25 Nov 2018 17:51:43 -0500
Received: by mail-ot1-x341.google.com with SMTP id i20so14979164otl.0
	for <qemu-trivial@nongnu.org>; Sun, 25 Nov 2018 14:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=4VPFUvUh+SIJ+3NGyAlEbuOq1IguRY+8U6jYQsAVtDc=;
	b=FDwH15krw1eoVUTttPiwXJr5Kh6RDuVBxT35ruYHQdblwqcyoY7+jPRMD1nKzieYzj
	TddtTzyK2ytIsbjET2pA3zIQGF5E617WlycUmWI1Vf3kuCF/0fSLgTafGCFit8fcUtKb
	DYc1fZY9l0M0PaUzIv/1YxxLbapK67+imZlX4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=4VPFUvUh+SIJ+3NGyAlEbuOq1IguRY+8U6jYQsAVtDc=;
	b=pe0vESPx1lXWWCQRRBqlS3JyVnjVvROPTImgeAF5g/CbeOj5YnrvDBSiFQ4zhpp2nd
	g4BnUfmH3UwW4/48qcyr+tbUpeBd9TogI+RoaqcMyZNuSGDH3ZmLJs14ZDWEcX4qYShK
	wlhb/CtfBG9kMk5veZxZJUYoRjs5ggTdHGQYHpyTnxTdqXBmIajx/gkGKgw9ZgeqpX+n
	Iji6cBqPiQu9BtXjl3gv5ELqeHl8U9a49cYy5r5A7TFtLU4v2ngVh23bsGANwFYfoM2M
	k2ClBTAV7He5Z63PjBz+/3zGmiT8zN+mluWE456SZ1/tM7MfyYRO99y+eJJAMYTY60sh
	BCqA==
X-Gm-Message-State: AA+aEWZTYbMJsHwNMFTXXG7G5HJcvZpTZcYSyyoXgV6BQDzH/s5hpq2l
	Gx1toQotu57ago4kZnRAsZKmlDJSbSrrTMdQS63+qA==
X-Google-Smtp-Source: AFSGD/UiJn6RxAp6kFqFj6QEIeRhYBx07/8+br643TlHdSMmFqzOTK4Zap3Xv48mG7+1HGjeqHosG6Rfnwtm3T6BRbY=
X-Received: by 2002:a9d:3d44:: with SMTP id a62mr5196462otc.363.1543186302038; 
	Sun, 25 Nov 2018 14:51:42 -0800 (PST)
MIME-Version: 1.0
References: <20181125205000.10324-1-philmd@redhat.com>
	<20181125205000.10324-17-philmd@redhat.com>
In-Reply-To: <20181125205000.10324-17-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 25 Nov 2018 22:51:30 +0000
Message-ID: <CAFEAcA-9eazE0mhLA04JoUh6mwuiA3RVGVeeQrbYO9JwaEC-=A@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>, 
	QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-trivial] [PATCH for-3.1 16/25] MAINTAINERS: Add missing
 entries for the MPS2 machine
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
X-List-Received-Date: Sun, 25 Nov 2018 22:51:48 -0000

On Sun, 25 Nov 2018 at 20:52, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> Missed in de343bb632a.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e04f2f1a44..2795135a09 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -587,6 +587,8 @@ F: hw/misc/mps2-*.c
>  F: include/hw/misc/mps2-*.h
>  F: hw/arm/iotkit.c
>  F: include/hw/arm/iotkit.h
> +F: hw/misc/iotkit-secctl.c
> +F: include/hw/misc/iotkit-secctl.h
>  F: hw/misc/iotkit-sysctl.c
>  F: include/hw/misc/iotkit-sysctl.h
>  F: hw/misc/iotkit-sysinfo.c
> --

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

