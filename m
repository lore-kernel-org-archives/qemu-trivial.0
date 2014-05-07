Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wi5Jr-0002xb-OC
	for mharc-qemu-trivial@gnu.org; Wed, 07 May 2014 13:07:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40415)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Wi5Jl-0002pm-8L
	for qemu-trivial@nongnu.org; Wed, 07 May 2014 13:07:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Wi5Jd-0003Ij-DS
	for qemu-trivial@nongnu.org; Wed, 07 May 2014 13:07:41 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:36486)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Wi5JT-0003HW-Ci; Wed, 07 May 2014 13:07:23 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 9AE1240AB0;
	Wed,  7 May 2014 21:07:22 +0400 (MSK)
Message-ID: <536A684A.8080801@msgid.tls.msk.ru>
Date: Wed, 07 May 2014 21:07:22 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.5.0
MIME-Version: 1.0
To: qemu-devel@nongnu.org
References: <1399482202-22544-1-git-send-email-mjt@msgid.tls.msk.ru>
In-Reply-To: <1399482202-22544-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PULL 00/21] Trivial patches for 2014-05-07
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
X-List-Received-Date: Wed, 07 May 2014 17:07:46 -0000

07.05.2014 21:03, Michael Tokarev wrote:
> Another pull request for trivial patches.  It is the same as previous
> (2014-05-05) but without the problematic Makefile patch.
> 
> So I'm not resending all the individual patches, as they're the same.

On change actually appeared.

I had to resolve a trivial conflict in

 arch_init: Be sure of only one exit entry with DPRINTF() for ram_load()

This happens after this commit:

commit 21a246a43b606ee833f907d589d8dcbb54a2761e
Author: ChenLiang <chenliang88@huawei.com>
Date:   Fri Apr 25 17:06:20 2014 +0800

    migration: remove duplicate code

    version_id is checked twice in the ram_load.

> Thanks,
> 
> /mjt


