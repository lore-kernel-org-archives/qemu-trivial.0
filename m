Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WnwKA-0000HB-A1
	for mharc-qemu-trivial@gnu.org; Fri, 23 May 2014 16:44:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45516)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WnwK3-00008s-OC
	for qemu-trivial@nongnu.org; Fri, 23 May 2014 16:44:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WnwJy-00027t-VL
	for qemu-trivial@nongnu.org; Fri, 23 May 2014 16:44:11 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:53797)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WnwJo-00026N-Rs; Fri, 23 May 2014 16:43:57 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 52DE142B94;
	Sat, 24 May 2014 00:43:54 +0400 (MSK)
Message-ID: <537FB30A.9000303@msgid.tls.msk.ru>
Date: Sat, 24 May 2014 00:43:54 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.5.0
MIME-Version: 1.0
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>, 
	qemu-devel@nongnu.org
References: <1399374955-29082-1-git-send-email-dgilbert@redhat.com>
In-Reply-To: <1399374955-29082-1-git-send-email-dgilbert@redhat.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, wdauchy@gmail.com
Subject: Re: [Qemu-trivial] [PATCH] Fix 'name' option to work with
	-readconfig
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
X-List-Received-Date: Fri, 23 May 2014 20:44:17 -0000

06.05.2014 15:15, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> The 'name' option silently failed when used in config files
> ( http://lists.gnu.org/archive/html/qemu-devel/2014-04/msg00378.html )
> 
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Reported-by: William Dauchy <wdauchy@gmail.com>

Applied to -trivial, after:

 1. Changing Reported/Tested-by as asked by William Dauchy
 2. Adding a subject prefix (vl)
 3. Adding commit message as suggested by Marcus
 4. Adding Marcus's Reviewed-by.

Oh ma... ;)

Thank you!  And please excuse me for it took so long.  It'd be
faster if I hadn't do all th e above ;)

/mjt

