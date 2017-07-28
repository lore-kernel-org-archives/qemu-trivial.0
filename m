Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1db3L3-0008Et-45
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 07:21:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49320)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1db3Kz-0008Dn-7c
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 07:21:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1db3Ky-0001aU-Bv
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 07:21:45 -0400
Received: from mail.uni-paderborn.de ([131.234.142.9]:40322)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <kbastian@mail.uni-paderborn.de>)
	id 1db3Ku-0001Tv-AJ; Fri, 28 Jul 2017 07:21:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mail.uni-paderborn.de; s=20170601; 
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=u85KoAjxtEODA8XZO8uS0FwhuxR2WrqlvwIEQedoYs4=; 
	b=GxGJ+Xt2w3K3A2m2A/UjyXe1SgxdRJFoU/2X+3JT0JzauFluX8LDhrxtzzF//2hNWaGoSgqKVPR+DzrqRfgr6jbrSZkOVTZX6fOzFfr/ZCReFrBZI3VPz7j33n1jEHTAi8VAe+Y68Cyf7IR92Of4Q2z1Zg255y+PaaQig6T0xLA=;
To: Michael Tokarev <mjt@tls.msk.ru>, Eduardo Otubo <otubo@redhat.com>,
	qemu-trivial@nongnu.org
Cc: thuth@redhat.com, qemu-devel@nongnu.org
References: <20170727143040.7236-1-otubo@redhat.com>
	<9858302e-566c-2ce8-45a1-29a5551bc367@msgid.tls.msk.ru>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Message-ID: <df7e23a4-540d-fa1c-86e5-a527503d3247@mail.uni-paderborn.de>
Date: Fri, 28 Jul 2017 13:20:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <9858302e-566c-2ce8-45a1-29a5551bc367@msgid.tls.msk.ru>
Content-Type: text/plain; charset=windows-1251
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-IMT-Spam-Score: 0.0 ()
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409,
	Antispam-Data: 2017.7.28.111215, AntiVirus-Engine: 5.38.0,
	AntiVirus-Data: 2017.7.4.5380001
X-IMT-Authenticated-Sender: kbastian@UNI-PADERBORN.DE
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 131.234.142.9
Subject: Re: [Qemu-trivial] [Qemu-devel] qemu-system-tricore: segfault when
 entering "x 0" on the monitor
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
X-List-Received-Date: Fri, 28 Jul 2017 11:21:48 -0000

On 07/28/2017 01:19 PM, Michael Tokarev wrote:
> 27.07.2017 17:30, Eduardo Otubo wrote:
>> Starting Qemu with "qemu-system-tricore -nographic -M tricore_testboard -S"
>> and entering "x 0" at the monitor prompt leads to Segmentation fault. This happens
>> because tricore_cpu_get_phys_page_debug() is not implemented yet, this
>> is a temporary workaround to avoid the crash.
> 
> Applied to -trivial, without the extra newline in target/tricore/cpu.h
> 
> /mjt
> 

Thanks for picking this up :)

Cheers,
Bastian

