Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZkOdS-0006ML-4F
	for mharc-qemu-trivial@gnu.org; Thu, 08 Oct 2015 23:46:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54829)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1ZkOdI-000690-14
	for qemu-trivial@nongnu.org; Thu, 08 Oct 2015 23:46:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1ZkOdH-0002mB-8B
	for qemu-trivial@nongnu.org; Thu, 08 Oct 2015 23:46:11 -0400
Received: from ozlabs.org ([103.22.144.67]:49588)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>)
	id 1ZkOdC-0002hy-0z; Thu, 08 Oct 2015 23:46:06 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 2D03B140DA7; Fri,  9 Oct 2015 14:46:00 +1100 (AEDT)
Date: Fri, 9 Oct 2015 12:51:49 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Thomas Huth <thuth@redhat.com>
Message-ID: <20151009015149.GA1278@voom.redhat.com>
References: <1444332916-16476-1-git-send-email-thuth@redhat.com>
	<1444332916-16476-3-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7JfCtLOvnd9MIVvH"
Content-Disposition: inline
In-Reply-To: <1444332916-16476-3-git-send-email-thuth@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 103.22.144.67
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org, Alexander Graf <agraf@suse.de>
Subject: Re: [Qemu-trivial] [PATCH 2/5] hw/scsi/spapr_vscsi: Remove
	superfluous memset
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
X-List-Received-Date: Fri, 09 Oct 2015 03:46:13 -0000


--7JfCtLOvnd9MIVvH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 08, 2015 at 09:35:13PM +0200, Thomas Huth wrote:
> g_malloc0 already clears the memory, so no need for
> the additional memset here.
>=20
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: David Gibson <david@gibson.dropbear.id.au>
> Cc: Alexander Graf <agraf@suse.de>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Thanks, applied to spapr-next.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--7JfCtLOvnd9MIVvH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWFx21AAoJEGw4ysog2bOSmd4QAJbOqkx/noDQm5uw/5zjVdxA
j9k730Fr23EjD35bx90eXyrrD7iS02I7cUBWl1i9zoKZvY+FZtPGc6UUM6HHQ16e
bwsXMeAo1fRvmopWsnQyrpRhFyBIbAIQfmWWQeK8mB0gPjPPTZXcbxN1I2KNmCqG
vD006z9805ioxTSZLTDWtTPz+MTZBor2SoGDX7jeIncx8x38KHuPYK5fthl0sa5q
v6iIFuhU6qPU4HmQKyIJbKs7leJM04OUE/s++lPM9AS3uRXq3Fd9o+h6UfacvWd5
43mq1FHFZSClb5ZdQL3LjB+qHxYOBB/jU4c++S/4Mv4fC93VE3u3ZDViXf6vmrOk
Ke0e0LRr3h2wTuvjZrEp/LVLrFIJtpceUxRTLM8RBer87Oqoi7NIv4mhi8VCakkO
MPYm+y6EyAOchOCFZ3LQ+hLWjIWjCkIg+9c4xC3IzrzL8SO7c5KRG4P0GPRSCf7l
VVmhCfib/WqhyvcjuYDLzVer/tfCWEcczQ/pAHIctCp8zkK0qvSAgAYFoqyVBqsd
ATSzMe8jNP0M8O+sRNseldzwuC9idaIfKxDk4CIW9ZC8iRJ3/ocjd6P+FvP3IK6+
oyq/zhH8nBAXNw/CbZNF973Pvs7uZrRyZ0mIFdfjcdnJCGEgxa7Iav//arPPKhaV
nAg1cfIVXQWUwlAR20DG
=GT/A
-----END PGP SIGNATURE-----

--7JfCtLOvnd9MIVvH--

