Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YDqJF-0002nA-FE
	for mharc-qemu-trivial@gnu.org; Wed, 21 Jan 2015 03:06:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60193)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YDqJB-0002kZ-V5
	for qemu-trivial@nongnu.org; Wed, 21 Jan 2015 03:06:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YDqJB-00066g-8t
	for qemu-trivial@nongnu.org; Wed, 21 Jan 2015 03:06:37 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:50899)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YDqJ3-000647-9b; Wed, 21 Jan 2015 03:06:29 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 7E23442199;
	Wed, 21 Jan 2015 11:06:28 +0300 (MSK)
Message-ID: <54BF5E04.6090503@msgid.tls.msk.ru>
Date: Wed, 21 Jan 2015 11:06:28 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.3.0
MIME-Version: 1.0
To: Gonglei <arei.gonglei@huawei.com>, Markus Armbruster <armbru@redhat.com>
References: <1415881027-8112-1-git-send-email-arei.gonglei@huawei.com>	<1415881027-8112-2-git-send-email-arei.gonglei@huawei.com>	<87d288kdup.fsf@blackfin.pond.sub.org>
	<54BF5CB9.9070706@huawei.com>
In-Reply-To: <54BF5CB9.9070706@huawei.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"aneesh.kumar@linux.vnet.ibm.com" <aneesh.kumar@linux.vnet.ibm.com>,
	"Huangpeng \(Peter\)" <peter.huangpeng@huawei.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/2] virtfs-proxy-helper:
 Fix possible socket leak.
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
X-List-Received-Date: Wed, 21 Jan 2015 08:06:38 -0000

21.01.2015 11:00, Gonglei wrote:
[]
> Hi, Michael
> 
> I guess Paolo forgot this patch :(
> Maybe this one can be picked up by qemu-trivial. Thanks.

I picked it up and applied to -trivial.
It is not a problem if the same patch will be applied to
several trees at once, so if Paolo will send a pull request
for it together with me it all will work ok.

Thanks,

/mjt

