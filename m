Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XZFY3-0000jn-Av
	for mharc-qemu-trivial@gnu.org; Wed, 01 Oct 2014 04:46:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37917)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1XZFXx-0000cn-8C
	for qemu-trivial@nongnu.org; Wed, 01 Oct 2014 04:46:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1XZFXs-0003jj-Eo
	for qemu-trivial@nongnu.org; Wed, 01 Oct 2014 04:46:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:22923)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1XZFXi-0003iA-3n; Wed, 01 Oct 2014 04:45:50 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s918jeUm009105
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Wed, 1 Oct 2014 04:45:41 -0400
Received: from blackfin.pond.sub.org (ovpn-116-61.ams2.redhat.com
	[10.36.116.61])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s918jbIh020702
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 1 Oct 2014 04:45:39 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id ED8883042B6D; Wed,  1 Oct 2014 10:45:36 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: <arei.gonglei@huawei.com>
References: <1411638384-5844-1-git-send-email-arei.gonglei@huawei.com>
	<1411638384-5844-3-git-send-email-arei.gonglei@huawei.com>
Date: Wed, 01 Oct 2014 10:45:36 +0200
In-Reply-To: <1411638384-5844-3-git-send-email-arei.gonglei@huawei.com> (arei
	gonglei's message of "Thu, 25 Sep 2014 17:46:22 +0800")
Message-ID: <87a95gch5b.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, weidong.huang@huawei.com, qemu-trivial@nongnu.org,
	luonengjun@huawei.com, mjt@tls.msk.ru, qemu-devel@nongnu.org,
	peter.huangpeng@huawei.com, pbonzini@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/4] os-posix: report error
	message when lock file failed
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
X-List-Received-Date: Wed, 01 Oct 2014 08:46:10 -0000

<arei.gonglei@huawei.com> writes:

> From: Gonglei <arei.gonglei@huawei.com>
>
> It will cause that create vm failed When manager
> tool is killed forcibly (kill -9 libvirtd_pid),
> the file not was unlink, and unlock. It's better
> that report the error message for users.
>
> Signed-off-by: Huangweidong <weidong.huang@huawei.com>
> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
> ---
>  os-posix.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/os-posix.c b/os-posix.c
> index 9d5ae70..89831dc 100644
> --- a/os-posix.c
> +++ b/os-posix.c
> @@ -316,6 +316,7 @@ int qemu_create_pidfile(const char *filename)
>          return -1;
>      }
>      if (lockf(fd, F_TLOCK, 0) == -1) {
> +        error_report("lock file '%s' failed: %s", filename, strerror(errno));
>          close(fd);
>          return -1;
>      }

Only called from main():

    if (pid_file && qemu_create_pidfile(pid_file) != 0) {
        os_pidfile_error();
        exit(1);
    }

I suspect the error reporting is os_pidfile_error()'s job.  And it
actually does it (POSIX version shown, W32 is simpler):

void os_pidfile_error(void)
{
    if (daemonize) {
        uint8_t status = 1;
        if (write(fds[1], &status, 1) != 1) {
            perror("daemonize. Writing to pipe\n");
        }
    } else
        fprintf(stderr, "Could not acquire pid file: %s\n", strerror(errno));
}

Are you sure your patch makes sense?

