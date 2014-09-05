Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XPiV0-0003R7-Ni
	for mharc-qemu-trivial@gnu.org; Thu, 04 Sep 2014 21:39:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48076)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <john.liuli@huawei.com>) id 1XPiUu-0003JB-0w
	for qemu-trivial@nongnu.org; Thu, 04 Sep 2014 21:39:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <john.liuli@huawei.com>) id 1XPiUo-0000pJ-UT
	for qemu-trivial@nongnu.org; Thu, 04 Sep 2014 21:39:31 -0400
Received: from szxga01-in.huawei.com ([119.145.14.64]:48921)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <john.liuli@huawei.com>)
	id 1XPiUe-0000gY-MB; Thu, 04 Sep 2014 21:39:17 -0400
Received: from 172.24.2.119 (EHLO SZXEML414-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CBG33942; Fri, 05 Sep 2014 09:39:08 +0800 (CST)
Received: from [127.0.0.1] (10.142.143.9) by SZXEML414-HUB.china.huawei.com
	(10.82.67.153) with Microsoft SMTP Server id 14.3.158.1; Fri, 5 Sep 2014
	09:39:05 +0800
Message-ID: <54091432.4050904@huawei.com>
Date: Fri, 5 Sep 2014 09:38:58 +0800
From: Li Liu <john.liuli@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>
References: <1409115651-3612-1-git-send-email-john.liuli@huawei.com>	<87iolefn36.fsf@blackfin.pond.sub.org>
	<53FD8B7D.7030301@huawei.com>
In-Reply-To: <53FD8B7D.7030301@huawei.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.142.143.9]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-char: fix terminal
 crash when using "-monitor stdio -nographic"
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
X-List-Received-Date: Fri, 05 Sep 2014 01:39:36 -0000

Ping, any more comments? Thanks.

On 2014/8/27 15:40, Li Liu wrote:
> 
> 
> On 2014/8/27 14:44, Markus Armbruster wrote:
>> "john.liuli" <john.liuli@huawei.com> writes:
>>
>>> From: Li Liu <john.liuli@huawei.com>
>>>
>>> Eeay to reproduce, just try "qemu -monitor stdio -nographic"
>>> and type "quit", then the terminal will be crashed.
>>>
>>> There are two pathes try to call tcgetattr of stdio in vl.c:
>>>
>>> 1) Monitor_parse(optarg, "readline");
>>>    .....
>>>    qemu_opts_foreach(qemu_find_opts("chardev"),
>>>                      chardev_init_func, NULL, 1) != 0)
>>>
>>> 2) if (default_serial)
>>>    add_device_config(DEV_SERIAL, "stdio");
>>>    ....
>>>    if (foreach_device_config(DEV_SERIAL, serial_parse) < 0)
>>>
>>> Both of them will trigger qemu_chr_open_stdio which will disable
>>> ECHO attributes. First one has updated the attributes of stdio
>>> by calling qemu_chr_fe_set_echo(chr, false). And the tty
>>> attributes has been saved in oldtty. Then the second path will
>>> redo such actions, and the oldtty is overlapped. So till "quit",
>>> term_exit can't recove the correct attributes.
>>>
>>> Signed-off-by: Li Liu <john.liuli@huawei.com>
>>
>> Yes, failure to restore tty settings is a bug.
>>
>> But is having multiple character devices use the same terminal valid?
> 
> I'm not sure. But I have found such comments in vl.c
> "According to documentation and historically, -nographic redirects
> serial port, parallel port and monitor to stdio"
> 
> Best regards
> Li.
> 
>> If no, can we catch and reject the attempt?
>>
>> [...]
>>
>>
> 
> 
> 
> 


