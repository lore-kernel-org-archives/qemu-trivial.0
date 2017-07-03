Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dS0va-0007ef-6U
	for mharc-qemu-trivial@gnu.org; Mon, 03 Jul 2017 08:58:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45866)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1dS0vU-0007bT-Q2
	for qemu-trivial@nongnu.org; Mon, 03 Jul 2017 08:58:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1dS0vT-0007D6-OH
	for qemu-trivial@nongnu.org; Mon, 03 Jul 2017 08:58:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40364)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mreitz@redhat.com>)
	id 1dS0vL-00078W-7e; Mon, 03 Jul 2017 08:57:55 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B7BBD33458F;
	Mon,  3 Jul 2017 12:57:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com B7BBD33458F
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=mreitz@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com B7BBD33458F
Received: from dresden.str.redhat.com (unknown [10.40.205.14])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 683A688F0A;
	Mon,  3 Jul 2017 12:57:48 +0000 (UTC)
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: edgar.iglesias@xilinx.com, stefanha@redhat.com, qemu-block@nongnu.org,
	qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	Jiri Pirko <jiri@resnulli.us>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20170703123114.17103-1-eblake@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <73fa75d7-3aa7-e125-af55-c9f383007a28@redhat.com>
Date: Mon, 3 Jul 2017 14:57:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <20170703123114.17103-1-eblake@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="63lkvp5ss26ehh031WmCPFtLQlKeaabMe"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Mon, 03 Jul 2017 12:57:54 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v3] tests: Avoid non-portable 'echo -ARG'
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
X-List-Received-Date: Mon, 03 Jul 2017 12:58:09 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--63lkvp5ss26ehh031WmCPFtLQlKeaabMe
Content-Type: multipart/mixed; boundary="Fa5Ln5VNuKRGMVCmToa7w3exreAvvPgEa";
 protected-headers="v1"
From: Max Reitz <mreitz@redhat.com>
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: edgar.iglesias@xilinx.com, stefanha@redhat.com, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Jiri Pirko <jiri@resnulli.us>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Message-ID: <73fa75d7-3aa7-e125-af55-c9f383007a28@redhat.com>
Subject: Re: [PATCH v3] tests: Avoid non-portable 'echo -ARG'
References: <20170703123114.17103-1-eblake@redhat.com>
In-Reply-To: <20170703123114.17103-1-eblake@redhat.com>

