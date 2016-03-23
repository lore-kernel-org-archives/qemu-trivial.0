Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aimLl-0000Nw-Gt
	for mharc-qemu-trivial@gnu.org; Wed, 23 Mar 2016 13:13:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42977)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1aimLj-0000Mj-RX
	for qemu-trivial@nongnu.org; Wed, 23 Mar 2016 13:13:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1aimLi-0005Jk-TH
	for qemu-trivial@nongnu.org; Wed, 23 Mar 2016 13:13:39 -0400
Received: from mail.weilnetz.de ([37.221.199.173]:39844)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1aimLd-0005Il-Hl; Wed, 23 Mar 2016 13:13:33 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by mail.weilnetz.de (Postfix) with ESMTP id 90EC011810AA;
	Wed, 23 Mar 2016 18:13:32 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from mail.weilnetz.de ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id BAOlZfdtPH9l; Wed, 23 Mar 2016 18:13:30 +0100 (CET)
Received: from edv32.bib.uni-mannheim.de (p54AC9F3D.dip0.t-ipconnect.de
	[84.172.159.61])
	by mail.weilnetz.de (Postfix) with ESMTPSA id 272861181097;
	Wed, 23 Mar 2016 18:13:30 +0100 (CET)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1458745197-17973-1-git-send-email-sw@weilnetz.de>
	<CAFEAcA_d14UThiOF4sh7T1VK54Zi3wOmBfKwQxUgEPOagT3RdA@mail.gmail.com>
From: Stefan Weil <sw@weilnetz.de>
X-Enigmail-Draft-Status: N1110
Message-ID: <56F2CEB9.4010009@weilnetz.de>
Date: Wed, 23 Mar 2016 18:13:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_d14UThiOF4sh7T1VK54Zi3wOmBfKwQxUgEPOagT3RdA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.199.173
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developer <qemu-devel@nongnu.org>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] Fix some typos found by codespell
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
X-List-Received-Date: Wed, 23 Mar 2016 17:13:40 -0000

Am 23.03.2016 um 17:36 schrieb Peter Maydell:
> On 23 March 2016 at 14:59, Stefan Weil <sw@weilnetz.de> wrote:

>> - * This program is free sofware: you can redistribute it and/or modif=
y
>> + * This program is free software: you can redistribute it and/or modi=
fy
>>   * it under the terms of the GNU General Public License as published =
by
>> - * the Free Sofware Foundation, either version 2 of the License, or
>> + * the Free Software Foundation, either version 2 of the License, or
>>   * (at your option) version 3 or any later version.
>>   *
>>   * This program is distributed in the hope that it will be useful,
>=20
> ...I wonder how we ended up with a license boilerplate with typos;
> they're almost always just cut-n-pasted from another copy...


I'm no longer sure which spelling is correct. :-)

From https://www.fsf.org/about/history.html:
    1985 Richard Stallman creates the Free Sofware Foundation

Google finds around 1000 more instances.

Thanks for the review and the additional correction.
I think it can be added manually when the patch is applied to
qemu-trivial, therefore I won't send an updated patch.


Regards,
Stefan


