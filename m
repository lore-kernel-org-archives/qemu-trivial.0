Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yn1s5-0008Mo-NR
	for mharc-qemu-trivial@gnu.org; Tue, 28 Apr 2015 05:32:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46834)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Yn1s3-0008Mc-Ls
	for qemu-trivial@nongnu.org; Tue, 28 Apr 2015 05:32:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Yn1s0-0000gN-Bg
	for qemu-trivial@nongnu.org; Tue, 28 Apr 2015 05:32:03 -0400
Received: from szxga01-in.huawei.com ([58.251.152.64]:56441)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1Yn1rz-0000fl-Ld; Tue, 28 Apr 2015 05:32:00 -0400
Received: from 172.24.2.119 (EHLO szxeml434-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CMW67589; Tue, 28 Apr 2015 17:28:34 +0800 (CST)
Received: from [127.0.0.1] (10.177.19.102) by szxeml434-hub.china.huawei.com
	(10.82.67.225) with Microsoft SMTP Server id 14.3.158.1;
	Tue, 28 Apr 2015 17:27:13 +0800
Message-ID: <553F5281.2080006@huawei.com>
Date: Tue, 28 Apr 2015 17:27:29 +0800
From: Gonglei <arei.gonglei@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>, "Edgar E. Iglesias"
	<edgar.iglesias@gmail.com>
References: <1425524720-11376-1-git-send-email-arei.gonglei@huawei.com>	<5507D480.1000505@huawei.com>	<55161404.4000404@huawei.com>
	<CAJy5ezrFVPCC1VCbvVVYYTEgx2v__AicWFUme_yh2ikuB0wOEg@mail.gmail.com>
	<55165C4A.5080800@huawei.com> <551831C5.5020807@msgid.tls.msk.ru>
In-Reply-To: <551831C5.5020807@msgid.tls.msk.ru>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 58.251.152.64
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org, "pbonzini@redhat.com" <pbonzini@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH v2] microblaze: fix memory leak
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
X-List-Received-Date: Tue, 28 Apr 2015 09:32:04 -0000

On 2015/3/30 1:09, Michael Tokarev wrote:
> 28.03.2015 10:46, Gonglei wrote:
> []
>>> Can this go through -trivial?
>>>
>> It's ok, but I don't know if -trivial branch maintainer has a plan to send a pull request
>> for rc2.
> 
> I do have plan to send a pull request, but this thing is ugly.  The
> original code is ugly, and your patch does not make it better.  I
> wanted to make some changes myself but didn't find fime for that.
> 
> Ofcourse it is okay to apply your change to plug the leak, but..
> oh well... :(  And if we do, we'll sure forget about that completely.
> Now at least you're pinging me from time to time... ;))
> 

Maybe you are waiting for my ping, right?  :)
Do you have any time for this leak or code optimization now?

Regards,
-Gonglei



