Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TYztC-00018U-FY
	for mharc-qemu-trivial@gnu.org; Thu, 15 Nov 2012 08:53:54 -0500
Received: from eggs.gnu.org ([208.118.235.92]:58310)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1TYzt8-00010n-0N
	for qemu-trivial@nongnu.org; Thu, 15 Nov 2012 08:53:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1TYzt4-0006pb-Tu
	for qemu-trivial@nongnu.org; Thu, 15 Nov 2012 08:53:49 -0500
Received: from hall.aurel32.net ([2001:470:1f15:c4f::1]:59258)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1TYzt4-0006p7-Mn
	for qemu-trivial@nongnu.org; Thu, 15 Nov 2012 08:53:46 -0500
Received: from wifi-pers-0465.univ-lyon1.fr ([134.214.213.210]
	helo=ohm.aurel32.net)
	by hall.aurel32.net with esmtpsa (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.72) (envelope-from <aurelien@aurel32.net>)
	id 1TYzt2-00007B-Fe; Thu, 15 Nov 2012 14:53:44 +0100
Received: from aurel32 by ohm.aurel32.net with local (Exim 4.80)
	(envelope-from <aurelien@aurel32.net>)
	id 1TYzsw-0005rm-Ti; Thu, 15 Nov 2012 14:53:38 +0100
Date: Thu, 15 Nov 2012 14:53:38 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: =?utf-8?B?6Zmz6Z+L5Lu7IChXZWktUmVuIENoZW4p?= <chenwj@iis.sinica.edu.tw>
Message-ID: <20121115135338.GA21046@ohm.aurel32.net>
References: <20121114024954.GA63683@cs.nctu.edu.tw>
	<20121114164521.GA5877@ohm.aurel32.net>
	<20121114235704.GB11985@cs.nctu.edu.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20121114235704.GB11985@cs.nctu.edu.tw>
X-Mailer: Mutt 1.5.21 (2010-09-15)
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:470:1f15:c4f::1
Cc: qemu-trivial@nongnu.org
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
X-List-Received-Date: Thu, 15 Nov 2012 13:53:53 -0000

On Thu, Nov 15, 2012 at 07:57:04AM +0800, 陳韋任 (Wei-Ren Chen) wrote:
> On Wed, Nov 14, 2012 at 05:45:21PM +0100, Aurelien Jarno wrote:
> > On Wed, Nov 14, 2012 at 10:49:55AM +0800, 陳韋任 (Wei-Ren Chen) wrote:
> > > Hi all,
> > > 
> > >   While reading microMIPS decoding, I found a possible wrong opcode
> > > encoding. According to [1] page 337, the bits 13..12 for MULTU is
> > > 0x01 rather than 0x00. Please review, thanks.
> > > 
> > > [1] MIPS Architecture for Programmers VolumeIV-e: The MIPS DSP
> > >     Application-Specific Extension to the microMIPS32 Architecture
> > 
> > This is indeed correct, but I guess the page you meant is 166. Page 337
> > refers to the original MULTU instruction from the MIPS Architecture for
> > Programmers Volume II-B: The microMIPS32 Instruction Set.
> > 
> > On the other the microMIPS32 encoding for DSP instruction is not yet
> > supported.
> 
>   Maybe we can start cleanup it a little bit. ;) Is this OK to commit?
> 

My point was that the patch what correct, but not the comment. I have
committed it after fixing the comment.

-- 
Aurelien Jarno                          GPG: 1024D/F1BCDB73
aurelien@aurel32.net                 http://www.aurel32.net

