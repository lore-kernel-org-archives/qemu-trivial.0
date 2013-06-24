Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ur25I-0004UL-QO
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jun 2013 04:25:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35343)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Ur25G-0004Q0-4d
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 04:25:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Ur25E-0008BO-Uu
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 04:25:10 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:45288)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Ur256-0007tE-Iw; Mon, 24 Jun 2013 04:25:00 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 0DE274266D;
	Mon, 24 Jun 2013 12:24:59 +0400 (MSK)
Message-ID: <51C80259.5020102@msgid.tls.msk.ru>
Date: Mon, 24 Jun 2013 12:24:57 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/20130529 Icedove/17.0.5
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>
References: <1372055996-4072-1-git-send-email-kraxel@redhat.com>
	<51C7F2B9.6050707@msgid.tls.msk.ru>
	<87a9mgrkm9.fsf@blackfin.pond.sub.org>
In-Reply-To: <87a9mgrkm9.fsf@blackfin.pond.sub.org>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 00/13] A bunch of little
 socket + chardev fixes
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
X-List-Received-Date: Mon, 24 Jun 2013 08:25:11 -0000

24.06.2013 12:14, Markus Armbruster wrote:
> Michael Tokarev <mjt@tls.msk.ru> writes:
[]
>> Thank you Gerd, applied all series to the trivial-patches queue,
>> with two edits:
>>
>>>   qemu-char: use ChardevBackendKind in in CharDriver
>>>   qemu-char: report udb backend errors
>>
>> fxed these :)
> 
> My commit message nitpicks aren't worth a respin.  Perhaps you want to
> fix them in your tree.

I'm not sure I understand what you're saying.  I fixed them
in my tree while applying, and that's exactly what I said --
"applied all..fixed these".  What does not worth what?

Thanks,

/mjt


