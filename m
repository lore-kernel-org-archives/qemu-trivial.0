Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ehdt3-0007K9-04
	for mharc-qemu-trivial@gnu.org; Fri, 02 Feb 2018 11:08:25 -0500
Received: from eggs.gnu.org ([208.118.235.92]:56235)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1ehdt0-0007HG-K1
	for qemu-trivial@nongnu.org; Fri, 02 Feb 2018 11:08:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1ehdsz-0000vL-0c
	for qemu-trivial@nongnu.org; Fri, 02 Feb 2018 11:08:22 -0500
Received: from mx1.redhat.com ([209.132.183.28]:35978)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mreitz@redhat.com>)
	id 1ehdNw-000862-Fp; Fri, 02 Feb 2018 10:36:16 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 776A790905;
	Fri,  2 Feb 2018 15:36:15 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-204-169.brq.redhat.com
	[10.40.204.169])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 756665C20A;
	Fri,  2 Feb 2018 15:36:14 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: Shravan Rajinikanth <shravan2x@utexas.edu>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <1512254273-7567-1-git-send-email-shravan2x@utexas.edu>
	<be898714-bffb-7fdf-0b91-e3c276559fc7@redhat.com>
Message-ID: <77301f3f-5ce2-dfe5-1529-6b03fbe245e7@redhat.com>
Date: Fri, 2 Feb 2018 16:36:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <be898714-bffb-7fdf-0b91-e3c276559fc7@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="H0EHMSOSrEcIUxHv4HPUz6wM7X2VHdmZf"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 02 Feb 2018 15:36:15 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-img: Fixed grammatical
 error in dump_human_image_check
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
X-List-Received-Date: Fri, 02 Feb 2018 16:08:24 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--H0EHMSOSrEcIUxHv4HPUz6wM7X2VHdmZf
Content-Type: multipart/mixed; boundary="8u9zJV40mMQvy3VVNPfxtFjserVFy4asQ";
 protected-headers="v1"
From: Max Reitz <mreitz@redhat.com>
To: Shravan Rajinikanth <shravan2x@utexas.edu>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Message-ID: <77301f3f-5ce2-dfe5-1529-6b03fbe245e7@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] qemu-img: Fixed grammatical error in
 dump_human_image_check
References: <1512254273-7567-1-git-send-email-shravan2x@utexas.edu>
 <be898714-bffb-7fdf-0b91-e3c276559fc7@redhat.com>
In-Reply-To: <be898714-bffb-7fdf-0b91-e3c276559fc7@redhat.com>

--8u9zJV40mMQvy3VVNPfxtFjserVFy4asQ
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 2018-02-02 14:37, Max Reitz wrote:
> On 2017-12-02 23:37, Shravan Rajinikanth wrote:
>> Signed-off-by: Shravan Rajinikanth <shravan2x@utexas.edu>
>> ---
>>  qemu-img.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/qemu-img.c b/qemu-img.c
>> index 68b375f..bea9268 100644
>> --- a/qemu-img.c
>> +++ b/qemu-img.c
>> @@ -580,7 +580,7 @@ static void dump_human_image_check(ImageCheck *che=
ck, bool quiet)
>>          if (check->leaks) {
>>              qprintf(quiet,
>>                      "\n%" PRId64 " leaked clusters were found on the =
image.\n"
>> -                    "This means waste of disk space, but no harm to d=
ata.\n",
>> +                    "This means disk space is wasted, but data is saf=
e.\n",
>>                      check->leaks);
>>          }
>=20
> Sorry, somehow I never applied this.  (Maybe I thought it would go
> through trivial...)
>=20
> Applied to my block tree:
>=20
> https://github.com/XanClic/qemu/commits/block

I'll have to unstage it again because it breaks some iotests (026, 060,
and 112), sorry.

Max


--8u9zJV40mMQvy3VVNPfxtFjserVFy4asQ--

--H0EHMSOSrEcIUxHv4HPUz6wM7X2VHdmZf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFGBAEBCAAwFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAlp0hWwSHG1yZWl0ekBy
ZWRoYXQuY29tAAoJEPQH2wBh1c9AAo0IAJpg70rbFBalfkIjkOvvqt/EyZatDOkP
kIB9q95oxj4DC8vmmteNm129c09fAme1RQmzS5WfB14oRe0kXLhBudwFR8dVZyn9
H5Bn3wJcqoOLeyTPSRrii+pF2ORVKqc96Xa5WbB+EdtK49leQFbYF5NH2d/7sB58
4gy4Xxg0ytNHLQHFgQDc5b34+wRuyLXDyuSsn6AgogjBgvnBtXZJgylZ9Qx/7A0d
7rZPolAOSqVEN5g7T+9LPlAtYXehuPU2rGP+xyafNyzGTgDgyPS1FjswpBd5Wtms
Dud3pF0mXt0Y66OdLDGgfRH6exiwkgaVk4582UKZbpcAdkrFMpO+YMU=
=pKNj
-----END PGP SIGNATURE-----

--H0EHMSOSrEcIUxHv4HPUz6wM7X2VHdmZf--

