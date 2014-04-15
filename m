Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WZyyH-0003Tl-UQ
	for mharc-qemu-trivial@gnu.org; Tue, 15 Apr 2014 04:44:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59688)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1WZyyB-0003Lj-Gy
	for qemu-trivial@nongnu.org; Tue, 15 Apr 2014 04:44:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1WZyy6-0000rQ-Gc
	for qemu-trivial@nongnu.org; Tue, 15 Apr 2014 04:43:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:3471)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1WZyxu-0000p5-TG; Tue, 15 Apr 2014 04:43:39 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s3F8hZSm031928
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Tue, 15 Apr 2014 04:43:35 -0400
Received: from blackfin.pond.sub.org (ovpn-116-48.ams2.redhat.com
	[10.36.116.48])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s3F8hWAR016987
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 15 Apr 2014 04:43:34 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id D032D200D1; Tue, 15 Apr 2014 10:43:31 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
References: <53337BEB.90305@gmail.com> <87wqfgrp83.fsf@blackfin.pond.sub.org>
	<5333F6E2.9080202@gmail.com> <53382DDD.8050001@gmail.com>
	<87fvlylf02.fsf@blackfin.pond.sub.org> <53396545.805@gmail.com>
	<CAFEAcA-GL7bnZ-Pkga9PzDq7DpwPf8Gx0Wezzkm_CCbSUB1W8A@mail.gmail.com>
	<533969AB.4010505@gmail.com>
	<CAFEAcA_w=35e9dVL_Zo84MoxZqCUH9qJ76v=Pn=XQ0FZq8g_-g@mail.gmail.com>
	<53396CE9.9090405@gmail.com>
	<CAFEAcA9dk3991gc+FK0qp9QwhWkjxO0vK=X1TxS37Y1sXD5RNw@mail.gmail.com>
	<533E7DD5.3090203@gmail.com> <5340F4FD.7040305@msgid.tls.msk.ru>
	<53414941.5040908@gmail.com> <5343E4D4.6070305@gmail.com>
	<5343E516.3020103@gmail.com> <5343E571.60407@gmail.com>
	<CAEgOgz7gEi7s2paSDo+AnO67LT+T+K0_SZ_MnBEZCdpHZgaJrA@mail.gmail.com>
Date: Tue, 15 Apr 2014 10:43:31 +0200
In-Reply-To: <CAEgOgz7gEi7s2paSDo+AnO67LT+T+K0_SZ_MnBEZCdpHZgaJrA@mail.gmail.com>
	(Peter Crosthwaite's message of "Tue, 15 Apr 2014 12:13:38 +1000")
Message-ID: <87tx9vgez0.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Chen Gang <gang.chen.5i5j@gmail.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Anthony Liguori <aliguori@amazon.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH trivial 2/3] vl: remove
	redundant local variable 'res'
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
X-List-Received-Date: Tue, 15 Apr 2014 08:44:00 -0000

Peter Crosthwaite <peter.crosthwaite@xilinx.com> writes:

> On Tue, Apr 8, 2014 at 10:02 PM, Chen Gang <gang.chen.5i5j@gmail.com> wrote:
>> In function, if no additional resources to free before quit, commonly,
>> need not use additional local variable 'res' to notice about it. So
>> remove it to simplify code.
>>
>
> Styling wise, there is a school of thought that functions should only
> have one return statement which is probably the original authors
> intention.

Plausible.  But what matters here is whether we think the patch is
worthwhile or not.

I find Chen's version a bit clearer, but I'm not sure it's worth the
churn.

