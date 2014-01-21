Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W5foK-00034d-N7
	for mharc-qemu-trivial@gnu.org; Tue, 21 Jan 2014 13:12:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50019)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1W5foB-0002py-Nf
	for qemu-trivial@nongnu.org; Tue, 21 Jan 2014 13:12:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1W5fo5-0002Mn-Ob
	for qemu-trivial@nongnu.org; Tue, 21 Jan 2014 13:12:19 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:37972)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1W5fnq-0002IX-2r; Tue, 21 Jan 2014 13:11:58 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 23E09426C1;
	Tue, 21 Jan 2014 22:11:50 +0400 (MSK)
Message-ID: <52DEB866.2040300@msgid.tls.msk.ru>
Date: Tue, 21 Jan 2014 22:11:50 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: Martin Husemann <martin@duskware.de>
References: <20131217085540.GA7891@mail.duskware.de>
	<52B02428.20306@redhat.com> <52D68012.8090603@redhat.com>
	<20140118134723.GA20716@mail.duskware.de>
In-Reply-To: <20140118134723.GA20716@mail.duskware.de>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] qemu 1.7.0 does not
	build on NetBSD
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Jan 2014 18:12:27 -0000

18.01.2014 17:47, Martin Husemann wrote:
>  Do not rely on int8_t (and friends) not being preprocessor
>  symbols (or symbols expanding to themselves). On NetBSD (for example) the
>  glue(u, SDATA_TYPE) results in u__int8_t, which is undefined. There is no way
>  to stop cpp expanding inner macros, so just add the few lines explicitly and
>  get rid of the magic.

Thanks, applied to the trivial-patches queue.

/mjt

