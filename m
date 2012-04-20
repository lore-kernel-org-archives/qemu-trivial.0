Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SLD0s-0005iY-AG
	for mharc-qemu-trivial@gnu.org; Fri, 20 Apr 2012 08:32:34 -0400
Received: from eggs.gnu.org ([208.118.235.92]:35095)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SLD0m-0005S5-4W
	for qemu-trivial@nongnu.org; Fri, 20 Apr 2012 08:32:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SLD0h-0005HP-Ex
	for qemu-trivial@nongnu.org; Fri, 20 Apr 2012 08:32:27 -0400
Received: from mail-ee0-f45.google.com ([74.125.83.45]:47837)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1SLD0W-0005GZ-Mn; Fri, 20 Apr 2012 08:32:12 -0400
Received: by eeit10 with SMTP id t10so2816707eei.4
	for <multiple recipients>; Fri, 20 Apr 2012 05:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ydGYYkRrTzuL+8/MAcvUIEL1D6H549hG3hhVs9b0ESM=;
	b=NsMsZjmJxwjRAmybWoR+HoMfv7dgeLh3p8UbtW3jhAzFX0x3QVn2WpIAUgRRdbn7aZ
	RLZFRq8KblWY9cXaCX4AOHpX0JxDzhnkf4w/TJMhGfHF8R9puWc+LOZtYigFEAKhgDQ7
	ixRtB+3vwpEyLmvpErDhTl+pbBsO9iDtYvl1a0NGMTXAHPTd/yxhLCIGFIYPXFfpbbv9
	cd/uIjzqjke21KtHlw8v5Z/pcGq6tzOpMs4K3zy7OtbLF+yuxs+s7qmnqDm5DctrdLSG
	4f/6ytelGKWtyIOjIywnmka+cQWeoiNq8D3G9fyQkGHgJbcxE3PQq/wUtCXXl0x+VEWG
	Y7zg==
Received: by 10.213.21.204 with SMTP id k12mr189142ebb.109.1334924682088;
	Fri, 20 Apr 2012 05:24:42 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice1n1.emea.ibm.com. [195.212.29.67])
	by mx.google.com with ESMTPS id
	q45sm25578809eem.7.2012.04.20.05.24.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 20 Apr 2012 05:24:41 -0700 (PDT)
Date: Fri, 20 Apr 2012 13:24:40 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>
Message-ID: <20120420122440.GA13494@stefanha-thinkpad.localdomain>
References: <1334326641-30837-1-git-send-email-stefanha@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1334326641-30837-1-git-send-email-stefanha@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.83.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] gitignore: ignore qtest
	binaries
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
X-List-Received-Date: Fri, 20 Apr 2012 12:32:33 -0000

On Fri, Apr 13, 2012 at 03:17:21PM +0100, Stefan Hajnoczi wrote:
> Signed-off-by: Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>
> ---
>  .gitignore |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/.gitignore b/.gitignore
> index 9859c7d..db74219 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -89,3 +89,4 @@ cscope.*
>  tags
>  TAGS
>  *~
> +tests/*-test

Dropped in favor of the patch from David Gibson
<david@gibson.dropbear.id.au> which does more.

Stefan

