Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1diL2l-0004KS-An
	for mharc-qemu-trivial@gnu.org; Thu, 17 Aug 2017 09:41:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36245)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <frederic.konrad@adacore.com>) id 1diK6h-00068b-4P
	for qemu-trivial@nongnu.org; Thu, 17 Aug 2017 08:41:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <frederic.konrad@adacore.com>) id 1diK6e-0008Fb-H2
	for qemu-trivial@nongnu.org; Thu, 17 Aug 2017 08:41:03 -0400
Received: from mel.act-europe.fr ([194.98.77.210]:44613
	helo=smtp.eu.adacore.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <frederic.konrad@adacore.com>)
	id 1diK6e-0008FC-Bv
	for qemu-trivial@nongnu.org; Thu, 17 Aug 2017 08:41:00 -0400
Received: from localhost (localhost [127.0.0.1])
	by filtered-smtp.eu.adacore.com (Postfix) with ESMTP id 49E4A82415;
	Thu, 17 Aug 2017 14:40:57 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at eu.adacore.com
Received: from smtp.eu.adacore.com ([127.0.0.1])
	by localhost (smtp.eu.adacore.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bTalnXPv7W4N; Thu, 17 Aug 2017 14:40:57 +0200 (CEST)
Received: from localhost.localdomain (unknown
	[IPv6:2a01:e35:87f0:3180:2b18:7e65:c33:7f62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.eu.adacore.com (Postfix) with ESMTPSA id B2D9F823B2;
	Thu, 17 Aug 2017 14:40:55 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>, 
	QEMU Developers <qemu-devel@nongnu.org>
References: <cover.1502708830.git.mjt@msgid.tls.msk.ru>
	<a808c0865b720e22ca2929ec3d362d4610fbad51.1502708830.git.mjt@msgid.tls.msk.ru>
	<CAFEAcA-Jac8wFzQ9vRyKjcEwDKYBdXysNyDP7ERFfXFhVcF56w@mail.gmail.com>
	<ff54b90d-9912-ce03-31cf-9fd08571eab2@redhat.com>
	<CAFEAcA_Fr3U5n+pBqfDk1J9GeaLREU1ttgKvMmmawMF+W1Fi+A@mail.gmail.com>
From: KONRAD Frederic <frederic.konrad@adacore.com>
Message-ID: <d2f92c3e-34ee-9a38-96b8-623fbc316e61@adacore.com>
Date: Thu, 17 Aug 2017 14:40:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_Fr3U5n+pBqfDk1J9GeaLREU1ttgKvMmmawMF+W1Fi+A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 194.98.77.210
X-Mailman-Approved-At: Thu, 17 Aug 2017 09:41:01 -0400
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 7/7] hw/misc/mmio_interface:
 Return after error_setg() to avoid crash
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
X-List-Received-Date: Thu, 17 Aug 2017 12:41:04 -0000



On 08/14/2017 01:55 PM, Peter Maydell wrote:
> On 14 August 2017 at 12:52, Thomas Huth <thuth@redhat.com> wrote:
>> On 14.08.2017 13:45, Peter Maydell wrote:
>>> It seems like it should be an error to permit this to be
>>> created from the command line at all
> 
>> That's also what thought first ... but the commit message of commit
>> 7cc2298c46a6afa4f4ff7e5cd262809c782d701b says that it "can be
>> hotplugged/hotunplugged" ? ... that's confusing ...
> 
> It means that memory.c creates and deletes instances of the
> device on demand, not that it's hotplugged in the "controlled by
> the user simulating PCI or other hotplug" sense.
> 
> thanks
> -- PMM
> 

Sorry, missed that I changed my email address recently.
I'll add some docs and fix the things we mentioned for 2.11.

For the context:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg446748.html

Thanks,
Fred

