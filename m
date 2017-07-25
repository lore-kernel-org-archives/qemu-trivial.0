Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dZzI4-0004gY-CJ
	for mharc-qemu-trivial@gnu.org; Tue, 25 Jul 2017 08:50:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59811)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dZzI2-0004fb-4V
	for qemu-trivial@nongnu.org; Tue, 25 Jul 2017 08:50:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dZzI1-0007Yy-Eg
	for qemu-trivial@nongnu.org; Tue, 25 Jul 2017 08:50:18 -0400
Received: from mail-wr0-x22e.google.com ([2a00:1450:400c:c0c::22e]:38380)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dZzI1-0007Ye-5n
	for qemu-trivial@nongnu.org; Tue, 25 Jul 2017 08:50:17 -0400
Received: by mail-wr0-x22e.google.com with SMTP id f21so62145857wrf.5
	for <qemu-trivial@nongnu.org>; Tue, 25 Jul 2017 05:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=AJFr0itKUEXAPy00Akq8Vfk5e8VxOLd0wZi5zrBilBw=;
	b=bj34nQiLDmzp8+zf0vEeusme/hOrFpcLBsgWr3mhWD86PBbuNCq/frgD2L6gf65/Jk
	1U1ospMiKf9+45P80NxiDmlrcJ3AJXXJrJtrMFPRsjhsEHw9jveYnzPIKt1oG0NaC+5/
	ThDUw1x+0XzdD7h3qiISLBpQeWjttMMRZOHlg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=AJFr0itKUEXAPy00Akq8Vfk5e8VxOLd0wZi5zrBilBw=;
	b=KK7FgOuZ20IPZzE9hER1TrtT3riUYV7yCIp9aWsFS88lyO9eahKC+Bjcee69Aqhb0N
	uiz6n49aeTGLMBtC1xssw9hYcBWVYH1tcsdetAn+k6Z4GkuT/YdD3pCUzHPFmSprfDhI
	EMgJINiuHaiUQF9RWftAglCM7JhSmjathBbsVyZDP+ijQxGzX+i/Ao2Se4WF44sQ0ZN8
	4HblddsN8h6ftaVAdNzKdsA8UXfzwiwzzoM1JGXDlKsMYZTAH5OPWxuYmTwAfu00fcIP
	Zs+GkCj3wp4eZxRgKnH4sDXyNgYsmfRKiOuGQsbrXrk5ANhhYdXZPa1eRg5drmiLUitQ
	2tfg==
X-Gm-Message-State: AIVw111GxaywqvlkW/StydOlhsPyFKhglHGUfxdazHScpRcebpLL3Lpi
	7pT9QReAaNN0k1QgHWMSZN8wbBm2jPaS
X-Received: by 10.223.163.16 with SMTP id c16mr21013487wrb.173.1500987015875; 
	Tue, 25 Jul 2017 05:50:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.54 with HTTP; Tue, 25 Jul 2017 05:49:55 -0700 (PDT)
In-Reply-To: <20170724183517.GA2427@work-vm>
References: <1500309462-12792-1-git-send-email-peter.maydell@linaro.org>
	<CAFEAcA9yup9CQzst6m14oO+7JHZ2F0mkrsnUN5LLx++=9ctqMw@mail.gmail.com>
	<20170724183517.GA2427@work-vm>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Jul 2017 13:49:55 +0100
Message-ID: <CAFEAcA94ovPdsHdKGjSUpTYtN=rzFTxzrbJznQNyr93DmL6Apg@mail.gmail.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	"patches@linaro.org" <patches@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22e
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.10] hw/display/sm501:
 Don't use vmstate_register_ram_global()
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 25 Jul 2017 12:50:19 -0000

On 24 July 2017 at 19:35, Dr. David Alan Gilbert <dgilbert@redhat.com> wrote:
> * Peter Maydell (peter.maydell@linaro.org) wrote:
>> Ping for review, please? Would be nice to get this into rc0.
>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Thanks; applied to master.

-- PMM

