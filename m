Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f80aH-0004uk-2e
	for mharc-qemu-trivial@gnu.org; Mon, 16 Apr 2018 05:38:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50671)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1f80aD-0004t3-Fj
	for qemu-trivial@nongnu.org; Mon, 16 Apr 2018 05:37:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1f80aC-0001Ol-LP
	for qemu-trivial@nongnu.org; Mon, 16 Apr 2018 05:37:57 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:56175)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1f80a6-0001Dx-Ir; Mon, 16 Apr 2018 05:37:50 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id EA1E4413B0;
	Mon, 16 Apr 2018 12:37:49 +0300 (MSK)
Received: from [192.168.177.103] (mjtmob.vpn.tls.msk.ru [192.168.177.103])
	by tsrv.corpit.ru (Postfix) with ESMTP id B0278E99;
	Mon, 16 Apr 2018 12:37:49 +0300 (MSK)
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
References: <20180414142739.23375-1-mjt@msgid.tls.msk.ru>
	<CAFEAcA_isnmigyPV=bZtyJ3r++8pc__7b9z12FEtd6SHJum9mg@mail.gmail.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <08cf4157-d63f-a407-933d-56d6f34724ac@msgid.tls.msk.ru>
Date: Mon, 16 Apr 2018 12:37:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_isnmigyPV=bZtyJ3r++8pc__7b9z12FEtd6SHJum9mg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: ru-RU
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH trivial for-2.12] Makefile: install gtk
 message catalogs if CONFIG_GTK=y too, not only =m
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
X-List-Received-Date: Mon, 16 Apr 2018 09:37:59 -0000

16.04.2018 12:26, Peter Maydell wrote:
> On 14 April 2018 at 15:27, Michael Tokarev <mjt@tls.msk.ru> wrote:

>> -ifeq ($(CONFIG_GTK),m)
>> +ifneq ($(filter $(CONFIG_GTK),y m),)
>>         $(MAKE) -C po $@
>>  endif

> "trivial" and "for 2.12" don't make much sense together at this point in
> the release cycle. Is this important enough to go into rc4, or not?

Well, without this, gtk translations wont be installed. Not a huge issue,
especially for the languages where qemu lacks translations, but I still
think it is important enough to go to 2.12, or else it'll be a regression.

I've just sent another, simpler version of the same thing.

Thanks,

/mjt

