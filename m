Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YVDJi-0007ap-PZ
	for mharc-qemu-trivial@gnu.org; Tue, 10 Mar 2015 02:06:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48818)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YVDJe-0007U9-FZ
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 02:06:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YVDJd-0008At-N4
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 02:06:54 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:55774)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YVDJY-000893-EB; Tue, 10 Mar 2015 02:06:48 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id D1EEC41302;
	Tue, 10 Mar 2015 09:06:47 +0300 (MSK)
Message-ID: <54FE89F7.1050108@msgid.tls.msk.ru>
Date: Tue, 10 Mar 2015 09:06:47 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.4.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>, QEMU Trivial <qemu-trivial@nongnu.org>
References: <1425766581-18250-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1425766581-18250-1-git-send-email-sw@weilnetz.de>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: Kevin Wolf <kwolf@redhat.com>, QEMU Developer <qemu-devel@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] block/qapi: Fix Sparse warning
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
X-List-Received-Date: Tue, 10 Mar 2015 06:06:55 -0000

08.03.2015 01:16, Stefan Weil wrote:
> Sparse reports this warning:
> 
> block/qapi.c:417:47: warning:
>  too long initializer-string for array of char(no space for nul char)
> 
> Replacing the string by an array of characters fixes this warning.

> -    static const char suffixes[NB_SUFFIXES] = "KMGT";
> +    static const char suffixes[NB_SUFFIXES] = {'K', 'M', 'G', 'T'};

The latter is a bit uglier to my taste but oh well, damn warnings! :)

Applied to -trivial, thanks!

/mjt


