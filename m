Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XkDt5-0005bH-Kk
	for mharc-qemu-trivial@gnu.org; Fri, 31 Oct 2014 11:13:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42685)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XkDs0-0003aK-Ak
	for qemu-trivial@nongnu.org; Fri, 31 Oct 2014 11:13:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Xk6pT-0006ur-WA
	for qemu-trivial@nongnu.org; Fri, 31 Oct 2014 03:41:11 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:38545)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1Xk6pT-0006tx-9s; Fri, 31 Oct 2014 03:41:03 -0400
Received: from 172.24.2.119 (EHLO SZXEML458-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CBQ19971; Fri, 31 Oct 2014 15:40:58 +0800 (CST)
Received: from [127.0.0.1] (10.177.19.102) by SZXEML458-HUB.china.huawei.com
	(10.82.67.201) with Microsoft SMTP Server id 14.3.158.1;
	Fri, 31 Oct 2014 15:40:49 +0800
Message-ID: <54533CEE.8070408@huawei.com>
Date: Fri, 31 Oct 2014 15:40:30 +0800
From: Gonglei <arei.gonglei@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1414648877-13788-1-git-send-email-arei.gonglei@huawei.com>
	<87a94e6ni4.fsf@blackfin.pond.sub.org>
	<54524324.9070202@msgid.tls.msk.ru> <5452E943.1050303@huawei.com>
	<545337DB.4090505@msgid.tls.msk.ru>
In-Reply-To: <545337DB.4090505@msgid.tls.msk.ru>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	"Huangpeng \(Peter\)" <peter.huangpeng@huawei.com>,
	"lcapitulino@redhat.com" <lcapitulino@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] dump: fix use-after-free
 for s->fd
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
X-List-Received-Date: Fri, 31 Oct 2014 15:13:14 -0000

On 2014/10/31 15:18, Michael Tokarev wrote:

> 31.10.2014 04:43, Gonglei wrote:
>> On 2014/10/30 21:54, Michael Tokarev wrote:
>>
>>> So I'm applying this -- which is your patch and your commit message, and
>>> I really wonder why this is Reviewed-by and not Signed-off-by, with your
>>> authorship?  It really should be...
>>
>> Yes, maybe it should be. But I have to say something:
>> First, I posted a patch fix the fd leak problem. Markus reviewed it and gave
>> his reviewing comments which I think is better, and then I posted
>> the version 2 with Markus' suggestion. As your meaning, I should add the
>> Signed-off-by tag of Markus? But for me, I don't get Markus' authorization,
>> so I can't do this, and maybe he have other comments for version 2.
> 
> Um.  I didn't want to offend you in any way.  I was just pointing out that
> it was actually Marcus who did the rest of the work, besides discovering the
> original problem.  Again, it is both his change and his commit message...
> 
> Let's agree to have Signed-off-by from both of you ;)

Yes, of course.

Best regards,
-Gonglei


