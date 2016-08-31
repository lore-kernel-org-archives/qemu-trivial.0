Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bfBpB-0007WD-Ie
	for mharc-qemu-trivial@gnu.org; Wed, 31 Aug 2016 16:09:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41986)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1bfBp8-0007Tn-JN
	for qemu-trivial@nongnu.org; Wed, 31 Aug 2016 16:09:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1bfBp6-0002xt-Jd
	for qemu-trivial@nongnu.org; Wed, 31 Aug 2016 16:09:25 -0400
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1]:36713)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>)
	id 1bfBp2-0002wE-Uc; Wed, 31 Aug 2016 16:09:21 -0400
Received: from [2001:bc8:30d7:120:daeb:97ff:feb6:3f19] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.84_2)
	(envelope-from <aurelien@aurel32.net>)
	id 1bfBp1-00044y-17; Wed, 31 Aug 2016 22:09:19 +0200
Received: from aurel32 by ohm.rr44.fr with local (Exim 4.87)
	(envelope-from <aurelien@aurel32.net>)
	id 1bfBp0-00051C-Ff; Wed, 31 Aug 2016 22:09:18 +0200
Date: Wed, 31 Aug 2016 22:09:18 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Reda Sallahi <fullmanet@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Magnus Damm <magnus.damm@gmail.com>
Message-ID: <20160831200918.ufllk5mx72wioyqv@aurel32.net>
References: <20160831163104.6268-1-fullmanet@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160831163104.6268-1-fullmanet@gmail.com>
User-Agent: Mutt/1.6.2-neo (2016-07-23)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:bc8:30d7:100::1
Subject: Re: [Qemu-trivial] [PATCH v2] sh4: fix broken link to documentation
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 31 Aug 2016 20:09:27 -0000

On 2016-08-31 18:31, Reda Sallahi wrote:
> The page that was previously linked in the source code and the README file is
> no longer available so it now returns a 404 error message.
> 
> This puts a previous snapshot from archive.org instead.
> 
> Signed-off-by: Reda Sallahi <fullmanet@gmail.com>
> ---
> Changes from v1:
> * Add the 'https://' part to the link in hw/sh4/shix.c.
> 
>  hw/sh4/shix.c         | 2 +-
>  target-sh4/README.sh4 | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Thanks for the new version.

Acked-by: Aurelien Jarno <aurelien@aurel32.net>

Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                 http://www.aurel32.net

