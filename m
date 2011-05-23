Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QOcna-0000Tv-6T
	for mharc-qemu-trivial@gnu.org; Mon, 23 May 2011 17:36:26 -0400
Received: from eggs.gnu.org ([140.186.70.92]:54770)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1QOcnX-0000Nx-GD
	for qemu-trivial@nongnu.org; Mon, 23 May 2011 17:36:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1QOcnW-0002Qn-D0
	for qemu-trivial@nongnu.org; Mon, 23 May 2011 17:36:23 -0400
Received: from hall.aurel32.net ([88.191.126.93]:56517)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>)
	id 1QOcnU-0002QU-7G; Mon, 23 May 2011 17:36:20 -0400
Received: from [2001:470:d4ed:0:5e26:aff:fe2b:6f5b] (helo=volta.aurel32.net)
	by hall.aurel32.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <aurelien@aurel32.net>)
	id 1QOcnT-0000M0-L3; Mon, 23 May 2011 23:36:19 +0200
Received: from aurel32 by volta.aurel32.net with local (Exim 4.76)
	(envelope-from <aurelien@aurel32.net>)
	id 1QOcnS-0002Bi-8J; Mon, 23 May 2011 23:36:18 +0200
Date: Mon, 23 May 2011 23:36:18 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20110523213618.GA28505@volta.aurel32.net>
References: <1306142027-29995-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
In-Reply-To: <1306142027-29995-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: Mutt 1.5.21 (2010-09-15)
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 88.191.126.93
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: Document
 --disable-slirp option in --help
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
X-List-Received-Date: Mon, 23 May 2011 21:36:24 -0000

On Mon, May 23, 2011 at 10:13:47AM +0100, Peter Maydell wrote:
> The --disable-slirp option was undocumented; add it to configure's
> --help output.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  configure |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)

Thanks, applied.

> diff --git a/configure b/configure
> index d7dba5d..1f95ed7 100755
> --- a/configure
> +++ b/configure
> @@ -964,6 +964,7 @@ echo "  --disable-check-utests   disable check unit-tests"
>  echo "  --enable-check-utests    enable check unit-tests"
>  echo "  --disable-bluez          disable bluez stack connectivity"
>  echo "  --enable-bluez           enable bluez stack connectivity"
> +echo "  --disable-slirp          disable SLIRP userspace network connectivity"
>  echo "  --disable-kvm            disable KVM acceleration support"
>  echo "  --enable-kvm             enable KVM acceleration support"
>  echo "  --disable-nptl           disable usermode NPTL support"
> -- 
> 1.7.1
> 
> 
> 

-- 
Aurelien Jarno                          GPG: 1024D/F1BCDB73
aurelien@aurel32.net                 http://www.aurel32.net

