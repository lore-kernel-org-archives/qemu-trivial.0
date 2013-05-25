Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UgApZ-0008VD-Ly
	for mharc-qemu-trivial@gnu.org; Sat, 25 May 2013 05:32:05 -0400
Received: from eggs.gnu.org ([208.118.235.92]:35790)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UgApT-0008JS-Ee
	for qemu-trivial@nongnu.org; Sat, 25 May 2013 05:32:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UgApO-0005nU-QS
	for qemu-trivial@nongnu.org; Sat, 25 May 2013 05:31:59 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:56874)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UgAp8-0005lN-Ap; Sat, 25 May 2013 05:31:38 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 920464197B;
	Sat, 25 May 2013 13:31:37 +0400 (MSK)
Message-ID: <51A084F8.3040503@msgid.tls.msk.ru>
Date: Sat, 25 May 2013 13:31:36 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/17.0 Icedove/17.0
MIME-Version: 1.0
To: Ed Maste <emaste@freebsd.org>
References: <1369228899-74124-1-git-send-email-emaste@freebsd.org>
In-Reply-To: <1369228899-74124-1-git-send-email-emaste@freebsd.org>
X-Enigmail-Version: 1.6a1pre
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] configure: remove confusing file
	manipulation
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
X-List-Received-Date: Sat, 25 May 2013 09:32:04 -0000

22.05.2013 17:21, Ed Maste wrote:
> The configure script had some code to manipulate config-host.ld~ (i.e.,
> a common backup filename), comparing it with the newly-generated file.
> I believe the sense of the comparison was backwards.
> 
> Since it seemed to serve little purpose anyway, remove it to avoid any
> confusion.

Thanks, applied to the trivial patches queue.

/mjt

