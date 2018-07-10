Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fctSU-0001xA-0b
	for mharc-qemu-trivial@gnu.org; Tue, 10 Jul 2018 10:17:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54271)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1fctSR-0001x0-15
	for qemu-trivial@nongnu.org; Tue, 10 Jul 2018 10:17:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1fctSN-0004lx-Su
	for qemu-trivial@nongnu.org; Tue, 10 Jul 2018 10:17:35 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:36949)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1fctSN-0004lb-K7; Tue, 10 Jul 2018 10:17:31 -0400
Received: by mail-wr1-x441.google.com with SMTP id q10-v6so14812515wrd.4;
	Tue, 10 Jul 2018 07:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Y0B2JH5bMtmSpZigtDWAm7gSYt5AcQc3NSSSy/63z6Y=;
	b=JG1Vim87phLcdxwUJC6tW39HK4oS63LMinMnLLNMkyIMpFB0oKZM39soLZZwV5mQ4E
	WkSuLUIJwFpgvm9GA09+ui+QL0Tj5IWx5USX2AJNq5AM4CI2h3fDW+0WATSfas2RsyeG
	1H6BpTXLqxXGF70UGZVbEr863vdWQ60Me5Q9pSXkfrNljGqKM1NhQd1029B25SpXTJBn
	hcbSHZYxt4aVTXdM7IcoqIud5kMI9iybkVb1LMR4k/N8ZTdXo7r24vKhHvoZEvBWpqdO
	AoFrMwh7pMceNdqNrRD7mAdqVxr976hi0nOLzZaZKXwOS+OGtm0EaOHIzkhMP3jU67nk
	/KEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Y0B2JH5bMtmSpZigtDWAm7gSYt5AcQc3NSSSy/63z6Y=;
	b=Uem/Yxs3c5FXiOhxe8BokRHTZGAxNq+zAQY4OfFfjxUTcQVhoosgWC8+jtzJ4q6pE2
	q6eCmR5aAaru+zh73L3PpZOiKZGIenK3aV8cP4kgdhUw7rOC2EPpxEkIRVY1Vie094KY
	Bgm0waG3lWan5EdfVGy/CBhIF18HPA9hEc4FoTBAEYKKna+7XZ6HjS4/SoEr0a/C/rGq
	yHS3lkme9kliRyCB2C0DRN7M42u6qE/RElpzjjq53ROLkOmI17gjE3XjBM8jcDmotknr
	QV60nJ3Zz4uF2llMJu2Fc68lbM32k/eBf0p4j5jTwJBJfc3OZifiCGQAljWspuELob02
	a6pA==
X-Gm-Message-State: APt69E1a7ukZ9jm7jcCxTP2oViHHLEK/NBnMcTiRtR9eHwTeGMJ7UmCa
	Zkfe7I43NRvE2Gs5AkjjXzU=
X-Google-Smtp-Source: AAOMgpc4s7NXSUJnamNT94K29nLsz2RTADGn7X7s2KG6do8SI8FWnh1SrRFSulZ5qylNACgqWrmyuw==
X-Received: by 2002:adf:c4f0:: with SMTP id
	o45-v6mr17335173wrf.173.1531232250531; 
	Tue, 10 Jul 2018 07:17:30 -0700 (PDT)
Received: from localhost ([51.15.41.238]) by smtp.gmail.com with ESMTPSA id
	t11-v6sm12993192wro.53.2018.07.10.07.17.29
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 10 Jul 2018 07:17:29 -0700 (PDT)
Date: Tue, 10 Jul 2018 15:17:28 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Yaowei Bai <baiyaowei@cmss.chinamobile.com>
Cc: mjt@tls.msk.ru, laurent@vivier.eu, stefanha@redhat.com,
	qemu-trivial@nongnu.org, armbru@redhat.com, qemu-devel@nongnu.org,
	cota@braap.org
Message-ID: <20180710141728.GD30635@stefanha-x1.localdomain>
References: <1530674247-31200-1-git-send-email-baiyaowei@cmss.chinamobile.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="veXX9dWIonWZEC6h"
Content-Disposition: inline
In-Reply-To: <1530674247-31200-1-git-send-email-baiyaowei@cmss.chinamobile.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] tracing: Use double-dash
 spelling for trace option
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
X-List-Received-Date: Tue, 10 Jul 2018 14:17:37 -0000


--veXX9dWIonWZEC6h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 04, 2018 at 11:17:27AM +0800, Yaowei Bai wrote:
> The '-trace' and '--trace' spellings are only both supported in qemu
> binary, while for qemu-nbd or qemu-img only '--trace' spelling is
> supported. So for the consistency of trace option invocation, we
> should use double-dash spelling in our documentation.
>=20
> This's also mentioned in
> https://wiki.qemu.org/BiteSizedTasks#Consistent_option_usage_in_documenta=
tion
> .
>=20
> Signed-off-by: Yaowei Bai <baiyaowei@cmss.chinamobile.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> ---
>  docs/devel/tracing.txt | 6 +++---
>  trace/control.c        | 4 ++--
>  trace/control.h        | 4 ++--
>  3 files changed, 7 insertions(+), 7 deletions(-)

Thanks, applied to my tracing tree:
https://github.com/stefanha/qemu/commits/tracing

Stefan

--veXX9dWIonWZEC6h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJbRL/4AAoJEJykq7OBq3PImI0H/i3az246Z4UI/B4yb8K+AknT
kgNqehTmczemTqjxMVGQkVe/IuWhyGuin2PSe+8zKqHHnMYbtBJw0LMuiSN4qNDA
clgoH7twVodIYmBsd+vlX0vwE4LWKfR50JKz6LpP4IcPnSLdIap7bffKcwQYmx8m
fTmGTKalS8o8IfkGAqQktwVtCKD6inQjSiYZVyf4GgEkMOn9FbtPzfBczbLLF/mE
HaQCP7wICdhXhphehF/EwNU63Cg1T3TzziIn7e/l6G7PiRuN0Bw4qpbNDqOeOHk2
EinpjihNbwOryWnVpTbHUphvd28qiaUcVxvYkAiGNio4Z3FIyj+xf2gE0fxlF08=
=Gs67
-----END PGP SIGNATURE-----

--veXX9dWIonWZEC6h--

