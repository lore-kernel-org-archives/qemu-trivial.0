Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TP87h-0008TQ-Ac
	for mharc-qemu-trivial@gnu.org; Fri, 19 Oct 2012 04:40:05 -0400
Received: from eggs.gnu.org ([208.118.235.92]:45194)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TP87Z-0008NI-M3
	for qemu-trivial@nongnu.org; Fri, 19 Oct 2012 04:40:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TP87T-0003mj-Te
	for qemu-trivial@nongnu.org; Fri, 19 Oct 2012 04:39:57 -0400
Received: from mail-bk0-f45.google.com ([209.85.214.45]:60175)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TP87T-0003ma-Kw; Fri, 19 Oct 2012 04:39:51 -0400
Received: by mail-bk0-f45.google.com with SMTP id jf3so69661bkc.4
	for <multiple recipients>; Fri, 19 Oct 2012 01:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=Mb1kcSoWxEG/qM/h7S6QC3xJe1OXZ92VVFSaafFbzgw=;
	b=Y4lRhF58L2DfpwEMdCoK/8Sm5D3T1V1W2NTkvkoLJkRgV52G/tobP2IaRbnZ/BveqY
	llsGbjWukTGW/1s0Gl5Rfco6EyKrRqY094iJw+wz0ni7+5BlEW5YR6KsB7ROnQQyPeab
	+NP338SAinptCHVlLDTBu1gyEMA03nxyrkA1doxu/onIlEUOuYbflWj02z91mwiWR6P3
	7eHv/oY62TWoVVZBPnTILE1iivnZdUGXM4WVBCp+T9l45jO/6aN8ZA80702kSLasrhNc
	x/37a51xG56FBTG9xexXclbv4HFGsSnd/fO9uhPPzPTcgpbxdN9Goi5WRLhTEdRpwXxB
	A/QA==
Received: by 10.205.118.136 with SMTP id fq8mr154506bkc.24.1350635990516;
	Fri, 19 Oct 2012 01:39:50 -0700 (PDT)
Received: from localhost (188-194-252-80-dynip.superkabel.de. [188.194.252.80])
	by mx.google.com with ESMTPS id e13sm315954bkw.12.2012.10.19.01.39.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 19 Oct 2012 01:39:49 -0700 (PDT)
Date: Fri, 19 Oct 2012 10:39:48 +0200
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20121019083948.GE4656@stefanha-thinkpad.redhat.com>
References: <1350496430-14429-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1350496430-14429-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.214.45
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] net/tap-win32: Fix compiler warning
 caused by missing include statement
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
X-List-Received-Date: Fri, 19 Oct 2012 08:40:03 -0000

On Wed, Oct 17, 2012 at 07:53:50PM +0200, Stefan Weil wrote:
> The include file for net_init_tap was missing:
> 
> net/tap-win32.c:703:
>  warning: no previous prototype for ‘net_init_tap’
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  net/tap-win32.c |    1 +
>  1 file changed, 1 insertion(+)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

