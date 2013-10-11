Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VUVvL-00076t-JD
	for mharc-qemu-trivial@gnu.org; Fri, 11 Oct 2013 02:10:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35109)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1VUVvF-0006xn-Nv
	for qemu-trivial@nongnu.org; Fri, 11 Oct 2013 02:10:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1VUVvB-00046L-0w
	for qemu-trivial@nongnu.org; Fri, 11 Oct 2013 02:10:01 -0400
Received: from [2a03:4000:1::4e2f:c7ac:d] (port=45310
	helo=v220110690675601.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1VUVv0-00044w-9X; Fri, 11 Oct 2013 02:09:46 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	4383072819E7; Fri, 11 Oct 2013 08:09:45 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id PmGzFJ8TKDEz; Fri, 11 Oct 2013 08:09:43 +0200 (CEST)
Received: from [192.168.178.35] (p54AD83DB.dip0.t-ipconnect.de
	[84.173.131.219])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	C898D72809F3; Fri, 11 Oct 2013 08:09:42 +0200 (CEST)
Message-ID: <52579626.8020507@weilnetz.de>
Date: Fri, 11 Oct 2013 08:09:42 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1373228703-26226-1-git-send-email-sw@weilnetz.de>
	<037D60EF2A5746E468BF0A04@nimrod.local>
	<CAFEAcA9V_THiPwVwv-gYH14h2kujDnWpGAOSBd95C9W56p3AuQ@mail.gmail.com>
	<51DA438A.8060903@weilnetz.de>
	<CAHR064g-jOt7XaY4G9a7MZRs_qd9REnyyGn8D=mrRoY+J-bXUA@mail.gmail.com>
	<5256FBE7.80207@weilnetz.de>
	<CAFEAcA_KEnRRUCp87K55RanQWHXr2gPBvtk2uQc7hCwjo6S94g@mail.gmail.com>
In-Reply-To: <CAFEAcA_KEnRRUCp87K55RanQWHXr2gPBvtk2uQc7hCwjo6S94g@mail.gmail.com>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:1::4e2f:c7ac:d
Cc: Alex Bligh <alex@alex.org.uk>, Corentin Chary <corentincj@iksaif.net>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Qemu-development List <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	Anthony Liguori <anthony@codemonkey.ws>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Spelling fixes
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
X-List-Received-Date: Fri, 11 Oct 2013 06:10:06 -0000

Am 11.10.2013 03:34, schrieb Peter Maydell:
> On 11 October 2013 04:11, Stefan Weil <sw@weilnetz.de> wrote:
>> Am 08.07.2013 17:14, schrieb Corentin Chary:
>>> The comments (and most of the code) are from libvncserver (and,
>>> earlier, from "THE 'ZYWRLE' VNC CODEC SOURCE CODE. " as described in
>>> the header):
>>>
>>> http://fastdroid-vnc.googlecode.com/svn-history/r3/trunk/LibVNCServer-0.9.7/libvncserver/zywrletemplate.c
>>>
>> Then I suggest to apply my patch as it is. It fixes two locations and
>> improves a third one a little bit.
> Disagree. If we don't understand the intention of the original
> author we should leave the text as is rather than changing it
> in a way which might be incorrect.
>
> -- PMM

- This lead us to more speed and less memory.
- Of cause, the result of both method is quite same
- because it's only difference that coefficient position.
+ This leads us to more speed and less memory.
+ Of course, the result of both methods is quite same
+ because its only difference is that coefficient position.


Would you agree on fixing the first line only and removing the two following lines?

Stefan



