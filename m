Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WWieZ-0006Wn-Vz
	for mharc-qemu-trivial@gnu.org; Sun, 06 Apr 2014 04:42:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49855)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1WWieS-0006O9-PJ
	for qemu-trivial@nongnu.org; Sun, 06 Apr 2014 04:42:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1WWieM-0002Yc-WA
	for qemu-trivial@nongnu.org; Sun, 06 Apr 2014 04:42:04 -0400
Received: from v220110690675601.yourvserver.net ([37.221.199.173]:49436)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1WWieC-0002XW-75; Sun, 06 Apr 2014 04:41:48 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	97ECF1182EB4; Sun,  6 Apr 2014 10:41:47 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id EhYx3RQqQGwQ; Sun,  6 Apr 2014 10:41:43 +0200 (CEST)
Received: from [192.168.178.35] (p54AD8E8D.dip0.t-ipconnect.de
	[84.173.142.141])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	D6A0B1182EB3; Sun,  6 Apr 2014 10:41:42 +0200 (CEST)
Message-ID: <53411345.3010501@weilnetz.de>
Date: Sun, 06 Apr 2014 10:41:41 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, 
	Michael Tokarev <mjt@tls.msk.ru>, Paolo Bonzini <pbonzini@redhat.com>, 
	Markus Armbruster <armbru@redhat.com>
References: <1395834349-19001-1-git-send-email-pbonzini@redhat.com>	<5340F620.2000607@msgid.tls.msk.ru>	<CAFEAcA8gSmOM1g+iLAEi5iays4hTG_rVGWB_J5gtrrZ4M9ftpA@mail.gmail.com>
	<534111E9.3010604@weilnetz.de>
In-Reply-To: <534111E9.3010604@weilnetz.de>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 37.221.199.173
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v4] scripts: add sample
 model file for Coverity Scan
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
X-List-Received-Date: Sun, 06 Apr 2014 08:42:10 -0000

Am 06.04.2014 10:35, schrieb Stefan Weil:
> Am 06.04.2014 10:20, schrieb Peter Maydell:
>> On 6 April 2014 07:37, Michael Tokarev <mjt@tls.msk.ru> wrote:
>>> While we don't have issues with the model itself, but really wonder if we
>>> should keep this file inside qemu sources.  It isn't used in there, as
>>> explicitly stated above, and maybe it is easier to maintain it "closer"
>>> to the website?
>>
>> Where would that be? There's no version control there. The
>> other alternative would be somebody's personal git repo,
>> which seems a recipe for it being impossible to find.
>>
>> thanks
>> -- PMM
>>
> 
> I suggest documenting the use of coverity in the QEMU wiki.
> http://wiki.qemu.org/Testing is a good place for that.
> 
> The model file could also be placed there on a new page: mediawiki has
> version control, and maintenance would be easier than with patches sent
> to the mailing list. People who want to review any changes just have to
> get a Wiki account (most already have, I assume) and watch the page for
> modifications.
> 
> Regards
> Stefan

I forgot to mention that a license change would be needed for the model
file because the Wiki uses the GNU Free Documentation License 1.2.

Stefan




