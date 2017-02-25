Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1chV8Y-0001BX-Im
	for mharc-qemu-trivial@gnu.org; Sat, 25 Feb 2017 00:43:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34901)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1chV8W-0001AX-IU
	for qemu-trivial@nongnu.org; Sat, 25 Feb 2017 00:43:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1chV8V-0000z7-Ud
	for qemu-trivial@nongnu.org; Sat, 25 Feb 2017 00:43:16 -0500
Received: from mx1.redhat.com ([209.132.183.28]:36554)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1chV8R-0000w0-NK; Sat, 25 Feb 2017 00:43:11 -0500
Received: from smtp.corp.redhat.com (int-mx16.intmail.prod.int.phx2.redhat.com
	[10.5.11.28])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9E5D585376;
	Sat, 25 Feb 2017 05:43:11 +0000 (UTC)
Received: from [10.36.116.16] (ovpn-116-16.ams2.redhat.com [10.36.116.16])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0CC652DB70;
	Sat, 25 Feb 2017 05:43:09 +0000 (UTC)
To: BALATON Zoltan <balaton@eik.bme.hu>,
	Peter Maydell <peter.maydell@linaro.org>
References: <cover.1487522123.git.balaton@eik.bme.hu>
	<5077e2a9732e1b9afcb0754e93624b787589ac61.1487522123.git.balaton@eik.bme.hu>
	<CAFEAcA8gde7GfWhyRLyOB5yL_5zrm4b7tj4pH=GTj=RwZO_4wg@mail.gmail.com>
	<alpine.BSF.2.20.1702242148080.76443@zero.eik.bme.hu>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Aurelien Jarno <aurelien@aurel32.net>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <2a70e96a-3f61-473a-519a-af867a050fad@redhat.com>
Date: Sat, 25 Feb 2017 06:43:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <alpine.BSF.2.20.1702242148080.76443@zero.eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.74 on 10.5.11.28
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Sat, 25 Feb 2017 05:43:11 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 10/10] ppc: Add SM501 device
 in config for ppc and ppcemb targets
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
X-List-Received-Date: Sat, 25 Feb 2017 05:43:17 -0000

On 24.02.2017 21:51, BALATON Zoltan wrote:
> On Fri, 24 Feb 2017, Peter Maydell wrote:
>> On 19 February 2017 at 16:35, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>>> This is not used by default on any emulated machine yet but it is
>>> still useful to have it compiled so it can be added from the command
>>> line for clients that can use it (e.g. MorphOS has no driver for any
>>> other emulated video cards but can output via SM501)
>>>
>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>
>> If this is a generic PCI device then shouldn't it go into
>> default-configs/pci.mak ?
> 
> This is a multimedia chip usually found on sh4 systems and some ppc
> boards that's why I've only added it to these but I can move it to
> pci.mak if you think it's a better place for it.

If it is not really usable for other boards, then I think it should also
not go into pci.mak. No need to confuse the users of the other boards
with unusable PCI cards here.

 Thomas


