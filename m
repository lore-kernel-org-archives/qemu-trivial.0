Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XZFyd-00010m-Rh
	for mharc-qemu-trivial@gnu.org; Wed, 01 Oct 2014 05:13:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45350)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@hotmail.com>) id 1XZFyW-0000rs-1l
	for qemu-trivial@nongnu.org; Wed, 01 Oct 2014 05:13:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@hotmail.com>) id 1XZFyQ-00055D-44
	for qemu-trivial@nongnu.org; Wed, 01 Oct 2014 05:13:31 -0400
Received: from blu004-omc2s35.hotmail.com ([65.55.111.110]:58618)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@hotmail.com>)
	id 1XZFyE-0004ru-5c; Wed, 01 Oct 2014 05:13:14 -0400
Received: from BLU437-SMTP61 ([65.55.111.72]) by BLU004-OMC2S35.hotmail.com
	over TLS secured channel with Microsoft SMTPSVC(7.5.7601.22724);
	Wed, 1 Oct 2014 02:13:13 -0700
X-TMN: [g8Y4Mvu6Gz4el6lewmlWTXrFmUrcHXJI/jJht3JE7ao=]
X-Originating-Email: [arei.gonglei@hotmail.com]
Message-ID: <BLU437-SMTP61BB708870E44DA94B53E69FB80@phx.gbl>
From: Gonglei <arei.gonglei@hotmail.com>
To: "'Markus Armbruster'" <armbru@redhat.com>,
	<arei.gonglei@huawei.com>
References: <1411638384-5844-1-git-send-email-arei.gonglei@huawei.com>	<1411638384-5844-3-git-send-email-arei.gonglei@huawei.com>
	<87a95gch5b.fsf@blackfin.pond.sub.org>
In-Reply-To: <87a95gch5b.fsf@blackfin.pond.sub.org>
Date: Wed, 1 Oct 2014 17:12:20 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: Ac/dVD0nZtDgYnL3Txq8R1aHZWSjygAARV8w
Content-Language: zh-cn
X-OriginalArrivalTime: 01 Oct 2014 09:13:12.0538 (UTC)
	FILETIME=[ED03DBA0:01CFDD57]
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 65.55.111.110
Cc: peter.maydell@linaro.org, weidong.huang@huawei.com, qemu-trivial@nongnu.org,
	luonengjun@huawei.com, mjt@tls.msk.ru, qemu-devel@nongnu.org,
	peter.huangpeng@huawei.com, pbonzini@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/4] os-posix: report error
	message when	lock file failed
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
X-List-Received-Date: Wed, 01 Oct 2014 09:13:38 -0000

Hi,

> Subject: Re: [Qemu-devel] [PATCH 2/4] os-posix: report error message =
when
> lock file failed
>=20
> <arei.gonglei@huawei.com> writes:
>=20
> > From: Gonglei <arei.gonglei@huawei.com>
> >
> > It will cause that create vm failed When manager
> > tool is killed forcibly (kill -9 libvirtd_pid),
> > the file not was unlink, and unlock. It's better
> > that report the error message for users.
> >
> > Signed-off-by: Huangweidong <weidong.huang@huawei.com>
> > Signed-off-by: Gonglei <arei.gonglei@huawei.com>
> > ---
> >  os-posix.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/os-posix.c b/os-posix.c
> > index 9d5ae70..89831dc 100644
> > --- a/os-posix.c
> > +++ b/os-posix.c
> > @@ -316,6 +316,7 @@ int qemu_create_pidfile(const char *filename)
> >          return -1;
> >      }
> >      if (lockf(fd, F_TLOCK, 0) =3D=3D -1) {
> > +        error_report("lock file '%s' failed: %s", filename, =
strerror(errno));
> >          close(fd);
> >          return -1;
> >      }
>=20
> Only called from main():
>=20
Yes, indeed.=20

>     if (pid_file && qemu_create_pidfile(pid_file) !=3D 0) {
>         os_pidfile_error();
>         exit(1);
>     }
>=20
> I suspect the error reporting is os_pidfile_error()'s job.  And it
> actually does it (POSIX version shown, W32 is simpler):
>=20
> void os_pidfile_error(void)
> {
>     if (daemonize) {
>         uint8_t status =3D 1;
>         if (write(fds[1], &status, 1) !=3D 1) {
>             perror("daemonize. Writing to pipe\n");
>         }
>     } else
>         fprintf(stderr, "Could not acquire pid file: %s\n", =
strerror(errno));
> }
>=20
> Are you sure your patch makes sense?

Yes, I'm sure it make sense. And I had tested, the result is OK as =
expected.

When daemonize variable is true, the os_pidfile_error() usually don't =
report an error,
because "if (write(fds[1], &status, 1) !=3D 1)" is always false. On the =
other
hand, we should assure that we can get the original error message
when lock failed but not other information, such as "Could not acquire =
pid file...".

Best regards,
-Gonglei




