Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bCULd-0007O0-Iu
	for mharc-qemu-trivial@gnu.org; Mon, 13 Jun 2016 12:04:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47543)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bCULb-0007LK-3c
	for qemu-trivial@nongnu.org; Mon, 13 Jun 2016 12:04:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bCULV-0002tr-OF
	for qemu-trivial@nongnu.org; Mon, 13 Jun 2016 12:04:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41699)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1bCULT-0002t9-3C; Mon, 13 Jun 2016 12:04:11 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AAAAAC049D59;
	Mon, 13 Jun 2016 16:04:10 +0000 (UTC)
Received: from [10.3.116.126] (ovpn-116-126.phx2.redhat.com [10.3.116.126])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5DG4A3T021065; Mon, 13 Jun 2016 12:04:10 -0400
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <1465805418-15906-1-git-send-email-thuth@redhat.com>
	<575ED0F2.2080900@redhat.com> <575ED8B1.10207@redhat.com>
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <575ED979.8090405@redhat.com>
Date: Mon, 13 Jun 2016 10:04:09 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <575ED8B1.10207@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="3NBLkJQsLljK7qrWQHn7xwW22eKRw96s2"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Mon, 13 Jun 2016 16:04:10 +0000 (UTC)
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
X-List-Received-Date: Mon, 13 Jun 2016 16:04:20 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--3NBLkJQsLljK7qrWQHn7xwW22eKRw96s2
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 06/13/2016 10:00 AM, Thomas Huth wrote:
> On 13.06.2016 17:27, Eric Blake wrote:
>> On 06/13/2016 02:10 AM, Thomas Huth wrote:
>>> Some source code analyzers like cppcheck spill out a warning if
>>> the sign of the argument does not match the format string.
>>>
>>> Ticket: https://bugs.launchpad.net/qemu/+bug/1589564
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>  hw/scsi/scsi-disk.c | 8 ++++----
>>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
>>> index 1881969..36f8a85 100644
>>> --- a/hw/scsi/scsi-disk.c
>>> +++ b/hw/scsi/scsi-disk.c
>>> @@ -2060,13 +2060,13 @@ static int32_t scsi_disk_emulate_command(SCSI=
Request *req, uint8_t *buf)
>>>          }
>>>          break;
>>>      case MODE_SELECT:
>>> -        DPRINTF("Mode Select(6) (len %lu)\n", (long)r->req.cmd.xfer)=
;
>>> +        DPRINTF("Mode Select(6) (len %lu)\n", (unsigned long)r->req.=
cmd.xfer);
>>
>> Why do we need a cast in the first place?  r->req.cmd.xfer is size_t, =
so
>> why not just "Mode Select(6) (len %zu)\n", r->req.cmd.xfer)?
>=20
> That sounds good, too. Do you want to provide a patch, or shall I do a
> v2 of my patch?

Up to Paolo, since he's already queued v1.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--3NBLkJQsLljK7qrWQHn7xwW22eKRw96s2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJXXtl5AAoJEKeha0olJ0NqNLIH/jcrXbI5SVeTVF+0j0uu6xOj
8U5vn1nA7LKPYQ35pphiBbYI7k6D3gpBxJvtacHPcE2nMgdUFBQG5oZSdcpB7K2/
5GhSvTK2hhme4yCQD10iRiTk7YhT8cxDPEMSV1tT6Su1l/6d61bOxtKpKpbxwyXb
RHvPwDYK7XugaoYsXmCQs5Qw6XHJk7deJDJVzwglfPEtt1KE2pU5bxo2FZBo6l7W
wPZdCN0t5c1IsctBdSGA+B7O0Zw1ybLttRNmCIymmxAPin+PXfACOKXVQXFB1Yza
ov2L5KmXgBTrnHkqHfpksazCZijylbpCja1VIjkIrCuxmlCxO4hMeup/ciCGock=
=Uo+/
-----END PGP SIGNATURE-----

--3NBLkJQsLljK7qrWQHn7xwW22eKRw96s2--