--Fa5Ln5VNuKRGMVCmToa7w3exreAvvPgEa
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 2017-07-03 14:31, Eric Blake wrote:
> POSIX says that backslashes in the arguments to 'echo', as well as
> any use of 'echo -n' and 'echo -e', are non-portable; it recommends
> people should favor 'printf' instead.  This is definitely true where
> we do not control which shell is running (such as in makefile snippets
> or in documentation examples).  But even for scripts where we
> require bash (and therefore, where echo does what we want by default),
> it is still possible to use 'shopt -s xpg_echo' to change bash's
> behavior of echo.  And setting a good example never hurts when we are
> not sure if a snippet will be copied from a bash-only script to a
> general shell script (although I don't change the use of non-portable
> \e for ESC when we know the running shell is bash).
>=20
> Replace 'echo -n "..."' with 'printf %s "..."', and 'echo -e "..."'
> with 'printf %b "...\n"', with the optimization that the %s/%b
> argument can be omitted if the string being printed contains no
> substitutions that could result in '%' (trivial if there are no
> $ or `, but also possible when using things like $ret that are
> known to be numeric given the assignment to ret just above).
>=20
> In the qemu-iotests check script, fix unusual shell quoting
> that would result in word-splitting if 'date' outputs a space.
>=20
> In test 051, take an opportunity to shorten the line.
>=20
> In test 068, get rid of a pointless second invocation of bash.
>=20
> CC: qemu-trivial@nongnu.org
> Signed-off-by: Eric Blake <eblake@redhat.com>
>=20
> ---
> v3: use 'printf %s' in a few more places that substitute [Max]
> v2: be robust to potential % in substitutions
> ---
>  qemu-options.hx             |  4 ++--
>  tests/multiboot/run_test.sh | 10 +++++-----
>  tests/qemu-iotests/051      |  7 ++++---
>  tests/qemu-iotests/068      |  2 +-
>  tests/qemu-iotests/142      | 48 ++++++++++++++++++++++---------------=
--------
>  tests/qemu-iotests/171      | 14 ++++++-------
>  tests/qemu-iotests/check    | 18 ++++++++---------
>  tests/rocker/all            | 10 +++++-----
>  tests/tcg/cris/Makefile     |  8 ++++----
>  9 files changed, 61 insertions(+), 60 deletions(-)

[...]

> diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
> index 4b1c674..30af0eb 100755
> --- a/tests/qemu-iotests/check
> +++ b/tests/qemu-iotests/check

[...]

> @@ -314,21 +314,21 @@ do
>=20
>          if [ -f core ]
>          then
> -            echo -n " [dumped core]"
> +            printf " [dumped core]"
>              mv core $seq.core
>              err=3Dtrue
>          fi
>=20
>          if [ -f $seq.notrun ]
>          then
> -            $timestamp || echo -n " [not run] "
> -            $timestamp && echo " [not run]" && echo -n "        $seq -=
- "
> +            $timestamp || printf " [not run] "
> +            $timestamp && echo " [not run]" && printf "        $seq --=
 "

Everywhere else, $seq got its own %s, but not here. That's at least
inconsistent.

I don't quite know why you're not simply using %s and %b everywhere
there is a non-constant format string. Yes, if it is an exit code, it is
pretty clear that it won't contain a %. If it's a return value from
"date +%T", it is kind of, too (but then you have to know what that does
in order to review the change -- and I myself had to consult the man
page, to be honest). If they are variables named "img_offset" and
"img_size", then you'd hope they are numbers, but in order to check you
still have to look at the rest of the code (especially since they are
embedded as strings into the JSON object).
If you simply used %s and %b everywhere there is a $, reviewing would be
absolutely trivial. Yes, it seems a bit unnecessary, but it does make
reviewing much easier and I think since this is also about setting a
good example, that would be a good example, IMHO.
(Sure, reviewing this already is easy enough, but there still is a
difference between "very easy" and "trivial".)

Although at this point I have to admit that reviewing a really trivial
v4 would take me more time than to just write the following:

With a %s added to the printf above:

Reviewed-by: Max Reitz <mreitz@redhat.com>

>              cat $seq.notrun
>              notrun=3D"$notrun $seq"
>          else
>              if [ $sts -ne 0 ]
>              then
> -                echo -n " [failed, exit status $sts]"
> +                printf " [failed, exit status $sts]"
>                  err=3Dtrue
>              fi
>=20


--Fa5Ln5VNuKRGMVCmToa7w3exreAvvPgEa--

--63lkvp5ss26ehh031WmCPFtLQlKeaabMe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEvBAEBCAAZBQJZWj9KEhxtcmVpdHpAcmVkaGF0LmNvbQAKCRD0B9sAYdXPQCRP
CACXWg78I0pQD5DjGAtAF6PKtkCX1ghYCN/s0ylfQybjh2CYCCkAvsx7WFOihv3U
eAlqGUSGBHktNWg64jVwMEf2KCppekgDtgiaie0hYqDscZ4p2hfmZycahv8EOT6G
fDkGRHj90+8zvcgxQtXzNgyD3L9fWZHdEIx+hXKXw0IDdytaiiGyEbmTF1F8cxMH
GETUVYzpgIq5zJbxQ/t6NOxtj2+NxpcQR8A2TK0sPH4cukTldyjbx4v8yij3jhSb
VFKXYBZo+WtxQhHQvur9SOxLFZGLRqv3ArlH+UlpzXaH303YxJhb/pu2vCZfPLjK
1V1UYHmlba4D8uh16/SdPkWi
=MwgD
-----END PGP SIGNATURE-----

--63lkvp5ss26ehh031WmCPFtLQlKeaabMe--

