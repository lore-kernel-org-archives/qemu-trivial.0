Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xycjl-00005t-Qt
	for mharc-qemu-trivial@gnu.org; Wed, 10 Dec 2014 03:35:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34827)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xycjd-0008KF-92
	for qemu-trivial@nongnu.org; Wed, 10 Dec 2014 03:35:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XycjX-0007uO-6J
	for qemu-trivial@nongnu.org; Wed, 10 Dec 2014 03:35:01 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:41033)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XycjK-0007si-Ki; Wed, 10 Dec 2014 03:34:42 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id F40E3419AF;
	Wed, 10 Dec 2014 11:34:41 +0300 (MSK)
Message-ID: <548805A1.4000905@msgid.tls.msk.ru>
Date: Wed, 10 Dec 2014 11:34:41 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.2.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <1417701603-26388-1-git-send-email-armbru@redhat.com>
In-Reply-To: <1417701603-26388-1-git-send-email-armbru@redhat.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 0/3] util: Trivial cleanups around
	g_malloc()
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
X-List-Received-Date: Wed, 10 Dec 2014 08:35:07 -0000

04.12.2014 17:00, Markus Armbruster wrote:
> Markus Armbruster (3):
>   util: Drop superfluous conditionals around g_free()
>   Fuse g_malloc(); memset() into g_new0()
>   util: Use g_new() & friends where that makes obvious sense

Applied to trivial (fixing 2/3 subject prefix), thank you!

/mjt

