Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WOV6b-0007dL-52
	for mharc-qemu-trivial@gnu.org; Fri, 14 Mar 2014 12:37:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48030)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WOV6S-0007JE-M9
	for qemu-trivial@nongnu.org; Fri, 14 Mar 2014 12:37:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WOV6M-0007Gf-QZ
	for qemu-trivial@nongnu.org; Fri, 14 Mar 2014 12:37:00 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:40206)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WOV62-00078m-Rz; Fri, 14 Mar 2014 12:36:35 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 0F63541CAF;
	Fri, 14 Mar 2014 20:36:34 +0400 (MSK)
Message-ID: <53233011.4010909@msgid.tls.msk.ru>
Date: Fri, 14 Mar 2014 20:36:33 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1394185418-30197-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1394185418-30197-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <rth@twiddle.net>, qemu-stable@nongnu.org,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] configure: Don't use __int128_t for
 clang versions before 3.2
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
X-List-Received-Date: Fri, 14 Mar 2014 16:37:07 -0000

07.03.2014 13:43, Stefan Weil wrote:
> Those versions don't fully support __int128_t.
> 
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
> 
> See http://stackoverflow.com/questions/16447808/bug-with-int128-t-in-clang
> for more details. Debian wheezy uses clang 3.0 and shows this bug.
> 
> I did not test whether the QEMU code will work nevertheless, but I think
> it's better to be on the safe side and disable __int128_t for old clang
> versions.

Thanks, applied to -trivial.

/mjt

