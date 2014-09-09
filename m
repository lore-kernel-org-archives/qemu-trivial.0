Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XRB5C-0001Dq-Dj
	for mharc-qemu-trivial@gnu.org; Mon, 08 Sep 2014 22:23:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55226)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <john.liuli@huawei.com>) id 1XRB56-0001DZ-BS
	for qemu-trivial@nongnu.org; Mon, 08 Sep 2014 22:23:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <john.liuli@huawei.com>) id 1XRB51-0002uQ-8B
	for qemu-trivial@nongnu.org; Mon, 08 Sep 2014 22:22:56 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:3585)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <john.liuli@huawei.com>)
	id 1XRB50-0002oG-L0; Mon, 08 Sep 2014 22:22:51 -0400
Received: from 172.24.2.119 (EHLO szxeml463-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id BZE91954; Tue, 09 Sep 2014 10:22:41 +0800 (CST)
Received: from [127.0.0.1] (10.142.143.9) by szxeml463-hub.china.huawei.com
	(10.82.67.206) with Microsoft SMTP Server id 14.3.158.1; Tue, 9 Sep 2014
	10:22:38 +0800
Message-ID: <540E6462.4060300@huawei.com>
Date: Tue, 9 Sep 2014 10:22:26 +0800
From: Li Liu <john.liuli@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <1409115651-3612-1-git-send-email-john.liuli@huawei.com>	
	<87iolefn36.fsf@blackfin.pond.sub.org>
	<53FD8B7D.7030301@huawei.com>	 <54091432.4050904@huawei.com>
	<87bnqujv51.fsf@blackfin.pond.sub.org>
	<1409909497.20018.9.camel@nilsson.home.kraxel.org>
In-Reply-To: <1409909497.20018.9.camel@nilsson.home.kraxel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.142.143.9]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
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
X-List-Received-Date: Tue, 09 Sep 2014 02:23:01 -0000



On 2014/9/5 17:31, Gerd Hoffmann wrote:
> On Fr, 2014-09-05 at 11:04 +0200, Markus Armbruster wrote:
>> Li Liu <john.liuli@huawei.com> writes:
>>
>>> Ping, any more comments? Thanks.
>>
>> I'd like to hear Gerd's opinion (cc'ed).
>>
>>>>> But is having multiple character devices use the same terminal valid?
> 
> No (guess we should catch that case in stdio init).
> 
> Beside the tty initialization and cleanup you also have the problem that
> both users are racing for input.  Well, maybe not in the qemu case as it
> is the same process and it very well might be that it polls the two
> chardevs in a well defined order, so one of them gets all input and the
> other gets nothing.  With two processes reading from the terminal (try
> 'cat | less') it is actually random though.
> 
>>>> I'm not sure. But I have found such comments in vl.c
>>>> "According to documentation and historically, -nographic redirects
>>>> serial port, parallel port and monitor to stdio"
> 
> In that case mux chardev is used (that is the piece which handles the
> input switching between serial and monitor via 'Ctrl-A c').  There is
> one stdio instance, and one mux instance, the mux is chained to stdio,
> and mux allows multiple backends to connect.
> 
> You can construct it on the command line this way:
> 
> qemu -nographic -nodefaults \
>    -chardev stdio,mux=on,id=terminal \
>    -serial chardev:terminal \
>    -monitor chardev:terminal
> 
> [ serial is default, so no output here, unless you boot a guest
>   with serial console configured ]
> 
> [ Hit 'Ctrl-A h' now ]
> 
> C-a h    print this help
> C-a x    exit emulator
> C-a s    save disk data back to file (if -snapshot)
> C-a t    toggle console timestamps
> C-a b    send break (magic sysrq)
> C-a c    switch between console and monitor
> C-a C-a  sends C-a
> 
> [ Hit 'Ctrl-A c' now ]
> 
> QEMU 2.1.50 monitor - type 'help' for more information
> (qemu) info chardev
> terminal: filename=mux
> terminal-base: filename=stdio
> (qemu) 
> 
> HTH,
>   Gerd
> 

Appreciate your detailed answer. Thank you very much.

Li.

> 
> 
> .
> 


