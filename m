Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XluiS-0003C0-42
	for mharc-qemu-trivial@gnu.org; Wed, 05 Nov 2014 02:09:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53038)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XluiG-0002wf-FL
	for qemu-trivial@nongnu.org; Wed, 05 Nov 2014 02:09:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XluiA-000886-63
	for qemu-trivial@nongnu.org; Wed, 05 Nov 2014 02:09:04 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:55846)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Xluhx-00086B-Bn; Wed, 05 Nov 2014 02:08:45 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 99FBC40A79;
	Wed,  5 Nov 2014 10:08:44 +0300 (MSK)
Message-ID: <5459CCFC.6090702@msgid.tls.msk.ru>
Date: Wed, 05 Nov 2014 10:08:44 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.2.0
MIME-Version: 1.0
To: zhanghailiang <zhang.zhanghailiang@huawei.com>, 
 qemu-trivial@nongnu.org
References: <1415098223-32404-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<1415098223-32404-4-git-send-email-zhang.zhanghailiang@huawei.com>
In-Reply-To: <1415098223-32404-4-git-send-email-zhang.zhanghailiang@huawei.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: eblake@redhat.com, peter.huangpeng@huawei.com, kraxel@redhat.com,
	armbru@redhat.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v3 3/5] qemu-char: fix incorrect state in
 error message
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
X-List-Received-Date: Wed, 05 Nov 2014 07:09:10 -0000

04.11.2014 13:50, zhanghailiang wrote
> It is either "Failed _to_ do something", or "something failed",
> but not "failed something".

Um.  Heh.  I was afraid of seeing this ;)

My comment about bad grammar was in context of changing error
reporting in this area -- so while chaning error API in use,
it might be a good idea to reword the obviously wrong error
messages _too_, on the same line..

I'll fold this to the next patch, so not to resend whole thing
again.  Oh well ;)

The error messages aren't nice still, but maybe it will be
more clean and easier to understand from the context provided
by the error api.

Thanks,

/mjt



