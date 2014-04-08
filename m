Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WXUg1-0002AU-4y
	for mharc-qemu-trivial@gnu.org; Tue, 08 Apr 2014 07:58:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51801)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WXUfv-00023U-Jp
	for qemu-trivial@nongnu.org; Tue, 08 Apr 2014 07:58:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WXUfr-0001Pu-13
	for qemu-trivial@nongnu.org; Tue, 08 Apr 2014 07:58:47 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:43300)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WXUfi-0001Mu-2V; Tue, 08 Apr 2014 07:58:34 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 942BB40F0C;
	Tue,  8 Apr 2014 15:58:31 +0400 (MSK)
Received: from wh.tls.msk.ru (wh.tls.msk.ru [192.168.177.7])
	by tsrv.corpit.ru (Postfix) with ESMTP id 61B616AB;
	Tue,  8 Apr 2014 15:58:31 +0400 (MSK)
Message-ID: <5343E467.2060008@msgid.tls.msk.ru>
Date: Tue, 08 Apr 2014 15:58:31 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>
References: <1396940651-10513-1-git-send-email-mjt@msgid.tls.msk.ru>
	<CAFEAcA941ST_y3k3b5UjTZeKP220WnZE0Bp2Lok4czw58T74_A@mail.gmail.com>
	<5343B8CB.9050700@msgid.tls.msk.ru>
	<CAFEAcA9xr+fyjACcvn7N=dMdMmsm6j++Vosqz1XZmzr125WqoQ@mail.gmail.com>
	<87fvlot7fx.fsf@blackfin.pond.sub.org>
In-Reply-To: <87fvlot7fx.fsf@blackfin.pond.sub.org>
X-Enigmail-Version: 1.5.1
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>,
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
X-List-Received-Date: Tue, 08 Apr 2014 11:58:52 -0000

08.04.2014 14:57, Markus Armbruster wrote:
> Peter Maydell <peter.maydell@linaro.org> writes:
> 
>> On 8 April 2014 09:52, Michael Tokarev <mjt@tls.msk.ru> wrote:
>>> Well.  At least one of them is entirely safe (hw/ide/ahci.c).
>>> Another - xbzrle.c - looks okay, and even maybe fixing a bug.
>>> And this int128 thing is okay too, except that the whole thing
>>> is questionable as has been mentioned in that thread.
>>>
>>> I can prepare another pull request without xbzrle and int128 changes,
>>> or even without ahci change too, but I'm not sure it is worth the
>>> effort - I think everything is okay to go.  I'll take your word for this.
>>
>> Well, anything that goes in today is going to get at best two
>> days of being tested before the release. To me that argues
>> fairly strongly for not putting anything in unless it is
>> fixing a genuine bug.
> 
> Seconded.

-trivial does not fix bugs.  Only documentation bugs, which does
not met the above definition.

So no -trivial patches for 2.0 anymore.

Thanks,

/mjt

