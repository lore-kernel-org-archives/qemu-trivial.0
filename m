Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SIcO3-0006gl-Sb
	for mharc-qemu-trivial@gnu.org; Fri, 13 Apr 2012 05:01:47 -0400
Received: from eggs.gnu.org ([208.118.235.92]:56180)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SIcNw-0006Kx-Px
	for qemu-trivial@nongnu.org; Fri, 13 Apr 2012 05:01:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SIcNq-0007Z8-LB
	for qemu-trivial@nongnu.org; Fri, 13 Apr 2012 05:01:40 -0400
Received: from mail-we0-f173.google.com ([74.125.82.173]:64018)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1SIcNi-0007YP-DS; Fri, 13 Apr 2012 05:01:26 -0400
Received: by werp12 with SMTP id p12so2077345wer.4
	for <multiple recipients>; Fri, 13 Apr 2012 02:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=lPOu32MGPRxL6py8tyTyoDFOQBr6JrK6fLl5s2YpjDE=;
	b=FVkquKcLE9gVP+PYAiT9mue+DVjB5KuoWDOLWYtzkQQ6pSsOuEP/J4SZby9odiOHE1
	++FsZJaQj9+byH58Wwpsbi27L80wdlVkmS1aKuhej9tbWgX/FqUYZ3rhVwP3l3VL18Nv
	ZeFShnJZjRYzUXaJMyVXTz/hUv+riF9g5HmWGzyF6BfbCeZt4B6bjvb55Zh6Q0qFaeHP
	Rs5Wo7R725X8lK4f9OnPO7EMlel5SOZaSwFT4rfbXmjAshQTIGRtYqM8wG4WhFy0mAbf
	PRPaZuL8t7TAZL3HVkuQoUGyeKfBYBqbhMEvmX76i39KsyW40stAmOIr1+zTULBCQvvP
	x2tw==
Received: by 10.180.94.33 with SMTP id cz1mr2761252wib.13.1334307683717;
	Fri, 13 Apr 2012 02:01:23 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice2n1.emea.ibm.com. [195.212.29.75])
	by mx.google.com with ESMTPS id fz9sm3356426wib.3.2012.04.13.02.01.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Apr 2012 02:01:23 -0700 (PDT)
Date: Fri, 13 Apr 2012 10:01:18 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20120413090118.GB16000@stefanha-thinkpad.localdomain>
References: <1334254192-26204-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1334254192-26204-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Boris Matti <swiftos@lavabit.com>, patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH] configure: Insist on a Python 2,
 not Python 3
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
X-List-Received-Date: Fri, 13 Apr 2012 09:01:47 -0000

On Thu, Apr 12, 2012 at 07:09:52PM +0100, Peter Maydell wrote:
> Our Python scripts require Python 2 and will fail on Python 3, eg:
>   File "/home/petmay01/linaro/qemu-from-laptop/qemu/scripts/qapi-commands.py", line 378
>       except getopt.GetoptError, err:
>                                ^
>   SyntaxError: invalid syntax
> 
> Add a check to configure that Python is not a Python 3, so we can
> fail with a comprehensible error rather than an obscure one.
> 
> Reported-by: Boris Matti <swiftos@lavabit.com>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  configure |    8 ++++++++
>  1 files changed, 8 insertions(+), 0 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

