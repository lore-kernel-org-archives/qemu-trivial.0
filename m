Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UoSnb-00045K-Gu
	for mharc-qemu-trivial@gnu.org; Mon, 17 Jun 2013 02:20:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58102)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UoSnY-00040X-KW
	for qemu-trivial@nongnu.org; Mon, 17 Jun 2013 02:20:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UoSnX-0003ha-QK
	for qemu-trivial@nongnu.org; Mon, 17 Jun 2013 02:20:16 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:51985)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UoSnV-0003h4-8J; Mon, 17 Jun 2013 02:20:13 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 8C1E541629;
	Mon, 17 Jun 2013 10:20:11 +0400 (MSK)
Message-ID: <51BEAA9B.500@msgid.tls.msk.ru>
Date: Mon, 17 Jun 2013 10:20:11 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/17.0 Icedove/17.0
MIME-Version: 1.0
To: Hu Tao <hutao@cn.fujitsu.com>
References: <1371120709-18923-1-git-send-email-hutao@cn.fujitsu.com>
	<1371120709-18923-2-git-send-email-hutao@cn.fujitsu.com>
	<51B9A766.6070706@suse.de>
	<20130617020849.GD6416@G08FNSTD100614.fnst.cn.fujitsu.com>
In-Reply-To: <20130617020849.GD6416@G08FNSTD100614.fnst.cn.fujitsu.com>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org,
	=?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] fix typo: apci -> acpi
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
X-List-Received-Date: Mon, 17 Jun 2013 06:20:18 -0000

17.06.2013 06:08, Hu Tao wrote:
> Michael,
>=20
> On Thu, Jun 13, 2013 at 01:05:10PM +0200, Andreas F=C3=A4rber wrote:
>> Am 13.06.2013 12:51, schrieb Hu Tao:
>>> Signed-off-by: Hu Tao <hutao@cn.fujitsu.com>
>>> ---
>>>  hw/acpi/ich9.c  | 4 ++--
>>>  hw/acpi/piix4.c | 6 +++---
>>>  2 files changed, 5 insertions(+), 5 deletions(-)
>>
>> Reviewed-by: Andreas F=C3=A4rber <afaerber@suse.de>
>=20
> Would you like to pick up this one?

Yes I will, together with a bunch of other patches
posted to -trivial.  This patch was a bit too late
for previous week pull so it missed that.

Thanks,

/mjt

