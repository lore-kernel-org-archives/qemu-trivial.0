Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TZ03m-0005OU-HB
	for mharc-qemu-trivial@gnu.org; Thu, 15 Nov 2012 09:04:50 -0500
Received: from eggs.gnu.org ([208.118.235.92]:47253)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1TZ03i-0005BK-84
	for qemu-trivial@nongnu.org; Thu, 15 Nov 2012 09:04:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1TZ03f-0002Af-5k
	for qemu-trivial@nongnu.org; Thu, 15 Nov 2012 09:04:46 -0500
Received: from hall.aurel32.net ([2001:470:1f15:c4f::1]:59299)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>)
	id 1TZ03Y-00029f-QU; Thu, 15 Nov 2012 09:04:36 -0500
Received: from wifi-pers-0465.univ-lyon1.fr ([134.214.213.210]
	helo=ohm.aurel32.net)
	by hall.aurel32.net with esmtpsa (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.72) (envelope-from <aurelien@aurel32.net>)
	id 1TZ03S-0000oJ-43; Thu, 15 Nov 2012 15:04:30 +0100
Received: from aurel32 by ohm.aurel32.net with local (Exim 4.80)
	(envelope-from <aurelien@aurel32.net>)
	id 1TZ03M-0005yK-Al; Thu, 15 Nov 2012 15:04:24 +0100
Date: Thu, 15 Nov 2012 15:04:24 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: "Johnson, Eric" <ericj@mips.com>
Message-ID: <20121115140424.GC21046@ohm.aurel32.net>
References: <20121115021501.GA15630@cs.nctu.edu.tw>
	<AD431C1EF67D4B4B801AEC089EB7ED48014488ABEC@exchdb03.mips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
In-Reply-To: <AD431C1EF67D4B4B801AEC089EB7ED48014488ABEC@exchdb03.mips.com>
X-Mailer: Mutt 1.5.21 (2010-09-15)
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:470:1f15:c4f::1
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"chenwj@cs.nctu.edu.tw" <chenwj@cs.nctu.edu.tw>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	=?utf-8?B?6Zmz6Z+L5Lu7IChXZWktUmVuIENoZW4p?= <chenwj@iis.sinica.edu.tw>,
	Jia Liu <proljc@gmail.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] target-mips: Clean up
 microMIPS32 major opcode
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
X-List-Received-Date: Thu, 15 Nov 2012 14:04:49 -0000

On Thu, Nov 15, 2012 at 02:34:31AM +0000, Johnson, Eric wrote:
> Hi Chen,
> 
> Please only remove the POOL48A opcode.
> 
> The others are documented in the microMIPS64 Instruction Set manual ( http://www.mips.com/secure-download/index.dot?product_name=/auth/MD00087-2B-MIPS64BIS-AFP-03.51.pdf ).  See http://www.mips.com/products/architectures/mips64/ for other relavent docs.
> 
> Instead of removing them please surround the POOL32S, DADDIU32, SD32, and LD32 opcodes with
> #if defined(TARGET_MIPS64)
> 

I don't think a #if is necessary there, this makes the code more
difficult to read, while it doesn't change anything on the generated
code.

-- 
Aurelien Jarno                          GPG: 1024D/F1BCDB73
aurelien@aurel32.net                 http://www.aurel32.net

