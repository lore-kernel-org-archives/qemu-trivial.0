Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zk82m-00008k-1n
	for mharc-qemu-trivial@gnu.org; Thu, 08 Oct 2015 06:03:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35671)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Zj034-0006Sb-O3
	for qemu-trivial@nongnu.org; Mon, 05 Oct 2015 03:19:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Zj033-0006F7-TT
	for qemu-trivial@nongnu.org; Mon, 05 Oct 2015 03:19:02 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:60622)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Zj02z-00065T-Fa; Mon, 05 Oct 2015 03:18:57 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id DD08D4044C;
	Mon,  5 Oct 2015 10:18:47 +0300 (MSK)
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id C8C1EA68;
	Mon,  5 Oct 2015 10:18:47 +0300 (MSK)
Message-ID: <56122457.4060903@msgid.tls.msk.ru>
Date: Mon, 05 Oct 2015 10:18:47 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>
References: <1443170278-9318-1-git-send-email-shraddha.6596@gmail.com>	<56100743.4010604@msgid.tls.msk.ru>
	<87d1wtao6l.fsf@blackfin.pond.sub.org>
In-Reply-To: <87d1wtao6l.fsf@blackfin.pond.sub.org>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Shraddha Barke <shraddha.6596@gmail.com>, kvm@vger.kernel.org,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH 1/3] Target-microblaze: Remove
	unnecessary variable
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
X-List-Received-Date: Mon, 05 Oct 2015 07:19:03 -0000

05.10.2015 08:18, Markus Armbruster wrote:
> Michael Tokarev <mjt@tls.msk.ru> writes:
> 
>> 25.09.2015 11:37, Shraddha Barke wrote:
>>> Compress lines and remove the variable .
>>
>> Applied to -trivial, removing this piece of commit message:
>>
>> ---
>>> Change made using Coccinelle script
[..snip..]
>> ---
> 
> Why?  I like having the semantic patch in the commit message when
> there's any chance we'll want do the same mechanical change again later.
> 
> You could save space and include it by reference, though: "Same
> Coccinelle semantic patch as is commit 74c373e".

git commit messages aren't good documentation for various scripts
like this, this info will be lost in the noize.  If it might be
better to keep such scripts in a separate file where it is easier
to find, or in a wiki page on the site. The key point is where to
find the info, git log is difficult for that, especially when you
don't know what to search for or that such a script exists in
there in the first place.

On the other hand, when git log is cluttered by such a long messages
for such small changes, it becomes more difficult to find info which
you really look in git log -- namely, which changes were made that
might have introduced this regression, things like that.

So to me, the shorter and cleaner the commit message is, the better.

BTW, I've no idea why this email has been Cc'd to kvm@vger :)

Thanks,

/mjt

