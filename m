Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dXTde-0001wK-Sk
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jul 2017 10:38:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35450)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dXTdZ-0001sf-SR
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 10:38:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dXTdW-0004LT-4q
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 10:38:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40522)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1dXTdQ-0004H2-Ge; Tue, 18 Jul 2017 10:38:00 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 754C17F40E;
	Tue, 18 Jul 2017 14:37:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 754C17F40E
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=thuth@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 754C17F40E
Received: from [10.33.200.180] (dhcp-200-180.str.redhat.com [10.33.200.180])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B8DB7F762;
	Tue, 18 Jul 2017 14:37:58 +0000 (UTC)
To: Michael Walle <michael@walle.cc>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
	<f4bug@amsat.org>
Cc: qemu-trivial@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
	<philippe.mathieu.daude@gmail.com>, qemu-devel@nongnu.org
References: <20170718061005.29518-1-f4bug@amsat.org>
	<20170718061005.29518-17-f4bug@amsat.org>
	<501136f163a5ab92df3d839360483774@walle.cc>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <f8dcb381-0935-bf7a-55a7-79d24f51e1dc@redhat.com>
Date: Tue, 18 Jul 2017 16:37:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <501136f163a5ab92df3d839360483774@walle.cc>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 18 Jul 2017 14:37:59 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 16/29] lm32: use
 QEMU_IS_ALIGNED macro
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
X-List-Received-Date: Tue, 18 Jul 2017 14:38:12 -0000

On 18.07.2017 13:42, Michael Walle wrote:
> Am 2017-07-18 08:09, schrieb Philippe Mathieu-Daud=C3=A9:
>> Applied using the Coccinelle semantic patch
>> scripts/coccinelle/use_osdep.cocci
>>
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>=20
> QEMU_IS_ALIGNED() sounds like it is used to check if a memory access is
> aligned. Although it does the same, the line in question is used for
> formatted output. I'm not sure if this macro should be used here.

+1

I think we should not replace every usage of % blindly. It does really
look wrong in this case here.

 Thomas

