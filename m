Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XluTM-0001nG-6e
	for mharc-qemu-trivial@gnu.org; Wed, 05 Nov 2014 01:53:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50519)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XluTE-0001eG-EJ
	for qemu-trivial@nongnu.org; Wed, 05 Nov 2014 01:53:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XluT9-00031m-Ji
	for qemu-trivial@nongnu.org; Wed, 05 Nov 2014 01:53:32 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:50158)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XluSz-0002yD-4q; Wed, 05 Nov 2014 01:53:17 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id E0FD140A6B;
	Wed,  5 Nov 2014 09:53:07 +0300 (MSK)
Message-ID: <5459C953.7020802@msgid.tls.msk.ru>
Date: Wed, 05 Nov 2014 09:53:07 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.2.0
MIME-Version: 1.0
To: Eric Blake <eblake@redhat.com>, arei.gonglei@huawei.com, 
	qemu-devel@nongnu.org
References: <1415018910-11600-1-git-send-email-arei.gonglei@huawei.com>
	<5458D57C.9030700@redhat.com>
In-Reply-To: <5458D57C.9030700@redhat.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-doc.texi: fix typos
	for x509 examples
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
X-List-Received-Date: Wed, 05 Nov 2014 06:53:37 -0000

04.11.2014 16:32, Eric Blake wrote:
> On 11/03/2014 01:48 PM, arei.gonglei@huawei.com wrote:
>> From: Gonglei <arei.gonglei@huawei.com>
>>
>> Fix typos made people confuesd:
> 
> Spelling:
> s/confuesd/confused/
> 
> Grammar: would read better as:
> 
> Fix typos that caused confusion for some people:

I just removed whole commit message (besides the subject
line), because the patch is self-explanatory anyway.
Hopefully it's okay.. ;)

Thanks,

/mjt

