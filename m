Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T1dfs-00037c-UQ
	for mharc-qemu-trivial@gnu.org; Wed, 15 Aug 2012 09:30:16 -0400
Received: from eggs.gnu.org ([208.118.235.92]:53149)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T1dfn-00032z-0E
	for qemu-trivial@nongnu.org; Wed, 15 Aug 2012 09:30:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T1dfl-0000wh-8w
	for qemu-trivial@nongnu.org; Wed, 15 Aug 2012 09:30:10 -0400
Received: from mail-wi0-f181.google.com ([209.85.212.181]:65197)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T1dfl-0000t6-2L
	for qemu-trivial@nongnu.org; Wed, 15 Aug 2012 09:30:09 -0400
Received: by wibhm2 with SMTP id hm2so1088018wib.10
	for <qemu-trivial@nongnu.org>; Wed, 15 Aug 2012 06:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=cRCD5/Y7kXidcdYnXlAeisSXlYi+tZZxi4OO4FL7SVs=;
	b=eYnyxyp6coIGxjFR0ORLOLSi6ktifyUKgCQ9KA3TI8ElkgUspWFTZGiK56Q2/Gia/f
	Qc33W/xYEPIl5ZV2FF8KRkZl+BIQOpkBAAoXlQjrmaHTG9oQm0jWKdaT3BAPHP3SsEKs
	BNVTx4Y09+iOaR1CbBvTmmGso3C3rnb9kEG7C4Rs5pZruJfofodySo+NbPowHOKTMKzf
	cXfH5J7rpIhMu843dofVnZUM6psv6ZpYC8sX+hhJHbFe3zcIaPzzWZpgXFRSfS9fNqEj
	ozSWbEezd7U5yEMOwMFrLMPAoUlc5AostsmVN2Lx4KnrI4r6+pkjjmUN/a7pgbDulk1A
	rqyA==
Received: by 10.180.97.135 with SMTP id ea7mr37120504wib.11.1345037406293;
	Wed, 15 Aug 2012 06:30:06 -0700 (PDT)
Received: from localhost ([109.224.133.37])
	by mx.google.com with ESMTPS id dc3sm28649176wib.7.2012.08.15.06.30.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 15 Aug 2012 06:30:05 -0700 (PDT)
Date: Wed, 15 Aug 2012 14:30:02 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Alberto Garcia <agarcia@igalia.com>
Message-ID: <20120815133002.GA10742@stefanha-thinkpad.localdomain>
References: <1344975512-15542-1-git-send-email-agarcia@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1344975512-15542-1-git-send-email-agarcia@igalia.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.212.181
Cc: qemu-trivial@nongnu.org, Orit Wasserman <owasserm@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] savevm: fix compiler warning
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
X-List-Received-Date: Wed, 15 Aug 2012 13:30:15 -0000

On Tue, Aug 14, 2012 at 11:18:32PM +0300, Alberto Garcia wrote:
> If we have a 32-bit long then the truncation of a 64-bit value will
> produce a compiler warning unless we make an explicit cast.
> ---
>  savevm.c |    2 +-
>  1 ficheiro modificado, 1 adição(+), 1 eliminado(-)
> 
> diff --git a/savevm.c b/savevm.c
> index 0ea10c9..c89fc4e 100644
> --- a/savevm.c
> +++ b/savevm.c
> @@ -2473,7 +2473,7 @@ int xbzrle_encode_buffer(uint8_t *old_buf, uint8_t *new_buf, int slen,
>          /* word at a time for speed, use of 32-bit long okay */
>          if (!res) {
>              /* truncation to 32-bit long okay */
> -            long mask = 0x0101010101010101ULL;
> +            long mask = (long) 0x0101010101010101ULL;

C99 6.3.1.3 Signed and unsigned integers, paragraph 3:

"Otherwise, the new type is signed and the value cannot be represented
in it; either the result is implementation-defined or an
implementation-defined signal is raised."

The safe way of doing this is by casting to (unsigned long) instead:

"Otherwise, if the new type is unsigned, the value is converted by
repeatedly adding or subtracting one more than the maximum value that
can be represented in the new type until the value is in the range of
the new type."

Stefan

