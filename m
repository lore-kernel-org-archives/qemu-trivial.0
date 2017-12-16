Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eQLXJ-0007rU-PY
	for mharc-qemu-trivial@gnu.org; Sat, 16 Dec 2017 18:06:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37300)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1eQLXG-0007oO-DY
	for qemu-trivial@nongnu.org; Sat, 16 Dec 2017 18:06:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1eQLXF-0006fN-Nt
	for qemu-trivial@nongnu.org; Sat, 16 Dec 2017 18:06:26 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:42643)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
	id 1eQLXB-0006W2-OL; Sat, 16 Dec 2017 18:06:21 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
	by localhost (Postfix) with SMTP id 7D8727456BC;
	Sun, 17 Dec 2017 00:06:18 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
	id 545D074569D; Sun, 17 Dec 2017 00:06:18 +0100 (CET)
Message-Id: <cover.1513465066.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Date: Sat, 16 Dec 2017 23:57:46 +0100
To: qemu-devel@nongnu.org,
    qemu-trivial@nongnu.org
Cc: Magnus Damm <magnus.damm@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	David Gibson <david@gibson.dropbear.id.au>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:738:2001:2001::2001
Subject: [Qemu-trivial] [PATCH 0/2] More SM501 improvements
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
X-List-Received-Date: Sat, 16 Dec 2017 23:06:27 -0000

Two simple patches to add some more registers that were found to be
accessed by some guests.

BALATON Zoltan (3):
  sm501: Add panel hardware cursor registers also to read function
  sm501: Add some more unimplemented registers

