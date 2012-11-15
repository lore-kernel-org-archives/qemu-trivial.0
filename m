Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TYzw4-0002xD-Ed
	for mharc-qemu-trivial@gnu.org; Thu, 15 Nov 2012 08:56:52 -0500
Received: from eggs.gnu.org ([208.118.235.92]:33992)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1TYzw0-0002vH-MR
	for qemu-trivial@nongnu.org; Thu, 15 Nov 2012 08:56:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1TYzvx-0007oi-Ko
	for qemu-trivial@nongnu.org; Thu, 15 Nov 2012 08:56:48 -0500
Received: from hall.aurel32.net ([2001:470:1f15:c4f::1]:59272)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1TYzvx-0007nd-DC
	for qemu-trivial@nongnu.org; Thu, 15 Nov 2012 08:56:45 -0500
Received: from wifi-pers-0465.univ-lyon1.fr ([134.214.213.210]
	helo=ohm.aurel32.net)
	by hall.aurel32.net with esmtpsa (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.72) (envelope-from <aurelien@aurel32.net>)
	id 1TYzvv-0000Iz-Vj; Thu, 15 Nov 2012 14:56:44 +0100
Received: from aurel32 by ohm.aurel32.net with local (Exim 4.80)
	(envelope-from <aurelien@aurel32.net>)
	id 1TYzvq-0005sZ-Ap; Thu, 15 Nov 2012 14:56:38 +0100
Date: Thu, 15 Nov 2012 14:56:38 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: =?utf-8?B?6Zmz6Z+L5Lu7IChXZWktUmVuIENoZW4p?= <chenwj@iis.sinica.edu.tw>
Message-ID: <20121115135638.GB21046@ohm.aurel32.net>
References: <20121114024954.GA63683@cs.nctu.edu.tw>
	<20121114164521.GA5877@ohm.aurel32.net>
	<20121115011719.GA13562@cs.nctu.edu.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20121115011719.GA13562@cs.nctu.edu.tw>
X-Mailer: Mutt 1.5.21 (2010-09-15)
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:470:1f15:c4f::1
Cc: qemu-trivial@nongnu.org, Jia Liu <proljc@gmail.com>
Subject: Re: [Qemu-trivial] [PATCH] Possible wrong microMIPS opcode encoding
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
X-List-Received-Date: Thu, 15 Nov 2012 13:56:51 -0000

On Thu, Nov 15, 2012 at 09:17:20AM +0800, 陳韋任 (Wei-Ren Chen) wrote:
> Hi Aurelien,
> 
>   off the topic. Do you happen to know if GCC or whatever compiler
> support microMIPS? I don't see any option used to produce microMIPS
> code on GCC manual [1]. Thanks.
> 

There are some patches floating around to add a -mmicromips option to
GCC, but they haven't been merged yet.

-- 
Aurelien Jarno                          GPG: 1024D/F1BCDB73
aurelien@aurel32.net                 http://www.aurel32.net

