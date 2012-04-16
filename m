Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SJigT-0002ua-HX
	for mharc-qemu-trivial@gnu.org; Mon, 16 Apr 2012 05:57:21 -0400
Received: from eggs.gnu.org ([208.118.235.92]:34281)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SJigM-0002b1-DE
	for qemu-trivial@nongnu.org; Mon, 16 Apr 2012 05:57:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SJigG-0007PS-3D
	for qemu-trivial@nongnu.org; Mon, 16 Apr 2012 05:57:13 -0400
Received: from mail-we0-f173.google.com ([74.125.82.173]:51796)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1SJig8-0007O7-8H; Mon, 16 Apr 2012 05:57:00 -0400
Received: by werp12 with SMTP id p12so3752100wer.4
	for <multiple recipients>; Mon, 16 Apr 2012 02:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=A4ZsPeD0el49cvZ5zLRghbZ0lpWJJYruCLZqJHL8+Nw=;
	b=TuIjvu36FYZVdXTQyrC5rV14MPA6VJjp2tlU0hM32Ecc1BoN3hEflj72qLtBtWoTDo
	DPYazARFp8ShMtAIK+AwWxDiEIf4sfS6gqH3vIbpbKR72iMjx838J2LyogxnLHsvNueW
	1/2b4D02Z4xDqHke/CmHOjxv6vKMzMytkKbeJ2QVLDsUwNf6N1YNWZGw2DkMdBb2C1IA
	TEgXau++LVCIvA6k/IBgLBDznjCEH8HQDyV7v4IhDTeCSwzh0GgvQE1Oie0RWyw3Y2LY
	MtUQj5Ancxqx95KL3HJWvzjCEo4fJo8d2Kwu+LppU2pZKgCE6EZZKNBVYo1TVxdm0p1Y
	LupA==
Received: by 10.216.139.156 with SMTP id c28mr6317748wej.57.1334570217550;
	Mon, 16 Apr 2012 02:56:57 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice2n1.emea.ibm.com. [195.212.29.75])
	by mx.google.com with ESMTPS id
	gd4sm30022724wib.6.2012.04.16.02.56.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 Apr 2012 02:56:56 -0700 (PDT)
Date: Mon, 16 Apr 2012 10:56:54 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120416095654.GA5676@stefanha-thinkpad.localdomain>
References: <1333310850-28767-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1333310850-28767-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] qxl: Add missing GCC_FMT_ATTR and fix
 format specifier
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
X-List-Received-Date: Mon, 16 Apr 2012 09:57:20 -0000

On Sun, Apr 01, 2012 at 10:07:30PM +0200, Stefan Weil wrote:
> val is an uint64_t, therefore %d was not correct.
> 
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  hw/qxl.c |    2 +-
>  hw/qxl.h |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

