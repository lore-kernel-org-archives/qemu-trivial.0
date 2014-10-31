Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XkE0U-0000Qg-TT
	for mharc-qemu-trivial@gnu.org; Fri, 31 Oct 2014 11:20:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44044)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XkDzG-0005ea-Jp
	for qemu-trivial@nongnu.org; Fri, 31 Oct 2014 11:20:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Xk1Fz-00072t-EZ
	for qemu-trivial@nongnu.org; Thu, 30 Oct 2014 21:44:09 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:53491)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1Xk1Fx-0006vy-Np; Thu, 30 Oct 2014 21:44:03 -0400
Received: from 172.24.2.119 (EHLO szxeml462-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id AWJ75729; Fri, 31 Oct 2014 09:43:56 +0800 (CST)
Received: from [127.0.0.1] (10.177.19.102) by szxeml462-hub.china.huawei.com
	(10.82.67.205) with Microsoft SMTP Server id 14.3.158.1;
	Fri, 31 Oct 2014 09:43:46 +0800
Message-ID: <5452E943.1050303@huawei.com>
Date: Fri, 31 Oct 2014 09:43:31 +0800
From: Gonglei <arei.gonglei@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1414648877-13788-1-git-send-email-arei.gonglei@huawei.com>
	<87a94e6ni4.fsf@blackfin.pond.sub.org>
	<54524324.9070202@msgid.tls.msk.ru>
In-Reply-To: <54524324.9070202@msgid.tls.msk.ru>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020201.5452E95D.0008, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 3147b0cfa0aac1f389ca5aba9b5e1b64
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
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
X-List-Received-Date: Fri, 31 Oct 2014 15:20:53 -0000

On 2014/10/30 21:54, Michael Tokarev wrote:

> So I'm applying this -- which is your patch and your commit message, and
> I really wonder why this is Reviewed-by and not Signed-off-by, with your
> authorship?  It really should be...

Yes, maybe it should be. But I have to say something:
First, I posted a patch fix the fd leak problem. Markus reviewed it and gave
his reviewing comments which I think is better, and then I posted
the version 2 with Markus' suggestion. As your meaning, I should add the
Signed-off-by tag of Markus? But for me, I don't get Markus' authorization,
so I can't do this, and maybe he have other comments for version 2.

Best regards,
-Gonglei


