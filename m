Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fGTUo-0001WS-OJ
	for mharc-qemu-trivial@gnu.org; Wed, 09 May 2018 14:07:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52259)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1fGTUj-0001Ru-CO
	for qemu-trivial@nongnu.org; Wed, 09 May 2018 14:07:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1fGTUi-0005dl-1K
	for qemu-trivial@nongnu.org; Wed, 09 May 2018 14:07:17 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:58286 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mreitz@redhat.com>)
	id 1fGTUZ-0005as-9m; Wed, 09 May 2018 14:07:07 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C0340412C2FB;
	Wed,  9 May 2018 18:07:06 +0000 (UTC)
Received: from dresden.str.redhat.com (unknown [10.40.205.23])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 913CCD7DEF;
	Wed,  9 May 2018 18:07:02 +0000 (UTC)
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Cc: qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>
References: <20180503225648.13153-1-jsnow@redhat.com>
	<df5d75a1-6855-c462-6f05-662a42f50f39@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=mreitz@redhat.com; prefer-encrypt=mutual; keydata=
	xsBNBFXOJlcBCADEyyhOTsoa/2ujoTRAJj4MKA21dkxxELVj3cuILpLTmtachWj7QW+TVG8U
	/PsMCFbpwsQR7oEy8eHHZwuGQsNpEtNC2G/L8Yka0BIBzv7dEgrPzIu+W3anZXQW4702+uES
	U29G8TP/NGfXRRHGlbBIH9KNUnOSUD2vRtpOLXkWsV5CN6vQFYgQfFvmp5ZpPeUe6xNplu8V
	mcTw8OSEDW/ZnxJc8TekCKZSpdzYoxfzjm7xGmZqB18VFwgJZlIibt1HE0EB4w5GsD7x5ekh
	awIe3RwoZgZDLQMdOitJ1tUc8aqaxvgA4tz6J6st8D8pS//m1gAoYJWGwwIVj1DjTYLtABEB
	AAHNHU1heCBSZWl0eiA8bXJlaXR6QHJlZGhhdC5jb20+wsCTBBMBCAA9AhsDBQkSzAMABQsJ
	CAcCBhUICQoLAgQWAgMBAh4BAheABQJVzie5FRhoa3A6Ly9rZXlzLmdudXBnLm5ldAAKCRD0
	B9sAYdXPQDcIB/9uNkbYEex1rHKz3mr12uxYMwLOOFY9fstP5aoVJQ1nWQVB6m2cfKGdcRe1
	2/nFaHSNAzT0NnKz2MjhZVmcrpyd2Gp2QyISCfb1FbT82GMtXFj1wiHmPb3CixYmWGQUUh+I
	AvUqsevLA+WihgBUyaJq/vuDVM1/K9Un+w+Tz5vpeMidlIsTYhcsMhn0L9wlCjoucljvbDy/
	8C9L2DUdgi3XTa0ORKeflUhdL4gucWoAMrKX2nmPjBMKLgU7WLBc8AtV+84b9OWFML6NEyo4
	4cP7cM/07VlJK53pqNg5cHtnWwjHcbpGkQvx6RUx6F1My3y52vM24rNUA3+ligVEgPYBzsBN
	BFXOJlcBCADAmcVUNTWT6yLWQHvxZ0o47KCP8OcLqD+67T0RCe6d0LP8GsWtrJdeDIQk+T+F
	xO7DolQPS6iQ6Ak2/lJaPX8L0BkEAiMuLCKFU6Bn3lFOkrQeKp3u05wCSV1iKnhg0UPji9V2
	W5eNfy8F4ZQHpeGUGy+liGXlxqkeRVhLyevUqfU0WgNqAJpfhHSGpBgihUupmyUg7lfUPeRM
	DzAN1pIqoFuxnN+BRHdAecpsLcbR8sQddXmDg9BpSKozO/JyBmaS1RlquI8HERQoe6EynJhd
	64aICHDfj61rp+/0jTIcevxIIAzW70IadoS/y3DVIkuhncgDBvGbF3aBtjrJVP+5ABEBAAHC
	wGUEGAEIAA8FAlXOJlcCGwwFCRLMAwAACgkQ9AfbAGHVz0CbFwf9F/PXxQR9i4N0iipISYjU
	sxVdjJOM2TMut+ZZcQ6NSMvhZ0ogQxJ+iEQ5OjnIputKvPVd5U7WRh+4lF1lB/NQGrGZQ1ic
	alkj6ocscQyFwfib+xIe9w8TG1CVGkII7+TbS5pXHRxZH1niaRpoi/hYtgzkuOPp35jJyqT/
	/ELbqQTDAWcqtJhzxKLE/ugcOMK520dJDeb6x2xVES+S5LXby0D4juZlvUj+1fwZu+7Io5+B
	bkhSVPb/QdOVTpnz7zWNyNw+OONo1aBUKkhq2UIByYXgORPFnbfMY7QWHcjpBVw9MgC4tGeF
	R4bv+1nAMMxKmb5VvQCExr0eFhJUAHAhVg==
