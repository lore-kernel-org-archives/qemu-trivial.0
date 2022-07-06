Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o8yry-0002yp-2A
	for mharc-qemu-trivial@gnu.org; Wed, 06 Jul 2022 02:50:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8yrw-0002u0-9a
 for qemu-trivial@nongnu.org; Wed, 06 Jul 2022 02:50:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8yrp-0004GD-1o
 for qemu-trivial@nongnu.org; Wed, 06 Jul 2022 02:50:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657090231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vKURHNN54r90cyFaxAqAgF5CKrEb9ORGLRIB7ZTQKPU=;
 b=GODK2rFBCLqfJ77ypa7ph1BLOkP6Kdy8gLkuOA/FP/H4u2m0FIQ2sFaEY3Ee7whwnjI5Xy
 spTi6HhxguekL1juOt/VUdCWaeJWTZDF1KCswHkwn7jgTneYIJM2onuGy7LaUCdaD0dA2Z
 Ncj0V9LE6KXNkGjohhco8NYxIpQh0Tg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-340-q4lAAcVJMMmqFScCXeH5fQ-1; Wed, 06 Jul 2022 02:50:30 -0400
X-MC-Unique: q4lAAcVJMMmqFScCXeH5fQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 l11-20020adfbd8b000000b0021d754b84c5so830490wrh.17
 for <qemu-trivial@nongnu.org>; Tue, 05 Jul 2022 23:50:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vKURHNN54r90cyFaxAqAgF5CKrEb9ORGLRIB7ZTQKPU=;
 b=fYfb+CSN7qPUwodus7TbbhNi3VZLyIkrPc6BENyj2NzblcfzzAWPk0o8ICVg3mni/6
 L4Gkq7sJ3G5T+cQ3Be6TKlx1CgQ5iditGfJBgP6vM2+sn6lewkl6G4ZSVF5yqASmJkg5
 lve/244OVm2i8I6jRymKAo8bhM36CG3lGbChOXfSl4cDHCCH7GXEi8pi6kq+2nh5aW4e
 Cb1OCAQHcfz3xJd3HTz5CF1vwf/rUZaU3wo0U5FQH6VWxFQm3NhwuH8NdsZprni4u4ux
 ++E2QXbjDzjXqqmOGaahWFXiqzAmBFkR3TkAh1QvPfGSeuI3FEaRYVXEBv6dxOJZ3ZGv
 dqCQ==
X-Gm-Message-State: AJIora+6lGjTAwt3nzCSA3scI7m0ZPy/mE7UWQz8Azh9ii9+bEMe8FLX
 +9WCLYvwlKB7MJIwsfGAf1UTQOw3j02vAJf9ZUN0aiA0q6AS87lT5FQ/+3hFq4i0vEQBWExRHcO
 AcFVHiIkEbvZOwju8+A==
X-Received: by 2002:adf:e786:0:b0:21d:6ec1:ee5c with SMTP id
 n6-20020adfe786000000b0021d6ec1ee5cmr9059726wrm.285.1657090229224; 
 Tue, 05 Jul 2022 23:50:29 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u2Ev/iuGG9nohbip+/UkuOjpgrjVH9gKOb59ly5aq60/LpTOg+m6jMc7ohzk1JuTXrwHSuNQ==
X-Received: by 2002:adf:e786:0:b0:21d:6ec1:ee5c with SMTP id
 n6-20020adfe786000000b0021d6ec1ee5cmr9059706wrm.285.1657090229016; 
 Tue, 05 Jul 2022 23:50:29 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-21.web.vodafone.de.
 [109.43.176.21]) by smtp.gmail.com with ESMTPSA id
 c3-20020adfef43000000b0021bab0ba755sm36127769wrp.106.2022.07.05.23.50.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jul 2022 23:50:28 -0700 (PDT)
Message-ID: <d6c8a2e8-0db1-d541-3f06-bcf2e2938853@redhat.com>
Date: Wed, 6 Jul 2022 08:50:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] scsi/lsi53c895a: fix use-after-free in lsi_do_msgout
 (CVE-2022-0216)
To: Mauro Matteo Cascella <mcascell@redhat.com>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, fam@euphon.net, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20220705200543.2366809-1-mcascell@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220705200543.2366809-1-mcascell@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Jul 2022 06:50:40 -0000

On 05/07/2022 22.05, Mauro Matteo Cascella wrote:
> Set current_req->req to NULL to prevent reusing a free'd buffer in case of
> repeated SCSI cancel requests. Thanks to Thomas Huth for suggesting the patch.
> 
> Fixes: CVE-2022-0216
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/972
> Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
> ---
>   hw/scsi/lsi53c895a.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
> index c8773f73f7..99ea42d49b 100644
> --- a/hw/scsi/lsi53c895a.c
> +++ b/hw/scsi/lsi53c895a.c
> @@ -1028,8 +1028,9 @@ static void lsi_do_msgout(LSIState *s)
>           case 0x0d:
>               /* The ABORT TAG message clears the current I/O process only. */
>               trace_lsi_do_msgout_abort(current_tag);
> -            if (current_req) {
> +            if (current_req && current_req->req) {
>                   scsi_req_cancel(current_req->req);
> +                current_req->req = NULL;
>               }
>               lsi_disconnect(s);
>               break;

Let's hope that this will fix the issue for good...

Reviewed-by: Thomas Huth <thuth@redhat.com>


