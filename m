Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XX8FU-0001OG-EH
	for mharc-qemu-trivial@gnu.org; Thu, 25 Sep 2014 08:34:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59590)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1XX8FO-0001Lc-Et
	for qemu-trivial@nongnu.org; Thu, 25 Sep 2014 08:34:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1XX8FJ-00075C-9W
	for qemu-trivial@nongnu.org; Thu, 25 Sep 2014 08:34:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51191)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1XX8FJ-00074p-2A; Thu, 25 Sep 2014 08:34:05 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s8PCXtHe020849
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Thu, 25 Sep 2014 08:33:55 -0400
Received: from [10.3.113.28] (ovpn-113-28.phx2.redhat.com [10.3.113.28])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s8PCXssx028442; Thu, 25 Sep 2014 08:33:54 -0400
Message-ID: <54240BB1.8020908@redhat.com>
Date: Thu, 25 Sep 2014 06:33:53 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.0
MIME-Version: 1.0
To: arei.gonglei@huawei.com, qemu-devel@nongnu.org
References: <1411638384-5844-1-git-send-email-arei.gonglei@huawei.com>
	<1411638384-5844-2-git-send-email-arei.gonglei@huawei.com>
In-Reply-To: <1411638384-5844-2-git-send-email-arei.gonglei@huawei.com>
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="81JgiW6MXCgew4nmaMUUA6vfl2XlNEAu6"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, weidong.huang@huawei.com, qemu-trivial@nongnu.org,
	luonengjun@huawei.com, mjt@tls.msk.ru, armbru@redhat.com,
	peter.huangpeng@huawei.com, pbonzini@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/4] os-posix/win32: convert
 fprintf/perror to error_report
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
X-List-Received-Date: Thu, 25 Sep 2014 12:34:14 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--81JgiW6MXCgew4nmaMUUA6vfl2XlNEAu6
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 09/25/2014 03:46 AM, arei.gonglei@huawei.com wrote:
> From: Gonglei <arei.gonglei@huawei.com>
>=20
> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
> ---
>  os-posix.c | 34 ++++++++++++++++++----------------
>  os-win32.c |  3 ++-
>  2 files changed, 20 insertions(+), 17 deletions(-)
>=20
> diff --git a/os-posix.c b/os-posix.c
> index cb2a7f7..9d5ae70 100644
> --- a/os-posix.c
> +++ b/os-posix.c
> @@ -39,6 +39,7 @@
>  #include "sysemu/sysemu.h"
>  #include "net/slirp.h"
>  #include "qemu-options.h"
> +#include "qemu/error-report.h"
> =20
>  #ifdef CONFIG_LINUX
>  #include <sys/prctl.h>
> @@ -120,11 +121,11 @@ void os_set_proc_name(const char *s)
>      /* Could rewrite argv[0] too, but that's a bit more complicated.
>         This simple way is enough for `top'. */
>      if (prctl(PR_SET_NAME, name)) {
> -        perror("unable to change process name");
> +        error_report("unable to change process name");

This loses the value of errno that perror would have displayed.  Is that
reduction in error message quality intentional?  If not, then this is
not a trivial conversion; if it is, then your commit message should call
it out.

> @@ -167,20 +168,20 @@ static void change_process_uid(void)
>  {
>      if (user_pwd) {
>          if (setgid(user_pwd->pw_gid) < 0) {
> -            fprintf(stderr, "Failed to setgid(%d)\n", user_pwd->pw_gid=
);
> +            error_report("Failed to setgid(%d)\n", user_pwd->pw_gid);

No trailing \n for error_report, please. (You got it right in most of
your conversions)


> @@ -190,11 +191,11 @@ static void change_root(void)
>  {
>      if (chroot_dir) {
>          if (chroot(chroot_dir) < 0) {
> -            fprintf(stderr, "chroot failed\n");
> +            error_report("chroot failed");
>              exit(1);
>          }
>          if (chdir("/")) {
> -            perror("not able to chdir to /");
> +            error_report("not able to chdir to /");

Another loss of errno value from perror.

>              exit(1);
>          }
>      }
> @@ -224,7 +225,7 @@ void os_daemonize(void)
>              if (len !=3D 1)
>                  exit(1);
>              else if (status =3D=3D 1) {
> -                fprintf(stderr, "Could not acquire pidfile: %s\n", str=
error(errno));
> +                error_report("Could not acquire pidfile: %s", strerror=
(errno));

This code is broken.  The earlier 'if (len !=3D 1)' fails to print a
message before exiting (not to mention it violates coding style by
omitting {}).  Then, if we get inside the 'else if (status =3D=3D 1)'
conditional, then we KNOW that read() succeeded, and therefore errno is
unspecified.  Printing strerror(errno) on a random value is NOT helpful.


> @@ -267,7 +268,7 @@ void os_setup_post(void)
>  	    exit(1);
> =20
>          if (chdir("/")) {
> -            perror("not able to chdir to /");
> +            error_report("not able to chdir to /");

Another loss of errno reporting.

>              exit(1);
>          }
>  	TFR(fd =3D qemu_open("/dev/null", O_RDWR));
> @@ -292,10 +293,11 @@ void os_pidfile_error(void)
>      if (daemonize) {
>          uint8_t status =3D 1;
>          if (write(fds[1], &status, 1) !=3D 1) {
> -            perror("daemonize. Writing to pipe\n");
> +            error_report("daemonize. Writing to pipe");

and another.

> @@ -338,7 +340,7 @@ int os_mlock(void)
> =20
>      ret =3D mlockall(MCL_CURRENT | MCL_FUTURE);
>      if (ret < 0) {
> -        perror("mlockall");
> +        error_report("mlockall");

and another.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--81JgiW6MXCgew4nmaMUUA6vfl2XlNEAu6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg

iQEcBAEBCAAGBQJUJAuxAAoJEKeha0olJ0NqWTMIAJDoGT2S/60KSxHZMDQjxBsI
dc0HIebaxaaISddnhYXBGqmM+5NK5usBoW9n3Xk+nHtebEikV2hQNkJ6hKGhPDfM
90tPUS+W5ABXmfYsMTGR/lc73fCJGSr1D/LcGKVOMdj8lAjr0BOzpcpVXerZJPXq
QyfJItsLvgInGelg8jXec7iuM8h9L+3ICa5iW2mUdJwWJjvwLPFsa5N8HJP72pBI
7iA3bve7PQNN+P0gB/eXNuOpdPfMfyB2SwxNAVuQ6RUmrH/sx1wjgkHOBKBkIoYC
hscS+5Rczt6/pXBCQya5o3pn9C9EZm1BRd00zybr/FVqt97GrIlVgDKcakapr8A=
=qbjV
-----END PGP SIGNATURE-----

--81JgiW6MXCgew4nmaMUUA6vfl2XlNEAu6--

