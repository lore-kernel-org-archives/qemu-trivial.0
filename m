Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xhvcm-0005OY-0y
	for mharc-qemu-trivial@gnu.org; Sat, 25 Oct 2014 03:18:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51815)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1Xhvca-0005ET-Je
	for qemu-trivial@nongnu.org; Sat, 25 Oct 2014 03:18:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1XhvcV-0006T5-9O
	for qemu-trivial@nongnu.org; Sat, 25 Oct 2014 03:18:44 -0400
Received: from mout.web.de ([212.227.15.4]:60406)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>)
	id 1XhvcK-0006RJ-F7; Sat, 25 Oct 2014 03:18:28 -0400
Received: from bender.mchp.siemens.de ([95.157.58.223]) by smtp.web.de
	(mrweb004) with ESMTPSA (Nemesis) id 0MdpWf-1XTI5P0jm9-00Pcf9;
	Sat, 25 Oct 2014 09:18:26 +0200
Message-ID: <544B4EB9.9030600@web.de>
Date: Sat, 25 Oct 2014 09:18:17 +0200
From: Jan Kiszka <jan.kiszka@web.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de;
	rv:1.8.1.12) Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12
	Mnenhy/0.7.5.666
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1414183045-14741-1-git-send-email-mjt@msgid.tls.msk.ru>
In-Reply-To: <1414183045-14741-1-git-send-email-mjt@msgid.tls.msk.ru>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="GV8ueoQvis71bi2iteSPcmX3Khr4JStjO"
X-Provags-ID: V03:K0:VXSKuMhiaALvSYAfx5nQ0HgaKuY8rzqDADGYeVspmOO1LrWYdf0
	ljntwu+kmyGlkN4osnMltYrIUJgQJ/4uPBbU6r5fwuy9BB9DbAQ+ouzp0zCSQVnHoRoMHkR
	OABMIzdIy3ZTn22pNDjUrOl7XIeybPJxfRntb5VTK7wYvEYs/pf73r3LyEzKaIv3VUOpVR9
	dCDjLAyyvgRriFKcM+3aQ==
X-UI-Out-Filterresults: notjunk:1;
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 212.227.15.4
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] net/slirp: specify logbase for smbd
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
X-List-Received-Date: Sat, 25 Oct 2014 07:18:50 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--GV8ueoQvis71bi2iteSPcmX3Khr4JStjO
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: quoted-printable

On 2014-10-24 22:37, Michael Tokarev wrote:
> It looks like smbd always logs to /var/log/samba/log.$progname
> even if config file specifies different logfile -- when it needs
> to log something before completing reading the config file.  But
> if it can't open it for writing, it fails and exits.  Tell smbd
> to use our temp dir as logbase (-l option) to avoid that.
>=20
> The same option is used by samba3 and samba4, so there should
> be no incompatible changes.
>=20
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>  net/slirp.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/net/slirp.c b/net/slirp.c
> index c171119..920af30 100644
> --- a/net/slirp.c
> +++ b/net/slirp.c
> @@ -549,8 +549,8 @@ static int slirp_smb(SlirpState* s, const char *exp=
orted_dir,
>              );
>      fclose(f);
> =20
> -    snprintf(smb_cmdline, sizeof(smb_cmdline), "%s -s %s",
> -             CONFIG_SMBD_COMMAND, smb_conf);
> +    snprintf(smb_cmdline, sizeof(smb_cmdline), "%s -l %s -s %s",
> +             CONFIG_SMBD_COMMAND, s->smb_dir, smb_conf);
> =20
>      if (slirp_add_exec(s->slirp, 0, smb_cmdline, &vserver_addr, 139) <=
 0 ||
>          slirp_add_exec(s->slirp, 0, smb_cmdline, &vserver_addr, 445) <=
 0) {
>=20

Cool, works for me as well!

Reviewed-and-tested-by: Jan Kiszka <jan.kiszka@siemens.com>

Jan


--GV8ueoQvis71bi2iteSPcmX3Khr4JStjO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlRLTsEACgkQitSsb3rl5xS41gCfe5RgJbgKM69ZWfC0jiGEMFXI
H0cAoLemB8lQ0b5Ah6mfhO1ybwwndY4n
=uZB9
-----END PGP SIGNATURE-----

--GV8ueoQvis71bi2iteSPcmX3Khr4JStjO--

