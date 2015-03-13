Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YWQ4T-0006hx-DH
	for mharc-qemu-trivial@gnu.org; Fri, 13 Mar 2015 09:56:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51765)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1YWQ4Q-0006hW-T4
	for qemu-trivial@nongnu.org; Fri, 13 Mar 2015 09:56:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1YWQ4N-0000x5-V0
	for qemu-trivial@nongnu.org; Fri, 13 Mar 2015 09:56:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37019)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1YWQ4N-0000x1-M1; Fri, 13 Mar 2015 09:56:07 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t2DDu2Dn008780
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Fri, 13 Mar 2015 09:56:03 -0400
Received: from [10.3.113.70] (ovpn-113-70.phx2.redhat.com [10.3.113.70])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t2DDu2Ac028019; Fri, 13 Mar 2015 09:56:02 -0400
Message-ID: <5502EC71.9000009@redhat.com>
Date: Fri, 13 Mar 2015 07:56:01 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <1426251334-29445-1-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1426251334-29445-1-git-send-email-pbonzini@redhat.com>
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="7RSHMdchr9qQ642usCDVdeFk2ukpff8Cp"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, famz@redhat.com, zhaoshenglong@huawei.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] vl: fix resource leak with
	monitor_fdset_add_fd
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
X-List-Received-Date: Fri, 13 Mar 2015 13:56:12 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--7RSHMdchr9qQ642usCDVdeFk2ukpff8Cp
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 03/13/2015 06:55 AM, Paolo Bonzini wrote:
> monitor_fdset_add_fd returns an AddfdInfo struct (used by the QMP
> command add_fd).  Free it.
>=20
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
> 	v1->v2: line length [Fam], pass &error_abort [Shannon]
> ---
>  vl.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>=20

Reviewed-by: Eric Blake <eblake@redhat.com>

> diff --git a/vl.c b/vl.c
> index eba5d4c..9eae8f9 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -1011,6 +1011,7 @@ static int parse_add_fd(QemuOpts *opts, void *opa=
que)
>      int fd, dupfd, flags;
>      int64_t fdset_id;
>      const char *fd_opaque =3D NULL;
> +    AddfdInfo *fdinfo;
> =20
>      fd =3D qemu_opt_get_number(opts, "fd", -1);
>      fdset_id =3D qemu_opt_get_number(opts, "set", -1);
> @@ -1060,8 +1061,10 @@ static int parse_add_fd(QemuOpts *opts, void *op=
aque)
>      }
> =20
>      /* add the duplicate fd, and optionally the opaque string, to the =
fd set */
> -    monitor_fdset_add_fd(dupfd, true, fdset_id, fd_opaque ? true : fal=
se,
> -                         fd_opaque, NULL);
> +    fdinfo =3D monitor_fdset_add_fd(dupfd, true, fdset_id,
> +                                  fd_opaque ? true : false, fd_opaque,=


I might have written !!fd_opaque (as cond ? true : false always looks so
long), but that's cosmetic and doesn't affect the review.


--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--7RSHMdchr9qQ642usCDVdeFk2ukpff8Cp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJVAuxxAAoJEKeha0olJ0NqFssIAICXlowBTcQ8/bShVH1Ixowh
zy+fykBSJsqkk+Ofz0x+EbicVM9BOG0l5NuBepUtMlWuJtNQz6H5B+aop+e+wuZ3
rWwfCZH3YYVBBXhGp7mn21VXFN57v14I1avq9upSk8Mngm4oGSi00XHg1j/IH2k8
wfRszgI3Crf+HcALl26G+dgLAPRHfRGX6PmbxbE2aQHag5ReE0uf8ycka0Pk5hme
CRnHvq4w6ImThKHPCrJmcxMV4IqkcB0fEM4TH+lDqEGFQM/BPJddYjXv15zep/i+
7hRyBGQtgx7xjrWXMcGnAmuQGElFdrd4cRhtzcYdHTeM66rYdTMWzJYufCEGEMc=
=MhPr
-----END PGP SIGNATURE-----

--7RSHMdchr9qQ642usCDVdeFk2ukpff8Cp--

