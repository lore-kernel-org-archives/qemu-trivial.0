Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WZz3l-0002w5-M9
	for mharc-qemu-trivial@gnu.org; Tue, 15 Apr 2014 04:49:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32886)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1WZz3e-0002n3-Bi
	for qemu-trivial@nongnu.org; Tue, 15 Apr 2014 04:49:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1WZz3Y-0002Z8-6J
	for qemu-trivial@nongnu.org; Tue, 15 Apr 2014 04:49:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:23530)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1WZz3I-0002VT-Fo; Tue, 15 Apr 2014 04:49:12 -0400
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s3F8n8w8004382
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Tue, 15 Apr 2014 04:49:08 -0400
Received: from blackfin.pond.sub.org (ovpn-116-48.ams2.redhat.com
	[10.36.116.48])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s3F8n60w024189
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 15 Apr 2014 04:49:08 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 5C970200D1; Tue, 15 Apr 2014 10:49:06 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Chen Gang <gang.chen.5i5j@gmail.com>
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
Date: Tue, 15 Apr 2014 10:49:06 +0200
In-Reply-To: <5343E4D4.6070305@gmail.com> (Chen Gang's message of "Tue, 08 Apr
	2014 20:00:20 +0800")
Message-ID: <87ppkjgepp.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>, Michael Tokarev <mjt@tls.msk.ru>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Anthony Liguori <aliguori@amazon.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH trivial 0/3] vl: simplify
	code for main() and get_boot_device()
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
X-List-Received-Date: Tue, 15 Apr 2014 08:49:40 -0000

Chen Gang <gang.chen.5i5j@gmail.com> writes:

> In "vl.c", at least, we can simplify the code below, so can let readers
> read professional C code (especially for new readers, which often start
> reading code at main function).
>
>  - remove useless 'continue' in main().
>
>  - remove redundant local variable 'res' in get_boot_device().
>
>  - remove local variable 'args' in the middle of code block in main().
>
> The following 3 patches are for the 3 'remove' above.
>
> And "vl.c" has a very long function main() which is about 17K lines.
> Next, it can be split into sub-functions (so can bypass another code
> style issue: multiple "{...}" styles within "swith(...)").
>
>
> Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
> ---
>  vl.c |   23 ++++++++++-------------
>  1 file changed, 10 insertions(+), 13 deletions(-)

In future submissions, please send the patches in-reply-to the cover
letter, not chained together in-reply-to the previous part.  Check out
git-send-email --no-chain-reply-to.

