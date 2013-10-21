Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VYB4u-00050v-Jm
	for mharc-qemu-trivial@gnu.org; Mon, 21 Oct 2013 04:43:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53151)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VYB4n-0004ru-9E
	for qemu-trivial@nongnu.org; Mon, 21 Oct 2013 04:43:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VYB4h-0003eM-9H
	for qemu-trivial@nongnu.org; Mon, 21 Oct 2013 04:43:01 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:42771)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VYB4V-0003dL-3S; Mon, 21 Oct 2013 04:42:43 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 0990442E03;
	Mon, 21 Oct 2013 12:42:42 +0400 (MSK)
Message-ID: <5264E902.1070106@msgid.tls.msk.ru>
Date: Mon, 21 Oct 2013 12:42:42 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130922 Icedove/17.0.9
MIME-Version: 1.0
To: Fam Zheng <famz@redhat.com>
References: <1381805919-11572-1-git-send-email-famz@redhat.com>
In-Reply-To: <1381805919-11572-1-git-send-email-famz@redhat.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, lcapitulino@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] .gitignore: ignore qmp-commands.txt
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
X-List-Received-Date: Mon, 21 Oct 2013 08:43:07 -0000

15.10.2013 06:58, Fam Zheng wrote:
> This file is moved out from QMP/ to BUILD dir, change the ignore file
> too.

Thanks, applied to the trivial patches queue.

/mjt

