Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YVLJA-0006fk-ET
	for mharc-qemu-trivial@gnu.org; Tue, 10 Mar 2015 10:38:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53611)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YVLJ4-0006Ys-De
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 10:38:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YVLJ3-0004sL-Fs
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 10:38:50 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:56856)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YVLIo-0004mS-6H; Tue, 10 Mar 2015 10:38:34 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id B98DD413C8;
	Tue, 10 Mar 2015 17:38:32 +0300 (MSK)
Message-ID: <54FF01E8.6040207@msgid.tls.msk.ru>
Date: Tue, 10 Mar 2015 17:38:32 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.5.0
MIME-Version: 1.0
To: Kevin Wolf <kwolf@redhat.com>
References: <1425971164-9845-1-git-send-email-mjt@msgid.tls.msk.ru>
	<20150310085016.GC3770@noname.str.redhat.com>
	<20150310091759.GC14320@ad.nay.redhat.com>
	<20150310100936.GD3770@noname.str.redhat.com>
	<CAJSP0QWk+KzGuR2e6m8KsCUbMqcU6cReQbp2231zf9+Nt8zF9g@mail.gmail.com>
	<54FEF942.5010602@msgid.tls.msk.ru>
	<20150310140751.GG3770@noname.str.redhat.com>
In-Reply-To: <20150310140751.GG3770@noname.str.redhat.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: Fam Zheng <famz@redhat.com>, qemu-block@nongnu.org,
	qemu-trivial <qemu-trivial@nongnu.org>,
	Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>, Peter Wu <peter@lekensteyn.nl>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] block/dmg: make it modular if using
	additional library
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
X-List-Received-Date: Tue, 10 Mar 2015 14:38:54 -0000

10.03.2015 17:07, Kevin Wolf wrote:
> Am 10.03.2015 um 15:01 hat Michael Tokarev geschrieben:
[]
>> That might be useful if module loading will be modified a bit,
>> like by loadin modules on demand only.  Something like this,
>> search a "foo" block driver in the registered list, found ->
>> use it, if not, try to open block-foo.so (maybe after looking
>> in the "available" internal list before that) and look up in
>> the registered list again.
>>
>> That will make it more useful.
> 
> The problem with that would be that format probing wouldn't work any
> more for drivers that aren't loaded yet.

Probing needed -> run the current "load everything" sequence (maybe
limiting stuff being loaded to "block" system when other systems
will be there) before actual probing.  That should fix both worlds.

Alternatively, and this might be even better alternative actually,
the more I think about it, is to have a single probe function
which recognizes all known formats, no matter if the particular
driver is being built or not.  This routine will be significantly
simpler thant the combined "probe" functionality, it might know
much more formats even if a given format is not supported, etc,
So that format probing will be its own code which will trigger
(attempt) to load a detected driver.

Thanks,

/mjt

