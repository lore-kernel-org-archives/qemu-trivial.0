Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aQWpD-0004w8-FN
	for mharc-qemu-trivial@gnu.org; Tue, 02 Feb 2016 04:00:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59759)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1aQWpA-0004qA-DD
	for qemu-trivial@nongnu.org; Tue, 02 Feb 2016 04:00:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1aQWp9-0006RJ-Al
	for qemu-trivial@nongnu.org; Tue, 02 Feb 2016 04:00:36 -0500
Received: from [59.151.112.132] (port=61652 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1aQWp3-0006Pa-JA; Tue, 02 Feb 2016 04:00:29 -0500
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="3228635"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 02 Feb 2016 17:00:26 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id A9E404042EDB;
	Tue,  2 Feb 2016 16:59:35 +0800 (CST)
Received: from [10.167.226.69] (10.167.226.69) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Tue, 2 Feb 2016 17:00:24 +0800
To: Michael Tokarev <mjt@tls.msk.ru>, <qemu-devel@nongnu.org>
References: <1454309636-18263-1-git-send-email-caoj.fnst@cn.fujitsu.com>
	<1454309636-18263-2-git-send-email-caoj.fnst@cn.fujitsu.com>
	<56B0658A.20605@msgid.tls.msk.ru> <56B0680C.8050200@cn.fujitsu.com>
	<56B0693E.5070302@msgid.tls.msk.ru>
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Message-ID: <56B0703B.5050907@cn.fujitsu.com>
Date: Tue, 2 Feb 2016 17:00:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <56B0693E.5070302@msgid.tls.msk.ru>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.167.226.69]
X-yoursite-MailScanner-ID: A9E404042EDB.A7C13
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Cc: qemu-trivial <qemu-trivial@nongnu.org>, kraxel@redhat.com
Subject: Re: [Qemu-trivial] [PATCH 1/2] Emulated CCID card: QOMify
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
X-List-Received-Date: Tue, 02 Feb 2016 09:00:37 -0000



On 02/02/2016 04:30 PM, Michael Tokarev wrote:
> 02.02.2016 11:25, Cao jin wrote:
>> On 02/02/2016 04:15 PM, Michael Tokarev wrote:
>>> Why did you move the type definition from .c to .h file?
>>> It is only referenced in .c, no?
> []
>> Yes, that type definition is referred only in .c for now, but we are not sure about it in the future, for better flexibility, I think put it into .h is better. http://wiki.qemu.org/QOMConventions also says:
>>
>> DO use TYPE_FOO constants, defined in a header if used in other parts of code
>
> The last words in this sentense makes sense, I think:
> "if used in other parts of the code".
>
> So I read it as 2-part suggestion:
>
> 1) use TYPE_foo constants instead of "literals", and
> 2) define them in a header file if used elsewhere too.
>
> The "future flexibility" is, in my opinion, questionable.
> If we'll use them in the future, we can always move the
> #define to the header file.  For now, there's no need
> to clutter the heade more, but there's a good reason
> to use the #define in the "home" .c file where this
> device is implemented, in all places where the device
> name is referenced.
>
> At least that's how I read this (somewhat ambiguous)
> suggestion in the wiki.
>
> Thanks,
>
> /mjt
>

leave it where it was is also fine by me, it is not late to move it to 
header file when it is certainly to be used in other parts. I will 
update it:)

-- 
Yours Sincerely,

Cao jin



