Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TaMl4-0001iP-QQ
	for mharc-qemu-trivial@gnu.org; Mon, 19 Nov 2012 03:31:10 -0500
Received: from eggs.gnu.org ([208.118.235.92]:36479)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1TaMl0-0001f5-0X
	for qemu-trivial@nongnu.org; Mon, 19 Nov 2012 03:31:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1TaMkw-0008Pb-UD
	for qemu-trivial@nongnu.org; Mon, 19 Nov 2012 03:31:05 -0500
Received: from mail-ie0-f173.google.com ([209.85.223.173]:52064)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1TaMkw-0008PO-Pb
	for qemu-trivial@nongnu.org; Mon, 19 Nov 2012 03:31:02 -0500
Received: by mail-ie0-f173.google.com with SMTP id k14so2310696iea.4
	for <qemu-trivial@nongnu.org>; Mon, 19 Nov 2012 00:31:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=SGSHB+t5BQI/5wWd4efVcgx2jd7w4yzPuYbATxHemLE=;
	b=c1XSh9U8GK1/SMLpaGJveOOjMebP4/gDTinfQtnvJCtZzy7wRwRb3P8UGail3AbscQ
	jwU2Qsjsw5SD3NU2MR5vYbhM3UYwyxn7iS713aVfCVkoFcQOOyL9RTY3KZkwTaE3oMwc
	2ZT8y+A5cuuYnk9CuwI+u0kjiFTBFoSet9A1uErYcO88kY687jcP4qdr3LFV255ZPiPH
	OlbYYUCTazRztXFHAO42SNT38vHCq4GNi+5xttjadWCHF1/nayaU7r9Ly1Tj8vs7EIiM
	Usz3Rdpjx/VwAUO41t6HsEVCPa3TpE0iVpV4bDzi6VGeb2AMnaL+70oV+fD0H8qWaegZ
	5KFg==
MIME-Version: 1.0
Received: by 10.50.15.138 with SMTP id x10mr5962508igc.16.1353313861956; Mon,
	19 Nov 2012 00:31:01 -0800 (PST)
Received: by 10.50.88.166 with HTTP; Mon, 19 Nov 2012 00:31:01 -0800 (PST)
In-Reply-To: <1353302029-14255-1-git-send-email-peter.crosthwaite@xilinx.com>
References: <1353302029-14255-1-git-send-email-peter.crosthwaite@xilinx.com>
Date: Mon, 19 Nov 2012 08:31:01 +0000
Message-ID: <CAFEAcA8gXFixZZW4OEK_jJipq2n6E7wGgHLgQ2fffUW2n7h6Eg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQkunN5mLOtg9/Ah6lKA//gmztK92If7IXDsEovmHBy320Yw9bn+LKv29gQ7GbacS/HG5aiH
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.223.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] arm: a9mpcore: remove un-used
	ptimer_iomem field
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
X-List-Received-Date: Mon, 19 Nov 2012 08:31:09 -0000

On 19 November 2012 05:13, Peter Crosthwaite
<peter.crosthwaite@xilinx.com> wrote:
> I'm guessing this is a hangover from a previous coreification of the mptimer
> sub-module. This field is completely unused - removed.
>
> Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

-- PMM

