Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jqA0P-0008Cj-P9
	for mharc-qemu-trivial@gnu.org; Tue, 30 Jun 2020 02:44:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jqA0O-0008CX-Ao
 for qemu-trivial@nongnu.org; Tue, 30 Jun 2020 02:44:32 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:48859
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jqA0M-0006hE-B9
 for qemu-trivial@nongnu.org; Tue, 30 Jun 2020 02:44:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593499469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=v0QMW5vlFPte8IetrE7KV4h8RTh+Cnto64mWLbwBt4A=;
 b=DVC2y30uFOxooblOp6UyKAy1cYWRm/hIQjZkW6yZTaiE87VgyN7dUJbM5NBRPRmCBCNjC0
 6jRl8Aw/dfsN7oPQcN6ojgMnPRA1M2/7jUkDWOc8wrz6DF9PAYLYl3N9ZyZSN1JbnPk4pk
 HMxyQuvo0Y4AIYPH+gaKoHB19Tqr2AA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-4jKH5A0SOmG5X1i9cAMGGA-1; Tue, 30 Jun 2020 02:44:27 -0400
X-MC-Unique: 4jKH5A0SOmG5X1i9cAMGGA-1
Received: by mail-ej1-f70.google.com with SMTP id yw17so12507223ejb.12
 for <qemu-trivial@nongnu.org>; Mon, 29 Jun 2020 23:44:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=v0QMW5vlFPte8IetrE7KV4h8RTh+Cnto64mWLbwBt4A=;
 b=H/pSdFDX2friZ2OzWFGkDdlELKv1yWbPUN/j+Xl+W3OB7tv6zV7I4+DZV8fqkpuzoG
 5PI4hIIJIjlYXcDjmp+O0JW2ow6zBy/PYGU73qWTS7W0BfYzzPGklkPE0bjofJm5jBJG
 CHWrjQtsg+1vOHfuXtL86Nne0QVDytPkR+FWVzQZwhqyYzckxKM2i32Sqrg1gg9iOQCd
 xIaiNmRisJm8LyHO7Sgcj5Q0fLkulqS/e+8t19c3rx4wAXJuCGo9bL3IOIjzxp0JW+e2
 1XS8lsJcCbTncs/NWgiiVNC1OHqme9UzbNrfIH2gS33Z14RCAdR5SMRvGJHr5fTrk7zP
 HbXQ==
X-Gm-Message-State: AOAM5334kxqfGKW4qHJpCruhz5BEVwCbbF5a2ort3i9jqw2faWWVF6CW
 P/isWA80TUigsaZY9xuQqgGMXpIZLfT2zB1LppeeZODlS1dkb/yvT8n1fZO3rOLJ2UMBgGIzZi3
 JgaR1H8t+8c38RIKhWg==
X-Received: by 2002:a05:6402:cb3:: with SMTP id
 cn19mr17743055edb.368.1593499466488; 
 Mon, 29 Jun 2020 23:44:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJznsiLqVif/vC+PpCBwf38ue1hkpuCKoZTIRUtnd/ZW7PFgm5FrUO8N2wjK5nrmsE6iz6srLA==
X-Received: by 2002:a05:6402:cb3:: with SMTP id
 cn19mr17743045edb.368.1593499466325; 
 Mon, 29 Jun 2020 23:44:26 -0700 (PDT)
Received: from [192.168.1.40] (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id kt4sm1256612ejb.48.2020.06.29.23.44.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2020 23:44:25 -0700 (PDT)
Subject: Re: [PATC 7/9] Skipping drm build, unsupported
To: David CARLIER <devnexen@gmail.com>, QEMU Trivial
 <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <CA+XhMqzjjrfxXeSENBQuHzTe4TRMWV5GOdqPkD3bo17T3ufR1A@mail.gmail.com>
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
Message-ID: <1058ccbd-b4bb-9413-abc5-ae89076a58e1@redhat.com>
Date: Tue, 30 Jun 2020 08:44:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CA+XhMqzjjrfxXeSENBQuHzTe4TRMWV5GOdqPkD3bo17T3ufR1A@mail.gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/30 01:11:03
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Tue, 30 Jun 2020 06:44:32 -0000

+Gerd

On 6/29/20 11:48 PM, David CARLIER wrote:
> From 157a0374093371719de42e99364352d64190f52a Mon Sep 17 00:00:00 2001
> From: David Carlier <devnexen@gmail.com>
> Date: Mon, 29 Jun 2020 22:20:06 +0000
> Subject: [PATCH 7/9] Skipping drm build, unsupported.
> 
> Signed-off-by: David Carlier <devnexen@gmail.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  util/Makefile.objs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/util/Makefile.objs b/util/Makefile.objs
> index cc5e37177a..faebc13fac 100644
> --- a/util/Makefile.objs
> +++ b/util/Makefile.objs
> @@ -39,7 +39,7 @@ util-obj-y += qsp.o
>  util-obj-y += range.o
>  util-obj-y += stats64.o
>  util-obj-y += systemd.o
> -util-obj-$(CONFIG_POSIX) += drm.o
> +util-obj-$(CONFIG_LINUX) += drm.o
>  util-obj-y += guest-random.o
>  util-obj-$(CONFIG_GIO) += dbus.o
>  dbus.o-cflags = $(GIO_CFLAGS)
> --
> 2.26.0
> 


