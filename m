Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XVy9M-0002yO-7u
	for mharc-qemu-trivial@gnu.org; Mon, 22 Sep 2014 03:35:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34278)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XVy9E-0002nQ-PB
	for qemu-trivial@nongnu.org; Mon, 22 Sep 2014 03:35:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XVy99-0000h2-SL
	for qemu-trivial@nongnu.org; Mon, 22 Sep 2014 03:35:00 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:40142)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XVy8y-0000eL-CK; Mon, 22 Sep 2014 03:34:44 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id E5EDE45CD2;
	Mon, 22 Sep 2014 11:34:37 +0400 (MSK)
Received: from wh.tls.msk.ru (wh.tls.msk.ru [192.168.177.7])
	by tsrv.corpit.ru (Postfix) with ESMTP id C1D646B3;
	Mon, 22 Sep 2014 11:34:37 +0400 (MSK)
Message-ID: <541FD10D.8000809@msgid.tls.msk.ru>
Date: Mon, 22 Sep 2014 11:34:37 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.7.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>
References: <1411097848-3900-1-git-send-email-zhang.zhanghailiang@huawei.com>	<541D8812.1040406@msgid.tls.msk.ru>
	<87ppeow4uk.fsf@blackfin.pond.sub.org>
In-Reply-To: <87ppeow4uk.fsf@blackfin.pond.sub.org>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, peter.huangpeng@huawei.com, luonengjun@huawei.com,
	zhanghailiang <zhang.zhanghailiang@huawei.com>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v1] vl: Fix possible freed
 memory accessing
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
X-List-Received-Date: Mon, 22 Sep 2014 07:35:05 -0000

22.09.2014 10:23, Markus Armbruster wrote:
> Michael Tokarev <mjt@tls.msk.ru> writes:
> 
>> Applied to -trivial, thank you!
> 
> Makes my 'hmp: Remove "info pcmcia"' conflict.  Either revert this one
> before applying mine, or resolve the conflict and drop the paragraph
> about the bug from my commit message.

Okay, I'll keep an eye on this -- I'm reverting the trivial patch
for now.

/mjt