Message-ID: <5c8e8a3e-9347-ec7b-3b5d-ad626b2dbb30@redhat.com>
Date: Wed, 9 May 2018 20:07:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <df5d75a1-6855-c462-6f05-662a42f50f39@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="FNk3JqKgwbyzbt1sjHxgHuak3idlH9GTr"
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Wed, 09 May 2018 18:07:06 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Wed, 09 May 2018 18:07:06 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'mreitz@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-block] [PATCH 0/5] qemu-img: make
 subcommand usage docstrings consistent
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
X-List-Received-Date: Wed, 09 May 2018 18:07:21 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--FNk3JqKgwbyzbt1sjHxgHuak3idlH9GTr
Content-Type: multipart/mixed; boundary="ObishBpNIL8X6LW8xSFi6J3nv2TbH1AvI";
 protected-headers="v1"
From: Max Reitz <mreitz@redhat.com>
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Cc: qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>
Message-ID: <5c8e8a3e-9347-ec7b-3b5d-ad626b2dbb30@redhat.com>
Subject: Re: [Qemu-block] [PATCH 0/5] qemu-img: make subcommand usage
 docstrings consistent
References: <20180503225648.13153-1-jsnow@redhat.com>
 <df5d75a1-6855-c462-6f05-662a42f50f39@redhat.com>
In-Reply-To: <df5d75a1-6855-c462-6f05-662a42f50f39@redhat.com>

--ObishBpNIL8X6LW8xSFi6J3nv2TbH1AvI
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 2018-05-04 03:03, John Snow wrote:
> On 05/03/2018 06:56 PM, John Snow wrote:
>> I'm working on a project to attempt to autogenerate all of this, but
>> until then let's just do a bit of the usual kinds of tidying.
>>
>> ______________________________________________________________________=
__________
>>
>> For convenience, this branch is available at:
>> https://github.com/jnsnow/qemu.git branch trivial-qemu-img
>> https://github.com/jnsnow/qemu/tree/trivial-qemu-img
>>
>> This version is tagged trivial-qemu-img-v1:
>> https://github.com/jnsnow/qemu/releases/tag/trivial-qemu-img-v1
>>
>> John Snow (5):
>>   qemu-img-commands.hx: argument ordering fixups
>>   qemu-img.texi: fix command ordering
>>   qemu-img: remove references to GEN_DOCS
>>   qemu-img: Make documentation between .texi and .hx consistent
>>   qemu-img-cmds.hx: add passive-aggressive note
>>
>>  qemu-img-cmds.hx       | 13 +++++----
>>  qemu-img.c             |  2 --
>>  qemu-img.texi          | 78 ++++++++++++++++++++++++++---------------=
---------
>>  qemu-options-wrapper.h |  1 -
>>  4 files changed, 48 insertions(+), 46 deletions(-)
>>
>=20
> Possessed by some kind of malevolent phantasm, I documented the followi=
ng:
>=20
> amend	 [--object objectdef] [--image-opts] [-q] [-f fmt]      filename
> bench                                        [-q] [-f fmt] [-U] filenam=
e
> check    [--object objectdef] [--image-opts] [-q] [-f fmt] [-U] filenam=
e
> commit   [--object objectdef] [--image-opts] [-q] [-f fmt]      filenam=
e
> compare  [--object objectdef] [--image-opts] [-q] [-f fmt] [-U] filenam=
e
> convert  [--object objectdef] [--image-opts] [-q] [-f fmt] [-U] filenam=
e
> create   [--object objectdef]                [-q] [-f fmt]      filenam=
e
> dd                            [--image-opts]      [-f fmt] [-U]
> info     [--object objectdef] [--image-opts]      [-f fmt] [-U] filenam=
e
> map      [--object objectdef] [--image-opts]      [-f fmt] [-U] filenam=
e
> measure  [--object objectdef] [--image-opts]      [-f fmt]      filenam=
e
> snapshot [--object objectdef] [--image-opts] [-q]          [-U] filenam=
e
> rebase   [--object objectdef] [--image-opts] [-q] [-f fmt] [-U] filenam=
e
> resize   [--object objectdef] [--image-opts] [-q] [-f fmt]      filenam=
e
>=20
> These are the largely universal set of options we support on most
> commands, except sometimes some commands don't support them. Maybe
> that's intentional, Maybe it isn't:
>=20
> - Maybe we don't really want -U on commands that are opened RDWR.

