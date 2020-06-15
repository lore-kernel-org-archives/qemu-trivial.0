Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jkrjF-0001Za-4y
	for mharc-qemu-trivial@gnu.org; Mon, 15 Jun 2020 12:12:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jkrjD-0001Z4-UC
 for qemu-trivial@nongnu.org; Mon, 15 Jun 2020 12:12:55 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:31014
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jkrjB-00039g-IF
 for qemu-trivial@nongnu.org; Mon, 15 Jun 2020 12:12:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592237572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ko1KrOE+/ewbMu5m1pZCerV3BD24wxFHyxapXL1bllo=;
 b=XfN4s6Vzs7RsJy1s6+fp9cyA3inRFqhg/5BZ1vyIiv0LV4L8eWlN0par0zzh9m6JS5aP0D
 VNVdoOxgnHVkN2ceSFUZoZUQ+fhfRfN6t0eyGSzZF4NIyoFr8PG95ybJ32niAyIaBLKZ7V
 JO91/yJsUwli6Ky0ZjNX/mt4mMVhQB0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-obcn5f4YMEabnwOyRyR_kg-1; Mon, 15 Jun 2020 12:12:48 -0400
X-MC-Unique: obcn5f4YMEabnwOyRyR_kg-1
Received: by mail-wm1-f72.google.com with SMTP id j128so39856wmj.6
 for <qemu-trivial@nongnu.org>; Mon, 15 Jun 2020 09:12:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ko1KrOE+/ewbMu5m1pZCerV3BD24wxFHyxapXL1bllo=;
 b=gcyw3SZJP1qMQlYK5ecYLmrBvnQG/ih3Q1hmA3paw45vcGWr2SrefcLIJt2UWOmR0W
 9iPUvG/WqPtVRLcO0IiXFuF0YHC2+dwsVgU76KHkYxhkNv/IRgRWoy4HM/QVK0mGk744
 403LR2xxh5Q0Em1ywAzLkllcTfsC+LtrUL/dkA/9joZtHr3GJACuNVGbQ8cmewBBRm6J
 EqU93frqeeIndhHHvhYRFcyh9Fq5M/kEUj4uXdUifneiSxnG9GKSz+inDiupcvyRIa1B
 PmG9cMWOgcolaC01vUJKO+FkrvGhDjxjlmS4VIS9LnegCf9vdmXLz7qxLvjZCpBBJmOL
 6dYg==
X-Gm-Message-State: AOAM530uZvgJS4i6217exW0e1bbvKICOF8c6cffPybZ17bJAfDwx6F9B
 L9FcXYmxZXAUROebbuLa0lJb7oQWZcZZ+YyI3m30MMJyku3KiYDyM1C/S+/83g+dRAxFeTT0rxG
 jsQEvAdj+X7a7UJE+Sg==
X-Received: by 2002:adf:bac8:: with SMTP id w8mr28417620wrg.47.1592237567294; 
 Mon, 15 Jun 2020 09:12:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxiQOXjqQQ1aVV/DMBBwdCBUIXzmVfkbVaKfgy1+7guKzFN4POZrpQ2VrFAH3n/uZqI3s32oA==
X-Received: by 2002:adf:bac8:: with SMTP id w8mr28417601wrg.47.1592237567022; 
 Mon, 15 Jun 2020 09:12:47 -0700 (PDT)
Received: from [192.168.178.58] ([151.48.99.33])
 by smtp.gmail.com with ESMTPSA id w1sm53537wmi.13.2020.06.15.09.12.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jun 2020 09:12:46 -0700 (PDT)
Subject: Re: [PATCH] Makefile: Install qemu-[qmp/ga]-ref.* into the directory
 "interop"
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Yi Wang <wang.yi59@zte.com.cn>, qemu-devel@nongnu.org
Cc: Liao Pingfang <liao.pingfang@zte.com.cn>, wang.liang82@zte.com.cn,
 xue.zhihong@zte.com.cn, QEMU Trivial <qemu-trivial@nongnu.org>
References: <1591663670-47712-1-git-send-email-wang.yi59@zte.com.cn>
 <94e456a8-0b4f-e1fd-7baa-8f81f36c6872@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <31290c21-01bb-e191-a166-1595f4fc8549@redhat.com>
Date: Mon, 15 Jun 2020 18:12:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <94e456a8-0b4f-e1fd-7baa-8f81f36c6872@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/15 01:17:36
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Mon, 15 Jun 2020 16:12:56 -0000

