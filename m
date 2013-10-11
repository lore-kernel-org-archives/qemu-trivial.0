Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VUiOS-0006jj-Qm
	for mharc-qemu-trivial@gnu.org; Fri, 11 Oct 2013 15:29:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52440)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1VUiOL-0006Y9-2G
	for qemu-trivial@nongnu.org; Fri, 11 Oct 2013 15:28:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1VUiOF-0004Fo-Is
	for qemu-trivial@nongnu.org; Fri, 11 Oct 2013 15:28:53 -0400
Received: from v220110690675601.yourvserver.net ([37.221.199.173]:39795)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1VUiO4-0004CV-Qv; Fri, 11 Oct 2013 15:28:36 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	1BDEC72819F6; Fri, 11 Oct 2013 21:28:35 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id AFEBbP2fGVL6; Fri, 11 Oct 2013 21:28:24 +0200 (CEST)
Received: from [192.168.178.35] (p54AD83DE.dip0.t-ipconnect.de
	[84.173.131.222])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	9C99272809F3; Fri, 11 Oct 2013 21:28:23 +0200 (CEST)
Message-ID: <52585156.1010707@weilnetz.de>
Date: Fri, 11 Oct 2013 21:28:22 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1381518382-6105-1-git-send-email-sw@weilnetz.de>
	<CAFEAcA9Stuakd5tytT_65j4mUtKUyXtGQAG3Htvei0k3HU5WWA@mail.gmail.com>
In-Reply-To: <CAFEAcA9Stuakd5tytT_65j4mUtKUyXtGQAG3Htvei0k3HU5WWA@mail.gmail.com>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.199.173
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Jan Kiszka <jan.kiszka@siemens.com>,
	Alex Bligh <alex@alex.org.uk>, qemu-devel <qemu-devel@nongnu.org>,
	Anthony Liguori <anthony@codemonkey.ws>
Subject: Re: [Qemu-trivial] [PATCH v2] misc: Spelling and other fixes in
	comments
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
X-List-Received-Date: Fri, 11 Oct 2013 19:28:59 -0000

Am 11.10.2013 21:12, schrieb Peter Maydell:
> On 12 October 2013 04:06, Stefan Weil <sw@weilnetz.de> wrote:
>> * it's -> its
>> * Grammar fix in ui/vnc-enc-zywrle.h. In the same context
>>   a sentence with unclear meaning which could not be fixed was removed.
>>
>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>> ---
>>
>> This is an update of patch http://patchwork.ozlabs.org/patch/257416/
>> (Spelling fixes).
>>
>> v2: Don't try to fix a strange sentence in ui/vnc-enc-zywrle.h - remove it.
> What? I thought you meant "remove that part of the change from
> the patch", not "remove the sentence altogether". Please leave
> it in place so that anybody in future who needs to try to understand
> this code has the maximum available amount of clues.
>
> -- PMM

Well, I said "Would you agree on fixing the first line only and removing the two following lines?".
Obviously it's not so easy for foreign speakers like me to find the right words. :-)

I'll send a v3.

Stefan





