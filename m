Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cjWVt-000208-4z
	for mharc-qemu-trivial@gnu.org; Thu, 02 Mar 2017 14:35:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55315)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cjWVp-0001z4-3I
	for qemu-trivial@nongnu.org; Thu, 02 Mar 2017 14:35:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cjWVo-0002zM-BF
	for qemu-trivial@nongnu.org; Thu, 02 Mar 2017 14:35:41 -0500
Received: from mail-wm0-x233.google.com ([2a00:1450:400c:c09::233]:37691)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cjWVo-0002yE-4x
	for qemu-trivial@nongnu.org; Thu, 02 Mar 2017 14:35:40 -0500
Received: by mail-wm0-x233.google.com with SMTP id n11so34199794wma.0
	for <qemu-trivial@nongnu.org>; Thu, 02 Mar 2017 11:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KBTRMJ1B53Wa0FSGaR/6hoEs9Z+ZW6U746PuQbyXfOs=;
	b=AXg4bu0APT8gUMPhUtW8Q1XkTY5OWD73RyJ8U+DoN6kQlLIvI/R5wzBqmhuBpkbprs
	eiLChJ6YH3UHPMSCrS4g1jg1ZON3r2CtGY3Il00X1h3+74H7UgA3WIMpPayW8SXUvSnQ
	E84ND/UD/093IIzpy2HjdIhg6lCk6rr3QcvOk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KBTRMJ1B53Wa0FSGaR/6hoEs9Z+ZW6U746PuQbyXfOs=;
	b=RRarBPiTU9dgqKH/FqLuV9gFV0UvjNyjUl4eV29SedPHEDFAdllFezlpNRHah0i0w0
	Hd4NjKPsJXnUSgizTMS0ECK1NYCv78bjmivai1kY+ZDOTiRnYfKqWnac2V+gHDE7dG6B
	h6FS2cuHQUCDf2TpcvmFtPh+MWx7nV5v3Xj85LPcPvyACScyk9FAFhJs9vmq1o4UQSYv
	2ShIwGCBV3aan6XI7xSxipRV4qXGwqsER6eCAwCJuY3tQK5oCm6t5gizYsKYXmsalpVo
	bkOFKX8yGIVWdofPB+amB8P2PB9bOQ2Z1INc3xyAW0sElDi06FI9XmQejcZ/JIucwLvu
	SyKg==
X-Gm-Message-State: AMke39m1QI6+TRLaS3sl/rSl5gzK2ECv8f/LU6dZwEV/TBuL+vChtdGcti5Rxpnt94qKPCAIF0q+GtcnJonEo1bB
X-Received: by 10.28.172.68 with SMTP id v65mr9349245wme.111.1488483337465;
	Thu, 02 Mar 2017 11:35:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Thu, 2 Mar 2017 11:35:16 -0800 (PST)
In-Reply-To: <42af1728d1f27eab0b20f2474cf0c18a15d94f96.1488068248.git.balaton@eik.bme.hu>
References: <cover.1488068248.git.balaton@eik.bme.hu>
	<42af1728d1f27eab0b20f2474cf0c18a15d94f96.1488068248.git.balaton@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Mar 2017 19:35:16 +0000
Message-ID: <CAFEAcA9pCL-YFqEi-SXFAiAZe3sRT=KK-Vqc87x-d5j7NQST3Q@mail.gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::233
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 08/14] sm501: Fix
 hardware cursor
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
X-List-Received-Date: Thu, 02 Mar 2017 19:35:43 -0000

On 4 December 2016 at 18:01, BALATON Zoltan <balaton@eik.bme.hu> wrote:
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>

Can you say in the commit message what the bugs you're fixing are,
please? Otherwise it's a bit hard to disentangle here what's
just refactoring and what's making behavioural changes.

> ---
>  hw/display/sm501.c          | 169 +++++++++++++++++++++++++-------------------
>  hw/display/sm501_template.h |  25 +++----
>  2 files changed, 107 insertions(+), 87 deletions(-)
>
> diff --git a/hw/display/sm501.c b/hw/display/sm501.c
> index 2694081..c4bdc50 100644
> --- a/hw/display/sm501.c
> +++ b/hw/display/sm501.c
> @@ -553,6 +553,24 @@ static uint32_t get_local_mem_size_index(uint32_t size)
>      return index;
>  }
>
> +static inline int get_width(SM501State *s, int crt)
> +{
> +    int width = crt ? s->dc_crt_h_total : s->dc_panel_h_total;
> +    return (width & 0x00000FFF) + 1;
> +}
> +
> +static inline int get_height(SM501State *s, int crt)
> +{
> +    int height = crt ? s->dc_crt_v_total : s->dc_panel_v_total;
> +    return (height & 0x00000FFF) + 1;
> +}
> +
> +static inline int get_bpp(SM501State *s, int crt)
> +{
> +    int bpp = crt ? s->dc_crt_control : s->dc_panel_control;
> +    return (8 << (bpp & 3)) / 8;

Isn't this the same as "1 << (bpp & 3)" ?

> +}


thanks
-- PMM