Sounds reasonable to me.

> - Maybe -f fmt isn't useful on snapshot or amend (which only work for
> qcow2?)

But amend does have -f fmt.  I suppose snapshot should as well.

> - Maybe -q is inherently pretty useless for commands like info, map, or=

> measure whose job is to show you something.

I suppose so, too.  If it was an option, it just wouldn=E2=80=99t do anyt=
hing.
That=E2=80=99s OK to me if you plan to add it as a global option, but it =
isn=E2=80=99t
really useful.

> Less clear to me:
>=20
> - Is there no place for --image-opts for create?

Not yet.  When x-blockdev-create loses its x-, it might be the time to
change that.

The same holds true for convert, by the way.  Its --image-opts is only
usable for the source, but there is no --target-image-opts.  That=E2=80=99=
s
because currently you always need a filename for image creation, and you
just can give some creation options in addition (through -o).

It might be useful for bench, but that=E2=80=99s debugging anyway, so I d=
on=E2=80=99t
really care.

> - Or --object for dd?

I=E2=80=99d rather not see any changes to dd.  Actually, I=E2=80=99d rath=
er not see dd
at all, but that=E2=80=99s a personal opinion.

I=E2=80=99ve always wanted to merge dd=E2=80=99s functionality into conve=
rt, so the less
it can do until then, the better, I suppose.  (Though of course I=E2=80=99=
ve
never had the time to attack this issue, as usual.)

> - Or either of these two for bench?

Again, it=E2=80=99s solely for debugging, so feel free to go wild, but th=
ere=E2=80=99s
no actual need to support it until any of us developers wants to use it
with luks.

Shouldn=E2=80=99t be that hard, anyway.

Max

> The thought, though, is to define some core set of options that will
> always apply to all commands. It might not always be perfect, but the
> arguments listed here are a start for what probably makes sense for mos=
t
> commands. Maybe it's a bad idea; but maybe individual parsers could opt=

> out of the common set of arguments on an as-needed basis instead.
>=20
> Might help the documentation along to be able to point to some
> definitely universal core group of options.
>=20
> --js
>=20
>=20



--ObishBpNIL8X6LW8xSFi6J3nv2TbH1AvI--

--FNk3JqKgwbyzbt1sjHxgHuak3idlH9GTr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAlrzOMUACgkQ9AfbAGHV
z0AR3QgAi6cPfIlmqx1hiNFBCW4tuCJclWJ7vsTOza92L+Ye4zmmj/iSBunkoopu
HrNWT3pNEGkEJCa+ay4IHdocFNT2js/w0CZaERCoMz+FeG7bWWd2NrtT1bmnFg+7
tKyLFPTSBFDPlVlBksvcJ2dPbv4sriMptNeylV8p/nKX/5Fd1lqtGPigqQ9rgfTG
iuPGmUAg85bpAkL2zKcvbJaLzWzZknA3lMCvcJHArqxrj+8JSmY3db37zWLqk6Ls
3gjfAnZby3QUdbgv0/XVTdJXRbjr8iVE/yERdRD7nTyObgwDnJd0zFBEs5kTBWBJ
Mrhm2qVv+d/Y1LzonlGrysUHOWwIvQ==
=UPrk
-----END PGP SIGNATURE-----

--FNk3JqKgwbyzbt1sjHxgHuak3idlH9GTr--

