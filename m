Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dChhV-0004BD-Bp
	for mharc-qemu-trivial@gnu.org; Mon, 22 May 2017 03:24:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54828)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1dChhT-00049x-CY
	for qemu-trivial@nongnu.org; Mon, 22 May 2017 03:24:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1dChhS-0008HS-HS
	for qemu-trivial@nongnu.org; Mon, 22 May 2017 03:24:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53126)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1dChhO-0008Fg-9w; Mon, 22 May 2017 03:24:14 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 46B3F80F93;
	Mon, 22 May 2017 07:24:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 46B3F80F93
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=armbru@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 46B3F80F93
Received: from blackfin.pond.sub.org (ovpn-116-54.ams2.redhat.com
	[10.36.116.54])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E9A7018B2F;
	Mon, 22 May 2017 07:24:11 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 74B881138647; Mon, 22 May 2017 09:24:10 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org,  qemu-trivial@nongnu.org
References: <1495238065-15846-1-git-send-email-thuth@redhat.com>
Date: Mon, 22 May 2017 09:24:10 +0200
In-Reply-To: <1495238065-15846-1-git-send-email-thuth@redhat.com> (Thomas
	Huth's message of "Sat, 20 May 2017 01:54:25 +0200")
Message-ID: <87r2zh2w2t.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Mon, 22 May 2017 07:24:13 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tests/libqtest: Print error
 instead of aborting when env variable is missing
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
X-List-Received-Date: Mon, 22 May 2017 07:24:20 -0000

Thomas Huth <thuth@redhat.com> writes:

> When you currently try to run a test directly from the command line
> without setting the QTEST_QEMU_BINARY environment variable first,
> you are presented with an unhelpful assertion message like this:
>
>  ERROR:tests/libqtest.c:163:qtest_init_without_qmp_handshake:
>  assertion failed: (qemu_binary != NULL)
>  Aborted (core dumped)
>
> Let's replace the assert() with a more user friendly error message
> instead.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/libqtest.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/tests/libqtest.c b/tests/libqtest.c
> index 84ecbd2..f0fd682 100644
> --- a/tests/libqtest.c
> +++ b/tests/libqtest.c
> @@ -160,7 +160,11 @@ QTestState *qtest_init_without_qmp_handshake(const char *extra_args)
>      const char *qemu_binary;
>  
>      qemu_binary = getenv("QTEST_QEMU_BINARY");
> -    g_assert(qemu_binary != NULL);
> +    if (!qemu_binary) {
> +        fprintf(stderr, "The environment variable QTEST_QEMU_BINARY has to be "
> +                        "set before running the test.\n");

Nitpick: error messages usually don't end with a period.

I'm fine with the message itself, although I'd have written somehing
more laconic like "Environment variable QTEST_QEMU_BINARY required".
Your choice.

> +        exit(1);
> +    }
>  
>      s = g_malloc(sizeof(*s));

Reviewed-by: Markus Armbruster <armbru@redhat.com>

