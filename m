Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dayhS-0001F6-37
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 02:24:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44608)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1dayhP-0001A5-Np
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 02:24:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1dayhO-0004Jl-Rk
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 02:24:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39898)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <famz@redhat.com>)
	id 1dayhK-0004Hm-D5; Fri, 28 Jul 2017 02:24:30 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6B2B2C050338;
	Fri, 28 Jul 2017 06:24:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 6B2B2C050338
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=famz@redhat.com
Received: from localhost (ovpn-12-54.pek2.redhat.com [10.72.12.54])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 238B1600C2;
	Fri, 28 Jul 2017 06:24:26 +0000 (UTC)
Date: Fri, 28 Jul 2017 14:24:26 +0800
From: Fam Zheng <famz@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: Eric Blake <eblake@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, pbonzini@redhat.com
Message-ID: <20170728062426.GQ5117@lemon.lan>
References: <20170728053610.15770-1-f4bug@amsat.org>
	<20170728053610.15770-47-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20170728053610.15770-47-f4bug@amsat.org>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Fri, 28 Jul 2017 06:24:29 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [RFC PATCH 46/47] MAINTAINERS: add
 missing entries for Coccinelle scripts
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
X-List-Received-Date: Fri, 28 Jul 2017 06:24:36 -0000

On Fri, 07/28 02:36, Philippe Mathieu-Daud=E9 wrote:
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 224890643d..7854792765 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1537,6 +1537,12 @@ Checkpatch
>  S: Odd Fixes
>  F: scripts/checkpatch.pl
> =20
> +Coccinelle scripts
> +R: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> +S: Orphan

"Orphan" sounds like we don't care much anymore but I suppose this is not=
 the
case. But I don't have any better idea either.

Fam

> +F: scripts/cocci-macro-file.h
> +F: scripts/coccinelle/
> +
>  Migration
>  M: Juan Quintela <quintela@redhat.com>
>  M: Dr. David Alan Gilbert <dgilbert@redhat.com>
> @@ -1970,4 +1976,3 @@ Build system architecture
>  M: Daniel P. Berrange <berrange@redhat.com>
>  S: Odd Fixes
>  F: docs/devel/build-system.txt

