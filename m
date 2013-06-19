Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UpD52-0000Zc-DT
	for mharc-qemu-trivial@gnu.org; Wed, 19 Jun 2013 03:45:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34034)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UpD4z-0000UE-Go
	for qemu-trivial@nongnu.org; Wed, 19 Jun 2013 03:45:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UpD4y-0000ga-FK
	for qemu-trivial@nongnu.org; Wed, 19 Jun 2013 03:45:21 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:38789)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UpD4s-0000fc-Kv; Wed, 19 Jun 2013 03:45:14 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id CD4E341974;
	Wed, 19 Jun 2013 11:45:13 +0400 (MSK)
Message-ID: <51C16188.7080201@msgid.tls.msk.ru>
Date: Wed, 19 Jun 2013 11:45:12 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/17.0 Icedove/17.0
MIME-Version: 1.0
To: Anthony PERARD <anthony.perard@citrix.com>
References: <1371487106-17194-1-git-send-email-anthony.perard@citrix.com>
In-Reply-To: <1371487106-17194-1-git-send-email-anthony.perard@citrix.com>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, QEMU-devel <qemu-devel@nongnu.org>,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] qxl: Fix QXLRam initialisation.
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
X-List-Received-Date: Wed, 19 Jun 2013 07:45:22 -0000

17.06.2013 20:38, Anthony PERARD wrote:> The qxl driver expect NULL for QXLRam.memory_configs, but this is never
> initialized.

Thanks, applied to the trivial patches queue.

/mjt

