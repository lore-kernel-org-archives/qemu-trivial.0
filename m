Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wa4i8-0004X7-19
	for mharc-qemu-trivial@gnu.org; Tue, 15 Apr 2014 10:51:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42404)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Wa4hz-0004PL-6T
	for qemu-trivial@nongnu.org; Tue, 15 Apr 2014 10:51:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Wa4ht-0003Mj-1l
	for qemu-trivial@nongnu.org; Tue, 15 Apr 2014 10:51:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:61520)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1Wa4hg-00038D-EC; Tue, 15 Apr 2014 10:51:16 -0400
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s3FEpCLF018584
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Tue, 15 Apr 2014 10:51:12 -0400
Received: from blackfin.pond.sub.org (ovpn-116-48.ams2.redhat.com
	[10.36.116.48])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s3FEpAfY008523
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 15 Apr 2014 10:51:11 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 76FD1200D1; Tue, 15 Apr 2014 16:51:09 +0200 (CEST)
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
	<87ppkjgepp.fsf@blackfin.pond.sub.org> <534D3A2E.8020300@gmail.com>
Date: Tue, 15 Apr 2014 16:51:09 +0200
In-Reply-To: <534D3A2E.8020300@gmail.com> (Chen Gang's message of "Tue, 15 Apr
	2014 21:54:54 +0800")
Message-ID: <87mwfmd4te.fsf@blackfin.pond.sub.org>
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
X-List-Received-Date: Tue, 15 Apr 2014 14:51:42 -0000

Chen Gang <gang.chen.5i5j@gmail.com> writes:

> On 04/15/2014 04:49 PM, Markus Armbruster wrote:
>> In future submissions, please send the patches in-reply-to the cover
>> letter, not chained together in-reply-to the previous part.  Check out
>> git-send-email --no-chain-reply-to.
>> 
>
> OK, thanks. But excuse me, I use thunderbird client to send/recv mail
> (not use git send-mail), so not quit understand what you said. And I
> guess what your meaning is:
>
>   - start a new thread "[PATH 0/3]..."
>
>     - "[PATH 1/3]..." need "reply all" the "[PATH 0/3]..."
>
>     - "[PATH 2/3]..." need "reply all" the "[PATH 0/3]..."
>
>     - "[PATH 3/3]..." need "reply all" the "[PATH 0/3]..."
>
> If what I guess is incorrect, please let me know, and it will be better
> to provide more detials.

Sounds okay.  But sending with git-send-email is so much easier...

