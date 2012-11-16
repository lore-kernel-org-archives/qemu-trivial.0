Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TZMOo-0004Yo-JF
	for mharc-qemu-trivial@gnu.org; Fri, 16 Nov 2012 08:56:02 -0500
Received: from eggs.gnu.org ([208.118.235.92]:33945)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TZMOk-0004KR-4i
	for qemu-trivial@nongnu.org; Fri, 16 Nov 2012 08:56:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TZMOh-0004YQ-0X
	for qemu-trivial@nongnu.org; Fri, 16 Nov 2012 08:55:58 -0500
Received: from mail-ee0-f45.google.com ([74.125.83.45]:35347)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TZMOa-0004X1-2O; Fri, 16 Nov 2012 08:55:48 -0500
Received: by mail-ee0-f45.google.com with SMTP id d49so1678650eek.4
	for <multiple recipients>; Fri, 16 Nov 2012 05:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=Jk9++MxRmgiaqZE9Sv6n/8Ioaigg/ibtlLQfvexv0NU=;
	b=Sci8XZ6E1nZsIQpgr2KqbgW6ZBxHXn6sSSzP2NanmroO81fruob+yyMJUwGN+nlz37
	lRsbfBZcca7cenJ0GDN4XwFDu5DZuvpGXMi9lnu1BWFGaSpg5FYRURxnno/DEpdC0zrQ
	rAJTc9Fvkml0F8u3OcPhAnd8dBM8bpqK4Noj7svYvYd3Jhsh9P9S5P0zbcZ9kWMoYBpQ
	TuIQNrMwE45E2m26Dqiu2d8qJ6rTkcliYd+hrvnvgjpFulal0vkti+suEE2h9QjBd3p9
	kVbGZTlXar+Af6hfYwJg4bLMLXsmNwUdmSpSplVnvcwVdtrQVSKgN8hpvXS8pi9TmcZP
	FDEQ==
Received: by 10.14.209.136 with SMTP id s8mr13686010eeo.33.1353074147179;
	Fri, 16 Nov 2012 05:55:47 -0800 (PST)
Received: from localhost (178-26-141-215-dynip.superkabel.de. [178.26.141.215])
	by mx.google.com with ESMTPS id s1sm3628424eem.9.2012.11.16.05.55.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 16 Nov 2012 05:55:46 -0800 (PST)
Date: Fri, 16 Nov 2012 14:55:45 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: =?utf-8?B?6Zmz6Z+L5Lu7IChXZWktUmVuIENoZW4p?= <chenwj@iis.sinica.edu.tw>
Message-ID: <20121116135545.GD31927@stefanha-thinkpad.redhat.com>
References: <20121116020552.GA48755@cs.nctu.edu.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20121116020552.GA48755@cs.nctu.edu.tw>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 74.125.83.45
Cc: qemu-trivial@nongnu.org, Jia Liu <proljc@gmail.com>, qemu-devel@nongnu.org,
	"Johnson, Eric" <ericj@mips.com>
Subject: Re: [Qemu-trivial] [PATCH v2] target-mips: Clean up microMIPS32
 major opcode
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
X-List-Received-Date: Fri, 16 Nov 2012 13:56:01 -0000

On Fri, Nov 16, 2012 at 10:05:52AM +0800, 陳韋任 (Wei-Ren Chen) wrote:
> Hi all,
> 
>   I check MIPS microMIPS manual [1], and found the major opcode might be
> wrong. I add a comment to explicitly indicate what manual I am refering
> to, and according that manual I remove microMIPS32 major opcodes 0x1f.
> As for others, like 0x16, 0x17, 0x36 and 0x37, they are for higher-order
> MIPS ISA level or new revision of this microMIPS architecture. Quote
> from Johnson, they are belong MIPS64 [2].
> 
>   Please review, thanks.
> 
> [1] http://www.mips.com/products/architectures/micromips/#specifications
> 
>     MIPS Architecture for Programmers Volume II-B:
>       The microMIPS32 Instruction Set (Revision 3.05)
> 
>     MD00582-2B-microMIPS-AFP-03.05.pdf
> 
> [2] http://www.mips.com/products/architectures/mips64/
> 
>     MIPS Architecture For Programmers
>       Volume II-A: The MIPS64 Instruction Set
> 
>     MD00087-2B-MIPS64BIS-AFP-03.51.pdf
> 
> Signed-off-by: Chen Wei-Ren <chenwj@iis.sinica.edu.tw>
> ---
>  target-mips/translate.c |   24 +++++++++++++++++-------
>  1 files changed, 17 insertions(+), 7 deletions(-)

Please send this through Aurelian as maintainer for target-mips/.  The
discussion on previous the thread show this isn't qemu-trivial material
:).

Stefan

