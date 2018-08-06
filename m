Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fmh5c-00009X-Gb
	for mharc-qemu-trivial@gnu.org; Mon, 06 Aug 2018 11:06:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45033)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1fmh5Z-00007K-Gw
	for qemu-trivial@nongnu.org; Mon, 06 Aug 2018 11:06:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1fmh5Y-0005ma-Lm
	for qemu-trivial@nongnu.org; Mon, 06 Aug 2018 11:06:29 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:46094 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1fmh5U-0005hM-Dc; Mon, 06 Aug 2018 11:06:24 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 705F27C6A9;
	Mon,  6 Aug 2018 15:06:18 +0000 (UTC)
Received: from gondolin (dhcp-192-215.str.redhat.com [10.33.192.215])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AC1BA1C55D;
	Mon,  6 Aug 2018 15:06:17 +0000 (UTC)
Date: Mon, 6 Aug 2018 17:06:16 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Pavel Zbitskiy <pavel.zbitskiy@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-s390x@nongnu.org
Message-ID: <20180806170616.2064e677.cohuck@redhat.com>
In-Reply-To: <20180805182832.3012-1-pavel.zbitskiy@gmail.com>
References: <20180805182832.3012-1-pavel.zbitskiy@gmail.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Mon, 06 Aug 2018 15:06:18 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Mon, 06 Aug 2018 15:06:18 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'cohuck@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/6] Some improvements in
 z/Arch instructions support
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
X-List-Received-Date: Mon, 06 Aug 2018 15:06:30 -0000

On Sun,  5 Aug 2018 14:28:25 -0400
Pavel Zbitskiy <pavel.zbitskiy@gmail.com> wrote:

Meta note #1: please add the s390x maintainers on cc: for the cover
              letter as well; that makes tracking easier
Meta note #2: I don't think this really fits trivial? I'll be happy to
              take the end result via the s390x tree, anyway.

> Add BAL, BALR, CVB instructions
> Fix few bugs in PACK, CSST
> 
> Pavel Zbitskiy (6):
>   target/s390x: add BAL and BALR instructions
>   target/s390x: fix CSST decoding and runtime alignment check
>   target/s390x: fix ipm polluting irrelevant bits
>   target/s390x: add EX support for TRT and TRTR
>   target/s390x: fix PACK reading 1 byte less and writing 1 byte more
>   target/s390x: implement CVB, CVBY and CVBG
> 
>  target/s390x/helper.h      |  2 ++
>  target/s390x/insn-data.def |  7 ++++++
>  target/s390x/int_helper.c  | 58 ++++++++++++++++++++++++++++++++++++++++++++++
>  target/s390x/mem_helper.c  | 24 +++++++++++++++----
>  target/s390x/translate.c   | 52 +++++++++++++++++++++++++++++++++++++----
>  5 files changed, 135 insertions(+), 8 deletions(-)
> 

Out of curiousity: Do you have some code that actually makes use of
these instructions (especially BAL/BALR), or have you found this by
looking at the documentation?

