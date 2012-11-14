Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TYg5s-0008Rn-BK
	for mharc-qemu-trivial@gnu.org; Wed, 14 Nov 2012 11:45:40 -0500
Received: from eggs.gnu.org ([208.118.235.92]:44951)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1TYg5l-0008Q3-UV
	for qemu-trivial@nongnu.org; Wed, 14 Nov 2012 11:45:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1TYg5i-0006KO-Se
	for qemu-trivial@nongnu.org; Wed, 14 Nov 2012 11:45:33 -0500
Received: from hall.aurel32.net ([2001:470:1f15:c4f::1]:53912)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1TYg5i-0006KD-M9
	for qemu-trivial@nongnu.org; Wed, 14 Nov 2012 11:45:30 -0500
Received: from wifi-pers-0465.univ-lyon1.fr ([134.214.213.210]
	helo=ohm.aurel32.net)
	by hall.aurel32.net with esmtpsa (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.72) (envelope-from <aurelien@aurel32.net>)
	id 1TYg5f-0004fj-Bi; Wed, 14 Nov 2012 17:45:27 +0100
Received: from aurel32 by ohm.aurel32.net with local (Exim 4.80)
	(envelope-from <aurelien@aurel32.net>)
	id 1TYg5Z-0003f0-QZ; Wed, 14 Nov 2012 17:45:21 +0100
Date: Wed, 14 Nov 2012 17:45:21 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: =?utf-8?B?6Zmz6Z+L5Lu7IChXZWktUmVuIENoZW4p?= <chenwj@iis.sinica.edu.tw>
Message-ID: <20121114164521.GA5877@ohm.aurel32.net>
References: <20121114024954.GA63683@cs.nctu.edu.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20121114024954.GA63683@cs.nctu.edu.tw>
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
X-List-Received-Date: Wed, 14 Nov 2012 16:45:37 -0000

On Wed, Nov 14, 2012 at 10:49:55AM +0800, 陳韋任 (Wei-Ren Chen) wrote:
> Hi all,
> 
>   While reading microMIPS decoding, I found a possible wrong opcode
> encoding. According to [1] page 337, the bits 13..12 for MULTU is
> 0x01 rather than 0x00. Please review, thanks.
> 
> [1] MIPS Architecture for Programmers VolumeIV-e: The MIPS DSP
>     Application-Specific Extension to the microMIPS32 Architecture

This is indeed correct, but I guess the page you meant is 166. Page 337
refers to the original MULTU instruction from the MIPS Architecture for
Programmers Volume II-B: The microMIPS32 Instruction Set.

On the other the microMIPS32 encoding for DSP instruction is not yet
supported.


> Signed-off-by: Chen Wei-Ren <chenwj@iis.sinica.edu.tw>
> ---
>  target-mips/translate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target-mips/translate.c b/target-mips/translate.c
> index f6fc0c2..01b48fa 100644
> --- a/target-mips/translate.c
> +++ b/target-mips/translate.c
> @@ -10385,7 +10385,7 @@ enum {
>  
>      /* bits 13..12 for 0x32 */
>      MULT_ACC = 0x0,
> -    MULTU_ACC = 0x0,
> +    MULTU_ACC = 0x1,
>  
>      /* bits 15..12 for 0x2c */
>      SEB = 0x2,
> -- 
> 1.7.12.3
> 

-- 
Aurelien Jarno                          GPG: 1024D/F1BCDB73
aurelien@aurel32.net                 http://www.aurel32.net

