Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iWcmJ-0002kk-Ni
	for mharc-qemu-trivial@gnu.org; Mon, 18 Nov 2019 03:52:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53611)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iWcmH-0002k0-B4
 for qemu-trivial@nongnu.org; Mon, 18 Nov 2019 03:52:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iWcmF-0005aY-72
 for qemu-trivial@nongnu.org; Mon, 18 Nov 2019 03:52:56 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:28747
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1iWcmE-0005ZH-Se
 for qemu-trivial@nongnu.org; Mon, 18 Nov 2019 03:52:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574067173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Uj//TRfL6/3wwgnBTxP9o2XPXQ/0l5M4gq/5/A9dFw8=;
 b=fXFx5Ir9GLnplgWugUp8lhEHR8SoTFMAuNxt1dfzxLuok753aWMFhZsGbL9hcQImYUcUyr
 9WTPSY8iKeMZpIV4A+lmEWRxXGNrOTCrq5MK2H/N0GEYeQy7C0L2Zug8dGiQ8s8Ay9BlNR
 653IiyLxCq+yDEO1WDJeSdF3C/4mMNc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-78-Pcsma_RuOJ2Mmz3u4vfcAQ-1; Mon, 18 Nov 2019 03:52:52 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E099395B25;
 Mon, 18 Nov 2019 08:52:50 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-200.ams2.redhat.com
 [10.36.116.200])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EFC5561073;
 Mon, 18 Nov 2019 08:52:49 +0000 (UTC)
Subject: Re: [PATCH] Modify tests to work with clang
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1574032465-12186-1-git-send-email-tsimpson@quicinc.com>
Cc: alex.bennee@linaro.org, QEMU Trivial <qemu-trivial@nongnu.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <bbad38fa-d2fa-2acd-7f01-eabae34fbc18@redhat.com>
Date: Mon, 18 Nov 2019 09:52:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <1574032465-12186-1-git-send-email-tsimpson@quicinc.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: Pcsma_RuOJ2Mmz3u4vfcAQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
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
X-List-Received-Date: Mon, 18 Nov 2019 08:52:58 -0000

On 18/11/2019 00.14, Taylor Simpson wrote:
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> ---
>  tests/tcg/multiarch/float_helpers.c | 2 --
>  tests/tcg/multiarch/linux-test.c    | 6 +++++-
>  2 files changed, 5 insertions(+), 3 deletions(-)
>=20
> diff --git a/tests/tcg/multiarch/float_helpers.c b/tests/tcg/multiarch/fl=
oat_helpers.c
> index 8ee7903..bc530e5 100644
> --- a/tests/tcg/multiarch/float_helpers.c
> +++ b/tests/tcg/multiarch/float_helpers.c
> @@ -79,11 +79,9 @@ char *fmt_16(uint16_t num)
> =20
>  #ifndef SNANF
>  /* Signaling NaN macros, if supported.  */
> -# if __GNUC_PREREQ(3, 3)
>  #  define SNANF (__builtin_nansf (""))
>  #  define SNAN (__builtin_nans (""))
>  #  define SNANL (__builtin_nansl (""))
> -# endif
>  #endif
> =20
>  static float f32_numbers[] =3D {
> diff --git a/tests/tcg/multiarch/linux-test.c b/tests/tcg/multiarch/linux=
-test.c
> index 673d7c8..8a7c15c 100644
> --- a/tests/tcg/multiarch/linux-test.c
> +++ b/tests/tcg/multiarch/linux-test.c
> @@ -485,7 +485,11 @@ static void test_signal(void)
>      act.sa_flags =3D SA_SIGINFO;
>      chk_error(sigaction(SIGSEGV, &act, NULL));
>      if (setjmp(jmp_env) =3D=3D 0) {
> -        *(uint8_t *)0 =3D 0;
> +        /*
> +         * clang requires volatile or it will turn this into a
> +         * call to abort() instead of forcing a SIGSEGV.
> +         */
> +        *(volatile uint8_t *)0 =3D 0;
>      }
> =20
>      act.sa_handler =3D SIG_DFL;
>=20

Reviewed-by: Thomas Huth <thuth@redhat.com>


