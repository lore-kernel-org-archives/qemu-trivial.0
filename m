Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bCUId-0004yH-7I
	for mharc-qemu-trivial@gnu.org; Mon, 13 Jun 2016 12:01:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46803)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1bCUIX-0004u0-1h
	for qemu-trivial@nongnu.org; Mon, 13 Jun 2016 12:01:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1bCUIT-0002K4-3N
	for qemu-trivial@nongnu.org; Mon, 13 Jun 2016 12:01:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43752)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1bCUIL-0002Ik-Ny; Mon, 13 Jun 2016 12:00:57 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 13DE0A70A;
	Mon, 13 Jun 2016 16:00:57 +0000 (UTC)
Received: from [10.36.6.135] (vpn1-6-135.ams2.redhat.com [10.36.6.135])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5DG0sKZ030344
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 13 Jun 2016 12:00:55 -0400
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <1465805418-15906-1-git-send-email-thuth@redhat.com>
	<575ED0F2.2080900@redhat.com>
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <575ED8B1.10207@redhat.com>
Date: Mon, 13 Jun 2016 18:00:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <575ED0F2.2080900@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="wNFGB4FqUwwGu6k8bAJDNEcK96OUp08g2"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Mon, 13 Jun 2016 16:00:57 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] scsi-disk: Use (unsigned
 long) typecasts when using "%lu" format string
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
X-List-Received-Date: Mon, 13 Jun 2016 16:01:14 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--wNFGB4FqUwwGu6k8bAJDNEcK96OUp08g2
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 13.06.2016 17:27, Eric Blake wrote:
> On 06/13/2016 02:10 AM, Thomas Huth wrote:
>> Some source code analyzers like cppcheck spill out a warning if
>> the sign of the argument does not match the format string.
>>
>> Ticket: https://bugs.launchpad.net/qemu/+bug/1589564
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>  hw/scsi/scsi-disk.c | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
>> index 1881969..36f8a85 100644
>> --- a/hw/scsi/scsi-disk.c
>> +++ b/hw/scsi/scsi-disk.c
>> @@ -2060,13 +2060,13 @@ static int32_t scsi_disk_emulate_command(SCSIR=
equest *req, uint8_t *buf)
>>          }
>>          break;
>>      case MODE_SELECT:
>> -        DPRINTF("Mode Select(6) (len %lu)\n", (long)r->req.cmd.xfer);=

>> +        DPRINTF("Mode Select(6) (len %lu)\n", (unsigned long)r->req.c=
md.xfer);
>=20
> Why do we need a cast in the first place?  r->req.cmd.xfer is size_t, s=
o
> why not just "Mode Select(6) (len %zu)\n", r->req.cmd.xfer)?

That sounds good, too. Do you want to provide a patch, or shall I do a
v2 of my patch?

 Thomas



--wNFGB4FqUwwGu6k8bAJDNEcK96OUp08g2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJXXti1AAoJEC7Z13T+cC21V0YP/09VlFuJf2VV61qf2XWcfqWb
jwBWoIuZcN+4LH1aC5oJZbKFa4Ln9zpIWsiSA3gLErS9oX9RamMgqtg8Fn1AoLtp
yN3E2Rtdqo8EFz1vDApCBpGN2K8mx8KnlvSsQr1rx6+X+7uXKTuomiG5913ZZN3y
zCP6pM7OnvPJ29cZL1edh/J9JBnRWaufMvBJUp6P2Mcczcn41DCtVlOt4sl8rJAq
JbXyGmjnxMpDveBDpyCTZ2MCubESPnyWBBybeSz+CSWxSOxEuSJRHZWe2T+3Txlw
n9v4t5Uzi2O/YArWur9BlCBDttozF0W+mWG/eeFuIJBfW5ixlUY5Uib5njgplTnf
lCIn/yNRtjs7qSPwBX1magknamtJaD++FLygTlqFdO/BFc65hr7nKRzf/ZqBRFJh
DrG5kcFTmpyMOG0E6YuKmn84aq+EQI7wpTmavtqpuMtslwmpy7HL7C7mbfy41Obx
HT0Fv9qqcKbQoA1STWAm4dFx4YiGFoaXHGm5ZAOvisVASLydv5kjlUqEI4jdsDta
Xx3PJw5oyM0AKND1pYzM5iToOcifbcVcAPo3Z2ujHsaEKIH2Mpg/enWA+ddm9oql
xQOYP4wQC29mzzfRxakx/vDZr9C1VPYmg8Av+CfWicKmN5+pNKz4jlZ5sVm98CbL
lEJRhwQ7ReRLc5g1j/kQ
=veWd
-----END PGP SIGNATURE-----

--wNFGB4FqUwwGu6k8bAJDNEcK96OUp08g2--

