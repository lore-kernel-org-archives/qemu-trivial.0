Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f7uE9-00038E-BA
	for mharc-qemu-trivial@gnu.org; Sun, 15 Apr 2018 22:50:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43126)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7uE7-00037E-BW
	for qemu-trivial@nongnu.org; Sun, 15 Apr 2018 22:50:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7uE4-0008EP-4t
	for qemu-trivial@nongnu.org; Sun, 15 Apr 2018 22:50:43 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:40008)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7uE3-0008Dy-ST; Sun, 15 Apr 2018 22:50:40 -0400
Received: by mail-qk0-x241.google.com with SMTP id o64so15056148qkl.7;
	Sun, 15 Apr 2018 19:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=yD1FSf1h0tMXO6/oISm1acwXqieuuI9poa/zor/hK4E=;
	b=JV5fJpPlAKcJgYS+dEjSAQvChN3dZxtflHAe6Rwfzgk6e/7HlR/6dgU1gnJnHZ4KXe
	4LsqEPd3Vrq/gW7+l+10KpwUcY9v3vOdQ0NdL3BopDKoC6b+Vx67p8kmQ+5FE5hv9nE3
	KT6NqUOCmIynZ7Wy8BO8xhLtbHHgLfbE8Tlry4cLWoeLoCkJjQiDEPKiy2vL5Z3plqxX
	BUb+mHrNF3Dp6p7PoXDbiafnRtQTPy8hawh4QhN+ImxFAZ/8ohRKfbdmh6DDWioX1z8z
	H+kAJ0yQ1/KvKOIc7RfcHjOxAnbv3bp6kGAhw+dYP/k+/+7tSqzhi0IfZpE55xV4zF63
	9jMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=yD1FSf1h0tMXO6/oISm1acwXqieuuI9poa/zor/hK4E=;
	b=eM9+yQS6wsAJZRwlBVlxoPXRKIDpOrh8AzRXXNS6LM7ioHju02YQSdPe/+rrTmlnc0
	wecH7P9LueQ4xGAZdVO0FMYKLJn3IfmSNQufnXR1AMQIiMYNRHjmQoVeMyhVRXiPLZNF
	zs4iAHRTlZ2pI1N04U6DuPKPUS4AItW2/L59OxBwdx2yvAIB1azWL0BeJyiNESPvjwkq
	+erUa7d5q6CATVyVy7YNs90XV+IiH7m3I8A+E8JekGc5zQ5kF1zoCuSWnD10TuPRQAZi
	mjUjzSP4BxShaqdTHSMbB1RPYSoxiWhwNCcCUb6Iv0wM7iJiLzafAnGX+u0/ETnE4wj8
	gEZQ==
X-Gm-Message-State: ALQs6tDcNlePICCiaXw776cRQsfJbf3Hq0Xi/Wmci+l2URUEs+cq0G0O
	2G+xYqPviBCE+psxlT8t/2xF9pCCkII=
X-Google-Smtp-Source: AIpwx4/xPNZDAqCjsQOYC9IWXaaXdgOT+OLHCgMu6zmqlWfR1rumXwWq288FB715sAfBkutvS3ktGw==
X-Received: by 10.233.225.18 with SMTP id g18mr7521180qkm.113.1523847038770;
	Sun, 15 Apr 2018 19:50:38 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.212])
	by smtp.gmail.com with ESMTPSA id j1sm5765376qtc.53.2018.04.15.19.50.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Apr 2018 19:50:38 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20180414142739.23375-1-mjt@msgid.tls.msk.ru>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <fbdc319a-d816-1135-116a-1db5438325c3@amsat.org>
Date: Sun, 15 Apr 2018 23:50:35 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180414142739.23375-1-mjt@msgid.tls.msk.ru>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: Re: [Qemu-trivial] [PATCH trivial for-2.12] Makefile: install gtk
 message catalogs if CONFIG_GTK=y too, not only =m
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
X-List-Received-Date: Mon, 16 Apr 2018 02:50:44 -0000

Hi Michael,

On 04/14/2018 11:27 AM, Michael Tokarev wrote:
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 727ef118f3..8644c2e918 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -856,7 +856,7 @@ ifneq ($(BLOBS),)
>  		$(INSTALL_DATA) $(SRC_PATH)/pc-bios/$$x "$(DESTDIR)$(qemu_datadir)"; \
>  	done
>  endif
> -ifeq ($(CONFIG_GTK),m)
> +ifneq ($(filter $(CONFIG_GTK),y m),)

Or simply:

ifdef CONFIG_GTK

>  	$(MAKE) -C po $@
>  endif
>  	$(INSTALL_DIR) "$(DESTDIR)$(qemu_datadir)/keymaps"
> 

Regards,

Phil.

