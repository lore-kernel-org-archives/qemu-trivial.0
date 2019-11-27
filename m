Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ia1kW-0006tx-6P
	for mharc-qemu-trivial@gnu.org; Wed, 27 Nov 2019 13:09:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56585)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ia1kP-0006nr-27
 for qemu-trivial@nongnu.org; Wed, 27 Nov 2019 13:09:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ia1kM-00046G-UR
 for qemu-trivial@nongnu.org; Wed, 27 Nov 2019 13:09:04 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:47554
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ia1kK-00044K-TT
 for qemu-trivial@nongnu.org; Wed, 27 Nov 2019 13:09:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574878139;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CFzBbSrdqli3Vyr1U/lAw4MFkqUukGTYQMCetsbniRg=;
 b=IG+Y5PjavUU0/IJPSeH6qf8iUK+VUyckByUNDk8jpB2851tpgOSOlTZvnHVgD1eMZnVncr
 246r/si9kDbN6GVtGWfYhP/Mwz1D6Ol6nM/wq2dE9OmV/TimLealECG9xgqHtiWkpO/ie1
 Yw53gdQeV21pHMoRUaWrUpkvTwDICuU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-72-wvaf5SrRNHWuNIDWBuzyew-1; Wed, 27 Nov 2019 13:08:57 -0500
Received: by mail-wr1-f71.google.com with SMTP id c16so12572553wro.1
 for <qemu-trivial@nongnu.org>; Wed, 27 Nov 2019 10:08:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bwTurDkAf51bZMPGgSVHsdQNeyfDQ3kU20qXgUge+i4=;
 b=NYcbw/IDlKkaBkBPeE3htyVrWe7BXy/CtueZQrUbN6LBAzOiWaWgNKNDIrlbDvGbaE
 4yUjJXEIff4k2ph1LBCNYF+2uylBUoqX3ETrJaF/QVXXUCmz6XYCLuFArzdVw/FCXuYe
 8bT37xRJKwOVsymNmXblXv8ug3wan79pyYeuHdr5NLbBSIc46P0KF1lN0F5k8Ub/e9QV
 jzFVpeRK6/t14EOHFaD/FpMhYOi7f5hKQzfj+2x7U6hz4QETHhv4rZq536Hb/FEi1vi4
 31oiWhIzMY6J7uO1xqd0tOkHGaonmZlVf+ZABT/aeD/OYIM96QVruSgWw9VBAIrDLMee
 CrUg==
X-Gm-Message-State: APjAAAVjKy028vAqac/hwDpeC4Nog7NnLwV6L9dlwl+Ucl7KJQ0nh0kj
 q0KK0gMWdAsh3VgpDo29jp8z1Z7TawVgTXu7RrD8XiRAL22zbR73SPX19bMV4Me80FXokMxzru8
 jld2qKZ821AFDs4WQlg==
X-Received: by 2002:adf:aa92:: with SMTP id h18mr45505353wrc.150.1574878136236; 
 Wed, 27 Nov 2019 10:08:56 -0800 (PST)
X-Google-Smtp-Source: APXvYqyAv64As4EASNVQAmeCRxyIN5sDRaeJ/MYk53zLECuZXcLFrFMR4ClY7YosNixM/iD+85ETLg==
X-Received: by 2002:adf:aa92:: with SMTP id h18mr45505330wrc.150.1574878136058; 
 Wed, 27 Nov 2019 10:08:56 -0800 (PST)
Received: from [192.168.1.35] (182.red-88-21-103.staticip.rima-tde.net.
 [88.21.103.182])
 by smtp.gmail.com with ESMTPSA id l17sm1318555wro.77.2019.11.27.10.08.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Nov 2019 10:08:55 -0800 (PST)
Subject: Re: [PATCH] travis.yml: Run tcg tests with tci
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20191127154857.3590-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <c74e337e-a3ea-ac67-eb36-490166eba88e@redhat.com>
Date: Wed, 27 Nov 2019 19:08:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191127154857.3590-1-thuth@redhat.com>
Content-Language: en-US
X-MC-Unique: wvaf5SrRNHWuNIDWBuzyew-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
X-List-Received-Date: Wed, 27 Nov 2019 18:09:07 -0000

On 11/27/19 4:48 PM, Thomas Huth wrote:
> So far we only have compile coverage for tci. But since commit
> 2f160e0f9797c7522bfd0d09218d0c9340a5137c ("tci: Add implementation
> for INDEX_op_ld16u_i64") has been included, we can also run the
> x86 TCG tests with tci, so let's enable them in Travis now.
>=20
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Ran for 26 min 28 sec:
https://travis-ci.org/philmd/qemu/jobs/617823541

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

> ---
>   .travis.yml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/.travis.yml b/.travis.yml
> index c09b6a0014..b0b634d484 100644
> --- a/.travis.yml
> +++ b/.travis.yml
> @@ -218,7 +218,7 @@ matrix:
>       # We manually include builds which we disable "make check" for
>       - env:
>           - CONFIG=3D"--enable-debug --enable-tcg-interpreter"
> -        - TEST_CMD=3D""
> +        - TEST_CMD=3D"make run-tcg-tests-x86_64-softmmu V=3D1"
>  =20
>  =20
>       # We don't need to exercise every backend with every front-end
>=20


