Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bF2wJ-0004qd-J2
	for mharc-qemu-trivial@gnu.org; Mon, 20 Jun 2016 13:24:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49303)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1bF2wG-0004je-Tr
	for qemu-trivial@nongnu.org; Mon, 20 Jun 2016 13:24:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1bF2wE-0008OM-O6
	for qemu-trivial@nongnu.org; Mon, 20 Jun 2016 13:24:43 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:49287)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>)
	id 1bF2w9-0008MN-3N; Mon, 20 Jun 2016 13:24:37 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue104) with ESMTPSA (Nemesis) id 0Lgoo2-1blbkE1M9u-00oFLR;
	Mon, 20 Jun 2016 19:24:24 +0200
To: Eric Blake <eblake@redhat.com>, Riku Voipio <riku.voipio@iki.fi>
References: <1466416292-9615-1-git-send-email-laurent@vivier.eu>
	<57681E96.507@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <41c66aa8-69c1-3d73-4ef4-957eb0326cc1@vivier.eu>
Date: Mon, 20 Jun 2016 19:24:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.0
MIME-Version: 1.0
In-Reply-To: <57681E96.507@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="npuj9Wja99Pue1644VjJQnDMHMMsMDfpl"
X-Provags-ID: V03:K0:Btet/F6OLHqQ7/5g/gUcOTsuOrBn5kEtFTcI251t2weqf7ez4BR
	oPuvnu3XiBAiIC0hz+uIJpAlDYfCtif03GbQmiFlugp8VfsCMQ0cPAbtNBE6cs572l5vzJv
	gxCt7rsULT2Fmo24h4F5i9gaWx9iE1sScxVo2/2bxJxZ5Rog/Cq3XZMXdh4+UEk3mu89oss
	GyKgcc+dD+YAth5nsIL6g==
X-UI-Out-Filterresults: notjunk:1;V01:K0:UISxt9xKGNA=:XCG7c//KxbdXR9AGhunqU9
	cDKLoPS510mSTGG+2XsypyB1yctPZzU0vc+OvdjOYuN7r0zcNI4BphpoV/KGoq9oP4McOv140
	nmiMrh9nlOFYktsiQDDFeAfqeyC4kQSKYCXdyssRm/2WNPF2VXXGL1mgSW1aKtjIm/ipoiQ6p
	zYWfuBVfdJlDFcjxAQaW2Y4dhnTW3VmvNOgnYPTXAjHwgLTIw2wFku9b7S2WDzfe4oUNaXol3
	CR51Ww1xtGVuOM0T279dGKpoyoIC448ZltveGignu9u/buQWo5VTmicynl0A/Tm29kNYJsYFq
	JAHKml1j9zGB8jVFB5eW1SEsH8eF/zkjcslT7aKf5g7govdO/5tICgVFzwFUK4UeE5om0CAZ0
	SHha0Pp4ZIXNNWk/1bECEx61XZ7Nt1oUJpPBudJDNZo3IGkzCvIIboekOFeczZQ0GLmOzd3Kq
	lSUUefrYDcipDpU1VzWlH8aWF2BnFehT2ufQzTibHVJhKAL5FJXdwJ+Z/oPadFPW854IH0VJ2
	Liv5Hh9LW1eqQikL3wfus+4xFCHcbFsthIjyXxqKG3Hrgjior881bji+PsGr3t0u7QkVcDSr0
	0G4Ij1O9saOC/eDyxfkivE124IrBFtWRXuPLZl4IrU3/VPb1mgYyO1UhQKI7g16gL4hRe6aR3
	lnMnDCwFdwPLvhBbx+vRWhCM4vwC5QRyLgIAqC9j1346wumda++EumummvYgPS0dyyEE=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.24
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] linux-user,
 trivial: display "0x%x" instead of "0x%d"
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
X-List-Received-Date: Mon, 20 Jun 2016 17:24:46 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--npuj9Wja99Pue1644VjJQnDMHMMsMDfpl
Content-Type: multipart/mixed; boundary="cjoQRBFmXS7T4ibsTFJWLkToslGG0g48E"
From: Laurent Vivier <laurent@vivier.eu>
To: Eric Blake <eblake@redhat.com>, Riku Voipio <riku.voipio@iki.fi>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Message-ID: <41c66aa8-69c1-3d73-4ef4-957eb0326cc1@vivier.eu>
Subject: Re: [Qemu-devel] [PATCH] linux-user, trivial: display "0x%x" instead
 of "0x%d"
