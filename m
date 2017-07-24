Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dZkip-0002tz-6m
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jul 2017 17:16:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33005)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dZkim-0002tM-CH
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 17:16:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dZkil-0001D1-Gw
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 17:16:56 -0400
Received: from mail-wm0-x22b.google.com ([2a00:1450:400c:c09::22b]:36172)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dZkil-0001CS-AA
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 17:16:55 -0400
Received: by mail-wm0-x22b.google.com with SMTP id t201so29786031wmt.1
	for <qemu-trivial@nongnu.org>; Mon, 24 Jul 2017 14:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=yVlbEY121I9o4SL36Sl0n002Q4VRG7QdNCkoVq+XnxA=;
	b=UDgk78lFoDRj6GdV41O5951LOPiI/A0KqerucmKHy5c8LdVZZAW43G0zW7r7Bxlq+s
	QbSld6W7LpFqwkmt9hPS4cbBFGQTTiSUDK5Qiw2SmHD0o+2ibvI0wejouyAWwr/Bujv2
	+IZGAIywkrfU6A7VHUTN5mYQ3r/4lHsz5wkbs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=yVlbEY121I9o4SL36Sl0n002Q4VRG7QdNCkoVq+XnxA=;
	b=G31rbfW3G53fhOssokUw2yvxYbcupQpvFBTnRCmclFtypzPn1zRfGsID0nzCHzOQ7Z
	0jzLlnT8ZUl7a3cap1Q5D1LJXPR4NCd6Iosklmn+Ldf0jPJ1dJhCdwfTRDW2MjueclFN
	dIhktozGqPUxaqbhM5yi5G8u1yYy6DZhai+4UGjo2DbzR+XHc16BC5bi7dduqP555I/T
	cJP+q+i0bqm3ExisRf0YSQVQmGUlmMRgdOlHDe+B9GtODa974tn4GhXFf1VIIeTnPCqI
	gMfJ5dqXSDCcS8jaYg10wRlMNQ8G7fvPtrGtvxziFhEbzuyztWGCqHX5A9D8muw5E3gK
	u8mA==
X-Gm-Message-State: AIVw113xM/hXrTdU/3U3YkRN18LPkT0KLX10H8NNF8kDSDJ5kihRCzOK
	fLijVP2Sjennv4Eqf0AZnxHLhZzh8fux
X-Received: by 10.28.24.135 with SMTP id 129mr6008375wmy.86.1500931013872;
	Mon, 24 Jul 2017 14:16:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.54 with HTTP; Mon, 24 Jul 2017 14:16:33 -0700 (PDT)
In-Reply-To: <20170724182751.18261-4-f4bug@amsat.org>
References: <20170724182751.18261-1-f4bug@amsat.org>
	<20170724182751.18261-4-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Jul 2017 22:16:33 +0100
Message-ID: <CAFEAcA8QspP_PEaWBKVt7QWOpwHjJNav3x9yy9D-hX5D8_QzUA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Eric Blake <eblake@redhat.com>,
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
	Riku Voipio <riku.voipio@iki.fi>, QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22b
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for 2.10 03/35] thunk: check
 nb_fields is valid before continuing
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
X-List-Received-Date: Mon, 24 Jul 2017 21:16:57 -0000

On 24 July 2017 at 19:27, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wro=
te:
> thunk.c:91:32: warning: Call to 'malloc' has an allocation size of 0 byte=
s
>         se->field_offsets[i] =3D malloc(nb_fields * sizeof(int));
>                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> Reported-by: Clang Static Analyzer
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  thunk.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/thunk.c b/thunk.c
> index 2dac36666d..d1c5e221f5 100644
> --- a/thunk.c
> +++ b/thunk.c
> @@ -67,7 +67,6 @@ void thunk_register_struct(int id, const char *name, co=
nst argtype *types)
>      int nb_fields, offset, max_align, align, size, i, j;
>
>      assert(id < max_struct_entries);
> -    se =3D struct_entries + id;
>
>      /* first we count the number of fields */
>      type_ptr =3D types;
> @@ -76,6 +75,10 @@ void thunk_register_struct(int id, const char *name, c=
onst argtype *types)
>          type_ptr =3D thunk_type_next(type_ptr);
>          nb_fields++;
>      }
> +    if (!nb_fields) {
> +        return;
> +    }

Can this ever actually happen? We only call this function
for a fixed set of known-at-compile-time data (it's invoked
by all the STRUCT() macro uses). It seems likely that it
would be better to make this an assert() and check that none
of our uses of STRUCT() cause it to fire.

> +    se =3D struct_entries + id;
>      se->field_types =3D types;
>      se->nb_fields =3D nb_fields;
>      se->name =3D name;
> --
> 2.13.3
>

thanks
-- PMM

