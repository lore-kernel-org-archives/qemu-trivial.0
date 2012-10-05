Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TK8HH-0000C1-3C
	for mharc-qemu-trivial@gnu.org; Fri, 05 Oct 2012 09:49:19 -0400
Received: from eggs.gnu.org ([208.118.235.92]:59542)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TK8HB-0008Ms-Kn
	for qemu-trivial@nongnu.org; Fri, 05 Oct 2012 09:49:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TK8HA-0000zc-Jj
	for qemu-trivial@nongnu.org; Fri, 05 Oct 2012 09:49:13 -0400
Received: from mail-bk0-f45.google.com ([209.85.214.45]:42379)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TK8H1-0000vj-7i; Fri, 05 Oct 2012 09:49:03 -0400
Received: by mail-bk0-f45.google.com with SMTP id jf3so809294bkc.4
	for <multiple recipients>; Fri, 05 Oct 2012 06:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=X9jAqCEo0Jq1nqnCh9f6+H42pCUdV+RNwSy1oDPxfbg=;
	b=UVGjCttr7+G3ATlSQtidaSxRQmEZxr914MRF0kGgGfOpPuuxFo01ZoJo1xlVxlenJn
	bi9VfnxV94kz4qgFYJTI2Pldo0opk4nrbreZg8Yo8pUwMtFKVcWaw1GSl172RHpnb6Of
	VOxm3FlzbjgAzuiNkw/H2lwaj4SC7zwU6ARj+hDUvHn500R3Tds5OK5wQGDiWPapa+V0
	/ZZM8GbVr+RyTeEbqifVLci7/jZWO0sVINnlz1yxhJ5P5iBLUddFn+pLAdI2EB1ALOhK
	jIrQ9+D8AaeTlKbh+IPKq0jHdYoaO99MPt3FN/vhHTaC4UdC7054fTTND3IODcyuT3lp
	DK8g==
Received: by 10.205.118.135 with SMTP id fq7mr2744467bkc.50.1349444941856;
	Fri, 05 Oct 2012 06:49:01 -0700 (PDT)
Received: from localhost (188-194-152-192-dynip.superkabel.de.
	[188.194.152.192])
	by mx.google.com with ESMTPS id 9sm7752554bkq.13.2012.10.05.06.48.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 05 Oct 2012 06:49:00 -0700 (PDT)
Date: Fri, 5 Oct 2012 15:48:58 +0200
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20121005134858.GH10951@stefanha-thinkpad.redhat.com>
References: <1349298662-16666-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1349298662-16666-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.214.45
Cc: qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	qemu-devel@nongnu.org, qemu-stable@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] qemu-barrier: Fix compiler version check
 for future gcc versions
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
X-List-Received-Date: Fri, 05 Oct 2012 13:49:18 -0000

On Wed, Oct 03, 2012 at 11:11:02PM +0200, Stefan Weil wrote:
> The current check will give a wrong result for gcc-5.x with x < 4.
> Using QEMU_GNUC_PREREQ is simpler and fixes that issue.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
> 
> With current gcc versions (gcc-4.x) there is no problem.
> Nevertheless, I suggest to fix this in stable versions, too.
> 
> Regards
> 
> Stefan Weil
> 
>  qemu-barrier.h |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

