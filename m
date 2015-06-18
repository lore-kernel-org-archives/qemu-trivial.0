Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z5Vlp-0002sE-Sg
	for mharc-qemu-trivial@gnu.org; Thu, 18 Jun 2015 05:06:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36591)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z5Vlm-0002p0-45
	for qemu-trivial@nongnu.org; Thu, 18 Jun 2015 05:05:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z5Vlk-0006dZ-V3
	for qemu-trivial@nongnu.org; Thu, 18 Jun 2015 05:05:57 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:33037)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Z5Vlf-0006ZH-HF; Thu, 18 Jun 2015 05:05:51 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 7A8384183B;
	Thu, 18 Jun 2015 12:05:50 +0300 (MSK)
Message-ID: <558289EE.3020707@msgid.tls.msk.ru>
Date: Thu, 18 Jun 2015 12:05:50 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>
References: <1433258768-28946-1-git-send-email-berrange@redhat.com>	<5581CDB3.2030300@msgid.tls.msk.ru>
	<87k2v14dlv.fsf@blackfin.pond.sub.org>
In-Reply-To: <87k2v14dlv.fsf@blackfin.pond.sub.org>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, "Daniel P. Berrange" <berrange@redhat.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Add .dir-locals.el file to
 configure emacs coding style
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
X-List-Received-Date: Thu, 18 Jun 2015 09:05:59 -0000

18.06.2015 11:36, Markus Armbruster wrote:
> Michael Tokarev <mjt@tls.msk.ru> writes:
> 
>> So, what is the consensus here?
>>
>> Everyone who talked wants the emacs mode, but everyone
>> offers their own mode.
>>
>> I'd pick the stroustrup variant suggested by Marcus
>> since it is shortest, but while being shortest, it
>> is looks a bit "magical".
> 
> I don't think it's magical at all.  It uses .dir-locals exactly as
> intended.  In fact, it's almost straight from the Emacs manual:

No, I mean the one-line "stroustrup" definition is a bit "magical"
as it "magically" have all parameters behind the scenes matching
our coding style, as opposed to listing every aspect explicitly.

[]
> Want me to post a formal patch adding my revised .dir-locals.el?

Daniel already posted his 2-line V2.  It might be good
idea to add indent-tabs-mod nil to other modes too.

At any rate I'm *far* from emacs expert (even if it was my
only editor and development environment for about 10 years,
I forgot almost everything already).

Thanks,

/mjt

