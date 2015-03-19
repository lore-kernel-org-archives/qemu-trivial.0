Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YYVwL-0007Kh-GD
	for mharc-qemu-trivial@gnu.org; Thu, 19 Mar 2015 04:36:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48331)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YYVwJ-0007Gj-TA
	for qemu-trivial@nongnu.org; Thu, 19 Mar 2015 04:36:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YYVwI-0003nm-DE
	for qemu-trivial@nongnu.org; Thu, 19 Mar 2015 04:36:27 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:50759)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YYVwB-0003jF-3X; Thu, 19 Mar 2015 04:36:19 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 55A3041D21;
	Thu, 19 Mar 2015 11:36:18 +0300 (MSK)
Message-ID: <550A8A82.2030902@msgid.tls.msk.ru>
Date: Thu, 19 Mar 2015 11:36:18 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.5.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <1425990184-30913-1-git-send-email-armbru@redhat.com>
In-Reply-To: <1425990184-30913-1-git-send-email-armbru@redhat.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] hmp: Fix texinfo documentation
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
X-List-Received-Date: Thu, 19 Mar 2015 08:36:28 -0000

10.03.2015 15:23, Markus Armbruster wrote:
> Several issues:
> 
> * Commands i and o lack @item.  Their one-liner documentation gets
>   squashed into the preceding command print.  Add the obvious @item.
> 
> * Commands i, o and cpu-add lack @findex.  The function index doesn't
>   have them.  Add the obvious @findex.
> 
> * Commit 727f005 put block_set_io_throttle was added in the middle of
>   block_passwd.  Move it.
> 
> * Correct spelling of commands chardev-add and chardev-remove in @item
>   and @findex.
> 
> * Some commands have a blank line between @item/@findex and the text,
>   most don't.  Normalize to no blank line.

Applied to -trivial, thank you!

/mjt

