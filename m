Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UWpsc-0004Hr-W9
	for mharc-qemu-trivial@gnu.org; Mon, 29 Apr 2013 11:20:39 -0400
Received: from eggs.gnu.org ([208.118.235.92]:56611)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1UWpsX-0004Fg-Go
	for qemu-trivial@nongnu.org; Mon, 29 Apr 2013 11:20:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1UWpsR-0003p7-Mq
	for qemu-trivial@nongnu.org; Mon, 29 Apr 2013 11:20:33 -0400
Received: from mail-ea0-x229.google.com ([2a00:1450:4013:c01::229]:35639)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1UWpsR-0003p0-GV; Mon, 29 Apr 2013 11:20:27 -0400
Received: by mail-ea0-f169.google.com with SMTP id d10so2253374eaj.28
	for <multiple recipients>; Mon, 29 Apr 2013 08:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=/IPocyMBv0DT6ufpn3iaGHOfW+wKc7+p6sM0eJQKZQI=;
	b=VryLFXiXnojD/Wg0BRNFhwbbLDsWsiDdD07KEHFseRNZ9jjT1EhucpNQ6FG660yIBl
	qOrHB37ZfHzirbLtXCyCZCVtfeD4YyHTXB71hRqVEAq71NWY+xMbPKY9n9f44GJ/Ygmn
	hik7VQ+hyMqA4bF6DRaUaNZBbbGd4SKeUF4fwQ0pZ1VKvfXT8gJfZ9fW1OUYRivrwP6W
	afHgq6JO11lv/QatD5pYpyKKKrYZb7keqUsIZoZCG9KS5JF/ILC344hajXZYOJE7T3XQ
	EB/5WTayvxKk8YmHnwClchBf0TKmxQQiZxs09c/oUN6s0hAT9K/3bYcrbmXV8YkoNoiV
	aI3Q==
X-Received: by 10.14.149.141 with SMTP id x13mr124645289eej.31.1367248826660; 
	Mon, 29 Apr 2013 08:20:26 -0700 (PDT)
Received: from pebble.twiddle.net
	(host217-43-57-145.range217-43.btcentralplus.com. [217.43.57.145])
	by mx.google.com with ESMTPSA id
	bk42sm33418530eeb.3.2013.04.29.08.20.25 for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 29 Apr 2013 08:20:26 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Message-ID: <517E8FB7.9080706@twiddle.net>
Date: Mon, 29 Apr 2013 16:20:23 +0100
From: Richard Henderson <rth@twiddle.net>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130402 Thunderbird/17.0.5
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1367142597-28810-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1367142597-28810-1-git-send-email-sw@weilnetz.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4013:c01::229
Cc: qemu-trivial@nongnu.org, Alexander Graf <agraf@suse.de>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Trivial grammar and
	spelling fixes
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
X-List-Received-Date: Mon, 29 Apr 2013 15:20:36 -0000

On 2013-04-28 10:49, Stefan Weil wrote:
> similiar -> similar
> recieve -> receive
> transfered -> transferred
> preperation -> preparation
>
> Most changes are in comments, one modifies a parameter name in a function
> prototype.
>
> The spelling fixes were made using codespell.
>
> Signed-off-by: Stefan Weil<sw@weilnetz.de>

Acked-by: Richard Henderson <rth@twiddle.net>


r~

