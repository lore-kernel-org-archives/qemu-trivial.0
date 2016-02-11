Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aTkEd-0000Si-OL
	for mharc-qemu-trivial@gnu.org; Thu, 11 Feb 2016 00:56:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43929)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aTkEb-0000Pq-95
	for qemu-trivial@nongnu.org; Thu, 11 Feb 2016 00:56:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aTkEa-0000yF-I4
	for qemu-trivial@nongnu.org; Thu, 11 Feb 2016 00:56:09 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:56857)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1aTkEW-0000uu-Fv; Thu, 11 Feb 2016 00:56:04 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 9BF7D412DC;
	Thu, 11 Feb 2016 08:56:03 +0300 (MSK)
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <1455027417-32278-1-git-send-email-pbonzini@redhat.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Openpgp: id=6EE195D1886E8FFB810D4324457CE0A0804465C5
Organization: Telecom Service, JSC
Message-ID: <56BC2273.70607@msgid.tls.msk.ru>
Date: Thu, 11 Feb 2016 08:56:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.5.0
MIME-Version: 1.0
In-Reply-To: <1455027417-32278-1-git-send-email-pbonzini@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>
Subject: Re: [Qemu-trivial] [PATCH] w32: include winsock2.h before windows.h
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
X-List-Received-Date: Thu, 11 Feb 2016 05:56:10 -0000

09.02.2016 17:16, Paolo Bonzini wrote:
> Recent Fedora complains while compiling ui/sdl.c:
> 
>     /usr/x86_64-w64-mingw32/sys-root/mingw/include/winsock2.h:15:2: warning: #warning Please include winsock2.h before windows.h [-Wcpp]
> 
> And with this patch we dutifully obey.

Applied to -trivial, adding Stefan's comments to the commit
message too.

Thanks,

/mjt

