Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aIXrH-0006AF-8X
	for mharc-qemu-trivial@gnu.org; Mon, 11 Jan 2016 03:29:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47980)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aIXrF-00068x-O2
	for qemu-trivial@nongnu.org; Mon, 11 Jan 2016 03:29:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aIXrF-00061z-0d
	for qemu-trivial@nongnu.org; Mon, 11 Jan 2016 03:29:45 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:51227)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1aIXrA-00060s-ME; Mon, 11 Jan 2016 03:29:40 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id A230940375;
	Mon, 11 Jan 2016 11:29:39 +0300 (MSK)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
References: <1447186571-27672-1-git-send-email-thuth@redhat.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Openpgp: id=6EE195D1886E8FFB810D4324457CE0A0804465C5
Organization: Telecom Service, JSC
Message-ID: <569367F3.30604@msgid.tls.msk.ru>
Date: Mon, 11 Jan 2016 11:29:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.5.0
MIME-Version: 1.0
In-Reply-To: <1447186571-27672-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH 0/4] Remove superfluous return statements
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
X-List-Received-Date: Mon, 11 Jan 2016 08:29:46 -0000

10.11.2015 23:16, Thomas Huth wrote:
> Some functions in QEMU have a "return;" statement at the
> very end of a function with "void" return type, i.e. the
> return statement is superfluous. This patch series removes
> some of them.
> 
> Thomas Huth (4):
>   hw/ide: Remove superfluous return statements
>   hw/acpi: Remove superfluous return statement
>   hw/s390x: Remove superfluous return statements
>   hw/core/qdev: Remove superfluous return statement

(Finally!) applied to -trivial, after removing changes
to hw/s390x/event-facility.c from hw/s390x patch as
discussed before.

Thank you, and please excuse me it took so long :)

/mjt

