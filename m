Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XPpS0-0001wN-OV
	for mharc-qemu-trivial@gnu.org; Fri, 05 Sep 2014 05:05:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49599)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1XPpRu-0001mc-32
	for qemu-trivial@nongnu.org; Fri, 05 Sep 2014 05:04:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1XPpRp-0005Ux-21
	for qemu-trivial@nongnu.org; Fri, 05 Sep 2014 05:04:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50774)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1XPpRe-0005B3-Nc; Fri, 05 Sep 2014 05:04:38 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s8594TQa024152
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Fri, 5 Sep 2014 05:04:29 -0400
Received: from blackfin.pond.sub.org (ovpn-116-61.ams2.redhat.com
	[10.36.116.61])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s8594ROP024053
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 5 Sep 2014 05:04:28 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id C6CC4305B4C8; Fri,  5 Sep 2014 11:04:26 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Li Liu <john.liuli@huawei.com>
References: <1409115651-3612-1-git-send-email-john.liuli@huawei.com>
	<87iolefn36.fsf@blackfin.pond.sub.org> <53FD8B7D.7030301@huawei.com>
	<54091432.4050904@huawei.com>
Date: Fri, 05 Sep 2014 11:04:26 +0200
In-Reply-To: <54091432.4050904@huawei.com> (Li Liu's message of "Fri, 5 Sep
	2014 09:38:58 +0800")
Message-ID: <87bnqujv51.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>
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
X-List-Received-Date: Fri, 05 Sep 2014 09:04:59 -0000

Li Liu <john.liuli@huawei.com> writes:

> Ping, any more comments? Thanks.

I'd like to hear Gerd's opinion (cc'ed).

> On 2014/8/27 15:40, Li Liu wrote:
>> 
>> 
>> On 2014/8/27 14:44, Markus Armbruster wrote:
>>> "john.liuli" <john.liuli@huawei.com> writes:
>>>
>>>> From: Li Liu <john.liuli@huawei.com>
>>>>
>>>> Eeay to reproduce, just try "qemu -monitor stdio -nographic"
>>>> and type "quit", then the terminal will be crashed.
>>>>
>>>> There are two pathes try to call tcgetattr of stdio in vl.c:
>>>>
>>>> 1) Monitor_parse(optarg, "readline");
>>>>    .....
>>>>    qemu_opts_foreach(qemu_find_opts("chardev"),
>>>>                      chardev_init_func, NULL, 1) != 0)
>>>>
>>>> 2) if (default_serial)
>>>>    add_device_config(DEV_SERIAL, "stdio");
>>>>    ....
>>>>    if (foreach_device_config(DEV_SERIAL, serial_parse) < 0)
>>>>
>>>> Both of them will trigger qemu_chr_open_stdio which will disable
>>>> ECHO attributes. First one has updated the attributes of stdio
>>>> by calling qemu_chr_fe_set_echo(chr, false). And the tty
>>>> attributes has been saved in oldtty. Then the second path will
>>>> redo such actions, and the oldtty is overlapped. So till "quit",
>>>> term_exit can't recove the correct attributes.
>>>>
>>>> Signed-off-by: Li Liu <john.liuli@huawei.com>
>>>
>>> Yes, failure to restore tty settings is a bug.
>>>
>>> But is having multiple character devices use the same terminal valid?
>> 
>> I'm not sure. But I have found such comments in vl.c
>> "According to documentation and historically, -nographic redirects
>> serial port, parallel port and monitor to stdio"
>> 
>> Best regards
>> Li.
>> 
>>> If no, can we catch and reject the attempt?
>>>
>>> [...]

