Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dfShQ-00005F-DO
	for mharc-qemu-trivial@gnu.org; Wed, 09 Aug 2017 11:15:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59467)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dfShM-0008Q0-5O
	for qemu-trivial@nongnu.org; Wed, 09 Aug 2017 11:15:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dfShI-0004aG-Vw
	for qemu-trivial@nongnu.org; Wed, 09 Aug 2017 11:15:04 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:48191)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dfSh6-0004Ts-Uj; Wed, 09 Aug 2017 11:14:49 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 410BA4091F;
	Wed,  9 Aug 2017 18:14:48 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with ESMTP id DA7523F3;
	Wed,  9 Aug 2017 18:14:45 +0300 (MSK)
To: Eduardo Otubo <otubo@redhat.com>, qemu-trivial@nongnu.org,
	thuth@redhat.com, gxt@mprc.pku.edu.cn, qemu-devel@nongnu.org
References: <20170728115131.31725-1-otubo@redhat.com>
	<a6feb869-e73e-ffd3-278e-23fef4ae6a0c@msgid.tls.msk.ru>
	<20170807141604.GA14212@bluepex.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <cdf1189d-f52c-6a2c-eabb-6923c383ca0e@msgid.tls.msk.ru>
Date: Wed, 9 Aug 2017 18:14:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170807141604.GA14212@bluepex.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] unicore32: abort when entering "x 0" on
 the monitor
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
X-List-Received-Date: Wed, 09 Aug 2017 15:15:05 -0000

07.08.2017 17:16, Eduardo Otubo wrote:
> On Mon, Jul 31, 2017 at 01:17:03PM +0300, Michael Tokarev wrote:
>> 28.07.2017 14:51, Eduardo Otubo wrote:
>>> Starting Qemu with "qemu-system-unicore32 -M puv3,accel=qtest -S -nographic"
>>> and entering "x 0 " at the monitor prompt leads to abort():
>>
>> Applied to -trivial, thanks!
> 
> Hi Michael, you missed this patch in the latest pull request. Care to
> take it on the next one? I'm planning to send some other small fixes
> until this Friday.

Yeah, for some reason it slipped out. I'm picking it up again.
Thanks,

/mjt

