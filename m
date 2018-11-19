Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gOjJp-0000Wt-Hw
	for mharc-qemu-trivial@gnu.org; Mon, 19 Nov 2018 08:10:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46480)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1gOjJl-0000Qa-NP
	for qemu-trivial@nongnu.org; Mon, 19 Nov 2018 08:10:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1gOjJk-0001zE-39
	for qemu-trivial@nongnu.org; Mon, 19 Nov 2018 08:10:21 -0500
Received: from mx1.redhat.com ([209.132.183.28]:57448)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1gOjJf-0001wS-1u; Mon, 19 Nov 2018 08:10:15 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 61588C058CA6;
	Mon, 19 Nov 2018 13:10:14 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-104.ams2.redhat.com
	[10.36.116.104])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 287672638D;
	Mon, 19 Nov 2018 13:10:14 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id AB05C11385F2; Mon, 19 Nov 2018 14:10:07 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org,  qemu-trivial@nongnu.org,  pbonzini@redhat.com
References: <20181116200016.2080785-1-eblake@redhat.com>
Date: Mon, 19 Nov 2018 14:10:07 +0100
In-Reply-To: <20181116200016.2080785-1-eblake@redhat.com> (Eric Blake's
	message of "Fri, 16 Nov 2018 14:00:16 -0600")
Message-ID: <87h8gdqkls.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Mon, 19 Nov 2018 13:10:14 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3] qapi: Reduce Makefile
 boilerplate
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
X-List-Received-Date: Mon, 19 Nov 2018 13:10:23 -0000

Eric Blake <eblake@redhat.com> writes:

> Adding a new qapi module had some rather tedious repetition to
> wire it into Makefile, Makefile.objs, and .gitignore (for example,
> see commit bf42508f and its followup b61acdec). For make, add some
> indirection by taking advantage of GNU Make string processing to
> expand a list of module names into all the required artifacts, so
> that future additions of a new module need only touch the list of
> module names.  And for gitignore, use globs to cover all generated
> file names.
>
> The list has to live in Makefile.objs, due to the way that
> our unnest-vars macro slirps in that file without remembering
> any definition of $(QAPI_MODULES) from Makefile.
>
> Signed-off-by: Eric Blake <eblake@redhat.com>

Reviewed-by: Markus Armbruster <armbru@redhat.com>

