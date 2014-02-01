Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W9XDy-00025z-JP
	for mharc-qemu-trivial@gnu.org; Sat, 01 Feb 2014 04:50:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44257)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1W9XDr-0001yu-Ch
	for qemu-trivial@nongnu.org; Sat, 01 Feb 2014 04:50:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1W9XDl-0007Tq-9D
	for qemu-trivial@nongnu.org; Sat, 01 Feb 2014 04:50:47 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:57037)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1W9XDY-0007SH-NF; Sat, 01 Feb 2014 04:50:28 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 04A8E4000F;
	Sat,  1 Feb 2014 13:50:28 +0400 (MSK)
Message-ID: <52ECC363.3090603@msgid.tls.msk.ru>
Date: Sat, 01 Feb 2014 13:50:27 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: David du Colombier <0intro@gmail.com>
References: <1387981063-14880-1-git-send-email-0intro@gmail.com>
	<52D6B40D.8080009@msgid.tls.msk.ru>
In-Reply-To: <52D6B40D.8080009@msgid.tls.msk.ru>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] ide: cmd_exec_dev_diagnostic() always
 set error register to 0x01
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
X-List-Received-Date: Sat, 01 Feb 2014 09:50:53 -0000

15.01.2014 20:15, Michael Tokarev wrote:
> 25.12.2013 18:17, David du Colombier wrote:
>> This notably fix IDE CD probing on the Plan 9 operating system,
>> which rely on the error register set by the Execute Device
>> Diagnostic command to detect drive configurations.
> 
> While this is a one-liner, I'm not sure it is "trivial enough", just because
> it is not at all obvious we shuold clear error here and not somewhere else.
> I mean, shouldn't s->error be cleared somewhere when next request is queued,
> or something like that?
> 
> That's basically why I haven't applied this initially.
> 
> CC'ing qemu-devel.

I've applied this to qemu-trivial 3 weeks ago, and now this change has been
applied to the master branch, -- still without any additional comments, which
is somewhat troubling me, but here we go.

Thanks,

/mjt

