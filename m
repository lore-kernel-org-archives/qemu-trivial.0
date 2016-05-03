Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1axUR7-0005Rx-Qg
	for mharc-qemu-trivial@gnu.org; Tue, 03 May 2016 03:08:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49087)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1axUR0-0005CN-A3
	for qemu-trivial@nongnu.org; Tue, 03 May 2016 03:08:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1axUQo-0007fI-Rn
	for qemu-trivial@nongnu.org; Tue, 03 May 2016 03:07:48 -0400
Received: from mail-yw0-x243.google.com ([2607:f8b0:4002:c05::243]:33070)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1axUQS-00074Y-US; Tue, 03 May 2016 03:07:22 -0400
Received: by mail-yw0-x243.google.com with SMTP id y6so897254ywe.0;
	Tue, 03 May 2016 00:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=vMFX7e5W+4LQKM4vYfDrP0wEVZSiVcFKmZkIZTXqKyw=;
	b=JKaRhzlcoZa6y8YrFKTXYeu7+qHXeMTiSssWfHZwh7letnjQVhsKB1mpYj7X5K7Ys9
	31n+X0L4b+fYXwQ58aysDcfuSJbFzDUbX6bfjMfqdSY2o1b3EagQObB954vlFNScRwhi
	1QoyxM7xDfZjQIACwinBbPYsx0uV3UdVur3xf0PYJoFUuMKF3A3hLYSe5uyWiQVicIuX
	kWGFzwU/Uf1JRgtxQvG2slDL01kseh5AcWxxRdE6rbRIAPCLAI1eb/foPjR+U0eeYqnA
	88XLXW6mcazwY2Lql5p6XFfSTN3TCGdicOel2Za9GUoVbLBTotIUMDXaCtTE0meGHBwS
	IDQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=vMFX7e5W+4LQKM4vYfDrP0wEVZSiVcFKmZkIZTXqKyw=;
	b=Ln91t0jnbcNItTxjXJlPvD/lsfDJYJLlpWmTTmS8JqE6adL17k0CR5UN4uzkfbRkZw
	08JuGh+j6XtpCjCpZMZnXt3cx3rYfjQuPEq6a5ouO4u7/CPCYULr+ljwiwA/9PPPeTKc
	k//5UAqS7KNBKtENvxYE3H1DJI0pXXngIBNJd334+Yysr2qTT5DwB5xXJxVLmfbWcKKd
	5RfdE1ejB5kl2l3uKrCcXWEk2V28TXDLGB7b1udo58k2DR9jKDxb+HgPlbSLURw2dgoq
	O7FLCyA2L6lzEnA9hun1dFAtxtF9bgoVBk12v89cPimSP7d2spTMqiVtk4PURFYSpt4T
	D9+g==
X-Gm-Message-State: AOPr4FUuTWP/Vtm6Dey4B79AL3yIHTw4TkOVLCyt0YE2MUzKQlaCcSAdlNv44griqZAH3A==
X-Received: by 10.129.158.87 with SMTP id v84mr351427ywg.282.1462259209466;
	Tue, 03 May 2016 00:06:49 -0700 (PDT)
Received: from bigtime.twiddle.net ([172.56.44.244])
	by smtp.googlemail.com with ESMTPSA id
	e6sm1126156ywd.23.2016.05.03.00.06.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 03 May 2016 00:06:48 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
To: Christopher Friedt <chrisfriedt@gmail.com>, famz@redhat.com, mst@redhat.com
References: <1462237852-61856-1-git-send-email-chrisfriedt@gmail.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
From: Richard Henderson <rth@twiddle.net>
Message-ID: <0b165339-9dde-57f8-959d-22122390ca0b@twiddle.net>
Date: Mon, 2 May 2016 21:06:43 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.0
MIME-Version: 1.0
In-Reply-To: <1462237852-61856-1-git-send-email-chrisfriedt@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4002:c05::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/2v2] [RESENT-INLINE] Use
 libtool instead of ar to create static libraries on Darwin.
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
X-List-Received-Date: Tue, 03 May 2016 07:08:00 -0000

On 05/02/2016 03:10 PM, Christopher Friedt wrote:
>  %.a:
> +ifdef CONFIG_DARWIN
> +	$(call quiet-command,rm -f $@ && libtool -static -o $@ $^,"  libtool    $(TARGET_DIR)$@")
> +else
>  	$(call quiet-command,rm -f $@ && $(AR) rcs $@ $^,"  AR    $(TARGET_DIR)$@")
> +endif
>

Does it work to use libtool -static everywhere?


r~

