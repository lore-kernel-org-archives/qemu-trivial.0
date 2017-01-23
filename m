Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cVYjK-0008NR-PS
	for mharc-qemu-trivial@gnu.org; Mon, 23 Jan 2017 02:07:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57889)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1cVYjI-0008Lw-JT
	for qemu-trivial@nongnu.org; Mon, 23 Jan 2017 02:07:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1cVYjH-0008C0-MF
	for qemu-trivial@nongnu.org; Mon, 23 Jan 2017 02:07:52 -0500
Received: from mx1.redhat.com ([209.132.183.28]:57670)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1cVYjD-0008B4-9T; Mon, 23 Jan 2017 02:07:47 -0500
Received: from smtp.corp.redhat.com (int-mx16.intmail.prod.int.phx2.redhat.com
	[10.5.11.28])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AB7013A7680;
	Mon, 23 Jan 2017 07:07:46 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-93.ams2.redhat.com
	[10.36.117.93])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 72726749FD;
	Mon, 23 Jan 2017 07:07:46 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id D28091138645; Mon, 23 Jan 2017 08:07:43 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Cc: QEMU Developer <qemu-devel@nongnu.org>,  QEMU Trivial
	<qemu-trivial@nongnu.org>,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
	<marcandre.lureau@redhat.com>, Michael Roth <mdroth@linux.vnet.ibm.com>
References: <20170122145407.27476-1-sw@weilnetz.de>
Date: Mon, 23 Jan 2017 08:07:43 +0100
In-Reply-To: <20170122145407.27476-1-sw@weilnetz.de> (Stefan Weil's message of
	"Sun, 22 Jan 2017 15:54:07 +0100")
Message-ID: <8760l6z22o.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.74 on 10.5.11.28
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Mon, 23 Jan 2017 07:07:46 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qapi: Remove unwanted
 commas after #optional keyword
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
X-List-Received-Date: Mon, 23 Jan 2017 07:07:53 -0000

Stefan Weil <sw@weilnetz.de> writes:

> We don't want that commas to be part of the generated documentation,
> so remove them.
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>
> This is an alternative solution for the issue which is also addressed
> by my previous patch http://patchwork.ozlabs.org/patch/718177/.
>
> It's also possible to apply both patches.

I'll take this one.

Reviewed-by: Markus Armbruster <armbru@redhat.com>

Applied to qapi-next, thanks!

