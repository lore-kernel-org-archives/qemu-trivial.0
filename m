Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bvzmI-00089V-9X
	for mharc-qemu-trivial@gnu.org; Mon, 17 Oct 2016 00:43:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45418)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1bvzmF-00088R-U5
	for qemu-trivial@nongnu.org; Mon, 17 Oct 2016 00:43:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1bvzmF-0003Xn-5m
	for qemu-trivial@nongnu.org; Mon, 17 Oct 2016 00:43:55 -0400
Received: from [2a03:4000:1::4e2f:c7ac:d] (port=34083 helo=mail.weilnetz.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1bvzmB-0003We-0s; Mon, 17 Oct 2016 00:43:51 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by mail.weilnetz.de (Postfix) with ESMTP id 8627011810A6;
	Mon, 17 Oct 2016 06:43:49 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from mail.weilnetz.de ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id Mj74Danm1GJk; Mon, 17 Oct 2016 06:43:47 +0200 (CEST)
Received: from edv32.bib.uni-mannheim.de (p54AC8964.dip0.t-ipconnect.de
	[84.172.137.100])
	by mail.weilnetz.de (Postfix) with ESMTPSA id 3C1A411810A5;
	Mon, 17 Oct 2016 06:43:47 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>, Michael Tokarev <mjt@tls.msk.ru>
References: <1476383370-30650-1-git-send-email-sw@weilnetz.de>
	<9af01992-677a-11d5-e372-fc5e942907be@msgid.tls.msk.ru>
	<CAFEAcA-u-XrxYrb_tCOfk5dHh1j2xpHZek8oRWqWKX-jS5i4uQ@mail.gmail.com>
Cc: QEMU Developer <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>
From: Stefan Weil <sw@weilnetz.de>
Message-ID: <48f03c8d-7697-bcc0-beee-4e8eb10cdcd2@weilnetz.de>
Date: Mon, 17 Oct 2016 06:43:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-u-XrxYrb_tCOfk5dHh1j2xpHZek8oRWqWKX-jS5i4uQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 2a03:4000:1::4e2f:c7ac:d
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Fix build for less common
 build directories names
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Oct 2016 04:43:56 -0000

Am 16.10.2016 um 21:04 schrieb Peter Maydell:
> On 16 October 2016 at 15:31, Michael Tokarev <mjt@tls.msk.ru> wrote:
>> 13.10.2016 21:29, Stefan Weil wrote:
>>> scripts/tracetool generates a C preprocessor macro from the name of the
>>> build directory. Any characters which are possible in a directory name
>>> but not allowed in a macro name must be substituted, otherwise builds
>>> will fail.
>>
>> Applied to -trivial, thank you!
>
> Consensus on this and the other thread seemed to be
> that we should just fix the bug where tracetool is
> putting the build directory name into symbols
> rather than working around that...
>
> thanks
> -- PMM
>

IMHO the patch can be applied nevertheless, as it uses a clearer
regular expression for characters allowed in macro names
(not one that is specific for the current QEMU code).

Stefan


