Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YcGiT-0000TI-VC
	for mharc-qemu-trivial@gnu.org; Sun, 29 Mar 2015 13:09:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47231)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YcGiR-0000Ra-SD
	for qemu-trivial@nongnu.org; Sun, 29 Mar 2015 13:09:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YcGiR-0006Qh-5t
	for qemu-trivial@nongnu.org; Sun, 29 Mar 2015 13:09:39 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:51705)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YcGiM-0006Ix-3O; Sun, 29 Mar 2015 13:09:34 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 50D4E42982;
	Sun, 29 Mar 2015 20:09:25 +0300 (MSK)
Message-ID: <551831C5.5020807@msgid.tls.msk.ru>
Date: Sun, 29 Mar 2015 20:09:25 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.5.0
MIME-Version: 1.0
To: Gonglei <arei.gonglei@huawei.com>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <1425524720-11376-1-git-send-email-arei.gonglei@huawei.com>	<5507D480.1000505@huawei.com>	<55161404.4000404@huawei.com>
	<CAJy5ezrFVPCC1VCbvVVYYTEgx2v__AicWFUme_yh2ikuB0wOEg@mail.gmail.com>
	<55165C4A.5080800@huawei.com>
In-Reply-To: <55165C4A.5080800@huawei.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
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
X-List-Received-Date: Sun, 29 Mar 2015 17:09:40 -0000

28.03.2015 10:46, Gonglei wrote:
[]
>> Can this go through -trivial?
>>
> It's ok, but I don't know if -trivial branch maintainer has a plan to send a pull request
> for rc2.

I do have plan to send a pull request, but this thing is ugly.  The
original code is ugly, and your patch does not make it better.  I
wanted to make some changes myself but didn't find fime for that.

Ofcourse it is okay to apply your change to plug the leak, but..
oh well... :(  And if we do, we'll sure forget about that completely.
Now at least you're pinging me from time to time... ;))

Thanks,

/mjt


