Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S87Lr-0002Jq-6q
	for mharc-qemu-trivial@gnu.org; Thu, 15 Mar 2012 05:52:07 -0400
Received: from eggs.gnu.org ([208.118.235.92]:59590)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1S86aA-0001dJ-Qq
	for qemu-trivial@nongnu.org; Thu, 15 Mar 2012 05:02:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1S86Zn-00058U-Nu
	for qemu-trivial@nongnu.org; Thu, 15 Mar 2012 05:02:50 -0400
Received: from mail-wi0-f181.google.com ([209.85.212.181]:61084)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1S86ZI-00053I-Pz; Thu, 15 Mar 2012 05:01:56 -0400
Received: by mail-wi0-f181.google.com with SMTP id hr17so3494128wib.10
	for <multiple recipients>; Thu, 15 Mar 2012 02:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=JKRhIQH0daOOCP1uKkk3Cxwe+U8NhqaxlFyc6Cev5bM=;
	b=BLiwI1DWXGk00o2leSR8jhd6M9Km9QcS+3JNf7wQqvqGF9Ayp9Q2rckJZ635xQXQoj
	AWaHFL9HWPydYSnQcXuQh1yZyXzy397oyg/XZ/JR14umovXh0ijs/232doRS1P1GhPLH
	5QUHuTy5qRkGRHzp/kZiiOypWcSVG+p+L+NmionuTNO2cjnNynfYhsXPABInv6bkTMVd
	Cqo9DR/l2jqH5Ec2WlZrVV2UlpMKyUD0bMEHjUimRJgk5leqYsAgoyBFMucJUT6njVhU
	5safRmglTtjm4vcQhqnl6x02PwBH8hR4RZSjFp6y4rw8MzRlPSockWSS2SkLOFgiss3w
	FX4w==
Received: by 10.180.104.65 with SMTP id gc1mr13689530wib.13.1331802115250;
	Thu, 15 Mar 2012 02:01:55 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id l5sm3485305wia.11.2012.03.15.02.01.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Mar 2012 02:01:54 -0700 (PDT)
Date: Thu, 15 Mar 2012 08:28:20 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120315082820.GD14640@stefanha-thinkpad.localdomain>
References: <1331243886-19117-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1331243886-19117-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.212.181
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	Anthony Liguori <aliguori@us.ibm.com>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] vnc: Fix packed boolean
	struct members
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
X-List-Received-Date: Thu, 15 Mar 2012 09:52:06 -0000

On Thu, Mar 08, 2012 at 10:58:06PM +0100, Stefan Weil wrote:
> This patch fixes warnings reported by splint:
> 
> For variables which are packed in a single bit, a signed data type
> like 'int' does not make much sense.
> 
> There is no obvious reason why the two values should be packed,
> so I removed the packing and changed the data type to bool
> because both are used as boolean values.
> 
> v2:
> 
> Some versions of gcc complain after this modification,
> for example gcc (Debian 4.4.5-8) 4.4.5):
> 
> ui/vnc-auth-sasl.c: In function ‘vnc_sasl_client_cleanup’:
> ui/vnc-auth-sasl.c:34: error: suggest parentheses around assignment used as truth value
> 
> Obviously, the compiler does not like code which does
> bool = unsigned = bool = 0
> 
> Splitting that code in three statements works.
> 
> Cc: Anthony Liguori <aliguori@us.ibm.com>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  ui/vnc-auth-sasl.c |    4 +++-
>  ui/vnc-auth-sasl.h |    4 ++--
>  2 files changed, 5 insertions(+), 3 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

