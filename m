Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1X2KeM-0005G0-E5
	for mharc-qemu-trivial@gnu.org; Wed, 02 Jul 2014 09:32:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51610)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1X2KeE-0005El-Nm
	for qemu-trivial@nongnu.org; Wed, 02 Jul 2014 09:32:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1X2Ke9-0004y7-IY
	for qemu-trivial@nongnu.org; Wed, 02 Jul 2014 09:32:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:3875)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1X2Ke9-0004xz-A2; Wed, 02 Jul 2014 09:32:25 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s62DWOSU021950
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Wed, 2 Jul 2014 09:32:24 -0400
Received: from [10.3.113.143] (ovpn-113-143.phx2.redhat.com [10.3.113.143])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s62DWNLv024465; Wed, 2 Jul 2014 09:32:23 -0400
Message-ID: <53B409E7.7080605@redhat.com>
Date: Wed, 02 Jul 2014 07:32:23 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>
References: <1403879569-24256-1-git-send-email-pbonzini@redhat.com>	<1403886899.31091.187.camel@ul30vt.home>
	<1081899261.33608246.1403891502613.JavaMail.zimbra@redhat.com>
In-Reply-To: <1081899261.33608246.1403891502613.JavaMail.zimbra@redhat.com>
X-Enigmail-Version: 1.6
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="P61sXuviUfmpDQo9qphQLhBP1KD15ICLf"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, "libvir-list@redhat.com" <libvir-list@redhat.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for 2.1] vfio: use correct
	runstate
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
X-List-Received-Date: Wed, 02 Jul 2014 13:32:36 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--P61sXuviUfmpDQo9qphQLhBP1KD15ICLf
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

[adding libvirt]

On 06/27/2014 11:51 AM, Paolo Bonzini wrote:
> ----- Messaggio originale -----
>> Da: "Alex Williamson" <alex.williamson@redhat.com>
>> A: "Paolo Bonzini" <pbonzini@redhat.com>
>> Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
>> Inviato: Venerd=C3=AC, 27 giugno 2014 18:34:59
>> Oggetto: Re: [PATCH for 2.1] vfio: use correct runstate
>>
>> On Fri, 2014-06-27 at 16:32 +0200, Paolo Bonzini wrote:
>>> io-error is for block device errors; it should always be preceded
>>> by a BLOCK_IO_ERROR event.
>>
>> Where does this requirement come from?  I only see a loose association=

>> of IO_ERROR to disk in libvirt and none in QEMU.
>=20
> See the RunState enum in qapi-schema.json:
>=20
> ##
> # @RunState
> #
> # An enumeration of VM run states.
> #
> # ...
> #
> # @internal-error: An internal error that prevents further guest execut=
ion
> # has occurred
> #
> # @io-error: the last IOP has failed and the device is configured to pa=
use
> # on I/O errors
> #
> # @paused: guest has been paused via the 'stop' command
>=20
> The point of io-error is that management can look at block devices, see=
 if
> any have an error reported, and then resume execution (see documentatio=
n of
> rerror=3Dstop and werror=3Dstop/enospc).  This is counter to the intent=
ions you
> have in vfio.
>=20
>>> I think vfio wants to use
>>> RUN_STATE_INTERNAL_ERROR instead.
>>
>> But that seems to put us into an "unknown" paused state in libvirt.
>=20
> I think paused is incorrect, because (unlike RUN_STATE_IO_ERROR), you c=
annot
> resume from RUN_STATE_INTERNAL_ERROR except with a reset.  QEMU enforce=
s that,
> and this matches the error you are reporting:
>=20
>     error_report("%s(%04x:%02x:%02x.%x) Unrecoverable error detected.  =
"
>                  "Please collect any data possible and then kill the gu=
est",
>                  __func__, vdev->host.domain, vdev->host.bus,
>                  vdev->host.slot, vdev->host.function);
>=20
> libvirt has a crashed state, I think that's what libvirt should call th=
e
> internal-error runstate.  IIRC on Xen you get to crashed when the proce=
ssor
> raises an error on vmentry, for example.
>=20
> Libvirt only knows about crashed/unknown, but one could add crashed/int=
ernal-error
> too.

Yes, we probably need to teach libvirt about this state.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--P61sXuviUfmpDQo9qphQLhBP1KD15ICLf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJTtAnnAAoJEKeha0olJ0NqAXkIAIHyltjzjX1/HUrSHUeALcEj
AJXT2NfkRViZZ1ULNGIiBnFYY8Ft/cxz9r8LrM48QA5XiozwVCufn+lLdPh8+ZR9
z9yOZzcuQlBK7PvMVCfd8jqnCaB0CaZJEWDwhS1yVRCXBKcV7hb+Q73LqvNqlW7A
wI9gxpxDesDL0hRkDIt7/3AJY11RchPDdhsBzhcrvZNhraybVTNRBQ7iOkdCg0yU
bEnheQ1ZlfngQ07zKg3FGr8CUlFNsNwe+jKeu5s4LJyWXjFNtxvFyeDQQoLIjAmf
lrhNz6ibOIUibm23LMLlq8UWQ94rMcKL2F/xo1qTqG/KwtNYO8ElVTG+g8N7T4w=
=kp2P
-----END PGP SIGNATURE-----

--P61sXuviUfmpDQo9qphQLhBP1KD15ICLf--

