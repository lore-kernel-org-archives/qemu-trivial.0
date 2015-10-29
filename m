Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZrhfT-0006L3-SM
	for mharc-qemu-trivial@gnu.org; Thu, 29 Oct 2015 03:30:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34335)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZrhfQ-0006JF-HT
	for qemu-trivial@nongnu.org; Thu, 29 Oct 2015 03:30:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZrhfL-0002Iv-0u
	for qemu-trivial@nongnu.org; Thu, 29 Oct 2015 03:30:36 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:52475)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZrhfE-0002I8-WF; Thu, 29 Oct 2015 03:30:25 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 6F54E42107;
	Thu, 29 Oct 2015 10:30:24 +0300 (MSK)
Message-ID: <5631CB10.30100@msgid.tls.msk.ru>
Date: Thu, 29 Oct 2015 10:30:24 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
References: <1444721930-5121-1-git-send-email-kwolf@redhat.com>
In-Reply-To: <1444721930-5121-1-git-send-email-kwolf@redhat.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-stable@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] gdbstub: Fix buffer overflows in
	gdb_handle_packet()
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
X-List-Received-Date: Thu, 29 Oct 2015 07:30:38 -0000

13.10.2015 10:38, Kevin Wolf wrote:
> Some places in gdb_handle_packet() can get an arbitrary length (most
> times directly from the client) and either didn't check it at all or
> checked against the wrong value, potentially causing buffer overflows.

Applied to -trivial, thank you!

/mjt


