Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VYB5s-0005zs-DK
	for mharc-qemu-trivial@gnu.org; Mon, 21 Oct 2013 04:44:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53417)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VYB5k-0005ke-5T
	for qemu-trivial@nongnu.org; Mon, 21 Oct 2013 04:44:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VYB5d-0003rM-W5
	for qemu-trivial@nongnu.org; Mon, 21 Oct 2013 04:44:00 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:59056)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VYB5R-0003pc-R9; Mon, 21 Oct 2013 04:43:41 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 1DF7542E03;
	Mon, 21 Oct 2013 12:43:41 +0400 (MSK)
Message-ID: <5264E93D.9080700@msgid.tls.msk.ru>
Date: Mon, 21 Oct 2013 12:43:41 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130922 Icedove/17.0.9
MIME-Version: 1.0
To: Eric Blake <eblake@redhat.com>
References: <1382201553-6561-1-git-send-email-eblake@redhat.com>
In-Reply-To: <1382201553-6561-1-git-send-email-eblake@redhat.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: kwolf@redhat.com, qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] qapi: fix documentation example
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
X-List-Received-Date: Mon, 21 Oct 2013 08:44:06 -0000

19.10.2013 20:52, Eric Blake wrote:
> The QMP wire format uses "", not '', around strings.
>
> * docs/qapi-code-gen.txt: Fix typo.

Thanks, applied to the trivial patches queue.

/mjt

