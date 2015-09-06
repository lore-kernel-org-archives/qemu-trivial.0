Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZYXY8-0007sj-TI
	for mharc-qemu-trivial@gnu.org; Sun, 06 Sep 2015 06:51:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47300)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZYXY7-0007rN-AX
	for qemu-trivial@nongnu.org; Sun, 06 Sep 2015 06:51:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZYXY6-0005l7-Gh
	for qemu-trivial@nongnu.org; Sun, 06 Sep 2015 06:51:51 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:48772)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZYXY0-0005WX-4m; Sun, 06 Sep 2015 06:51:44 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 08C1A409B9;
	Sun,  6 Sep 2015 13:51:43 +0300 (MSK)
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id E8136A76;
	Sun,  6 Sep 2015 13:51:42 +0300 (MSK)
Message-ID: <55EC1ABE.1080106@msgid.tls.msk.ru>
Date: Sun, 06 Sep 2015 13:51:42 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: "Daniel P. Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org
References: <1440587838-25595-1-git-send-email-berrange@redhat.com>
In-Reply-To: <1440587838-25595-1-git-send-email-berrange@redhat.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH 0/7] Misc trivial code cleanups
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
X-List-Received-Date: Sun, 06 Sep 2015 10:51:52 -0000

26.08.2015 14:17, Daniel P. Berrange wrote:
> This is a series of misc trivial code cleanups that I
> originally used to illustrate the use of GNULIB's
> syntax-check facility:
> 
>   http://lists.nongnu.org/archive/html/qemu-devel/2015-07/msg06268.html
> 
> Since it appears the license of the GNULIB syntax-check
> is problematic, this series has separated the fixes out
> from the GNULIB additions, to allow for possibility of
> merging them as-is.

Applied all 7 to -trivial.
With additional patch by Markus being 8/7 ;)

Nice work, thank you!

/mjt

