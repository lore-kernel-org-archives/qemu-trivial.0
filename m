Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XhC4M-0006pU-5l
	for mharc-qemu-trivial@gnu.org; Thu, 23 Oct 2014 02:40:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60806)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XhC4E-0006fl-Gm
	for qemu-trivial@nongnu.org; Thu, 23 Oct 2014 02:40:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XhC48-0001rQ-3s
	for qemu-trivial@nongnu.org; Thu, 23 Oct 2014 02:40:14 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:52966)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XhC3v-0001Xc-Gv; Thu, 23 Oct 2014 02:39:55 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id C4C1945AC0;
	Thu, 23 Oct 2014 10:39:54 +0400 (MSK)
Message-ID: <5448A2B9.1060006@msgid.tls.msk.ru>
Date: Thu, 23 Oct 2014 10:39:53 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.8.1
MIME-Version: 1.0
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <1413366669-10192-1-git-send-email-kraxel@redhat.com>
In-Reply-To: <1413366669-10192-1-git-send-email-kraxel@redhat.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] sparse: fix build
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
X-List-Received-Date: Thu, 23 Oct 2014 06:40:20 -0000

On 10/15/2014 01:51 PM, Gerd Hoffmann wrote:
> c++ compiler isn't wrapped with cgcc, resulting in gcc complaining about
> the sparse compiler flags which it doesn't know in case qemu is built
> with --enable-sparse.

Applied to -trivial, thank you!

/mjt

