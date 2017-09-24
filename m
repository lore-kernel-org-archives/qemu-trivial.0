Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dwEFJ-00079w-6n
	for mharc-qemu-trivial@gnu.org; Sun, 24 Sep 2017 17:15:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41887)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dwEFG-00078P-RS
	for qemu-trivial@nongnu.org; Sun, 24 Sep 2017 17:15:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dwEFG-0001om-0E
	for qemu-trivial@nongnu.org; Sun, 24 Sep 2017 17:15:22 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:54843)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dwEFA-0001nK-KC; Sun, 24 Sep 2017 17:15:16 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id A2F4541C78;
	Mon, 25 Sep 2017 00:15:15 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with ESMTP id 8AED13C3;
	Mon, 25 Sep 2017 00:15:15 +0300 (MSK)
To: Stefan Fritsch <sf@sfritsch.de>, qemu-trivial@nongnu.org
Cc: Stefan Fritsch <stefan_fritsch@genua.de>,
	"open list:All patches CC here" <qemu-devel@nongnu.org>
References: <1500538486-23453-1-git-send-email-sf@sfritsch.de>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <68c8816f-69a7-8897-9dba-19c0309cd268@msgid.tls.msk.ru>
Date: Mon, 25 Sep 2017 00:15:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1500538486-23453-1-git-send-email-sf@sfritsch.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] vmxcap: Fix output formatting
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
X-List-Received-Date: Sun, 24 Sep 2017 21:15:23 -0000

Please excuse me for the long delay with this patch.

20.07.2017 11:14, Stefan Fritsch wrote:
> From: Stefan Fritsch <stefan_fritsch@genua.de>
> 
> One string is longer than 40 chars. Set the field width to 50.

The string is this one, I guess:

Miscellaneous data
  Hex: 0x100401e5
  VMX-preemption timer scale (log2)        5
  Store EFER.LMA into IA-32e mode guest control yes
  HLT activity state                       yes
  Shutdown activity state                  yes

While technically after this change, it will be aligned
in one column, I think it is better to reword this one
entry instead: when widening the alignment column, the
whole thing becomes less and less readable, it is more
difficult this way to follow which value correspond to
which entry.

A better wording for this one entry is welcome :)

Thanks,

/mjt

