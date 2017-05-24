Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dDPDu-0000nf-KW
	for mharc-qemu-trivial@gnu.org; Wed, 24 May 2017 01:52:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60309)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1dDPDr-0000m0-NH
	for qemu-trivial@nongnu.org; Wed, 24 May 2017 01:52:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1dDPDq-0007VJ-PD
	for qemu-trivial@nongnu.org; Wed, 24 May 2017 01:52:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37160)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1dDPDm-0007NK-8S; Wed, 24 May 2017 01:52:34 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D324B85543;
	Wed, 24 May 2017 05:52:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com D324B85543
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=armbru@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com D324B85543
Received: from blackfin.pond.sub.org (ovpn-116-98.ams2.redhat.com
	[10.36.116.98])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C96C18ACE;
	Wed, 24 May 2017 05:52:31 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 7A4181138648; Wed, 24 May 2017 07:52:29 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, marcandre.lureau@redhat.com
References: <20170523174420.8903-1-eblake@redhat.com>
Date: Wed, 24 May 2017 07:52:29 +0200
In-Reply-To: <20170523174420.8903-1-eblake@redhat.com> (Eric Blake's message
	of "Tue, 23 May 2017 12:44:20 -0500")
Message-ID: <87k256u7he.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Wed, 24 May 2017 05:52:33 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] qapi: Fix some QMP
 documentation regressions
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
X-List-Received-Date: Wed, 24 May 2017 05:52:40 -0000

Eric Blake <eblake@redhat.com> writes:

> In the process of getting rid of docs/qmp-commands.txt, we managed
> to regress on some of the text that changed after the point where
> the move was first branched and when the move actually occurred.
> For example, commit 3282eca for blockdev-snapshot re-added the
> extra "options" layer which had been cleaned up in commit 0153d2f.
>
> This clears up all regressions identified over the range
> 02b351d..bd6092e:
> https://lists.gnu.org/archive/html/qemu-devel/2017-05/msg05127.html
> as well as a cleanup to x-blockdev-remove-medium to prefer
> 'id' over 'device' (matching the cleanup for 'eject').
>
> CC: qemu-trivial@nongnu.org
> Signed-off-by: Eric Blake <eblake@redhat.com>

Reviewed-by: Markus Armbruster <armbru@redhat.com>

> ---
> v2: add 'eject', 'x-blockdev-remove-medium' cleanups, thanks to
> Markus' audit.
>
> Can go in either via trivial or via qapi tree

I'll put it in my next pull unless -trivial picks it up first.

