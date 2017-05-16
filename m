Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dAatV-0002BP-Ev
	for mharc-qemu-trivial@gnu.org; Tue, 16 May 2017 07:44:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59233)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1dAatS-000299-GK
	for qemu-trivial@nongnu.org; Tue, 16 May 2017 07:43:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1dAatP-0008TD-8d
	for qemu-trivial@nongnu.org; Tue, 16 May 2017 07:43:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42666)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1dAatJ-0008RQ-NE; Tue, 16 May 2017 07:43:49 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 58C6E80468;
	Tue, 16 May 2017 11:43:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 58C6E80468
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=armbru@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 58C6E80468
Received: from blackfin.pond.sub.org (ovpn-116-54.ams2.redhat.com
	[10.36.116.54])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1499460F8D;
	Tue, 16 May 2017 11:43:45 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id B50A21138648; Tue, 16 May 2017 13:43:43 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>, famz@redhat.com,
	qemu-block@nongnu.org, qemu-trivial@nongnu.org,
	Max Reitz <mreitz@redhat.com>
References: <20170515195439.17677-1-eblake@redhat.com>
Date: Tue, 16 May 2017 13:43:43 +0200
In-Reply-To: <20170515195439.17677-1-eblake@redhat.com> (Eric Blake's message
	of "Mon, 15 May 2017 14:54:39 -0500")
Message-ID: <87d1b9kowg.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 16 May 2017 11:43:48 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] block: Use QDict helpers
 for --force-share
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
X-List-Received-Date: Tue, 16 May 2017 11:43:59 -0000

Eric Blake <eblake@redhat.com> writes:

> Fam's addition of --force-share in commits 459571f7 and 335e9937
> were developed prior to the addition of QDict scalar insertion
> macros, but merged after the general cleanup in commit 46f5ac20.
> Patch created mechanically by rerunning:
>
>  spatch --sp-file scripts/coccinelle/qobject.cocci \
>         --macro-file scripts/cocci-macro-file.h --dir . --in-place
>
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>
> This could go in through Markus' qapi tree (since he took the
> original cleanup), a block maintainer (since it only touches block
> files), or even the trivial patch queue (since it's so small and
> mechanical) - I don't care which, as long as we don't drop it!

Applied to qapi-next, thanks!

