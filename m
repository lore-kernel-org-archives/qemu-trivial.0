Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XhZMd-0000Qe-Gs
	for mharc-qemu-trivial@gnu.org; Fri, 24 Oct 2014 03:32:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57893)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XhZMW-0000HA-Mh
	for qemu-trivial@nongnu.org; Fri, 24 Oct 2014 03:32:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XhZMR-0000QC-Sk
	for qemu-trivial@nongnu.org; Fri, 24 Oct 2014 03:32:40 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:60235)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XhZMH-0008R5-R8; Fri, 24 Oct 2014 03:32:26 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id A7D1245F42;
	Fri, 24 Oct 2014 11:32:15 +0400 (MSK)
Message-ID: <544A007F.2090806@msgid.tls.msk.ru>
Date: Fri, 24 Oct 2014 11:32:15 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.8.1
MIME-Version: 1.0
To: arei.gonglei@huawei.com, qemu-devel@nongnu.org
References: <1411638384-5844-1-git-send-email-arei.gonglei@huawei.com>
	<1411638384-5844-3-git-send-email-arei.gonglei@huawei.com>
In-Reply-To: <1411638384-5844-3-git-send-email-arei.gonglei@huawei.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: peter.maydell@linaro.org, weidong.huang@huawei.com, qemu-trivial@nongnu.org,
	luonengjun@huawei.com, armbru@redhat.com,
	peter.huangpeng@huawei.com, pbonzini@redhat.com
Subject: Re: [Qemu-trivial] [PATCH 2/4] os-posix: report error message when
 lock file failed
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
X-List-Received-Date: Fri, 24 Oct 2014 07:32:45 -0000

On 09/25/2014 01:46 PM, arei.gonglei@huawei.com wrote:
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


I think I'll just revert this patch, because indeed, it makes
no sense to do this like that.

Context:

 qemu_create_pidfile() is only created from main(), and there,
 if that function returns failure, os_pidfile_error() function
 is called, to, guess that, report error (which is done differently
 whenever we're daemonizing or not).

 qemu_create_pidfile() function has several error returns, this
 lockf() failure is one of them, there are others (another shown
 in the patch context too).

 So this patch makes whole thing inconsistent at least.

 If we need to show error message when we're daemonizing, it
 looks like we should modify os_pidfile_error() routine to always
 report error and only after that check for daemon mode.  This way
 all errors will be reported the same way.

But I really wonder if we actually need os_pidfile_error() in the
first place, why this can't be done in qemu_create_pidfile().

So, I'm reverting this change now, to be revisited very soon.

Thanks,

/mjt


