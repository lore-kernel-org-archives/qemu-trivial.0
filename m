Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T1dj0-0003Ka-Vp
	for mharc-qemu-trivial@gnu.org; Wed, 15 Aug 2012 09:33:30 -0400
Received: from eggs.gnu.org ([208.118.235.92]:53942)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T1diy-0003Dq-Db
	for qemu-trivial@nongnu.org; Wed, 15 Aug 2012 09:33:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T1dix-00021R-C1
	for qemu-trivial@nongnu.org; Wed, 15 Aug 2012 09:33:28 -0400
Received: from mail-wi0-f181.google.com ([209.85.212.181]:53529)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1T1diu-00020o-W1; Wed, 15 Aug 2012 09:33:25 -0400
Received: by wibhm2 with SMTP id hm2so1090176wib.10
	for <multiple recipients>; Wed, 15 Aug 2012 06:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=lvs3S9Y5st6Dgick80mPoHamfJF5+fJcV51FiFyaFjc=;
	b=CG3bMk8QTI5sqgBKb2tqowKbA87RLwXm8sjflK0ZA2Gn9jP3UFlK1cPMx6mfgeJrIf
	WRns5OYyh/gqZ98d40fgL9DMiYPTHjyz3pku+lqWcht/m3giiojvZpvQuIEOVGlA5Tv4
	SeoG5Qq21KW6U4z9FVMsQ6jBRyLGS1/YmMdQcSZ3SG6Q/mwGv/PfUGeEaNtC3/xJLVdy
	Y7ObqUTc6ipiUd8CTw1bC295gJwxH3tL80dRa/YFytDJPlol18Kx9mk7keVSap9HKdNg
	C3tyIi/v1cEeRNazlDfVLHQ94hwZh9sFIet2Kat+c5feyN/b7VT0VrxenGzq4/1zm8hC
	Q1mg==
Received: by 10.216.243.10 with SMTP id j10mr10446112wer.211.1345037603972;
	Wed, 15 Aug 2012 06:33:23 -0700 (PDT)
Received: from localhost ([109.224.133.37])
	by mx.google.com with ESMTPS id fr4sm4606875wib.8.2012.08.15.06.33.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 15 Aug 2012 06:33:23 -0700 (PDT)
Date: Wed, 15 Aug 2012 14:33:19 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20120815133319.GB10742@stefanha-thinkpad.localdomain>
References: <1345030164-2496-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1345030164-2496-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.212.181
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH v2] Makefile: Avoid explicit list of
 directories in clean target
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
X-List-Received-Date: Wed, 15 Aug 2012 13:33:29 -0000

On Wed, Aug 15, 2012 at 12:29:24PM +0100, Peter Maydell wrote:
> Avoid having an explicit list of directories in the 'clean'
> target by using 'find' to remove all .o and .d files instead.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Changes v1->v2: use portable 'find -exec' rather than unsafe 'find | xargs'
> or unportable 'find -print0 | xargs -0'.
> 
>  Makefile |    7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

