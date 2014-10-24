Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XhagM-0008N4-8f
	for mharc-qemu-trivial@gnu.org; Fri, 24 Oct 2014 04:57:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45998)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XhagE-0008E2-S2
	for qemu-trivial@nongnu.org; Fri, 24 Oct 2014 04:57:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Xhag9-0001qq-M2
	for qemu-trivial@nongnu.org; Fri, 24 Oct 2014 04:57:06 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:31187)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1Xhafz-0001kx-BA; Fri, 24 Oct 2014 04:56:51 -0400
Received: from 172.24.2.119 (EHLO szxeml449-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id AVZ99868; Fri, 24 Oct 2014 16:56:37 +0800 (CST)
Received: from [127.0.0.1] (10.177.19.102) by szxeml449-hub.china.huawei.com
	(10.82.67.192) with Microsoft SMTP Server id 14.3.158.1;
	Fri, 24 Oct 2014 16:56:30 +0800
Message-ID: <544A1431.9050109@huawei.com>
Date: Fri, 24 Oct 2014 16:56:17 +0800
From: Gonglei <arei.gonglei@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1411638384-5844-1-git-send-email-arei.gonglei@huawei.com>
	<1411638384-5844-3-git-send-email-arei.gonglei@huawei.com>
	<544A007F.2090806@msgid.tls.msk.ru>
In-Reply-To: <544A007F.2090806@msgid.tls.msk.ru>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020205.544A1447.00D6, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 5674eb49776f43730c6fbff88ddf2da8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"Huangweidong \(C\)" <weidong.huang@huawei.com>,
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	Luonengjun <luonengjun@huawei.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"armbru@redhat.com" <armbru@redhat.com>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>,
	"Huangpeng \(Peter\)" <peter.huangpeng@huawei.com>
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
X-List-Received-Date: Fri, 24 Oct 2014 08:57:11 -0000

On 2014/10/24 15:32, Michael Tokarev wrote:

> On 09/25/2014 01:46 PM, arei.gonglei@huawei.com wrote:
>> From: Gonglei <arei.gonglei@huawei.com>
>>
>> It will cause that create vm failed When manager
>> tool is killed forcibly (kill -9 libvirtd_pid),
>> the file not was unlink, and unlock. It's better
>> that report the error message for users.
>>
>> Signed-off-by: Huangweidong <weidong.huang@huawei.com>
>> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
>> ---
>>  os-posix.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/os-posix.c b/os-posix.c
>> index 9d5ae70..89831dc 100644
>> --- a/os-posix.c
>> +++ b/os-posix.c
>> @@ -316,6 +316,7 @@ int qemu_create_pidfile(const char *filename)
>>          return -1;
>>      }
>>      if (lockf(fd, F_TLOCK, 0) == -1) {
>> +        error_report("lock file '%s' failed: %s", filename, strerror(errno));
>>          close(fd);
>>          return -1;
>>      }
> 
> 
> I think I'll just revert this patch, because indeed, it makes
> no sense to do this like that.
> 
> Context:
> 
>  qemu_create_pidfile() is only created from main(), and there,
>  if that function returns failure, os_pidfile_error() function
>  is called, to, guess that, report error (which is done differently
>  whenever we're daemonizing or not).
> 
>  qemu_create_pidfile() function has several error returns, this
>  lockf() failure is one of them, there are others (another shown
>  in the patch context too).
> 

Yes, agree.

>  So this patch makes whole thing inconsistent at least.
> 
>  If we need to show error message when we're daemonizing, it
>  looks like we should modify os_pidfile_error() routine to always
>  report error and only after that check for daemon mode.  This way
>  all errors will be reported the same way.
> 

In os_pidfile_error(), like below...
if (write(fds[1], &status, 1) != 1) {
            perror("daemonize. Writing to pipe\n");
}

will call its child process to report error:

 else if (status == 1) {
                fprintf(stderr, "Could not acquire pidfile\n");
                exit(1);
            }
I just want to make the error message more clear so that
people can find the root reasons of errors as soon as possible. :)

> But I really wonder if we actually need os_pidfile_error() in the
> first place, why this can't be done in qemu_create_pidfile().
> 

> So, I'm reverting this change now, to be revisited very soon.
> 

If you think that's better, I'm fine with it.

Best regards,
-Gonglei



