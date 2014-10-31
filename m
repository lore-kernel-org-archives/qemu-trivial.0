Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XkDvz-00030q-I1
	for mharc-qemu-trivial@gnu.org; Fri, 31 Oct 2014 11:16:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43880)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XkDsV-0005SF-Kt
	for qemu-trivial@nongnu.org; Fri, 31 Oct 2014 11:16:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xk6UC-00087j-En
	for qemu-trivial@nongnu.org; Fri, 31 Oct 2014 03:19:10 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:48253)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Xk6U5-000876-Vq; Fri, 31 Oct 2014 03:18:58 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 82B3B470FA;
	Fri, 31 Oct 2014 10:18:52 +0300 (MSK)
Message-ID: <545337DB.4090505@msgid.tls.msk.ru>
Date: Fri, 31 Oct 2014 10:18:51 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.8.1
MIME-Version: 1.0
To: Gonglei <arei.gonglei@huawei.com>
References: <1414648877-13788-1-git-send-email-arei.gonglei@huawei.com>
	<87a94e6ni4.fsf@blackfin.pond.sub.org>
	<54524324.9070202@msgid.tls.msk.ru> <5452E943.1050303@huawei.com>
In-Reply-To: <5452E943.1050303@huawei.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
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
X-List-Received-Date: Fri, 31 Oct 2014 15:16:14 -0000

31.10.2014 04:43, Gonglei wrote:
> On 2014/10/30 21:54, Michael Tokarev wrote:
> 
>> So I'm applying this -- which is your patch and your commit message, and
>> I really wonder why this is Reviewed-by and not Signed-off-by, with your
>> authorship?  It really should be...
> 
> Yes, maybe it should be. But I have to say something:
> First, I posted a patch fix the fd leak problem. Markus reviewed it and gave
> his reviewing comments which I think is better, and then I posted
> the version 2 with Markus' suggestion. As your meaning, I should add the
> Signed-off-by tag of Markus? But for me, I don't get Markus' authorization,
> so I can't do this, and maybe he have other comments for version 2.

Um.  I didn't want to offend you in any way.  I was just pointing out that
it was actually Marcus who did the rest of the work, besides discovering the
original problem.  Again, it is both his change and his commit message...

Let's agree to have Signed-off-by from both of you ;)

Thanks,

/mjt

