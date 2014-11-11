Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XoCVw-0006We-JG
	for mharc-qemu-trivial@gnu.org; Tue, 11 Nov 2014 09:33:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57429)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XoCVp-0006NK-Hi
	for qemu-trivial@nongnu.org; Tue, 11 Nov 2014 09:33:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XoCVj-0003d0-7Y
	for qemu-trivial@nongnu.org; Tue, 11 Nov 2014 09:33:41 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:35072)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XoCVW-0003XX-7r; Tue, 11 Nov 2014 09:33:22 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 823FD41DE5;
	Tue, 11 Nov 2014 17:33:21 +0300 (MSK)
Message-ID: <54621E31.8020909@msgid.tls.msk.ru>
Date: Tue, 11 Nov 2014 17:33:21 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.2.0
MIME-Version: 1.0
To: Fam Zheng <famz@redhat.com>, qemu-devel@nongnu.org
References: <1415610638-3918-1-git-send-email-famz@redhat.com>
In-Reply-To: <1415610638-3918-1-git-send-email-famz@redhat.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] block: Fix comment for
	bdrv_co_get_block_status
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
X-List-Received-Date: Tue, 11 Nov 2014 14:33:47 -0000

10.11.2014 12:10, Fam Zheng wrote:
> It returns more information than binary, fix the comment.

Applied to -trivial, with the fixup suggested by Markus --
hope that's okay with you, Fam and Max... ;)

Thanks,

/mjt

