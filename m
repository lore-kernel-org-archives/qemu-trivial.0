Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bnTeK-0001D2-DE
	for mharc-qemu-trivial@gnu.org; Fri, 23 Sep 2016 12:48:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42013)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1bnTeI-0001AT-H2
	for qemu-trivial@nongnu.org; Fri, 23 Sep 2016 12:48:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1bnTeH-00054p-Jh
	for qemu-trivial@nongnu.org; Fri, 23 Sep 2016 12:48:30 -0400
Received: from mail-wm0-f66.google.com ([74.125.82.66]:35576)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>)
	id 1bnTeC-00051n-2S; Fri, 23 Sep 2016 12:48:24 -0400
Received: by mail-wm0-f66.google.com with SMTP id 133so3661766wmq.2;
	Fri, 23 Sep 2016 09:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=dAaWHXFGY+kCQkYtJTmRVPN9UhFjRg7gvk4l9o5KGGk=;
	b=sWdTd82InonsWdgzgTRJ5Ok6Lrm/P5OCU8YT1QRCzHSzfwnbHzOCQcPOUJYmwiefqo
	iAtpMi+EABN77iMscCXA5ZPcuo6RibD/zFp9pCHGdYF9MfTs/kUvrb3QAl93Cm5vVI4N
	9hVyXTbYL0ci9G7Sj/tcQdPAkY50kWPAcKm8yhnO4Wz06DmLd1ODzN/WAD3VdXyfdHGn
	IWoaC9adORpNWvArFlKkWCHvNlg2ZrX6PJ3F+KqPH8o0Qir2K2xS4ItxvScirPfdBCtB
	+yzDYbBxq8WrU0r+5CCxnIM57RgOC0tTFlEpx+DC73bAQMhrhj79NCTjxIkV2Lz3oxlS
	BOjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=dAaWHXFGY+kCQkYtJTmRVPN9UhFjRg7gvk4l9o5KGGk=;
	b=evfs0g4DwE8D4UseAGSywCkK3wZEfqhgZJ1ruaIMu0zKZ741fyyYdcJ4XE3MLkEJCy
	jkjSZUO3i+WtVp7p7K0k9Se4xoUff+rmJX1xhNK3sSjykeeL7mEypzb5eyOO0K1O46Ew
	Ux1kNQiPdUK7GQnhTS40ggaAFKmOEh0S0jqYUh7bosMG6LqUbyKg7Emz4rggl7M8O7Oj
	W7EPghJYC2/I7ZqfSrOzaNyVtKuv/MC8TgLkoC8NrtLM/SqvEoPCG6SEJ6rhUf9wgBy5
	LbTYwJklwFQmhe0oK7vcgBKwVjBkP02VIW4MToBDULFnvHPv2PlcyBYaLnSJai9sbava
	RAFw==
X-Gm-Message-State: AA6/9RkW2GsTjqPEuxXD6N0Z1gAn52oOcS6CqlbmWKh1wkFk7FwvKPgVT3Doe2NA4h7RPw==
X-Received: by 10.28.142.197 with SMTP id q188mr3889599wmd.119.1474649148067; 
	Fri, 23 Sep 2016 09:45:48 -0700 (PDT)
Received: from localhost (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id 188sm3945329wmo.1.2016.09.23.09.45.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Sep 2016 09:45:47 -0700 (PDT)
Date: Fri, 23 Sep 2016 18:45:46 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <20160923164546.GW16305@toto>
References: <1474646926-30346-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1474646926-30346-1-git-send-email-thuth@redhat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.66
Subject: Re: [Qemu-trivial] [PATCH] MAINTAINERS: Add header files to CRIS
 section
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
X-List-Received-Date: Fri, 23 Sep 2016 16:48:31 -0000

On Fri, Sep 23, 2016 at 06:08:46PM +0200, Thomas Huth wrote:
> etraxfs_dma.h and etraxfs.h in include/hw/cris/ obviously belong
> to the CRIS section in MAINTAINERS.
>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9ea6f70..d8a0cfc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -117,6 +117,7 @@ M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
>  S: Maintained
>  F: target-cris/
>  F: hw/cris/
> +F: include/hw/cris/
>  F: tests/tcg/cris/
>  F: disas/cris.c
>  
> -- 
> 1.8.3.1
> 

