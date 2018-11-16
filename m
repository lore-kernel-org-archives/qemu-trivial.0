Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gNbBw-0002tp-UA
	for mharc-qemu-trivial@gnu.org; Fri, 16 Nov 2018 05:17:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49508)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1gNbBu-0002rv-NH
	for qemu-trivial@nongnu.org; Fri, 16 Nov 2018 05:17:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1gNbBt-0007A5-GX
	for qemu-trivial@nongnu.org; Fri, 16 Nov 2018 05:17:34 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52838)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1gNbBp-00076O-6U; Fri, 16 Nov 2018 05:17:29 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2B36A3078AA3;
	Fri, 16 Nov 2018 10:17:27 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-34.ams2.redhat.com
	[10.36.117.34])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D85FA608C1;
	Fri, 16 Nov 2018 10:17:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 4DB5A11385F2; Fri, 16 Nov 2018 11:17:25 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, pbonzini@redhat.com,
	xiezhide@huawei.com
References: <20181115225052.1322639-1-eblake@redhat.com>
Date: Fri, 16 Nov 2018 11:17:25 +0100
In-Reply-To: <20181115225052.1322639-1-eblake@redhat.com> (Eric Blake's
	message of "Thu, 15 Nov 2018 16:50:52 -0600")
Message-ID: <87bm6p72dm.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Fri, 16 Nov 2018 10:17:27 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] qapi: Reduce Makefile
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
X-List-Received-Date: Fri, 16 Nov 2018 10:17:35 -0000

Eric Blake <eblake@redhat.com> writes:

> Adding a new qapi module requires some rather tedious repetition to
> wire it into Makefile and Makefile.objs. Add some indirection by
> taking advantage of GNU Make string processing to expand a list
> of module names into all the required artifacts, so that future
> additions of a new module need only touch the list of module names.
>
> The list has to live in Makefile.objs, due to the way that
> unnest-vars slirps in that file without remembering any definition
> of $(QAPI_MODULES) from Makefile.
>
> Signed-off-by: Eric Blake <eblake@redhat.com>
>
> ---
> v2: also condense Makefile.objs, prefer $(FOO:%=a%b) over
> %(patsubst %,a%b,$(foo))
> ---
>  Makefile      | 192 ++++++--------------------------------------------
>  Makefile.objs |  75 ++------------------
>  2 files changed, 30 insertions(+), 237 deletions(-)

Lovely diffstat.

Reviewed-by: Markus Armbruster <armbru@redhat.com>

