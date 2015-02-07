Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YKCDb-0004Ka-Ru
	for mharc-qemu-trivial@gnu.org; Sat, 07 Feb 2015 15:43:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47669)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YKCDa-0004IV-5O
	for qemu-trivial@nongnu.org; Sat, 07 Feb 2015 15:43:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YKCDZ-0003CY-Bh
	for qemu-trivial@nongnu.org; Sat, 07 Feb 2015 15:43:06 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:60875)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YKCDV-0003C7-6r; Sat, 07 Feb 2015 15:43:01 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 8528A41468;
	Sat,  7 Feb 2015 23:43:00 +0300 (MSK)
Message-ID: <54D678D4.1040507@msgid.tls.msk.ru>
Date: Sat, 07 Feb 2015 23:43:00 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.4.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <1422375232-29283-1-git-send-email-armbru@redhat.com>
In-Reply-To: <1422375232-29283-1-git-send-email-armbru@redhat.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 0/3] util/uri: Cleanups and a bug fix
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
X-List-Received-Date: Sat, 07 Feb 2015 20:43:07 -0000

27.01.2015 19:13, Markus Armbruster wrote:
> Note: checkpatch is unhappy with the first patch, because I refrained
> from cleaning up the ugly return(NULL).  They're all over the place.
> 
> Markus Armbruster (3):
>   util/uri: uri_new() can't fail, drop dead error handling
>   util/uri: realloc2n() can't fail, drop dead error handling
>   util/uri: URI member path can be null, compare more carfully

Applied all to -trivial, with patch 3 replacing similar patch by Paolo.

Thanks,

/mjt

