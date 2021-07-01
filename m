Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lz4eV-0006sF-72
	for mharc-qemu-trivial@gnu.org; Thu, 01 Jul 2021 17:55:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lz4eU-0006rz-1C
 for qemu-trivial@nongnu.org; Thu, 01 Jul 2021 17:55:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lz4eR-0005Qi-6i
 for qemu-trivial@nongnu.org; Thu, 01 Jul 2021 17:55:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625176509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YinDB3O0gpIcKqYXAlGeUG1RXR5N8QCQpobSv1gZln4=;
 b=cjpVyBRD6IT+gYkaZs9knj6vUAVB5533z8Y3uYd4Gve6VQIt/Z18QGoMmgNgw6LocbJncb
 RwpWfHnVESCI5DcDQAn99X0ng4UbmL1aMNTWkn5ZBkZ+FgYMmuW95wd+Ze2tT7FwBc95Y7
 iE1+v7e2FYa8sGCtzylo/dyWlK+zk+c=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-xJsT8uH4PwSKdm_8eXDZNw-1; Thu, 01 Jul 2021 17:55:07 -0400
X-MC-Unique: xJsT8uH4PwSKdm_8eXDZNw-1
Received: by mail-wm1-f69.google.com with SMTP id
 j6-20020a05600c1906b029019e9c982271so5187065wmq.0
 for <qemu-trivial@nongnu.org>; Thu, 01 Jul 2021 14:55:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YinDB3O0gpIcKqYXAlGeUG1RXR5N8QCQpobSv1gZln4=;
 b=nmnSfyEgnUqdl+lmAJ6PLoMy15llrG2rG704pJ5shXVBE6YoBf5FTZHefJM+lr5R1B
 EjqkReMtnvD4fQTsIroW/SnF2b5VU5Q/pgt7zputhXC5XrEztcJ6lWw2EC5Uxgjg4poP
 64c3m6vmsk4m0ohE64mVwdwrhqeABRL2Jo7P4YJ0tR1zOW0gi0TlGTtAqDWXatL1UUB6
 wBU05jnpJXKbaJID0+DQ27pZHW6Qzu+2rfZfgg6woPr3nuTYJh64Yteg4Qcn6pX2fUm6
 L/coE1gr/VgHZ5bxMpWVMXe2U6C/808YUjUz+pvIcsZI/gzCB6XlMa4uiKG7eaMEebjo
 n6vg==
X-Gm-Message-State: AOAM533+jW1dyY8EHIZiJPt6yVZ1rK59SXcDn7xIzTWIi5dV/8A7ft5v
 Nmk4LAOD898c4BNkjEt8XElOT0BIeuTdRpr/KP+XFg4XhiZ+nB/Orr1HUdjxnuIpay7CCe3JTij
 CPUvJBRpn/wdXO7ia4g==
X-Received: by 2002:a1c:f216:: with SMTP id s22mr1932500wmc.18.1625176506639; 
 Thu, 01 Jul 2021 14:55:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwFSfV/172tqLFqOHzpg2snwMPLaMCMuZY2b3lyoIl4tpJaMh04RKFyjVb4rdWVPPJKHL0DtA==
X-Received: by 2002:a1c:f216:: with SMTP id s22mr1932483wmc.18.1625176506471; 
 Thu, 01 Jul 2021 14:55:06 -0700 (PDT)
Received: from [192.168.11.95] (pop.92-184-108-151.mobile.abo.orange.fr.
 [92.184.108.151])
 by smtp.gmail.com with ESMTPSA id s17sm1141681wrt.58.2021.07.01.14.55.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jul 2021 14:55:06 -0700 (PDT)
Subject: Re: [PATCH] virtiofsd: Add missing newline in error message
To: Hubert Jasudowicz <hubert.jasudowicz@gmail.com>, qemu-devel@nongnu.org
Cc: virtio-fs@redhat.com, qemu-trivial@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <e5914ad202a13e9c1bc2a5efa267ff3bd4f48db6.1625173475.git.hubert.jasudowicz@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <4081fc8a-7a52-2903-eeeb-c044bc7dfd01@redhat.com>
Date: Thu, 1 Jul 2021 23:55:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <e5914ad202a13e9c1bc2a5efa267ff3bd4f48db6.1625173475.git.hubert.jasudowicz@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.402,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 01 Jul 2021 21:55:18 -0000

On 7/1/21 11:11 PM, Hubert Jasudowicz wrote:
> From: Hubert Jasudowicz <hubert.jasudowicz@gmail.com>
> 
> Signed-off-by: Hubert Jasudowicz <hubert.jasudowicz@gmail.com>
> ---
>  tools/virtiofsd/fuse_virtio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


