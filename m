Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d1zFy-00054x-FH
	for mharc-qemu-trivial@gnu.org; Sat, 22 Apr 2017 13:55:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59697)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1d1zFv-00054J-Rn
	for qemu-trivial@nongnu.org; Sat, 22 Apr 2017 13:55:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1d1zFu-0008Pu-SS
	for qemu-trivial@nongnu.org; Sat, 22 Apr 2017 13:55:35 -0400
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1]:36360)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aurelien@aurel32.net>)
	id 1d1zFs-0008Om-Ju; Sat, 22 Apr 2017 13:55:32 -0400
Received: from [2001:bc8:30d7:120:9bb5:8936:7e6a:9e36] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <aurelien@aurel32.net>)
	id 1d1zFg-0001F4-RW; Sat, 22 Apr 2017 19:55:20 +0200
Received: from aurel32 by ohm.local with local (Exim 4.89)
	(envelope-from <aurelien@aurel32.net>)
	id 1d1xAZ-0005vA-MD; Sat, 22 Apr 2017 17:41:55 +0200
Date: Sat, 22 Apr 2017 17:41:55 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	David Gibson <david@gibson.dropbear.id.au>
Message-ID: <20170422154155.cnberyxmr6bt2ghj@aurel32.net>
References: <cover.1492787889.git.balaton@eik.bme.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1492787889.git.balaton@eik.bme.hu>
User-Agent: NeoMutt/20170113 (1.7.2)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:bc8:30d7:100::1
Subject: Re: [Qemu-trivial] [PATCH v7 00/13] Improvements for SM501 display
 controller emulation
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
X-List-Received-Date: Sat, 22 Apr 2017 17:55:37 -0000

On 2017-04-21 17:18, BALATON Zoltan wrote:
> v7: Define default values for some variables to avoid an (invalid)
>     warning from gcc 6 or 7 as suggested by Aurelien Jarno.

Thanks a lot for this new version, I confirm it now builds fine with GCC
6 or 7.

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                 http://www.aurel32.net

