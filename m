Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TM0Vs-0005a1-U6
	for mharc-qemu-trivial@gnu.org; Wed, 10 Oct 2012 13:56:08 -0400
Received: from eggs.gnu.org ([208.118.235.92]:34162)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1TM0Vo-0005MT-Oe
	for qemu-trivial@nongnu.org; Wed, 10 Oct 2012 13:56:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1TM0Vk-00081f-3z
	for qemu-trivial@nongnu.org; Wed, 10 Oct 2012 13:56:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55396)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1TM0Vc-0007zD-Ni; Wed, 10 Oct 2012 13:55:52 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q9AHtoa5008392
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 10 Oct 2012 13:55:50 -0400
Received: from [10.3.113.23] (ovpn-113-23.phx2.redhat.com [10.3.113.23])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q9AHtoHJ024240; Wed, 10 Oct 2012 13:55:50 -0400
Message-ID: <5075B6A5.2080807@redhat.com>
Date: Wed, 10 Oct 2012 11:55:49 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>
References: <1349868762-10021-1-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1349868762-10021-1-git-send-email-pbonzini@redhat.com>
X-Enigmail-Version: 1.4.4
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig063B402F6D735B34089A30D1"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] virtfs-proxy-helper: check
 return code of setfsgid/setfsuid
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
X-List-Received-Date: Wed, 10 Oct 2012 17:56:07 -0000

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig063B402F6D735B34089A30D1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 10/10/2012 05:32 AM, Paolo Bonzini wrote:
> Fixes the following error with glibc 2.16 on Fedora 18:
>=20
> virtfs-proxy-helper.c: In function =E2=80=98setfsugid=E2=80=99:
> virtfs-proxy-helper.c:293:13: error: ignoring return value of =E2=80=98=
setfsgid=E2=80=99, declared with attribute warn_unused_result [-Werror=3D=
unused-result]
> virtfs-proxy-helper.c:294:13: error: ignoring return value of =E2=80=98=
setfsuid=E2=80=99, declared with attribute warn_unused_result [-Werror=3D=
unused-result]
> cc1: all warnings being treated as errors
>=20
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  fsdev/virtfs-proxy-helper.c | 8 ++++++--
>  1 file modificato, 6 inserzioni(+), 2 rimozioni(-)

How does this differ from this earlier posting?
https://lists.gnu.org/archive/html/qemu-devel/2012-10/msg00851.html

--=20
Eric Blake   eblake@redhat.com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--------------enig063B402F6D735B34089A30D1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Mozilla - http://www.enigmail.net/

iQEcBAEBCAAGBQJQdbamAAoJEKeha0olJ0NqtywH/1yrXWbwiIF4Owe0cLZs3AZv
xxVQ2ntF6RthZgBI2KKddymBWGo/RC92Edt9uxOq00j/IdIixvgiAMvM7DVMN3/t
J3ctpjjMA5yNZba+f8Xqs+lKyZsm2mizf8gVl8E3PRywotS30zX95yzjiWLrDxaD
rPQQ3oMvhUAhP41Ui7VEV0P4wuLwVRehT2dr6GDsdINGmWunUF4V1JcVMmitZJB3
DGvpLxaRg/tnsF89LVa72URI4MiWt9qZXXsyaLvlzLQwouau4F1shfoyZr2sAPaM
emYQxRpFdbx5VCaA6RSvnaoZ6K71Paw/28iCjzLXC6UMVxqfzizo1SpBTj7sv1s=
=+Tvp
-----END PGP SIGNATURE-----

--------------enig063B402F6D735B34089A30D1--

