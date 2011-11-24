Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RTWj8-0008U5-E9
	for mharc-qemu-trivial@gnu.org; Thu, 24 Nov 2011 05:40:22 -0500
Received: from eggs.gnu.org ([140.186.70.92]:32910)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RTWj5-0008Ie-At
	for qemu-trivial@nongnu.org; Thu, 24 Nov 2011 05:40:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RTWj1-0005ik-BQ
	for qemu-trivial@nongnu.org; Thu, 24 Nov 2011 05:40:19 -0500
Received: from mail-bw0-f45.google.com ([209.85.214.45]:54090)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RTWiq-0005dg-T7; Thu, 24 Nov 2011 05:40:05 -0500
Received: by bkbzu5 with SMTP id zu5so3038229bkb.4
	for <multiple recipients>; Thu, 24 Nov 2011 02:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=wzhp37I9KE5Vs3B090gtJHqcYgGECrGnB8TVdvhlIOQ=;
	b=GimgcF6UQxkU6ycs7/mKsi7x+hqnZ8asX2zFztg39xYhhkWXggpc8jG44qmHvKm3+b
	OAVsHZuUe+pbAXE03HJqBqFLVi6pVN/8uAMJim54/eZrka1hBtex8yRqpbDFrBEyoRMQ
	ETwwcc2zaOxBcpa7fiznj18/wNt18ESuSn2u8=
Received: by 10.204.152.25 with SMTP id e25mr29113106bkw.51.1322131203474;
	Thu, 24 Nov 2011 02:40:03 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id
	n25sm24996933fah.15.2011.11.24.02.40.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 Nov 2011 02:40:02 -0800 (PST)
Date: Thu, 24 Nov 2011 10:40:01 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20111124104001.GA7227@stefanha-thinkpad.localdomain>
References: <1322069204-1824-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1322069204-1824-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.214.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH 0/2] configure: minor improvements to
 config.log
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
X-List-Received-Date: Thu, 24 Nov 2011 10:40:20 -0000

On Wed, Nov 23, 2011 at 05:26:42PM +0000, Peter Maydell wrote:
> Two trivial patches which make it a little easier to look at config.log
> and figure out what's going on.
> 
> The next step down this road would probably be something like
>    test_start() {
>        echo "# Checking for $1..." >> config.log
>    }
> 
> and then lots of:
>    test_start "zlib"
> in the relevant places.
>  
> 
> 
> Peter Maydell (2):
>   configure: Include #define name in check_define compiler error
>   configure: Print a banner comment at the top of config.log
> 
>  configure |    7 ++++++-
>  1 files changed, 6 insertions(+), 1 deletions(-)

Thanks, applied to the trivial patches -next tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches-next

Stefan

