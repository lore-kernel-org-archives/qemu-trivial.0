Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gVCv5-0004LB-Rg
	for mharc-qemu-trivial@gnu.org; Fri, 07 Dec 2018 04:59:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48071)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1gVCv4-0004KH-2U
	for qemu-trivial@nongnu.org; Fri, 07 Dec 2018 04:59:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1gVCv3-0003Ov-0m
	for qemu-trivial@nongnu.org; Fri, 07 Dec 2018 04:59:38 -0500
Received: from mx1.redhat.com ([209.132.183.28]:34840)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1gVCux-0003Kv-MZ; Fri, 07 Dec 2018 04:59:31 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 480179AE9D;
	Fri,  7 Dec 2018 09:59:30 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-56.ams2.redhat.com
	[10.36.116.56])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F955600C3;
	Fri,  7 Dec 2018 09:59:29 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 78DA4113860E; Fri,  7 Dec 2018 10:59:28 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, vsementsov@virtuozzo.com
References: <20181206151856.77503-1-eblake@redhat.com>
Date: Fri, 07 Dec 2018 10:59:28 +0100
In-Reply-To: <20181206151856.77503-1-eblake@redhat.com> (Eric Blake's message
	of "Thu, 6 Dec 2018 09:18:56 -0600")
Message-ID: <87pnudzmgv.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 07 Dec 2018 09:59:30 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] cutils: Assert in-range
 base for string-to-integer conversions
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
X-List-Received-Date: Fri, 07 Dec 2018 09:59:39 -0000

Eric Blake <eblake@redhat.com> writes:

> POSIX states that the value of endptr is unspecified if strtol()
> fails with EINVAL due to an invalid base argument.  Since none of
> the callers to check_strtox_error() initialized endptr, we could
> end up propagating uninitialized data back to a caller on error.
> However, passing an out-of-range base is already a sign of poor
> programming, so let's just assert that base is in range, at which
> point check_strtox_error() can be tightened to assert that it is
> receiving an initialized ep that points somewhere within the
> caller's original string, regardless of whether strto*() succeeded
> or failed with ERANGE.
>
> Reported-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Signed-off-by: Eric Blake <eblake@redhat.com>

Reviewed-by: Markus Armbruster <armbru@redhat.com>

