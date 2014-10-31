Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XkDrz-0003pd-1y
	for mharc-qemu-trivial@gnu.org; Fri, 31 Oct 2014 11:12:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45953)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XkDrK-00083J-NF
	for qemu-trivial@nongnu.org; Fri, 31 Oct 2014 11:12:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Xk773-0002e6-3X
	for qemu-trivial@nongnu.org; Fri, 31 Oct 2014 03:59:18 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:54349)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1Xk772-0002ah-E3; Fri, 31 Oct 2014 03:59:13 -0400
Received: from 172.24.2.119 (EHLO szxeml457-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CBQ22916; Fri, 31 Oct 2014 15:59:02 +0800 (CST)
Received: from [127.0.0.1] (10.177.19.102) by szxeml457-hub.china.huawei.com
	(10.82.67.200) with Microsoft SMTP Server id 14.3.158.1;
	Fri, 31 Oct 2014 15:58:58 +0800
Message-ID: <5453412E.9020601@huawei.com>
Date: Fri, 31 Oct 2014 15:58:38 +0800
From: Gonglei <arei.gonglei@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <cover.1414681502.git.mjt@msgid.tls.msk.ru>
	<dc4522b965468522221bd08231b169b1a3e28c69.1414681502.git.mjt@msgid.tls.msk.ru>
	<5453178B.2040504@huawei.com> <54533742.1000109@msgid.tls.msk.ru>
	<54533B60.2080008@huawei.com> <54533D41.6010704@msgid.tls.msk.ru>
In-Reply-To: <54533D41.6010704@msgid.tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH 3/4] pidfile: stop making pidfile error a
	special case
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
X-List-Received-Date: Fri, 31 Oct 2014 15:12:03 -0000

On 2014/10/31 15:41, Michael Tokarev wrote:

> 31.10.2014 10:33, Gonglei wrote:
> []
>>>>> While at it, fix wrong identation in os_daemonize().
>>>>
>>>> s/identation/identification/
>>>
>>> No, the original word was the right one.
>>
>> Sorry, I can't find 'identation' both dictionary and Google.
>> Your meaning 'indentation'?
> 
> Damn.  I missed that one.  It is "indentation" inedeed :)
> (but not identification).
> 
> []
>>>>>              do {
>>>>>                  len = read(fds[0], &status, 1);
>>>>>              } while (len < 0 && errno == EINTR);
>>>>> -            if (len != 1) {
>>>>> -                exit(1);
>>>>> -            }
>>>>
>>>> Does this check need to be removed?
>>>
>>> Yes, because...
>>>>
>>>>> -            else if (status == 1) {
>>>>> -                fprintf(stderr, "Could not acquire pidfile\n");
>>>>> -                exit(1);
>>>>> -            } else {
>>>>> -                exit(0);
>>>>> -            }
>>>>> -            } else if (pid < 0) {
>>>>> -                exit(1);
>>>>> -            }
>>>>> +
>>>>> +            exit(len == 1 && status == 0 ? 0 : 1);
>>>
>>> ...it is checked here, note the 'len == 1' part of the condition.
>>
>> If len != 1, the original code exit with 1, after your changes,
>> it will exit with 0. Right?
> 
> with len != 1, the condition 'len == 1 && status == 0 ? 0 : 1'

Ok. That's will be great if you can modify it
to "(len == 1 && status == 0 ) ? 0 : 1"

Best regards,
-Gonglei

> evaluates to 1.  Maybe I can add a comment here:
> 

> +            /* only exit successfully if our child actually
> +             * wrote a one-byte zero to our pipe */
> +            exit(len == 1 && status == 0 ? 0 : 1);
> 
> See the result at http://git.corpit.ru/?p=qemu.git;a=shortlog;h=refs/heads/trivial-patches-next
> 
> Thanks,
> 
> /mjt




