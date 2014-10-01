Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XZIZ3-0000q7-Hd
	for mharc-qemu-trivial@gnu.org; Wed, 01 Oct 2014 07:59:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43351)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@hotmail.com>) id 1XZIYw-0000dF-NY
	for qemu-trivial@nongnu.org; Wed, 01 Oct 2014 07:59:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@hotmail.com>) id 1XZIYq-0003xc-QY
	for qemu-trivial@nongnu.org; Wed, 01 Oct 2014 07:59:18 -0400
Received: from blu004-omc2s33.hotmail.com ([65.55.111.108]:53355)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@hotmail.com>)
	id 1XZIYe-0003w4-RE; Wed, 01 Oct 2014 07:59:00 -0400
Received: from BLU437-SMTP81 ([65.55.111.73]) by BLU004-OMC2S33.hotmail.com
	over TLS secured channel with Microsoft SMTPSVC(7.5.7601.22724);
	Wed, 1 Oct 2014 04:59:00 -0700
X-TMN: [RyHtFDEbyVINQTUs19l1b07mLvrDklmVSG/Co246yww=]
X-Originating-Email: [arei.gonglei@hotmail.com]
Message-ID: <BLU437-SMTP81261859A1DAABEEDAA9499FB80@phx.gbl>
From: Gonglei <arei.gonglei@hotmail.com>
To: "'Markus Armbruster'" <armbru@redhat.com>
References: <1411638384-5844-1-git-send-email-arei.gonglei@huawei.com>	<1411638384-5844-3-git-send-email-arei.gonglei@huawei.com>	<87a95gch5b.fsf@blackfin.pond.sub.org>	<BLU437-SMTP61BB708870E44DA94B53E69FB80@phx.gbl>
	<87egus9jew.fsf@blackfin.pond.sub.org>
In-Reply-To: <87egus9jew.fsf@blackfin.pond.sub.org>
Date: Wed, 1 Oct 2014 19:58:08 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: Ac/dYiVWG5+kEzT3T8S0005cGAIdPwACbaug
Content-Language: zh-cn
X-OriginalArrivalTime: 01 Oct 2014 11:58:59.0642 (UTC)
	FILETIME=[15F379A0:01CFDD6F]
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 65.55.111.108
Cc: peter.maydell@linaro.org, weidong.huang@huawei.com, qemu-trivial@nongnu.org,
	luonengjun@huawei.com, mjt@tls.msk.ru, qemu-devel@nongnu.org,
	peter.huangpeng@huawei.com, arei.gonglei@huawei.com, pbonzini@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/4] os-posix: report error
	message	when	lock file failed
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
X-List-Received-Date: Wed, 01 Oct 2014 11:59:25 -0000

> Subject: Re: [Qemu-devel] [PATCH 2/4] os-posix: report error message =
when
> lock file failed
>=20
> Gonglei <arei.gonglei@hotmail.com> writes:
>=20
> > Hi,
> >
> >> Subject: Re: [Qemu-devel] [PATCH 2/4] os-posix: report error =
message when
> >> lock file failed
> >>
> >> <arei.gonglei@huawei.com> writes:
> >>
> >> > From: Gonglei <arei.gonglei@huawei.com>
> >> >
> >> > It will cause that create vm failed When manager
> >> > tool is killed forcibly (kill -9 libvirtd_pid),
> >> > the file not was unlink, and unlock. It's better
> >> > that report the error message for users.
> >> >
> >> > Signed-off-by: Huangweidong <weidong.huang@huawei.com>
> >> > Signed-off-by: Gonglei <arei.gonglei@huawei.com>
> >> > ---
> >> >  os-posix.c | 1 +
> >> >  1 file changed, 1 insertion(+)
> >> >
> >> > diff --git a/os-posix.c b/os-posix.c
> >> > index 9d5ae70..89831dc 100644
> >> > --- a/os-posix.c
> >> > +++ b/os-posix.c
> >> > @@ -316,6 +316,7 @@ int qemu_create_pidfile(const char *filename)
> >> >          return -1;
> >> >      }
> >> >      if (lockf(fd, F_TLOCK, 0) =3D=3D -1) {
> >> > +        error_report("lock file '%s' failed: %s", filename,
> strerror(errno));
> >> >          close(fd);
> >> >          return -1;
> >> >      }
> >>
> >> Only called from main():
> >>
> > Yes, indeed.
> >
> >>     if (pid_file && qemu_create_pidfile(pid_file) !=3D 0) {
> >>         os_pidfile_error();
> >>         exit(1);
> >>     }
> >>
> >> I suspect the error reporting is os_pidfile_error()'s job.  And it
> >> actually does it (POSIX version shown, W32 is simpler):
> >>
> >> void os_pidfile_error(void)
> >> {
> >>     if (daemonize) {
> >>         uint8_t status =3D 1;
> >>         if (write(fds[1], &status, 1) !=3D 1) {
> >>             perror("daemonize. Writing to pipe\n");
> >>         }
> >>     } else
> >>         fprintf(stderr, "Could not acquire pid file: %s\n", =
strerror(errno));
> >> }
> >>
> >> Are you sure your patch makes sense?
> >
> > Yes, I'm sure it make sense. And I had tested, the result is OK as =
expected.
> >
> > When daemonize variable is true, the os_pidfile_error() usually =
don't
> > report an error,
> > because "if (write(fds[1], &status, 1) !=3D 1)" is always false. On =
the other
> > hand, we should assure that we can get the original error message
> > when lock failed but not other information, such as "Could not =
acquire
> > pid file...".
>=20
> Even if the new error message makes sense, reporting errors in two
> places doesn't.
>=20
> qemu_create_pidfile() is designed to leave the actual error reporting =
to
> its caller, which delegates it to os_pidfile_error().
>=20
> If daemonize, os_pidfile_error() signals the failure to the parent
> process instead of reporting to stderr.  The parent does the =
reporting,
> in os_daemonize().  If this isn't good enough, you're certainly =
welcome
> to improve it.
>=20
> Just noticed that commit e5048d1 "os-posix: report error message when
> lock file failed" already messed this up: error reporting is spread =
over
> three places: qemu_create_pidfile(), os_pidfile_error() and
> os_daemonize().
>=20
> Please pick one method to report errors: either just in
> qemu_create_pidfile(), or in os_pidfile_error() (normal case) and
> os_daemonize() (if daemonize).  I don't particularly care which one =
you
> pick, as long as it works with and without -daemonize.

If we can get the root reason of one error easier, why not?
(I encountered the scenario described in commit message,
I only repeated that issue and eventually got the root reason is locking
pid file failed)

I don't think it is a problem that reporting errors over
two or three places.=20

And I often encounter this coding style:

Int funA() {
   ...
   Printf(".....");
   Return -1;
}

Int funcB() {
    If (funA() < 0) {
        Printf("something wrong\n");
        Return -1;
    }
}

Best regards,
-Gonglei


