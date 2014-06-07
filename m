Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WtJCS-0001hi-Hn
	for mharc-qemu-trivial@gnu.org; Sat, 07 Jun 2014 12:10:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52317)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1WtJCM-0001eb-HS
	for qemu-trivial@nongnu.org; Sat, 07 Jun 2014 12:10:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1WtJCH-00053b-Vj
	for qemu-trivial@nongnu.org; Sat, 07 Jun 2014 12:10:26 -0400
Received: from v220110690675601.yourvserver.net ([37.221.199.173]:54581)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1WtJC8-00052n-N8; Sat, 07 Jun 2014 12:10:12 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	3E8D11180F97; Sat,  7 Jun 2014 18:10:11 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id KTkDG7w89Hpr; Sat,  7 Jun 2014 18:10:09 +0200 (CEST)
Received: from [192.168.178.35] (p54ACAC90.dip0.t-ipconnect.de
	[84.172.172.144])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	EEED11180A74; Sat,  7 Jun 2014 18:10:08 +0200 (CEST)
Message-ID: <53933960.5070502@weilnetz.de>
Date: Sat, 07 Jun 2014 18:10:08 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1402155757-24977-1-git-send-email-sw@weilnetz.de>
	<CAFEAcA9-80+p74U8-u_NTeDA5tzLYZFaXWMJZn8VcSBHWfc-GA@mail.gmail.com>
In-Reply-To: <CAFEAcA9-80+p74U8-u_NTeDA5tzLYZFaXWMJZn8VcSBHWfc-GA@mail.gmail.com>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 37.221.199.173
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] checkpatch: Check *.cc files and allow
 C99 comments for C++ code
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
X-List-Received-Date: Sat, 07 Jun 2014 16:10:31 -0000

Am 07.06.2014 17:58, schrieb Peter Maydell:
> On 7 June 2014 16:42, Stefan Weil <sw@weilnetz.de> wrote:
>> QEMU uses both *.cc and *.cpp for some files with C++ code:
>>
>> disas/libvixl/utils.cc
>> disas/libvixl/a64/disasm-a64.cc
>> disas/libvixl/a64/instructions-a64.cc
>> disas/libvixl/a64/decoder-a64.cc
>> disas/arm-a64.cc
>> qga/vss-win32/provider.cpp
>> qga/vss-win32/install.cpp
>> qga/vss-win32/requester.cpp
>>
>> *.cpp files were already checked. Add the cc pattern, so *.cc are checked
>> now, too.
> 
> Note that there's not much point in checking libvixl's .cc files,
> because we're only going to change these for (a) updates
> to new upstream versions and (b) fixes for serious issues
> that can't wait for a new upstream version; they're never
> going to match our coding style.
> 
> thanks
> -- PMM
> 

disas/arm-a64.cc is purely QEMU code and should use the QEMU coding
style. For Linux header files, libvixl and other imported code, people
usually know how they have to handle them. My own patch also fails when
it is checked with checkpatch.pl: it uses tabs, and some lines are too
long. It's also imported code...

Stefan


