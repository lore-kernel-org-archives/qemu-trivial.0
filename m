Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T1dsK-0006cv-KY
	for mharc-qemu-trivial@gnu.org; Wed, 15 Aug 2012 09:43:08 -0400
Received: from eggs.gnu.org ([208.118.235.92]:55465)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T1dsI-0006UP-2G
	for qemu-trivial@nongnu.org; Wed, 15 Aug 2012 09:43:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T1dsG-0004cs-UX
	for qemu-trivial@nongnu.org; Wed, 15 Aug 2012 09:43:05 -0400
Received: from mail-wi0-f181.google.com ([209.85.212.181]:63468)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1T1dsE-0004c3-5G; Wed, 15 Aug 2012 09:43:02 -0400
Received: by wibhm2 with SMTP id hm2so1096648wib.10
	for <multiple recipients>; Wed, 15 Aug 2012 06:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=n1TD0PHZ0EEIg705pIwe4cUV9To+wP++DTCFwJYX6ag=;
	b=Ns53u2EsgNO3BiJten4KgUuWzc5dEaLgnLyTNj+Ox51S2W5+p/W84l9i3x71OlIWYu
	9f3FUMdxeO+odGqnWamJoxySd4NqnFDw3g73jJHQjfiT4IP0kdTg4rgZAumvExAb2gQe
	0TzxszhX1POIpdwqj/HlKQvF08uLeZyHF3pt4Xy5epBrlKnumt9Nh8pfkDmcnPqwUG3t
	NHVDXTbHdWVtMzgKmkZN5OqvejBVdq0tWjXZXPR6zLH3g/R+2DvEWZ+Y94CUoTiS9mxR
	J7FgBiwPskFn1MC4+nPSEnj1zYaU8K6nZ/ArNLKWQYZmM2R8Wf6QEjhUF12W1DhO/186
	ggpg==
Received: by 10.180.103.136 with SMTP id fw8mr37142462wib.20.1345038181071;
	Wed, 15 Aug 2012 06:43:01 -0700 (PDT)
Received: from localhost ([109.224.133.37])
	by mx.google.com with ESMTPS id l5sm4683311wix.5.2012.08.15.06.43.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 15 Aug 2012 06:43:00 -0700 (PDT)
Date: Wed, 15 Aug 2012 14:42:57 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20120815134257.GE10742@stefanha-thinkpad.localdomain>
References: <1344615245-25080-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1344615245-25080-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.212.181
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] cputlb.c: Fix out of date
	comment
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
X-List-Received-Date: Wed, 15 Aug 2012 13:43:07 -0000

On Fri, Aug 10, 2012 at 05:14:05PM +0100, Peter Maydell wrote:
> The comment about the return address from get_page_addr_code() was
> well out of date as phys_ram_base has not existed for some time.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  cputlb.c |    4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

