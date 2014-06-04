Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ws6Rk-0002e9-4L
	for mharc-qemu-trivial@gnu.org; Wed, 04 Jun 2014 04:21:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59978)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1Ws6Ra-0002Qb-QB
	for qemu-trivial@nongnu.org; Wed, 04 Jun 2014 04:21:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1Ws6RS-0007Ga-DD
	for qemu-trivial@nongnu.org; Wed, 04 Jun 2014 04:21:10 -0400
Received: from oxygen.pond.sub.org ([144.76.244.19]:50729)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>)
	id 1Ws6RA-00073D-Tg; Wed, 04 Jun 2014 04:20:45 -0400
Received: from blackfin.pond.sub.org (p5B32B63A.dip0.t-ipconnect.de
	[91.50.182.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by oxygen.pond.sub.org (Postfix) with ESMTPSA id 33DD0204E6;
	Wed,  4 Jun 2014 10:20:44 +0200 (CEST)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 6C9C930403AF; Wed,  4 Jun 2014 10:20:43 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Chen Gang <gang.chen.5i5j@gmail.com>
References: <538C6F98.5070005@gmail.com>
Date: Wed, 04 Jun 2014 10:20:43 +0200
In-Reply-To: <538C6F98.5070005@gmail.com> (Chen Gang's message of "Mon, 02 Jun
	2014 20:35:36 +0800")
Message-ID: <871tv52ihw.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 144.76.244.19
Cc: quintela@redhat.com, QEMU Trivial <qemu-trivial@nongnu.org>,
	Michael Tokarev <mjt@tls.msk.ru>, dgilbert@redhat.com,
	QEMU Developers <qemu-devel@nongnu.org>, owasserm@redhat.com,
	arei.gonglei@huawei.com, Eric Blake <eblake@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH-trivial] arch_init.c: Always
	be sure that 'encoded_buf' and 'current_buf' are lock protected
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
X-List-Received-Date: Wed, 04 Jun 2014 08:21:19 -0000

Chen Gang <gang.chen.5i5j@gmail.com> writes:

> 'encoded_buf' and 'current_buf' are lock protected during using in
> save_xbzrle_page() in ram_save_page(), and during freeing in
> migration_end().
>
> So recommend to let them lock protected during starting, just like we
> have done to 'cache'.

I'd recommend against routing locking patches through -trivial.  The
code has maintainers, and you cc'ed them.

