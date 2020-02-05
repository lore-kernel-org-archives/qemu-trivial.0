Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1izOIo-00089o-8f
	for mharc-qemu-trivial@gnu.org; Wed, 05 Feb 2020 12:17:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38221)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1izOIj-000878-W1
 for qemu-trivial@nongnu.org; Wed, 05 Feb 2020 12:17:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1izOIi-0007pQ-Dj
 for qemu-trivial@nongnu.org; Wed, 05 Feb 2020 12:17:21 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:30399
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1izOIh-0007i0-Pq
 for qemu-trivial@nongnu.org; Wed, 05 Feb 2020 12:17:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580923039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+06cuhwJOrpPs/nqvWdogUh1JSYOZf7QdiLQOC+EmWQ=;
 b=Q9pboNmKHoL4NXZQpqBBtJrSlFL9vGxwGIP1sGGsvsKE0fstx8Lo1ybIeA4gJBIYLp1XXb
 hEDoGvJ7rSMNLXMUAoOj1joFJ6xp5oM0vKC7E/Xn+Ruqb499OFlCXo9wBGvRlE8dMdUi7s
 ZHnCtIkxfFobR1C1uSxWA3dP639YEL8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-9PCer8c2MYmBm-DVyrj78w-1; Wed, 05 Feb 2020 12:17:17 -0500
Received: by mail-wr1-f72.google.com with SMTP id x15so1486708wrl.15
 for <qemu-trivial@nongnu.org>; Wed, 05 Feb 2020 09:17:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=d1UTZ/afbxDcXrZJKo4vdbH5W01BYA3S7srPmxreZ+4=;
 b=FT6X8yLBCrkXiV0a1gP5LTPta/ltzhyMsC9+1L4tABVndaUGd2JYmgQKyBBZhtOf6m
 ex6eNWUi/gpnb4k5MVX7koIyeDoDJgDKytOY5xyb01fICIjZj6I4lRIOFOOAKa4ftxYz
 l8vE8zVZsTRu7/Q1wTvfUMSEhei3Y7HR4deK6BcDLZQX67vEMFzaqjtZvNKO90x8GiHo
 eFZyzGLI6S3FVnsEhZ2jea5oRMThumu1gQAAUAy0Urqx6JyG7ZxRsDYfWwJ4n1vey3Y9
 9HeImb6j7LPZOdxA1UlIOFVmpgI35P9wzdKdl6HZ/RpEzoBoZ4IblttaKpAWB0k3k1th
 pMKw==
X-Gm-Message-State: APjAAAVSFr9ZE7CvJ8C7/hOI01Cym9FShQSj5w8AmOsO+RtEVZcY9TSK
 e0vLEhUTosUkFoM7t87Mv2/lJ96XZHaqQYIEscS/4jMgVvtrmAyRtqfVcg0MCMd9Nsn6vEQ+Yvp
 vdazcWcpvCwqASRn3sA==
X-Received: by 2002:adf:f6c8:: with SMTP id y8mr28813898wrp.167.1580923035540; 
 Wed, 05 Feb 2020 09:17:15 -0800 (PST)
X-Google-Smtp-Source: APXvYqymKRtkmkudc/Bjf1E9whFAMRbVqBa0mk0tDWxEZdl+vIl0aJZZbRCtFmjQzWsoiZtVMFZ64w==
X-Received: by 2002:adf:f6c8:: with SMTP id y8mr28813881wrp.167.1580923035341; 
 Wed, 05 Feb 2020 09:17:15 -0800 (PST)
Received: from [192.168.1.35] (162.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.162])
 by smtp.gmail.com with ESMTPSA id s65sm235454wmf.48.2020.02.05.09.17.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2020 09:17:14 -0800 (PST)
Subject: Re: [PATCH] qemu-img: Place the '-i aio' option in alphabetical order
To: Julia Suvorova <jusual@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20200205163008.204493-1-jusual@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d97e763f-b987-06b7-a7e3-d243b6790f31@redhat.com>
Date: Wed, 5 Feb 2020 18:17:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200205163008.204493-1-jusual@redhat.com>
Content-Language: en-US
X-MC-Unique: 9PCer8c2MYmBm-DVyrj78w-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
X-List-Received-Date: Wed, 05 Feb 2020 17:17:23 -0000

Cc'ing qemu-trivial@

