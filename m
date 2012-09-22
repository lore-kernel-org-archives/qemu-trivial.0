Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TFRkg-0005D8-ID
	for mharc-qemu-trivial@gnu.org; Sat, 22 Sep 2012 11:36:18 -0400
Received: from eggs.gnu.org ([208.118.235.92]:35047)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TFRkc-000595-NA
	for qemu-trivial@nongnu.org; Sat, 22 Sep 2012 11:36:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TFRkY-0000hX-69
	for qemu-trivial@nongnu.org; Sat, 22 Sep 2012 11:36:14 -0400
Received: from mail-we0-f173.google.com ([74.125.82.173]:38389)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TFRkX-0000gj-E9; Sat, 22 Sep 2012 11:36:09 -0400
Received: by weyt11 with SMTP id t11so2282316wey.4
	for <multiple recipients>; Sat, 22 Sep 2012 08:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=c2lqmNxCCXBAeQWSiXZTr6H6cW5ohK1EfIbQx/snA1g=;
	b=YvVColkm83ZroiEx0+qRqWORoVGtOkmssH6iVuTMoCNJKe79sDFIQ0IkaniZ1DQwfr
	9UE4SHiR73PWB05cnMMUJiuI54aZPKo79i/q3dc9UMYo74UgL2OjRAcaKJyXdFLmcOks
	pxNPZtx+1X6U2mlI2nTtKn48qTKcR3wMDqlBvZmMMoK2PwENheJl2mSeI+CPyqDg3Q9d
	nSJNrPkR0wMmM6sL+FmAROBHCH7KOnjWlI/WMfk7M/K25Wmxzu6GHhCCojfkAlAcOV+Y
	BzyruwGbMu7ayCfVTnFhL1Yk2wjYC91QkJ9PWPdvUwhh07gUgj0Dkg82jjv+QvvqK30W
	dcvA==
Received: by 10.181.13.239 with SMTP id fb15mr2026060wid.22.1348328168415;
	Sat, 22 Sep 2012 08:36:08 -0700 (PDT)
Received: from localhost ([109.224.133.37])
	by mx.google.com with ESMTPS id cl8sm4147718wib.10.2012.09.22.08.36.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 22 Sep 2012 08:36:07 -0700 (PDT)
Date: Sat, 22 Sep 2012 16:36:05 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120922153605.GD13216@stefanha-thinkpad.localdomain>
References: <1346496221-11188-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1346496221-11188-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Mathieu Sonet <contact@elasticsheep.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] lm4549: Fix buffer overflow
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
X-List-Received-Date: Sat, 22 Sep 2012 15:36:17 -0000

On Sat, Sep 01, 2012 at 12:43:41PM +0200, Stefan Weil wrote:
> Report from smatch:
> lm4549.c:234 lm4549_write_samples(14) error:
>  buffer overflow 's->buffer' 1024 <= 1024
> 
> There must be enough space to add two entries starting with index
> s->buffer_level, therefore the old check was wrong.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  hw/lm4549.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

I've added Peter's comment to the commit message that the overflow
condition doesn't actually happen since we advance by two at a time.

Stefan

