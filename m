Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jiVsO-0002n0-DK
	for mharc-qemu-trivial@gnu.org; Tue, 09 Jun 2020 00:28:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiVsM-0002mh-RH
 for qemu-trivial@nongnu.org; Tue, 09 Jun 2020 00:28:38 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:48365
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiVsL-0002xc-6A
 for qemu-trivial@nongnu.org; Tue, 09 Jun 2020 00:28:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591676914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=LPElhX49VV3BV76W6MaqdEyY1VjWKaWxymyj/UGcFZ4=;
 b=Ld+hk5kLOKN8v6MIcJH5Mv0c3jqROUg001smnIIHIJy3KT/BuKzZgsxh985VgslzEvVR93
 QhveItOk79lviL/R1Ne42DVLGQnBpATIvE8uKYxUIRzi0F7Obkp8WEB/6kfyXpXlLIYZds
 tYzq8udbdsJ5eIrR0yyQZENK1lBYtV4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-6fikjNn-Nx6GPSkJNAppEA-1; Tue, 09 Jun 2020 00:28:31 -0400
X-MC-Unique: 6fikjNn-Nx6GPSkJNAppEA-1
Received: by mail-wr1-f72.google.com with SMTP id j16so8001036wre.22
 for <qemu-trivial@nongnu.org>; Mon, 08 Jun 2020 21:28:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=LPElhX49VV3BV76W6MaqdEyY1VjWKaWxymyj/UGcFZ4=;
 b=hsR/CzM9JXTBZX9MkiMPTZgzg1f5kCG8B7wEjrj3euDlTE0Uon4jXMLCOxrNyQfO0Q
 5AgNsVW0nM9/+Aja5t9/Hyt6vP7wdaOlHPMuA/dMJRY5ySYwlSODqy+mU4uySzafZV5y
 u+ie53OQl1/59yAfpeP7rnGMS621unUQuH9GjnkKVTktX5ZA1fPhwL6zuhY2PKd3i240
 NS49LsAYgpy/U4i51/NhNuje8RTUNaLdnJzL0c02RxSHXcNal4wd4h9lnLI3qv9iMxP7
 ZZ3u/b6f9LkScenifncAnJ4FUpD9cCH2TTaB9bTinFPz7InT5KYfMnEQDhMafeFOJjru
 b8EQ==
X-Gm-Message-State: AOAM5318gKTu4FYvdJR6ypWSUAseuaxCt/KuGNHWd/0zoca+mfMNIDh6
 dromg5XAMFrjPnv2N1Oncjn+U6xn+FhGhUKEXaKwySbRnaIdn3AVp44F0UEqytaNF8xlzTW8pkS
 av3QpCTP+Gvq0ulgrUQ==
X-Received: by 2002:a5d:6884:: with SMTP id h4mr2366790wru.198.1591676909917; 
 Mon, 08 Jun 2020 21:28:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzL6yGlYLq5uVkf26nsZMVqRUocmhTXo8Iql5QWkouQ6r3gmy11UnKNx6hS1AV4IwB+9HEdNQ==
X-Received: by 2002:a5d:6884:: with SMTP id h4mr2366776wru.198.1591676909711; 
 Mon, 08 Jun 2020 21:28:29 -0700 (PDT)
