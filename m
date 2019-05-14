Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hQWwt-0004Ov-Uu
	for mharc-qemu-trivial@gnu.org; Tue, 14 May 2019 08:54:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44070)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hQWwr-0004NL-63
	for qemu-trivial@nongnu.org; Tue, 14 May 2019 08:54:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hQWwq-0008QE-9G
	for qemu-trivial@nongnu.org; Tue, 14 May 2019 08:54:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50604)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hQWwq-0008PU-4C
	for qemu-trivial@nongnu.org; Tue, 14 May 2019 08:54:24 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5005D81DFC;
	Tue, 14 May 2019 12:54:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-28.ams2.redhat.com
	[10.36.116.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EB1E161995;
	Tue, 14 May 2019 12:54:22 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 6A56611385E4; Tue, 14 May 2019 14:54:21 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Yury Kotov <yury-kotov@yandex-team.ru>
Cc: "qemu-trivial\@nongnu.org" <qemu-trivial@nongnu.org>
References: <20190411174715.31855-1-yury-kotov@yandex-team.ru>
	<471871557828004@iva6-8a76e93b6298.qloud-c.yandex.net>
Date: Tue, 14 May 2019 14:54:21 +0200
In-Reply-To: <471871557828004@iva6-8a76e93b6298.qloud-c.yandex.net> (Yury
	Kotov's message of "Tue, 14 May 2019 13:00:09 +0300")
Message-ID: <875zqd5h8i.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 14 May 2019 12:54:23 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] monitor: Fix return type of
 monitor_fdset_dup_fd_find
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
X-List-Received-Date: Tue, 14 May 2019 12:54:26 -0000

Yury Kotov <yury-kotov@yandex-team.ru> writes:

> + armbru@
>
> Ping

Looks like you sent this only to qemu-trivial@nongnu.org.  You'll have
to resend the patch to qemu-devel@nongnu.org.  You can cc: qemu-trivial@
and me.

> This just fixes the return types because mon_fdset->id is int64_t
> Without it, there is a bug when removing fd for fdset id >= 2^32

This should go into your commit message.

