Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zf9FX-0004pM-N2
	for mharc-qemu-trivial@gnu.org; Thu, 24 Sep 2015 12:19:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43095)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Zf9FU-0004kz-Vq
	for qemu-trivial@nongnu.org; Thu, 24 Sep 2015 12:19:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Zf9FU-0003gB-4K
	for qemu-trivial@nongnu.org; Thu, 24 Sep 2015 12:19:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52722)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1Zf9FO-0003eP-O6; Thu, 24 Sep 2015 12:19:50 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id 282F4C0B2E0E;
	Thu, 24 Sep 2015 16:19:50 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-56.ams2.redhat.com
	[10.36.116.56])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t8OGJm3D002388
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 24 Sep 2015 12:19:49 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 1DF15303F90D; Thu, 24 Sep 2015 18:19:48 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
References: <1442231583-23535-1-git-send-email-armbru@redhat.com>
	<87h9mkthx7.fsf@blackfin.pond.sub.org> <5603A3B4.1020900@weilnetz.de>
Date: Thu, 24 Sep 2015 18:19:48 +0200
In-Reply-To: <5603A3B4.1020900@weilnetz.de> (Stefan Weil's message of "Thu, 24
	Sep 2015 09:18:12 +0200")
Message-ID: <87k2rfbxi3.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, riku.voipio@iki.fi,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] linux-user: Use g_new() &
	friends where that makes obvious sense
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
X-List-Received-Date: Thu, 24 Sep 2015 16:19:58 -0000

Stefan Weil <sw@weilnetz.de> writes:

> Am 24.09.2015 um 09:06 schrieb Markus Armbruster:
>> Ping?
>> 
>> Markus Armbruster <armbru@redhat.com> writes:
>> 
>>> g_new(T, n) is neater than g_malloc(sizeof(T) * n).  It's also 
>>> safer, for two reasons.  One, it catches multiplication 
>>> overflowing size_t. Two, it returns T * rather than void *,
>>> which lets the compiler catch more type errors.
>>> 
>>> This commit only touches allocations with size arguments of the 
>>> form sizeof(T).  Same Coccinelle semantic patchas in commit 
>>> b45c03f.
>>> 
>>> Signed-off-by: Markus Armbruster <armbru@redhat.com> --- 
>>> linux-user/elfload.c | 2 +- linux-user/main.c    | 2 +- 
>>> linux-user/syscall.c | 2 +- 3 files changed, 3 insertions(+), 3 
>>> deletions(-)
>
> Reviewed-by: Stefan Weil <sw@weilnetz.de>
>
> This patch is trivial enough for qemu-trivial.

I guess it is.  For code with a maintainer, I tend to try the maintainer
first.

> As Eric has written, the commit message needs
> a small correction: s/patchas/patch as/

Yes.

