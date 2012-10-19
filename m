Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TP80g-0002sd-53
	for mharc-qemu-trivial@gnu.org; Fri, 19 Oct 2012 04:32:50 -0400
Received: from eggs.gnu.org ([208.118.235.92]:45421)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TP80d-0002jc-31
	for qemu-trivial@nongnu.org; Fri, 19 Oct 2012 04:32:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TP80c-0001me-1d
	for qemu-trivial@nongnu.org; Fri, 19 Oct 2012 04:32:47 -0400
Received: from mail-bk0-f45.google.com ([209.85.214.45]:40672)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TP80W-0001dK-3H; Fri, 19 Oct 2012 04:32:40 -0400
Received: by mail-bk0-f45.google.com with SMTP id jf3so66202bkc.4
	for <multiple recipients>; Fri, 19 Oct 2012 01:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=LyXCaXAvHoUkIwjkGxdKSHnipSRP9t8rYGb2uD2S4iU=;
	b=appNolyUS9IBegeEWGoPxEdi2FUP2M8L/9CVMr0flAHAPxF0fVYfLPxdXKyVLi6b/k
	yjr0Cv6BtuvavMUkvyuGWOKzYYBswFaXn/wioL29Gxof+7sfhkkbZFCY6RP0W8HLvBqM
	SzjSQ7o1zBfSPgqhmLun56x/9nOB89EKK0vRdg6FNarJ6VjCEq1+Q5sBxtLqUSFWf0j7
	ALd0Qqz6tvKzwo1rIrdhKTnBnOFJmx9I+jEE+nE2aPSn/vqttdGihEmVgKIJIjatg9Gu
	uDYA2fIJppKa7BO8XRXKxcogio/VxZbYeIbCjue5VzalDbXbes6PzCCg7CjH2Td+c7Va
	iCCA==
Received: by 10.204.150.210 with SMTP id z18mr143472bkv.53.1350635559581;
	Fri, 19 Oct 2012 01:32:39 -0700 (PDT)
Received: from localhost (188-194-252-80-dynip.superkabel.de. [188.194.252.80])
	by mx.google.com with ESMTPS id k21sm300377bkv.1.2012.10.19.01.32.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 19 Oct 2012 01:32:38 -0700 (PDT)
Date: Fri, 19 Oct 2012 10:32:37 +0200
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20121019083237.GB4656@stefanha-thinkpad.redhat.com>
References: <1350065243-13147-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1350065243-13147-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.214.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] target-arm/neon_helper:
 Remove obsolete FIXME comment
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
X-List-Received-Date: Fri, 19 Oct 2012 08:32:48 -0000

On Fri, Oct 12, 2012 at 07:07:23PM +0100, Peter Maydell wrote:
> Commit 33ebc29 fixed the bugs in the implementation of VQRSHL,
> but forgot to remove the FIXME comment...
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target-arm/neon_helper.c |    1 -
>  1 file changed, 1 deletion(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