References: <1466416292-9615-1-git-send-email-laurent@vivier.eu>
 <57681E96.507@redhat.com>
In-Reply-To: <57681E96.507@redhat.com>

--cjoQRBFmXS7T4ibsTFJWLkToslGG0g48E
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



Le 20/06/2016 =C3=A0 18:49, Eric Blake a =C3=A9crit :
> On 06/20/2016 03:51 AM, Laurent Vivier wrote:
>> Display an exception number, generally defined as an hexadecimal
>> number (for instance, EXCP_HLT is 0x10001).
>>
>> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
>> ---
>> Resent to fix qemu-trivial email address.
>>
>>  linux-user/main.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>=20
> Reviewed-by: Eric Blake <eblake@redhat.com>
>=20
> Can you also fix the occurrence of 0x%d in trace-events, for
> mhp_pc_dimm_assigned_slot()? (Or whatever file it lands in after the
> trace-events split pull request)

Yes, after the after split pull request.

Thanks,
Laurent
>=20
>> diff --git a/linux-user/main.c b/linux-user/main.c
>> index b9a4e0e..c79f5cb 100644
>> --- a/linux-user/main.c
>> +++ b/linux-user/main.c
>> @@ -2036,7 +2036,7 @@ void cpu_loop(CPUPPCState *env)
>>              /* just indicate that signals should be handled asap */
>>              break;
>>          default:
>> -            cpu_abort(cs, "Unknown exception 0x%d. Aborting\n", trapn=
r);
>> +            cpu_abort(cs, "Unknown exception 0x%x. Aborting\n", trapn=
r);
>>              break;
>>          }
>>          process_pending_signals(env);
>>
>=20


--cjoQRBFmXS7T4ibsTFJWLkToslGG0g48E--

--npuj9Wja99Pue1644VjJQnDMHMMsMDfpl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXaCbFAAoJEPMMOL0/L748j/IQAJCxQbX8KBcwDGIMYkV6BHUL
Sm57MwEf00yf2UqFdFBBdlO1UK4E7Ak80qGVHG0AGnqX/BcsCXrB95RjiQvpOlTU
8ncIULo8FjWyU2FLfoDl3of7DFfGtbeyjQfBaxYcmBI7i4np0actYCM+HIgHJOWg
iYIxqEBDSVuvNkS/Yy4wEyE/T2JXPnPlJzrJ3mXrHy0K0kCCUnGNHj+OIKu5r6x4
QlQ9P2kN5kcMr6recHyZKB22HBow8PdwHi88FJGZN/0GI0jQ2CBvlb/Z+n7VTKXx
b1jrJzvBWWlwPlol68qh73ry09qAbnWBCZZkVMY7bFGiz/NQpaViM150IK3i0jPW
OrcDJXP9/9SOQg6TaVaaxV6bbWxVYZIGjCSiJuX5xcrTsCZIxVpHhgJ8xecck8Mt
la7oR5VP7XVFA5eHDm4xIjI/+QQFR5l/dPzOykgpCh6gMamGua4OIbBC2hA2cptv
O4PzerR2XiObebnag6w4OwEh6d1xWhMot68yUQ+5YX7E5wJdRQiymLkCS2tA22nl
NeTREnV8gb9x5l/GCMw1Zr3vnyNC/8Gqd531+AJgF45GKeeO1ylBJwD0FzIL8lc6
uzDmqnxtpLASo/csiYSWUSAtX3cW374nJYsLLbPMOm3/clZ8xBtZoYr9YtXlUVfs
040ntg+LJxvZBkSbqsEK
=/yup
-----END PGP SIGNATURE-----

--npuj9Wja99Pue1644VjJQnDMHMMsMDfpl--

