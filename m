Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ia2DF-0000ja-LN
	for mharc-qemu-trivial@gnu.org; Wed, 27 Nov 2019 13:38:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42945)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1ia2D8-0000hC-Pl
 for qemu-trivial@nongnu.org; Wed, 27 Nov 2019 13:38:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1ia2D6-0001HH-OB
 for qemu-trivial@nongnu.org; Wed, 27 Nov 2019 13:38:46 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:40325)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1ia2D4-0001Fy-MZ
 for qemu-trivial@nongnu.org; Wed, 27 Nov 2019 13:38:42 -0500
Received: by mail-wr1-x441.google.com with SMTP id c14so3289280wrn.7
 for <qemu-trivial@nongnu.org>; Wed, 27 Nov 2019 10:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=WDZ6Fj4H3med+NAezlNWAXwQ9kr/aZJ2bvNRhxJeucc=;
 b=WodM30LBywUmTNPsP7H/gnadl3HmxL8zzfv7x14BlRsxXJpXwXN6b48CKWQU9BENk2
 5Te+uRXaP0rSV7711B0dmH7Km5aYBp7RhGfcjZuBvU4RkKc3A2i7F4UkPbKkDQHYWBFq
 7aWrmtkHltPD2mN2a53vF79b4T+/hZM27UPhOM9MNG2DnRC5FwppP0NGyIcQF+jrblva
 aJqR5CYllAh+ktEvfjNvOwBjsUwBfJVgdSUbOrWct4rxkbiEcYpbjTfoQcfQVLCCBvuQ
 +IHa2vgi22k3DO1Mcm+lgb/IDsPlePcunz3cIt/hycbIxFvzzXLRh0uD/zqC77zsRCTk
 oI/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=WDZ6Fj4H3med+NAezlNWAXwQ9kr/aZJ2bvNRhxJeucc=;
 b=JFcW4rac/Me2WaleCkX9aHBFqV3ue8OEx++mBl9YqPVErEw14NERIB2B3TUBcKgyoC
 4QVLcQEhqTqWK0YUAJRmcQek3utUGh4j9waF1uVzgs18x+pYcI49fiPoRj6lNVgtp0A4
 SMZ6Mq3o8K03GGrx2RPqK1Mw0DfBIPywFlGqDXM5SsvKYpgLQMzpcpmwZ8glMzqoXlgG
 0VMR4quzGQ+uKJ/plu3T98ySzFoJHJx05gYPvMms/8TUznDJmxlJJ8QQianu/5y8J0Vo
 vKPSrWTn+m2kqXB/JyPsOol+M/Si4fCtlM3UUap1+hVKcx0xT8ZtZj9U4LIAHoSsKGXf
 IH5g==
X-Gm-Message-State: APjAAAV86wAvhEt3zyR8qaRCGBth/fneZCTsYMtwrQm7eE3rpUcd33Op
 R/UUAEI4O9dnkd0E3H7B0B/v4A==
X-Google-Smtp-Source: APXvYqxHAhZI6S3GnIRGUH3YZDr/hAetjw2BH1WEvPyoMVMZ4Rwyd2uqBsS0pgVAnsAVPG7m0YAphw==
X-Received: by 2002:adf:8426:: with SMTP id 35mr43769917wrf.262.1574879917636; 
 Wed, 27 Nov 2019 10:38:37 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s19sm3384369wmc.4.2019.11.27.10.38.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Nov 2019 10:38:36 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 06EFA1FF87;
 Wed, 27 Nov 2019 18:38:36 +0000 (GMT)
References: <20191127154857.3590-1-thuth@redhat.com>
User-agent: mu4e 1.3.5; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@redhat.com>, qemu-trivial@nongnu.org
Subject: Re: [PATCH] travis.yml: Run tcg tests with tci
In-reply-to: <20191127154857.3590-1-thuth@redhat.com>
Date: Wed, 27 Nov 2019 18:38:35 +0000
Message-ID: <87zhghf9lg.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
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
X-List-Received-Date: Wed, 27 Nov 2019 18:38:49 -0000


Thomas Huth <thuth@redhat.com> writes:

> So far we only have compile coverage for tci. But since commit
> 2f160e0f9797c7522bfd0d09218d0c9340a5137c ("tci: Add implementation
> for INDEX_op_ld16u_i64") has been included, we can also run the
> x86 TCG tests with tci, so let's enable them in Travis now.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  .travis.yml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/.travis.yml b/.travis.yml
> index c09b6a0014..b0b634d484 100644
> --- a/.travis.yml
> +++ b/.travis.yml
> @@ -218,7 +218,7 @@ matrix:
>      # We manually include builds which we disable "make check" for

this comment is out of date now (or rather has been for a while)

>      - env:
>          - CONFIG=3D"--enable-debug --enable-tcg-interpreter"

Perhaps as linux-user doesn't add much to testing the TCG we could limit
by MAIN_SOFTMMU_TARGETS here?

> -        - TEST_CMD=3D""
> +        - TEST_CMD=3D"make run-tcg-tests-x86_64-softmmu V=3D1"

How about "make check-qtest check-tcg"

Which will exercise the moderate boot code tests of various
architectures as well as x86_64 (if we include the --disable-docker
configure stanza)

>=20=20
>=20=20
>      # We don't need to exercise every backend with every front-end


--=20
Alex Benn=C3=A9e

