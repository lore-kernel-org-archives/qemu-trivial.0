Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WXRm1-0005nU-5X
	for mharc-qemu-trivial@gnu.org; Tue, 08 Apr 2014 04:52:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39313)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WXRlt-0005fm-86
	for qemu-trivial@nongnu.org; Tue, 08 Apr 2014 04:52:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WXRlo-0006nH-5h
	for qemu-trivial@nongnu.org; Tue, 08 Apr 2014 04:52:45 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:55592)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WXRld-0006m4-LZ; Tue, 08 Apr 2014 04:52:29 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 2489840E7E;
	Tue,  8 Apr 2014 12:52:27 +0400 (MSK)
Message-ID: <5343B8CB.9050700@msgid.tls.msk.ru>
Date: Tue, 08 Apr 2014 12:52:27 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1396940651-10513-1-git-send-email-mjt@msgid.tls.msk.ru>
	<CAFEAcA941ST_y3k3b5UjTZeKP220WnZE0Bp2Lok4czw58T74_A@mail.gmail.com>
In-Reply-To: <CAFEAcA941ST_y3k3b5UjTZeKP220WnZE0Bp2Lok4czw58T74_A@mail.gmail.com>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL for-2.0 00/11] Trivial
	patches for 2014-04-08
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
X-List-Received-Date: Tue, 08 Apr 2014 08:52:50 -0000

08.04.2014 12:10, Peter Maydell wrote:
> On 8 April 2014 08:04, Michael Tokarev <mjt@tls.msk.ru> wrote:
>> And there's a series of 3 patches by Peter Maydell which adds casts
>> to uint* in a few places.  Those are also quite simple and safe, even
>> with quite some disagreement about whenever this is necessary to
>> start with -- I mean the int128 change, the other changes are good.
>> At least this way we make it consistent with other parts of the code.
> 
> I was not expecting those to go in for 2.0...

Well.  At least one of them is entirely safe (hw/ide/ahci.c).
Another - xbzrle.c - looks okay, and even maybe fixing a bug.
And this int128 thing is okay too, except that the whole thing
is questionable as has been mentioned in that thread.

I can prepare another pull request without xbzrle and int128 changes,
or even without ahci change too, but I'm not sure it is worth the
effort - I think everything is okay to go.  I'll take your word for this.

Thanks,

/mjt

