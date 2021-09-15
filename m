Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQcaD-0006r9-4G
	for mharc-qemu-trivial@gnu.org; Wed, 15 Sep 2021 17:36:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mQcaB-0006gx-8s
 for qemu-trivial@nongnu.org; Wed, 15 Sep 2021 17:36:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mQca7-0006vl-LN
 for qemu-trivial@nongnu.org; Wed, 15 Sep 2021 17:36:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631741798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BORSjSfbNvpvUxtyAsGETSrImGVciqjJRsiTFdVXq4U=;
 b=I19fPqlUg6+/7orABsghQAJWu0KPI4r8PBztRbjN1NkFhOUx0ZDeLbwE1a9K7eGtDjen9u
 10ZQ4OhchYlHTT5iCVBUsg/xznuWeIfbxKnt70VzMbHUk5t3hxBTbvToVyWRr9JBr5iNUo
 fYFIwpbleJ0XybjHHy1XPCLVV7A8/1o=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-598-wgOERrIHOsaH-YR4yWdsSA-1; Wed, 15 Sep 2021 17:36:34 -0400
X-MC-Unique: wgOERrIHOsaH-YR4yWdsSA-1
Received: by mail-wm1-f71.google.com with SMTP id
 5-20020a1c00050000b02902e67111d9f0so2087651wma.4
 for <qemu-trivial@nongnu.org>; Wed, 15 Sep 2021 14:36:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BORSjSfbNvpvUxtyAsGETSrImGVciqjJRsiTFdVXq4U=;
 b=Z7UneaLvavOA+t+v08b2kHnJLVOSFEudFCvOpcx5l5MXlXabHS1ev7HLXO2bxqc83O
 7Jb4BXZWq+NsFRM/CT+q+9c8tawULiqpUvHxvT5I7wBPUCssOk0KpOy+9qvtepUHUlj9
 VDLc/r6ZqF1Q40Qb+t5GlykkWw+x1zugL15sHFqbbw7IgEdj/vjzjx3MihP8hNBHT+bU
 SJmejtE0Jb7ubYzSOdCJSAOWqzKYUWcKCRO7MOvQKtRZPYbkJ+mWzQ9ozuZAbr0Y/lE1
 NH3xpYpKC9yW3Pk9JbKmBXTMp/pQePnVw162V8+sF3D4jaK3Zcaqtz6BfeBVk7UX4F7F
 qI6g==
X-Gm-Message-State: AOAM532DM4gJvctbrVlNiHzMOZX5MzHMPq9gqW2padfgb7+eZ0FlZOHL
 suaPeJ5A7d8TOlA+3hPjTG00rJ6kd222y17L2zi0bkL3+5aXz5nrIRtSBafz129RsjXeRtHBfVw
 R3qi5xOSRB7DtqNeFpQ==
X-Received: by 2002:a5d:4b0b:: with SMTP id v11mr2305867wrq.359.1631741793283; 
 Wed, 15 Sep 2021 14:36:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxktvJZZqy79tCPyxImX6dmvisXSUjrTVxhyVYSeuFnmKZRFGm7NS6chSO2Saq4ZE5/RdUFvQ==
X-Received: by 2002:a5d:4b0b:: with SMTP id v11mr2305856wrq.359.1631741793081; 
 Wed, 15 Sep 2021 14:36:33 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id m4sm5569417wml.28.2021.09.15.14.36.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 14:36:32 -0700 (PDT)
Subject: Re: [PATCH] qemu-storage-daemon: Only display FUSE help when FUSE is
 built-in
To: qemu-devel@nongnu.org, QEMU Trivial <qemu-trivial@nongnu.org>
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Qing Wang <qinwang@redhat.com>
References: <20210816180442.2000642-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <152eb50e-621f-cbac-4748-dc689aa08635@redhat.com>
Date: Wed, 15 Sep 2021 23:36:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210816180442.2000642-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.698, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 15 Sep 2021 21:36:43 -0000

ping & Cc'ing qemu-trivial@ (reviewed twice) ...

On 8/16/21 8:04 PM, Philippe Mathieu-Daudé wrote:
> When configuring QEMU with --disable-fuse, the qemu-storage-daemon
> still reports FUSE command line options in its help:
> 
>   $ qemu-storage-daemon -h
>   Usage: qemu-storage-daemon [options]
>   QEMU storage daemon
> 
>     --export [type=]fuse,id=<id>,node-name=<node-name>,mountpoint=<file>
>              [,growable=on|off][,writable=on|off]
>                            export the specified block node over FUSE
> 
> Remove this help message when FUSE is disabled, to avoid:
> 
>   $ qemu-storage-daemon --export fuse
>   qemu-storage-daemon: --export fuse: Invalid parameter 'fuse'
> 
> Reported-by: Qing Wang <qinwang@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  storage-daemon/qemu-storage-daemon.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/storage-daemon/qemu-storage-daemon.c b/storage-daemon/qemu-storage-daemon.c
> index fc8b1506297..10a1a33761d 100644
> --- a/storage-daemon/qemu-storage-daemon.c
> +++ b/storage-daemon/qemu-storage-daemon.c
> @@ -98,10 +98,12 @@ static void help(void)
>  "                         export the specified block node over NBD\n"
>  "                         (requires --nbd-server)\n"
>  "\n"
> +#ifdef CONFIG_FUSE
>  "  --export [type=]fuse,id=<id>,node-name=<node-name>,mountpoint=<file>\n"
>  "           [,growable=on|off][,writable=on|off]\n"
>  "                         export the specified block node over FUSE\n"
>  "\n"
> +#endif /* CONFIG_FUSE */
>  "  --monitor [chardev=]name[,mode=control][,pretty[=on|off]]\n"
>  "                         configure a QMP monitor\n"
>  "\n"
> 


