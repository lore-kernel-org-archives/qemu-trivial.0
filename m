Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jybUX-0003GJ-TJ
	for mharc-qemu-trivial@gnu.org; Thu, 23 Jul 2020 09:42:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jybUW-0003GD-U3
 for qemu-trivial@nongnu.org; Thu, 23 Jul 2020 09:42:32 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:41095
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jybUU-00085E-OB
 for qemu-trivial@nongnu.org; Thu, 23 Jul 2020 09:42:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595511749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=98FTHgruO/ISHuEPOgBqDNEB3sjojMztM/vW00TUXOM=;
 b=THZUp3VEroIEBWm6z5p9Xb3WR/YFp69rqRmnKYTqNmFdIk8RgoIs/JoxpF2PvXmEXFA4Yb
 /GSDFRUG2zJn/NOs1dPnzlIzmNqLR88xyRtSNIY1Ofrg025sCN5h9n30gx4DfvEcl/C7VW
 tLCwBoiqBGtX0N13TOeYsg3uo2WtvG8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-262-icJbV0hJNXapjSkPcdFDKw-1; Thu, 23 Jul 2020 09:42:27 -0400
X-MC-Unique: icJbV0hJNXapjSkPcdFDKw-1
Received: by mail-wm1-f72.google.com with SMTP id z74so2379486wmc.4
 for <qemu-trivial@nongnu.org>; Thu, 23 Jul 2020 06:42:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=98FTHgruO/ISHuEPOgBqDNEB3sjojMztM/vW00TUXOM=;
 b=cA9qmGLXHD0aAA2J8bvhtmbf9R94ZD8VHcaSLXg0urkkEoQZkjgpB9+lwdy7nb6H2b
 QhSlIronWl7N+jQtz221H93OvQlNI9XQdkRzhPSwldVMPd0Ly4tomQghxReyQPunm0hF
 Qv5ULiNANP00nFEUaYLZl5rb+WgxfWWqbywR2nVnaYfjW4vF1Ax/s+NYiv3On2CC1lfy
 N8Fp9SKmXNNqBRrOqxipkmdtBqFsbpXCBjUTgn2aMJE7dit57famxU8LAThcK7ySdB5M
 qYgaE/R/mHR8TyP80GQgiGtzrR1BbwYhYxmhyDCoaqgfNG6fkW/DC1LEnBDP9DpVHjFg
 YRjQ==
X-Gm-Message-State: AOAM530K2mIvWGMAgOB6tVfsTpKy83TJZirPsol9Q5tZC3dpKnfUJAdA
 Ry1xFyKoq9CcJdM6CxLf3L8nchzvdN89GoGNeMDp1LOW/b8Is8c2P/qTbHroe3vNvMGULIicVhY
 tMJSqINbf/ToMSrurgQ==
X-Received: by 2002:a5d:4407:: with SMTP id z7mr4058603wrq.404.1595511746387; 
 Thu, 23 Jul 2020 06:42:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVttREbW+UCH6c0eK7sf/Jsql58kJw0HNFmwzQMbc/nScv+ILtaNiByYctKb3sKC/7XwiviQ==
X-Received: by 2002:a5d:4407:: with SMTP id z7mr4058588wrq.404.1595511746191; 
 Thu, 23 Jul 2020 06:42:26 -0700 (PDT)
Received: from [192.168.1.36] (138.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.138])
 by smtp.gmail.com with ESMTPSA id m16sm3785519wrr.71.2020.07.23.06.42.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jul 2020 06:42:25 -0700 (PDT)
Subject: Re: [PATCH] target/unicore32: Remove CURSES stuff from the
 Makefile.objs
To: Thomas Huth <thuth@redhat.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
References: <20200723132219.2956-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <b177ca63-a7bb-03e7-df22-13f77fed9678@redhat.com>
Date: Thu, 23 Jul 2020 15:42:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200723132219.2956-1-thuth@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/23 06:04:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Jul 2020 13:42:33 -0000

On 7/23/20 3:22 PM, Thomas Huth wrote:
> The dependency on curses has been removed in commit c7a856b42e403e2b
> ("target/unicore32: Prefer qemu_semihosting_log_out() over curses").
> So we can remove the related lines in the Makefile now, too.

Don't we also need to remove all uses of CONFIG_CURSES to
be complete? Eventually display a warning with --(en|dis)able-curses
is used.

> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  target/unicore32/Makefile.objs | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/target/unicore32/Makefile.objs b/target/unicore32/Makefile.objs
> index 35d8bf530d..6b41b1e9ef 100644
> --- a/target/unicore32/Makefile.objs
> +++ b/target/unicore32/Makefile.objs
> @@ -2,7 +2,3 @@ obj-y += translate.o op_helper.o helper.o cpu.o
>  obj-y += ucf64_helper.o
>  
>  obj-$(CONFIG_SOFTMMU) += softmmu.o
> -
> -# Huh? Uses curses directly instead of using ui/console.h interfaces ...
> -helper.o-cflags := $(CURSES_CFLAGS)
> -helper.o-libs := $(CURSES_LIBS)
> 


