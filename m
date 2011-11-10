Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ROSts-0007UL-SG
	for mharc-qemu-trivial@gnu.org; Thu, 10 Nov 2011 06:34:32 -0500
Received: from eggs.gnu.org ([140.186.70.92]:50276)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1ROStp-0007JW-Tg
	for qemu-trivial@nongnu.org; Thu, 10 Nov 2011 06:34:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1ROSto-0003gz-Tz
	for qemu-trivial@nongnu.org; Thu, 10 Nov 2011 06:34:29 -0500
Received: from mail-fx0-f45.google.com ([209.85.161.45]:48044)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1ROStl-0003g7-Jl; Thu, 10 Nov 2011 06:34:25 -0500
Received: by faap15 with SMTP id p15so3323575faa.4
	for <multiple recipients>; Thu, 10 Nov 2011 03:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=VwQS7jdlWaB1CHDhM2pUib2Bl4/gpMor7XW7arO5aM4=;
	b=rwVUn5rs141YpX3YfmfRKVrlMW0d9Y0/80vFs4EAgLXY8Eyat83JmH0qwNwcpLljsU
	FJCtlgddOt0gaVjbmm9QhdpSWhpIqdJoFPcUxKKvrQLRBXf//0GEgMfnjKUCxieY9xAF
	s7RMUufDVfVBqpHIqLHwKWnvBnMX8BdhImVHY=
Received: by 10.223.63.206 with SMTP id c14mr11633863fai.3.1320924864531;
	Thu, 10 Nov 2011 03:34:24 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id
	t28sm10747907faf.13.2011.11.10.03.34.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 10 Nov 2011 03:34:24 -0800 (PST)
Date: Thu, 10 Nov 2011 11:34:22 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20111110113422.GB12527@stefanha-thinkpad.localdomain>
References: <1320865194-9779-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1320865194-9779-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.161.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/lan9118.c: Add missing
 'break' to fix buffer overrun
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
X-List-Received-Date: Thu, 10 Nov 2011 11:34:31 -0000

On Wed, Nov 09, 2011 at 06:59:54PM +0000, Peter Maydell wrote:
> Add a missing 'break' statement to fix a buffer overrun when
> executing the EEPROM write-all command. Spotted by Coverity
> (see bug 887883).
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/lan9118.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)

Thanks, applied to the trivial patches tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

Stefan

