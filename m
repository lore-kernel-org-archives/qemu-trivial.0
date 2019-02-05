Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gquRh-0005yy-V2
	for mharc-qemu-trivial@gnu.org; Tue, 05 Feb 2019 01:43:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57985)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1gquRf-0005xH-Tc
	for qemu-trivial@nongnu.org; Tue, 05 Feb 2019 01:43:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1gquRf-0000xJ-6l
	for qemu-trivial@nongnu.org; Tue, 05 Feb 2019 01:42:59 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53296)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1gquRb-0000w1-Sq; Tue, 05 Feb 2019 01:42:55 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A8F993C2CCF;
	Tue,  5 Feb 2019 06:42:54 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-113.ams2.redhat.com
	[10.36.116.113])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 15C6A61522;
	Tue,  5 Feb 2019 06:42:51 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 42F1611386C5; Tue,  5 Feb 2019 07:42:49 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Stefano Garzarella <sgarzare@redhat.com>, qemu-riscv@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>
References: <20190204211204.27321-1-philmd@redhat.com>
	<20190204211204.27321-4-philmd@redhat.com>
Date: Tue, 05 Feb 2019 07:42:49 +0100
In-Reply-To: <20190204211204.27321-4-philmd@redhat.com> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Mon, 4 Feb 2019 22:12:04
	+0100")
Message-ID: <87a7jaag7q.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 05 Feb 2019 06:42:55 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3 3/3] util/cutils: Move
 function documentations to the header
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
X-List-Received-Date: Tue, 05 Feb 2019 06:43:00 -0000

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Many functions have documentation before the implementation in
> cutils.c. Since we expect documentation around the prototype
> declaration in headers,

We do?

There are two justifiable function comment placement styles: (1) next to
definition, and (2) next to declaration if it's in a header, else next
to definition.

The rationale for the latter is having the headers do double-duty as
interface documentation.

The rationale for the former is consistently placing the function
comments close to the code gives them a fighting chance to actually
match the code.

I'm in the "next to definition" camp.  If you want concise interface
specification, use something like Sphinx.

QEMU code is, as so often, in all camps.

>                         move the comments in cutils.h.

We document some cutils functions next to their definition, and some
next to their declaration.  The inconsistency is ugly, and your patch
fixes it.  I'd fix it in the other direction.

Even if we decide to fix this one in this direction, I object to the
sweeping generalization in the commit message :)

