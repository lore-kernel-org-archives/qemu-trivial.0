Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4nDB-0005bO-5D
	for mharc-qemu-trivial@gnu.org; Wed, 18 Oct 2017 08:12:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52316)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1e4nD4-0005Wu-LY
	for qemu-trivial@nongnu.org; Wed, 18 Oct 2017 08:12:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1e4nD0-00028o-UM
	for qemu-trivial@nongnu.org; Wed, 18 Oct 2017 08:12:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44408)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1e4nCw-000272-K9; Wed, 18 Oct 2017 08:12:22 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9D500883AB;
	Wed, 18 Oct 2017 12:12:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 9D500883AB
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from [10.33.192.189] (dhcp-192-189.str.redhat.com [10.33.192.189])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B667583068;
	Wed, 18 Oct 2017 12:12:19 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Michael Tokarev <mjt@tls.msk.ru>,
	Peter Maydell <peter.maydell@linaro.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>, Yu Ning <yu.ning@linux.intel.com>,
	Vincent Palatin <vpalatin@chromium.org>,
	Corey Minyard <cminyard@mvista.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20171017164426.25277-1-f4bug@amsat.org>
	<20171017164426.25277-17-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <2466fbb7-ab33-26bf-9605-e5fa339abdf5@redhat.com>
Date: Wed, 18 Oct 2017 14:12:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171017164426.25277-17-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Wed, 18 Oct 2017 12:12:21 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v3 16/42] i386/hax: remove duplicated
 include
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
X-List-Received-Date: Wed, 18 Oct 2017 12:12:36 -0000

On 17.10.2017 18:44, Philippe Mathieu-Daud=C3=A9 wrote:
> this file in include in "target/i386/hax-i386.h":
>=20
>     #ifdef CONFIG_WIN32
>     #include "target/i386/hax-windows.h"
>     #endif
>=20
> which guaranty than sysemu/os-win32.h is previously included (CONFIG_WI=
N32)

which guaranties that ... ?

 Thomas