On 09/06/20 06:28, Philippe Mathieu-Daudé wrote:
> On 6/9/20 2:47 AM, Yi Wang wrote:
>> From: Liao Pingfang <liao.pingfang@zte.com.cn>
>>
>> We need install qemu-[qmp/ga]-ref.* files into the subdirectory of qemu docs: interop.
>>
>> If we visit the following address and click the link to qemu-qmp-ref.html:
>> https://www.qemu.org/docs/master/interop/bitmaps.html#basic-qmp-usage
>>
>> It will report following error:
>> "
>> Not Found
>> The requested URL /docs/master/interop/qemu-qmp-ref.html was not found on this server.
>> "
>>
> 
> Fixes: d59157ea058b5 ('docs: create interop/ subdirectory')
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
>> Signed-off-by: Liao Pingfang <liao.pingfang@zte.com.cn>
>> ---
>>  Makefile           | 10 ++++++----
>>  docs/index.html.in |  4 ++--
>>  2 files changed, 8 insertions(+), 6 deletions(-)
>>
>> diff --git a/Makefile b/Makefile
>> index 40e4f76..49dbe7a 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -879,8 +879,9 @@ install-sphinxdocs: sphinxdocs
>>  install-doc: $(DOCS) install-sphinxdocs
>>  	$(INSTALL_DIR) "$(DESTDIR)$(qemu_docdir)"
>>  	$(INSTALL_DATA) $(MANUAL_BUILDDIR)/index.html "$(DESTDIR)$(qemu_docdir)"
>> -	$(INSTALL_DATA) docs/interop/qemu-qmp-ref.html "$(DESTDIR)$(qemu_docdir)"
>> -	$(INSTALL_DATA) docs/interop/qemu-qmp-ref.txt "$(DESTDIR)$(qemu_docdir)"
>> +	$(INSTALL_DIR) "$(DESTDIR)$(qemu_docdir)/interop"
>> +	$(INSTALL_DATA) docs/interop/qemu-qmp-ref.html "$(DESTDIR)$(qemu_docdir)/interop"
>> +	$(INSTALL_DATA) docs/interop/qemu-qmp-ref.txt "$(DESTDIR)$(qemu_docdir)/interop"
>>  ifdef CONFIG_POSIX
>>  	$(INSTALL_DIR) "$(DESTDIR)$(mandir)/man1"
>>  	$(INSTALL_DATA) $(MANUAL_BUILDDIR)/system/qemu.1 "$(DESTDIR)$(mandir)/man1"
>> @@ -898,8 +899,9 @@ ifdef CONFIG_TRACE_SYSTEMTAP
>>  endif
>>  ifneq (,$(findstring qemu-ga,$(TOOLS)))
>>  	$(INSTALL_DATA) $(MANUAL_BUILDDIR)/interop/qemu-ga.8 "$(DESTDIR)$(mandir)/man8"
>> -	$(INSTALL_DATA) docs/interop/qemu-ga-ref.html "$(DESTDIR)$(qemu_docdir)"
>> -	$(INSTALL_DATA) docs/interop/qemu-ga-ref.txt "$(DESTDIR)$(qemu_docdir)"
>> +	$(INSTALL_DIR) "$(DESTDIR)$(qemu_docdir)/interop"
>> +	$(INSTALL_DATA) docs/interop/qemu-ga-ref.html "$(DESTDIR)$(qemu_docdir)/interop"
>> +	$(INSTALL_DATA) docs/interop/qemu-ga-ref.txt "$(DESTDIR)$(qemu_docdir)/interop"
>>  	$(INSTALL_DATA) docs/interop/qemu-ga-ref.7 "$(DESTDIR)$(mandir)/man7"
>>  endif
>>  endif
>> diff --git a/docs/index.html.in b/docs/index.html.in
>> index e9a1603..6736fa4 100644
>> --- a/docs/index.html.in
>> +++ b/docs/index.html.in
>> @@ -12,8 +12,8 @@
>>              <li><a href="tools/index.html">Tools Guide</a></li>
>>              <li><a href="interop/index.html">System Emulation Management and Interoperability Guide</a></li>
>>              <li><a href="specs/index.html">System Emulation Guest Hardware Specifications</a></li>
>> -            <li><a href="qemu-qmp-ref.html">QMP Reference Manual</a></li>
>> -            <li><a href="qemu-ga-ref.html">Guest Agent Protocol Reference</a></li>
>> +            <li><a href="interop/qemu-qmp-ref.html">QMP Reference Manual</a></li>
>> +            <li><a href="interop/qemu-ga-ref.html">Guest Agent Protocol Reference</a></li>
>>          </ul>
>>      </body>
>>  </html>
>>
> 

Queued, thanks.

Paolo


