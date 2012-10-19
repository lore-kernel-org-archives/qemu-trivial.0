Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TP8AN-00031w-CR
	for mharc-qemu-trivial@gnu.org; Fri, 19 Oct 2012 04:42:51 -0400
Received: from eggs.gnu.org ([208.118.235.92]:45822)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TP8AF-0002fw-Rw
	for qemu-trivial@nongnu.org; Fri, 19 Oct 2012 04:42:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TP8AB-0004aU-LE
	for qemu-trivial@nongnu.org; Fri, 19 Oct 2012 04:42:43 -0400
Received: from mail-bk0-f45.google.com ([209.85.214.45]:34538)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TP8A2-0004Yz-Pj; Fri, 19 Oct 2012 04:42:30 -0400
Received: by mail-bk0-f45.google.com with SMTP id jf3so70854bkc.4
	for <multiple recipients>; Fri, 19 Oct 2012 01:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=BuA9zJJNbuY/qEoGk5PjQ7rcw3JmNp8PAOlgJA5HSho=;
	b=rvmx7RDTQMqq2JglGsJUu0zF6E1BKwlTuxkJiRN7ijljN6zq4/gQxJ26IuY1bgbi6e
	pJMrx2hzlrU8aUsfAnmHM0HjfeGb1D2Y3ogo2PW+VRFMqYU/8SEZy2pyt7QmiSkczjkU
	MmALaCLR6nhv8Uaw9/vebjuptPpFcElZpZeM5h+e+QZZcn4lnv/jY8YGmuMSQFrSypeB
	iFLeryUiTP/+BRglOwiNEAn47ClxcZZ+J+hiREBNBsQ0kmtt5qPRLnUB8qsXfrdupwbs
	Mj/5wtlXm2mNAUyDSNY8NBxtWTQ2b9INwXhx5iMg5rNI869heVYyUEIi72qDjxO3QWtG
	FDfA==
Received: by 10.204.129.211 with SMTP id p19mr151299bks.94.1350636149831;
	Fri, 19 Oct 2012 01:42:29 -0700 (PDT)
Received: from localhost (188-194-252-80-dynip.superkabel.de. [188.194.252.80])
	by mx.google.com with ESMTPS id s20sm322529bkw.15.2012.10.19.01.42.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 19 Oct 2012 01:42:29 -0700 (PDT)
Date: Fri, 19 Oct 2012 10:42:27 +0200
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20121019084227.GF4656@stefanha-thinkpad.redhat.com>
References: <1350578453-24368-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1350578453-24368-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.214.45
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH v2] ui/vnc-jobs.c: Fix minor typos in
 comments
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
X-List-Received-Date: Fri, 19 Oct 2012 08:42:50 -0000

On Thu, Oct 18, 2012 at 05:40:53PM +0100, Peter Maydell wrote:
> Fix some minor typos/grammar errors in comments.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> v1->v2: reinstated carelessly dropped 'if', noted by Stefan Weil.
> 
>  ui/vnc-jobs.c |   16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)

Reads like Shakespeare now, thanks! :D

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

