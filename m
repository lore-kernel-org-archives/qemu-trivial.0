Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TJsSg-0001Z8-GS
	for mharc-qemu-trivial@gnu.org; Thu, 04 Oct 2012 16:56:02 -0400
Received: from eggs.gnu.org ([208.118.235.92]:57932)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1TJsSe-0001Yh-NF
	for qemu-trivial@nongnu.org; Thu, 04 Oct 2012 16:56:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1TJsSd-00081l-TL
	for qemu-trivial@nongnu.org; Thu, 04 Oct 2012 16:56:00 -0400
Received: from mail-ie0-f173.google.com ([209.85.223.173]:52333)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1TJsSd-00081c-Ol
	for qemu-trivial@nongnu.org; Thu, 04 Oct 2012 16:55:59 -0400
Received: by mail-ie0-f173.google.com with SMTP id 17so1922342iea.4
	for <qemu-trivial@nongnu.org>; Thu, 04 Oct 2012 13:55:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=+5JGRXtB99/2L6TMZTHaBukUYYBGfVpboJqeDEhMb8w=;
	b=dXBsXl3kDl1QhGOOsdgStmgx1Bllo6rlVlWop54rB/YyDLxdGMZq9kudwK76jkFENA
	8oYFJCBwwvzsFSvk3OJrWIjsJ3oDF93b2o7ljYRuDLjl3OZkz6tVCDUWkPDkJfzx+Mgx
	iZsMEQNcmMKXn4diMymI8VMIftAJ90ACxhrAmYOX9ejG8uYoqDTkXCoAzc7TF4VdAjuy
	Scr9gL3We9nkt0pQSqQiAN/pmnSrTU68lq/s9y1PzpDhCe+NkTbfhhXefvHbMONkvk8o
	hJ7Wj97F96KtTtLlx2avoESbcaKnlwCg9c7elkSiMmw/SSwK6m9dIyhjt+Dmfdz0lrEV
	h5fg==
MIME-Version: 1.0
Received: by 10.50.95.198 with SMTP id dm6mr16978565igb.60.1349384158832; Thu,
	04 Oct 2012 13:55:58 -0700 (PDT)
Received: by 10.50.19.36 with HTTP; Thu, 4 Oct 2012 13:55:58 -0700 (PDT)
In-Reply-To: <1349383783-21392-1-git-send-email-sw@weilnetz.de>
References: <1349383783-21392-1-git-send-email-sw@weilnetz.de>
Date: Thu, 4 Oct 2012 21:55:58 +0100
Message-ID: <CAFEAcA8Ei5SwBi8D8cTv=WqqRva+XFusmSsZjC_BdtQ1yo=g0Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQmXqKu1C+nDUYSy0idR2gvE0B0ZwPKnEz07ndKF1BTbKaijev5kRN+1lgi3OHSkZdIM0631
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.223.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Paul Brook <paul@codesourcery.com>
Subject: Re: [Qemu-trivial] [PATCH] versatilepb: Use symbolic indices for
	ARM PIC
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
X-List-Received-Date: Thu, 04 Oct 2012 20:56:01 -0000

On 4 October 2012 21:49, Stefan Weil <sw@weilnetz.de> wrote:
> It is more readable, and all other code does it like that, too.
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

The right long term fix is named pins.

-- PMM