Received: from [192.168.1.43] (181.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id d24sm1441410wmb.45.2020.06.08.21.28.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jun 2020 21:28:29 -0700 (PDT)
Subject: Re: [PATCH] Makefile: Install qemu-[qmp/ga]-ref.* into the directory
 "interop"
To: Yi Wang <wang.yi59@zte.com.cn>, qemu-devel@nongnu.org
Cc: Liao Pingfang <liao.pingfang@zte.com.cn>, wang.liang82@zte.com.cn,
 xue.zhihong@zte.com.cn, QEMU Trivial <qemu-trivial@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <1591663670-47712-1-git-send-email-wang.yi59@zte.com.cn>
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
Message-ID: <94e456a8-0b4f-e1fd-7baa-8f81f36c6872@redhat.com>
Date: Tue, 9 Jun 2020 06:28:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1591663670-47712-1-git-send-email-wang.yi59@zte.com.cn>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/09 00:28:34
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Tue, 09 Jun 2020 04:28:39 -0000

On 6/9/20 2:47 AM, Yi Wang wrote:
> From: Liao Pingfang <liao.pingfang@zte.com.cn>
> 
> We need install qemu-[qmp/ga]-ref.* files into the subdirectory of qemu docs: interop.
> 
> If we visit the following address and click the link to qemu-qmp-ref.html:
> https://www.qemu.org/docs/master/interop/bitmaps.html#basic-qmp-usage
> 
> It will report following error:
> "
> Not Found
> The requested URL /docs/master/interop/qemu-qmp-ref.html was not found on this server.
> "
> 

Fixes: d59157ea058b5 ('docs: create interop/ subdirectory')
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> Signed-off-by: Liao Pingfang <liao.pingfang@zte.com.cn>
> ---
>  Makefile           | 10 ++++++----
>  docs/index.html.in |  4 ++--
>  2 files changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 40e4f76..49dbe7a 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -879,8 +879,9 @@ install-sphinxdocs: sphinxdocs
>  install-doc: $(DOCS) install-sphinxdocs
>  	$(INSTALL_DIR) "$(DESTDIR)$(qemu_docdir)"
>  	$(INSTALL_DATA) $(MANUAL_BUILDDIR)/index.html "$(DESTDIR)$(qemu_docdir)"
> -	$(INSTALL_DATA) docs/interop/qemu-qmp-ref.html "$(DESTDIR)$(qemu_docdir)"
> -	$(INSTALL_DATA) docs/interop/qemu-qmp-ref.txt "$(DESTDIR)$(qemu_docdir)"
> +	$(INSTALL_DIR) "$(DESTDIR)$(qemu_docdir)/interop"
> +	$(INSTALL_DATA) docs/interop/qemu-qmp-ref.html "$(DESTDIR)$(qemu_docdir)/interop"
> +	$(INSTALL_DATA) docs/interop/qemu-qmp-ref.txt "$(DESTDIR)$(qemu_docdir)/interop"
>  ifdef CONFIG_POSIX
>  	$(INSTALL_DIR) "$(DESTDIR)$(mandir)/man1"
>  	$(INSTALL_DATA) $(MANUAL_BUILDDIR)/system/qemu.1 "$(DESTDIR)$(mandir)/man1"
> @@ -898,8 +899,9 @@ ifdef CONFIG_TRACE_SYSTEMTAP
>  endif
>  ifneq (,$(findstring qemu-ga,$(TOOLS)))
>  	$(INSTALL_DATA) $(MANUAL_BUILDDIR)/interop/qemu-ga.8 "$(DESTDIR)$(mandir)/man8"
> -	$(INSTALL_DATA) docs/interop/qemu-ga-ref.html "$(DESTDIR)$(qemu_docdir)"
> -	$(INSTALL_DATA) docs/interop/qemu-ga-ref.txt "$(DESTDIR)$(qemu_docdir)"
> +	$(INSTALL_DIR) "$(DESTDIR)$(qemu_docdir)/interop"
> +	$(INSTALL_DATA) docs/interop/qemu-ga-ref.html "$(DESTDIR)$(qemu_docdir)/interop"
> +	$(INSTALL_DATA) docs/interop/qemu-ga-ref.txt "$(DESTDIR)$(qemu_docdir)/interop"
>  	$(INSTALL_DATA) docs/interop/qemu-ga-ref.7 "$(DESTDIR)$(mandir)/man7"
>  endif
>  endif
> diff --git a/docs/index.html.in b/docs/index.html.in
> index e9a1603..6736fa4 100644
> --- a/docs/index.html.in
> +++ b/docs/index.html.in
> @@ -12,8 +12,8 @@
>              <li><a href="tools/index.html">Tools Guide</a></li>
>              <li><a href="interop/index.html">System Emulation Management and Interoperability Guide</a></li>
>              <li><a href="specs/index.html">System Emulation Guest Hardware Specifications</a></li>
> -            <li><a href="qemu-qmp-ref.html">QMP Reference Manual</a></li>
> -            <li><a href="qemu-ga-ref.html">Guest Agent Protocol Reference</a></li>
> +            <li><a href="interop/qemu-qmp-ref.html">QMP Reference Manual</a></li>
> +            <li><a href="interop/qemu-ga-ref.html">Guest Agent Protocol Reference</a></li>
>          </ul>
>      </body>
>  </html>
> 


