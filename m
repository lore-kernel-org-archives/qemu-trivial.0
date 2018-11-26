Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gRDd4-0002TD-Cy
	for mharc-qemu-trivial@gnu.org; Mon, 26 Nov 2018 04:56:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49547)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1gRDd3-0002Ro-3Y
	for qemu-trivial@nongnu.org; Mon, 26 Nov 2018 04:56:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1gRDd2-0005pI-Ce
	for qemu-trivial@nongnu.org; Mon, 26 Nov 2018 04:56:33 -0500
Received: from mx1.redhat.com ([209.132.183.28]:44522)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1gRDd0-0005kz-Rg; Mon, 26 Nov 2018 04:56:30 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 29E37356CA;
	Mon, 26 Nov 2018 09:56:30 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-104.ams2.redhat.com
	[10.36.116.104])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DDB825C1B2;
	Mon, 26 Nov 2018 09:56:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id A3AB311385F2; Mon, 26 Nov 2018 10:56:26 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
References: <20181125205000.10324-1-philmd@redhat.com>
	<20181125205000.10324-20-philmd@redhat.com>
Date: Mon, 26 Nov 2018 10:56:26 +0100
In-Reply-To: <20181125205000.10324-20-philmd@redhat.com> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Sun,
	25 Nov 2018 21:49:54 +0100")
Message-ID: <87k1l0novp.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Mon, 26 Nov 2018 09:56:30 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-3.1 19/25] MAINTAINERS:
 Add a missing entry to the QMP section
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
X-List-Received-Date: Mon, 26 Nov 2018 09:56:33 -0000

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ac5d25491f..c73dde10a5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1887,6 +1887,7 @@ S: Supported
>  F: qmp.c
>  F: monitor.c
>  F: docs/devel/*qmp-*
> +F: docs/interop/*qmp-*
>  F: scripts/qmp/
>  F: tests/qmp-test.c
>  F: tests/qmp-cmd-test.c

Reviewed-by: Markus Armbruster <armbru@redhat.com>

