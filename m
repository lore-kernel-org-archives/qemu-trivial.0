Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aPRwM-0001dr-2U
	for mharc-qemu-trivial@gnu.org; Sat, 30 Jan 2016 04:35:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39580)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aPRwJ-0001aT-Ri
	for qemu-trivial@nongnu.org; Sat, 30 Jan 2016 04:35:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aPRwJ-0000Dc-2i
	for qemu-trivial@nongnu.org; Sat, 30 Jan 2016 04:35:31 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:36302)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1aPRwD-0000CH-Qp; Sat, 30 Jan 2016 04:35:25 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 3FC4541CA2;
	Sat, 30 Jan 2016 12:35:25 +0300 (MSK)
To: Alistair Francis <alistair.francis@xilinx.com>, qemu-devel@nongnu.org
References: <9aab0156c2f307ece61c3d8106450d736553a0d5.1453141118.git.alistair.francis@xilinx.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Openpgp: id=6EE195D1886E8FFB810D4324457CE0A0804465C5
Organization: Telecom Service, JSC
Message-ID: <56AC83DD.30503@msgid.tls.msk.ru>
Date: Sat, 30 Jan 2016 12:35:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.5.0
MIME-Version: 1.0
In-Reply-To: <9aab0156c2f307ece61c3d8106450d736553a0d5.1453141118.git.alistair.francis@xilinx.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: christian.liebhardt@arcor.de, qemu-trivial@nongnu.org,
	christian.liebhardt@keysight.com
Subject: Re: [Qemu-trivial] [PATCH v1 1/1] qom: Correct
	object_property_get_int() description
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
X-List-Received-Date: Sat, 30 Jan 2016 09:35:32 -0000

18.01.2016 21:42, Alistair Francis wrote:
> The description of object_property_get_int() stated that on an error
> it returns NULL. This is not the case and the function will return -1
> if an error occurs. Update the commented documentation accordingly.

Applied to -trivial, thanks!

/mjt

