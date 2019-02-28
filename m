Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gzNT9-0005bL-NB
	for mharc-qemu-trivial@gnu.org; Thu, 28 Feb 2019 10:19:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58522)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gzNT7-0005ZJ-Cu
	for qemu-trivial@nongnu.org; Thu, 28 Feb 2019 10:19:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gzNT2-0004mM-VH
	for qemu-trivial@nongnu.org; Thu, 28 Feb 2019 10:19:27 -0500
Received: from mx1.redhat.com ([209.132.183.28]:44453)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gzNSz-0004kL-2T; Thu, 28 Feb 2019 10:19:21 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4614A24851A;
	Thu, 28 Feb 2019 15:19:19 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7FC825D732;
	Thu, 28 Feb 2019 15:19:15 +0000 (UTC)
Date: Thu, 28 Feb 2019 16:19:14 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, mjt@tls.msk.ru,
	philmd@redhat.com, eblake@redhat.com, peter.maydell@linaro.org
Message-ID: <20190228161914.740b2134@redhat.com>
In-Reply-To: <20190225012530.28225-3-richardw.yang@linux.intel.com>
References: <20190225012530.28225-1-richardw.yang@linux.intel.com>
	<20190225012530.28225-3-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Thu, 28 Feb 2019 15:19:19 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v4 2/2] CODING_STYLE: indent example code
 as all others
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
X-List-Received-Date: Thu, 28 Feb 2019 15:19:30 -0000

On Mon, 25 Feb 2019 09:25:30 +0800
Wei Yang <richardw.yang@linux.intel.com> wrote:

> All the example code are indented with four spaces except this one.
>=20
> Fix this by adding four spaces here.
>=20
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  CODING_STYLE | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/CODING_STYLE b/CODING_STYLE
> index 1bccf4f865..e6d21dcd67 100644
> --- a/CODING_STYLE
> +++ b/CODING_STYLE
> @@ -137,10 +137,10 @@ block to a separate function altogether.
>  When comparing a variable for (in)equality with a constant, list the
>  constant on the right, as in:
> =20
> -if (a =3D=3D 1) {
> -    /* Reads like: "If a equals 1" */
> -    do_something();
> -}
> +    if (a =3D=3D 1) {
> +        /* Reads like: "If a equals 1" */
> +        do_something();
> +    }
> =20
>  Rationale: Yoda conditions (as in 'if (1 =3D=3D a)') are awkward to read.
>  Besides, good compilers already warn users when '=3D=3D' is mis-typed as=
 '=3D',


