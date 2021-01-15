Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l0LI2-0002sq-Hm
	for mharc-qemu-trivial@gnu.org; Fri, 15 Jan 2021 04:21:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l0LHz-0002j2-7Q
 for qemu-trivial@nongnu.org; Fri, 15 Jan 2021 04:21:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l0LHx-0003h0-Jh
 for qemu-trivial@nongnu.org; Fri, 15 Jan 2021 04:21:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610702460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V9OdiJ8KfdmTysTbQmmgc6B+rAetjlL/92+UFrG/UMM=;
 b=Pm+M7kO0CuLrjSyzfsGQeDdaw78tem3UVhaZtJA19Qfsuku1RKE0/2gTerOKiiGR48Ga5n
 biVZPyTXOJYp/nbVQSbBsA6PXHXyaikgEyiss7HLi8KEkesS/VAmibzNWYxm8XxsjVHwk9
 NEpTHBMpzY/HJtUlpwk4FjXTtnb7Cjg=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-66-s5bmog1dPq2CYX4kancthg-1; Fri, 15 Jan 2021 04:20:56 -0500
X-MC-Unique: s5bmog1dPq2CYX4kancthg-1
Received: by mail-ej1-f71.google.com with SMTP id d19so3371334ejo.18
 for <qemu-trivial@nongnu.org>; Fri, 15 Jan 2021 01:20:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=V9OdiJ8KfdmTysTbQmmgc6B+rAetjlL/92+UFrG/UMM=;
 b=M6CpNIsbG8Z83frmbrMHX2ywWce/luNiyiR9ezJ9GbGDyOf6VWo1asriVx4Z1w9SUp
 5VbTJMNQpzC2V0zZWQREn+7+152O6BZtdxX9iicmhIK9UqIf7GbljxnBPNNn+OiF5bLg
 ysq+MNElonLuIeTbr29H/WsqeLyWQLRhG4CzQrE/yXjwvk/gdK0hlDEgLNJtyco1dro5
 aCln+JdEhZ+DcZIfIxJSApN1wosF7ONWE2bHoI6I1MPYtRZsffQauyjzwx8/PA5BIbWE
 DGoBODUZoBEANJXVLP2tdUO3oMlqCBp0KGD0i3LeHAjb3CKC9t08SJVr79TMv/sdlLw2
 4aMw==
X-Gm-Message-State: AOAM531eeHC0PSjFX8BHFZDRjdZoKRXOLxr3U29Dox/nOazEMHrSmhGd
 Rpi6eEu5N8OlWlqa9PVVDWTO1+v60kl4odCTtBjAkhmLwHqI5DpbVb9iWlk7lGfYukGyp4uugjc
 wNk1m5wG6vSIDKtgY6g==
X-Received: by 2002:a17:906:d8b4:: with SMTP id
 qc20mr5037823ejb.451.1610702455602; 
 Fri, 15 Jan 2021 01:20:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyZzC/vRTBjuwEJQaeSmzFfxwiD8GKjKtVJCnCcThRavzXtcHt+Fj5Gx21vBArAbuz69OfR2A==
X-Received: by 2002:a17:906:d8b4:: with SMTP id
 qc20mr5037811ejb.451.1610702455446; 
 Fri, 15 Jan 2021 01:20:55 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id z22sm1815705edb.88.2021.01.15.01.20.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Jan 2021 01:20:54 -0800 (PST)
Subject: Re: [PATCH v2 5/7] audio: Don't use '%#' in format strings
To: Zhang Han <zhanghan64@huawei.com>, kraxel@redhat.com
Cc: hunongda@huawei.com, zhang.zhanghailiang@huawei.com,
 qemu-trivial@nongnu.org, qemu-devel@nongnu.org, alex.chen@huawei.com
References: <20210115012431.79533-1-zhanghan64@huawei.com>
 <20210115012431.79533-6-zhanghan64@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <c192c063-74da-0d48-de8a-51274665e43b@redhat.com>
Date: Fri, 15 Jan 2021 10:20:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210115012431.79533-6-zhanghan64@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.237, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 15 Jan 2021 09:21:03 -0000

On 1/15/21 2:24 AM, Zhang Han wrote:
> Use '0x' prefix instead of '%#'
> 
> Signed-off-by: Zhang Han <zhanghan64@huawei.com>
> ---
>  audio/dsoundaudio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


