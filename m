Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XZH67-0008T0-AO
	for mharc-qemu-trivial@gnu.org; Wed, 01 Oct 2014 06:25:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57047)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1XZH60-0008Ol-8T
	for qemu-trivial@nongnu.org; Wed, 01 Oct 2014 06:25:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1XZH5v-0002Oj-Du
	for qemu-trivial@nongnu.org; Wed, 01 Oct 2014 06:25:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:11331)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1XZH5l-0002A2-G1; Wed, 01 Oct 2014 06:25:05 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s91AOwXr023254
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Wed, 1 Oct 2014 06:24:58 -0400
Received: from blackfin.pond.sub.org (ovpn-116-61.ams2.redhat.com
	[10.36.116.61])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s91AOuEC030159
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 1 Oct 2014 06:24:57 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 6E11E3042B6D; Wed,  1 Oct 2014 12:24:55 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Gonglei <arei.gonglei@hotmail.com>
References: <1411638384-5844-1-git-send-email-arei.gonglei@huawei.com>
	<1411638384-5844-3-git-send-email-arei.gonglei@huawei.com>
	<87a95gch5b.fsf@blackfin.pond.sub.org>
	<BLU437-SMTP61BB708870E44DA94B53E69FB80@phx.gbl>
Date: Wed, 01 Oct 2014 12:24:55 +0200
In-Reply-To: <BLU437-SMTP61BB708870E44DA94B53E69FB80@phx.gbl> (Gonglei's
	message of "Wed, 1 Oct 2014 17:12:20 +0800")
Message-ID: <87egus9jew.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, weidong.huang@huawei.com, qemu-trivial@nongnu.org,
	luonengjun@huawei.com, mjt@tls.msk.ru, qemu-devel@nongnu.org,
	peter.huangpeng@huawei.com, arei.gonglei@huawei.com, pbonzini@redhat.com
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
X-List-Received-Date: Wed, 01 Oct 2014 10:25:25 -0000

Gonglei <arei.gonglei@hotmail.com> writes:

> Hi,
>
>> Subject: Re: [Qemu-devel] [PATCH 2/4] os-posix: report error message when
>> lock file failed
>> 
>> <arei.gonglei@huawei.com> writes:
>> 
>> > From: Gonglei <arei.gonglei@huawei.com>
>> >
>> > It will cause that create vm failed When manager
>> > tool is killed forcibly (kill -9 libvirtd_pid),
>> > the file not was unlink, and unlock. It's better
>> > that report the error message for users.
>> >
>> > Signed-off-by: Huangweidong <weidong.huang@huawei.com>
>> > Signed-off-by: Gonglei <arei.gonglei@huawei.com>
>> > ---
>> >  os-posix.c | 1 +
>> >  1 file changed, 1 insertion(+)
>> >
>> > diff --git a/os-posix.c b/os-posix.c
>> > index 9d5ae70..89831dc 100644
>> > --- a/os-posix.c
>> > +++ b/os-posix.c
>> > @@ -316,6 +316,7 @@ int qemu_create_pidfile(const char *filename)
>> >          return -1;
>> >      }
>> >      if (lockf(fd, F_TLOCK, 0) == -1) {
>> > +        error_report("lock file '%s' failed: %s", filename, strerror(errno));
>> >          close(fd);
>> >          return -1;
>> >      }
>> 
>> Only called from main():
>> 
> Yes, indeed. 
>
>>     if (pid_file && qemu_create_pidfile(pid_file) != 0) {
>>         os_pidfile_error();
>>         exit(1);
>>     }
>> 
>> I suspect the error reporting is os_pidfile_error()'s job.  And it
>> actually does it (POSIX version shown, W32 is simpler):
>> 
>> void os_pidfile_error(void)
>> {
>>     if (daemonize) {
>>         uint8_t status = 1;
>>         if (write(fds[1], &status, 1) != 1) {
>>             perror("daemonize. Writing to pipe\n");
>>         }
>>     } else
>>         fprintf(stderr, "Could not acquire pid file: %s\n", strerror(errno));
>> }
>> 
>> Are you sure your patch makes sense?
>
> Yes, I'm sure it make sense. And I had tested, the result is OK as expected.
>
> When daemonize variable is true, the os_pidfile_error() usually don't
> report an error,
> because "if (write(fds[1], &status, 1) != 1)" is always false. On the other
> hand, we should assure that we can get the original error message
> when lock failed but not other information, such as "Could not acquire
> pid file...".

Even if the new error message makes sense, reporting errors in two
places doesn't.

qemu_create_pidfile() is designed to leave the actual error reporting to
its caller, which delegates it to os_pidfile_error().

If daemonize, os_pidfile_error() signals the failure to the parent
process instead of reporting to stderr.  The parent does the reporting,
in os_daemonize().  If this isn't good enough, you're certainly welcome
to improve it.

Just noticed that commit e5048d1 "os-posix: report error message when
lock file failed" already messed this up: error reporting is spread over
three places: qemu_create_pidfile(), os_pidfile_error() and
os_daemonize().

Please pick one method to report errors: either just in
qemu_create_pidfile(), or in os_pidfile_error() (normal case) and
os_daemonize() (if daemonize).  I don't particularly care which one you
pick, as long as it works with and without -daemonize.

