Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jaadH-0002oL-2e
	for mharc-qemu-trivial@gnu.org; Mon, 18 May 2020 03:56:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jaadF-0002mF-Fj
 for qemu-trivial@nongnu.org; Mon, 18 May 2020 03:56:17 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:45520
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jaadE-0005fj-Jk
 for qemu-trivial@nongnu.org; Mon, 18 May 2020 03:56:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589788575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=30sJb6XvL+VUIj7MLhqbvtpw7ik1DUXGLc8LLLbVcrY=;
 b=B+RnXFsDJuNjNX+ZKxhzJ8U2AaPM+r1xGJTTRbTyC+bmKXZ0P4lRitMCH82d0PgdWPRV58
 udsyq+dWySZS00gbTE8j2Qh+fNeMoDWrx+1hUUVxy8uvZl0btzCVPDERiEL7m2xM7cvjVW
 cfazoA+yTGh4nv8Fj+8UguGtYpFgNok=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-ovH0XoTDMFisg49gGEOKjA-1; Mon, 18 May 2020 03:56:13 -0400
X-MC-Unique: ovH0XoTDMFisg49gGEOKjA-1
Received: by mail-wr1-f71.google.com with SMTP id w9so5282273wrr.3
 for <qemu-trivial@nongnu.org>; Mon, 18 May 2020 00:56:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=30sJb6XvL+VUIj7MLhqbvtpw7ik1DUXGLc8LLLbVcrY=;
 b=fY4gedwWdPdkP12OKGQJXQV7c8T8SmstFHEuMwXTW8AsoQQSFgclr2aiYMHj1A66L3
 Ybr1XiFwc2V7hMKZQtDEktJUaMJ+yVeiDtQtRAyYsEofgR+PuGRPWb+N+QULkx5nWEzT
 /z29KubeHSHR3CbgOG7oWxx3DIoGPnI8zbpj64Yug9EX4Ulv9K9jc6x/91ApNELuZOi7
 HgsobT6b1RyVSNbsIqQa7ennYO13quCTvGY1k7cbPPzEEEc03hGgOUHKCXN1glxeWbhJ
 6blLkLufogInQB/nwTWLQk5S/N5r2jxaoX1/XxNwKo/KzneOz/SSQKHCcGPRLNlu+RG9
 xJEw==
X-Gm-Message-State: AOAM532ZPXz6QAf/53/1VMBaaOme0YnmeEq0XYK+FnY5evgFyQPO36OF
 R/Ji5uJlbJtByKQXHGvN+Ui6n2EvvGgGRbP+EaLNG3rOLzKarzlf7Dfr82hWCIIS5UiN29hjrYz
 ttScW7pKdLqUzuJAm8w==
X-Received: by 2002:a1c:4b0e:: with SMTP id y14mr18503674wma.170.1589788572755; 
 Mon, 18 May 2020 00:56:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyBRFK+M62G8A1k+bSBH3qz5uy11UEAhm+n2ooKiDEXfKFrNpoyybH2X6yv+M4xfWn1aCDV/A==
X-Received: by 2002:a1c:4b0e:: with SMTP id y14mr18503643wma.170.1589788572460; 
 Mon, 18 May 2020 00:56:12 -0700 (PDT)
Received: from [192.168.1.38] (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id c143sm13962443wmd.43.2020.05.18.00.56.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 May 2020 00:56:11 -0700 (PDT)
Subject: Re: [PATCH] net: Do not include a newline in the id of -nic devices
To: Thomas Huth <thuth@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, qemu-stable@nongnu.org
References: <20200518074352.23125-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <1dfc3a44-8528-beb1-7c02-63274b6ccd20@redhat.com>
Date: Mon, 18 May 2020 09:56:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200518074352.23125-1-thuth@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/17 22:52:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Mon, 18 May 2020 07:56:17 -0000

On 5/18/20 9:43 AM, Thomas Huth wrote:
> The '\n' sneaked in by accident here, an "id" string should really
> not contain a newline character at the end.
> 
> Fixes: 78cd6f7bf6b ('net: Add a new convenience option "--nic" ...')
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   net/net.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/net/net.c b/net/net.c
> index 38778e831d..cbeeeadff8 100644
> --- a/net/net.c
> +++ b/net/net.c
> @@ -1506,7 +1506,7 @@ static int net_param_nic(void *dummy, QemuOpts *opts, Error **errp)
>       /* Create an ID if the user did not specify one */
>       nd_id = g_strdup(qemu_opts_id(opts));
>       if (!nd_id) {
> -        nd_id = g_strdup_printf("__org.qemu.nic%i\n", idx);
> +        nd_id = g_strdup_printf("__org.qemu.nic%i", idx);
>           qemu_opts_set_id(opts, nd_id);
>       }
>   
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


