Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WXbvS-0000ai-M4
	for mharc-qemu-trivial@gnu.org; Tue, 08 Apr 2014 15:43:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59644)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1WXbvM-0000Nr-4r
	for qemu-trivial@nongnu.org; Tue, 08 Apr 2014 15:43:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1WXbvH-0003Gm-7K
	for qemu-trivial@nongnu.org; Tue, 08 Apr 2014 15:43:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:26478)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1WXbv7-0003Eh-03; Tue, 08 Apr 2014 15:42:57 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s38JgsPn025795
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 8 Apr 2014 15:42:55 -0400
Received: from [10.3.113.97] (ovpn-113-97.phx2.redhat.com [10.3.113.97])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s38JgskK004250; Tue, 8 Apr 2014 15:42:54 -0400
Message-ID: <5344513D.7050806@redhat.com>
Date: Tue, 08 Apr 2014 13:42:53 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Baojun Wang <wangbj@gmail.com>, qemu-devel@nongnu.org
References: <1396985438-19741-1-git-send-email-wangbj@gmail.com>
In-Reply-To: <1396985438-19741-1-git-send-email-wangbj@gmail.com>
X-Enigmail-Version: 1.6
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="U5JKCGgTv3fJg8Tfutv1JhNJvkoWNq7fq"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH V3 1/1] Add pmemsave command for both
 monitor and qmp,
 which could be useful to have qemu-softmmu as a cross debugger to load guest
 physical memory.
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
X-List-Received-Date: Tue, 08 Apr 2014 19:43:17 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--U5JKCGgTv3fJg8Tfutv1JhNJvkoWNq7fq
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 04/08/2014 01:30 PM, Baojun Wang wrote:

Your subject line is extremely long.  In general, we strive for
something less than 60 characters, so that 'git shortlog -30' can
display the entire line in an 80-column terminal.  Also, the subject
mentions pmemsave, but your commit mentions pmemload - it's very
misleading to provide a patch where the commit message doesn't even
mention the name of the command the patch is adding.  I would suggest a
subject line of:

qmp: add pmemload command

> I found this could be useful to have qemu-softmmu as a cross debugger (=
launch
> with -s -S command line option), then if we can have a command to load =
guest
> physical memory, we can use cross gdb to do some target debug which gdb=
 cannot
> do directly.
>=20

Your patch is lacking a Signed-off-by designation, therefore we cannot
accept it yet.

> Many thanks to Eric Blake for review the patch.

This comment may be useful to reviewers, but is not part of the commit
itself, so it belongs better...

>=20
> ---

=2E..here, after the --- separator.


> =20
> +void qmp_pmemload(int64_t addr, int64_t size, const char *filename,
> +                  Error **errp)
> +{
> +    FILE *f;
> +    uint32_t l;
> +    uint8_t buf[1024];
> +
> +    f =3D fopen(filename, "rb");

Rather than using fopen() and FILE* operations, I'd prefer you use
qemu_open() and lower-level read() operations.  In particular, this will
automatically make it possible for management applications to pass in
'/dev/fdset/1' to reuse a file descriptor that they passed in to qemu,
rather than forcing qemu to directly open the file.

> +    if (!f) {
> +        error_setg_file_open(errp, errno, filename);
> +        return;
> +    }
> +
> +    while (size !=3D 0) {
> +        l =3D fread(buf, 1, sizeof(buf), f);
> +        if (l > size)
> +            l =3D size;

This is lousy at error detection.  Again, you should be using read(),
not fread(), and properly erroring out on read failures rather than
silently ignoring them.


> +        .name       =3D "pmemload",
> +        .args_type  =3D "val:l,size:i,filename:s",

Would it make sense to put filename as the FIRST argument, with val and
size as optional arguments (defaulting to reading in at address 0 and
for the size determined by the length of the input file), rather than
forcing the user to pass in a size up front?

> +++ b/qapi-schema.json
> @@ -1708,6 +1708,26 @@
>    'data': {'val': 'int', 'size': 'int', 'filename': 'str'} }
> =20
>  ##
> +# @pmemload:
> +#
> +# Load a portion of guest physical memory from a file.
> +#
> +# @val: the physical address of the guest to start from
> +#
> +# @size: the size of memory region to load
> +#
> +# @filename: the file to load the memory from as binary data
> +#
> +# Returns: Nothing on success
> +#
> +# Since: 2.1
> +#
> +# Notes: Errors were not reliably returned until 2.1

Delete this line.  I guess I didn't make it clear in my first review
that this line is bogus copy and paste.  You don't need it.  pmemsave
needed it, because pmemsave went through some iterations where earlier
versions were buggy.  But your pmemload command is brand new, and should
not have bugs worth worrying about.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--U5JKCGgTv3fJg8Tfutv1JhNJvkoWNq7fq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJTRFE9AAoJEKeha0olJ0NqI88H/3L5pe04o1OmGESiIE1I4XmO
s4gvgJyzUIi/OC2ZcfHPwQGzs2Wdw16+PWf5m/IL1EYiN4AHEDdL12a+ZBwW5slv
9u+emGCGE1Ek1gnHLL0XYpbA19lz9Bnxduphc23k8zr3JDv1Ck1OzNgigmcFOGJQ
2rp43lpqGs7nC7boEpv5DgDtogdndMRDzZSJAyQ71VcgAxgYzNmvvVnrRQK8X8ia
VsbGGHw/sdGe8dSPfMlaFhtD4ucl0VGKcpg8CdGxrowqyyLxWbP3Rm2gXPojFkf3
pD40mZwWldi82zlIo54un4uB+/ZklMMjPxY6I+OyGS1y8GIExnvBIRdCDxR9SSs=
=4rAB
-----END PGP SIGNATURE-----

--U5JKCGgTv3fJg8Tfutv1JhNJvkoWNq7fq--