On 2/5/20 5:30 PM, Julia Suvorova wrote:
> The '-i AIO' option was accidentally placed after '-n' and '-t'. Move it
> after '--flush-interval'.
>=20
> Signed-off-by: Julia Suvorova <jusual@redhat.com>
> ---
>   docs/interop/qemu-img.rst | 8 ++++----
>   qemu-img-cmds.hx          | 4 ++--
>   2 files changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/docs/interop/qemu-img.rst b/docs/interop/qemu-img.rst
> index fa27e5c7b4..42e4451db4 100644
> --- a/docs/interop/qemu-img.rst
> +++ b/docs/interop/qemu-img.rst
> @@ -247,7 +247,7 @@ Command description:
>     Amends the image format specific *OPTIONS* for the image file
>     *FILENAME*. Not all file formats support this operation.
>  =20
> -.. option:: bench [-c COUNT] [-d DEPTH] [-f FMT] [--flush-interval=3DFLU=
SH_INTERVAL] [-n] [-i AIO] [--no-drain] [-o OFFSET] [--pattern=3DPATTERN] [=
-q] [-s BUFFER_SIZE] [-S STEP_SIZE] [-t CACHE] [-w] [-U] FILENAME
> +.. option:: bench [-c COUNT] [-d DEPTH] [-f FMT] [--flush-interval=3DFLU=
SH_INTERVAL] [-i AIO] [-n] [--no-drain] [-o OFFSET] [--pattern=3DPATTERN] [=
-q] [-s BUFFER_SIZE] [-S STEP_SIZE] [-t CACHE] [-w] [-U] FILENAME
>  =20
>     Run a simple sequential I/O benchmark on the specified image. If ``-w=
`` is
>     specified, a write test is performed, otherwise a read test is perfor=
med.
> @@ -264,13 +264,13 @@ Command description:
>     ``--no-drain`` is specified, a flush is issued without draining the r=
equest
>     queue first.
>  =20
> +  if ``-i`` is specified, *AIO* option can be used to specify different
> +  AIO backends: ``threads``, ``native`` or ``io_uring``.
> +
>     If ``-n`` is specified, the native AIO backend is used if possible. O=
n
>     Linux, this option only works if ``-t none`` or ``-t directsync`` is
>     specified as well.
>  =20
> -  if ``-i`` is specified, *AIO* option can be used to specify different
> -  AIO backends: ``threads``, ``native`` or ``io_uring``.
> -
>     For write tests, by default a buffer filled with zeros is written. Th=
is can be
>     overridden with a pattern byte specified by *PATTERN*.
>  =20
> diff --git a/qemu-img-cmds.hx b/qemu-img-cmds.hx
> index 3fd836ca90..d7fbc6b1f4 100644
> --- a/qemu-img-cmds.hx
> +++ b/qemu-img-cmds.hx
> @@ -16,9 +16,9 @@ SRST
>   ERST
>  =20
>   DEF("bench", img_bench,
> -    "bench [-c count] [-d depth] [-f fmt] [--flush-interval=3Dflush_inte=
rval] [-n] [--no-drain] [-o offset] [--pattern=3Dpattern] [-q] [-s buffer_s=
ize] [-S step_size] [-t cache] [-i aio] [-w] [-U] filename")
> +    "bench [-c count] [-d depth] [-f fmt] [--flush-interval=3Dflush_inte=
rval] [-i aio] [-n] [--no-drain] [-o offset] [--pattern=3Dpattern] [-q] [-s=
 buffer_size] [-S step_size] [-t cache] [-w] [-U] filename")
>   SRST
> -.. option:: bench [-c COUNT] [-d DEPTH] [-f FMT] [--flush-interval=3DFLU=
SH_INTERVAL] [-n] [--no-drain] [-o OFFSET] [--pattern=3DPATTERN] [-q] [-s B=
UFFER_SIZE] [-S STEP_SIZE] [-t CACHE] [-i AIO] [-w] [-U] FILENAME
> +.. option:: bench [-c COUNT] [-d DEPTH] [-f FMT] [--flush-interval=3DFLU=
SH_INTERVAL] [-i AIO] [-n] [--no-drain] [-o OFFSET] [--pattern=3DPATTERN] [=
-q] [-s BUFFER_SIZE] [-S STEP_SIZE] [-t CACHE] [-w] [-U] FILENAME
>   ERST
>   DEF("check", img_check,
>       "check [--object objectdef] [--image-opts] [-q] [-f fmt] [--output=
=3Dofmt] [-r [leaks | all]] [-T src_cache] [-U] filename")
>=20

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>


