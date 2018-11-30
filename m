Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gSocp-0007mV-EH
	for mharc-qemu-trivial@gnu.org; Fri, 30 Nov 2018 14:38:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46045)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1gSocn-0007lW-Jm
	for qemu-trivial@nongnu.org; Fri, 30 Nov 2018 14:38:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1gSocm-0001zv-RH
	for qemu-trivial@nongnu.org; Fri, 30 Nov 2018 14:38:53 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:42891)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mjt@tls.msk.ru>)
	id 1gSocg-0001t8-JW; Fri, 30 Nov 2018 14:38:46 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id B7C164318B;
	Fri, 30 Nov 2018 22:38:34 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with ESMTP id 98B67168A;
	Fri, 30 Nov 2018 22:38:34 +0300 (MSK)
To: Laurent Vivier <laurent@vivier.eu>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	Li Qiang <liq3ea@gmail.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <1543571638-2892-1-git-send-email-liq3ea@gmail.com>
	<16fc13de-778b-430e-d734-bbc802d25ba8@redhat.com>
	<8f24cfdf-061b-75e8-9d89-e2b0b5196115@vivier.eu>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <94576180-9b50-f913-a22a-385114282879@msgid.tls.msk.ru>
Date: Fri, 30 Nov 2018 22:38:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <8f24cfdf-061b-75e8-9d89-e2b0b5196115@vivier.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] util: vfio-helpers: use ARRAY_SIZE in
 qemu_vfio_init_pci()
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
X-List-Received-Date: Fri, 30 Nov 2018 19:38:54 -0000

30.11.2018 15:58, Laurent Vivier wrote:

>>> -    for (i = 0; i < 6; i++) {
>>> +    for (i = 0; i < ARRAY_SIZE(s->bar_region_info); i++) {

> I'm wondering if adding a #define to define the size of the array and
> then using it with the for() loop wouldn't be better?

On the other side, it doesn't really matter, one way or another..
It's so.. trivial.. ;)

/mjt

