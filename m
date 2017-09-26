Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dwivr-0003Jv-2u
	for mharc-qemu-trivial@gnu.org; Tue, 26 Sep 2017 02:01:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33073)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dwivl-0003H5-GT
	for qemu-trivial@nongnu.org; Tue, 26 Sep 2017 02:01:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dwivg-0005cq-59
	for qemu-trivial@nongnu.org; Tue, 26 Sep 2017 02:01:17 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:46883)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dwivX-0005Yt-3v; Tue, 26 Sep 2017 02:01:03 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id A4E6841F8B;
	Tue, 26 Sep 2017 09:00:59 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with ESMTP id 52A4717;
	Tue, 26 Sep 2017 09:00:59 +0300 (MSK)
From: Michael Tokarev <mjt@tls.msk.ru>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, Eduardo Otubo <otubo@redhat.com>
References: <cover.1506288070.git.mjt@msgid.tls.msk.ru>
	<CAFEAcA9GtLniZNyO7Uv=vL9HiSBGjvWRYdR-Zi1E+W4N9qiB6A@mail.gmail.com>
	<55782343-4bb4-d5ed-2c5d-4dd0fc5764dd@tls.msk.ru>
Message-ID: <49eb0a94-5ca0-fb0d-e2b5-3bc965d3a5be@msgid.tls.msk.ru>
Date: Tue, 26 Sep 2017 09:00:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <55782343-4bb4-d5ed-2c5d-4dd0fc5764dd@tls.msk.ru>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PULL 00/31] Trivial patches for 2017-09-25
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
X-List-Received-Date: Tue, 26 Sep 2017 06:01:22 -0000

26.09.2017 08:57, Michael Tokarev wrote:
..
> Reverting this patch makes it run again. Cc'ing Eduardo.
> 
> I'll remove this patch, patch "hw/isa/pc87312: Mark the device with
> user_creatable = false" (will be replaced with a better variant),

Actually "dma/i82374: avoid double creation of i82374 device" :)

(Also Cc'ing Eduardo :) )

/mjt

