Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VKlqh-0001Ac-Hy
	for mharc-qemu-trivial@gnu.org; Sat, 14 Sep 2013 05:09:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39449)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VKlqZ-0000tI-05
	for qemu-trivial@nongnu.org; Sat, 14 Sep 2013 05:09:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VKlqR-00056e-4x
	for qemu-trivial@nongnu.org; Sat, 14 Sep 2013 05:08:54 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:41443)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VKlps-0004t2-3Z; Sat, 14 Sep 2013 05:08:12 -0400
Received: from gandalf.local (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 2040741074;
	Sat, 14 Sep 2013 13:08:11 +0400 (MSK)
Message-ID: <5234277B.9030809@msgid.tls.msk.ru>
Date: Sat, 14 Sep 2013 13:08:11 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130827 Icedove/17.0.8
MIME-Version: 1.0
To: Stefan Hajnoczi <stefanha@gmail.com>
References: <5230F7D1.9090009@twiddle.net>
	<20130912085155.GH1965@stefanha-thinkpad.redhat.com>
In-Reply-To: <20130912085155.GH1965@stefanha-thinkpad.redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Wenchao Xia <xiawenc@linux.vnet.ibm.com>,
	qemu-devel <qemu-devel@nongnu.org>, Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [Qemu-devel] Ping
	http://patchwork.ozlabs.org/patch/251410/
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
X-List-Received-Date: Sat, 14 Sep 2013 09:09:02 -0000

12.09.2013 12:51, Stefan Hajnoczi =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> On Wed, Sep 11, 2013 at 04:08:01PM -0700, Richard Henderson wrote:
>> There have been two patches posted for this uninitialized warning, out=
standing
>> since June 14.  I still encounter this daily...
>
> I'm still happy with the patch.
>
> Michael: Do you want to take this through the trivial patches tree?

Yes it looks like a trivial patch, but it has at least 2 issues:

  1) it does 2 different things in one patch
    (one for vscclient and one for iov)

  2) the subject line is too generic.

On the other hand, asking for a V4 for such a trivial thing is a bit
too much, in my opinion.

So - since by applying to -trivial I'm adding my S-o-b anyway - I'll
split it into two patches and fix $subject.

Thanks, applied to the trivial-patches queue.

/mjt

