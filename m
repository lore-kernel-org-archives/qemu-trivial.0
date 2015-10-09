Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZkZTF-0003Ac-5G
	for mharc-qemu-trivial@gnu.org; Fri, 09 Oct 2015 11:20:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52191)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ZkRM5-0003fX-HY
	for qemu-trivial@nongnu.org; Fri, 09 Oct 2015 02:40:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ZkRM4-0005TF-NS
	for qemu-trivial@nongnu.org; Fri, 09 Oct 2015 02:40:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41711)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1ZkRLy-0005SE-FB; Fri, 09 Oct 2015 02:40:30 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 2DF93A58A7;
	Fri,  9 Oct 2015 06:40:30 +0000 (UTC)
Received: from [10.36.4.95] (vpn1-4-95.ams2.redhat.com [10.36.4.95])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t996eRI1007277
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 9 Oct 2015 02:40:29 -0400
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <1444332916-16476-1-git-send-email-thuth@redhat.com>
	<1444332916-16476-4-git-send-email-thuth@redhat.com>
	<5616FD68.5050801@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <5617615B.5050805@redhat.com>
Date: Fri, 9 Oct 2015 08:40:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <5616FD68.5050801@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="ls2UfbsNbmP6ErVmIRXwpBWaTCTqMW45R"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 3/5] hw/input/tsc210x:
 Remove superfluous memset
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Oct 2015 06:40:38 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ls2UfbsNbmP6ErVmIRXwpBWaTCTqMW45R
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 09/10/15 01:34, Eric Blake wrote:
> On 10/08/2015 01:35 PM, Thomas Huth wrote:
>> g_malloc0 already clears the memory, so no need for additional
>> memsets here. And while we're at it, let's also remove the
>> superfluous typecasts for the return values of g_malloc0.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>  hw/input/tsc210x.c | 8 ++------
>>  1 file changed, 2 insertions(+), 6 deletions(-)
>>
>> diff --git a/hw/input/tsc210x.c b/hw/input/tsc210x.c
>> index fae3385..92b076a 100644
>> --- a/hw/input/tsc210x.c
>> +++ b/hw/input/tsc210x.c
>> @@ -1086,9 +1086,7 @@ uWireSlave *tsc2102_init(qemu_irq pint)
>>  {
>>      TSC210xState *s;
>> =20
>> -    s =3D (TSC210xState *)
>> -            g_malloc0(sizeof(TSC210xState));
>> -    memset(s, 0, sizeof(TSC210xState));
>> +    s =3D g_malloc0(sizeof(TSC210xState));
>=20
> This should probably be g_new0(TSC210xState, 1), consistent with Markus=
'
> recent cleanup patches.

Ok, I'll change my patch.

 Thomas



--ls2UfbsNbmP6ErVmIRXwpBWaTCTqMW45R
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJWF2FbAAoJEC7Z13T+cC216skP/0EHHRyVnXnMr65jUKWQjnDj
rX1z6XTDINhgCHyGDsk1/rIrjRxi+0AaqxNszw/EtA7HFN4JrqGjP4HSHlbCDhPu
2yxqfuD0EIK3W1yutdNmIujMuh9IwFQvqt8jD/hbtXZ5dS/yicWHk30oRgFlOvCx
L72IDX5vGgGMgoN4NxuRyfP9IMVXUreLkLKxJrKivHK4ZyvUB18yp83m4vnnPpNP
grLJ+0Luu0mOClCjy1JENXZYAfADyj8UPmgsX6e1VC1kPh5QHdcbtdn+E/HxPPzL
ZF3VeEOO3HxyZ5Jp2/ND6dKOguHotSFIOTEf1lfpUE/EkN6yHh1GN9KEBJHu3bJe
j3JToErdvFdJX9z3r24WHg5UTsjz1S82Lz3mhfsZ4joYmei0qh54XsocwJj76+vb
ekGv/qXEziS+2opb3nqvu05qGRirnKyXLA+h8mXN6/zsBqiXXfgtkssMnu4tY0hm
S8EApOSyu0PPP83Ay61sSKOVPZiAUcluzoDW/tbQa2+Bd6kDTkUoM9g9fcOtYiLR
0VtqaM2rH5LtAYhtyUNzC2PIxoFKU+UEY0Qe5pFDRl21lGloHuKsUVsg8NciTOwM
JRUdwOksPeVOPMG55tqYzKmJlVJGvA4UCQR7gN+zJIqmJllz1KUCIs0AD6i8cS2v
u3dCrIxMf/v7Jai4b/lP
=K3yi
-----END PGP SIGNATURE-----

--ls2UfbsNbmP6ErVmIRXwpBWaTCTqMW45R--

