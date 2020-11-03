Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kZluT-0001hF-17
	for mharc-qemu-trivial@gnu.org; Mon, 02 Nov 2020 21:18:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kZluR-0001dw-AI
 for qemu-trivial@nongnu.org; Mon, 02 Nov 2020 21:18:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kZltu-0004oj-8y
 for qemu-trivial@nongnu.org; Mon, 02 Nov 2020 21:18:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604369898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ESQS/9ZpN8f5wR/Ua+oxoReioLgsWM4Nnz/LVkHEDRc=;
 b=BUrWNghpzcyB5TdlsDcL83BK9QPEn8wK7bIEVPKXALDD/SJmdft3ITaP9FaX2+YmOFWZN/
 Qn/U2QXVASWakoAsCrWLIfmQ1OsFhn9QqfmOOz18jlcQw+uXMyye73IuuDSidTNzklebwI
 XzHhzPorlWDh+DsorDb7lu212EWHhBA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-vk7uDe_dPfCuoi0KeGSSQg-1; Mon, 02 Nov 2020 21:18:16 -0500
X-MC-Unique: vk7uDe_dPfCuoi0KeGSSQg-1
Received: by mail-wr1-f69.google.com with SMTP id j15so7217946wrd.16
 for <qemu-trivial@nongnu.org>; Mon, 02 Nov 2020 18:18:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ESQS/9ZpN8f5wR/Ua+oxoReioLgsWM4Nnz/LVkHEDRc=;
 b=FJo/vg8oY1stioPsWuesaxtAbJ1Bq5TMCH9IdkZ83utFQ/0u19wtg+2ba64RMxa7zC
 JGFLl6M2XG575eeN8p8sJFvVmT/uN+mj6JO4rHpOVLG590SuRBUkQPz10CpQuwG26mE6
 liHEd8qnu2zJdTC3kmqHXCSaE5HqCJX2V0PazhJsEOr6rDMBOD7hoi0iowOHmlViXc3c
 rnqorH6o70yD/juYybYaPUHj/7ATggRtLggzVrFFBFIgWo7JgyvV+NMwMICYB5RlGCQa
 sR5TInK2APK+X6e89Vb+YttAf1mou9YpxK4ITLlzGh+xLjqqS/jlBPXYfVh6eGGyqhKV
 kO0w==
X-Gm-Message-State: AOAM531FnzE3tn/zLxmvMzCIsXEaYTrjbqBCxJO2euC6jnZ1WBxC8KZB
 cbEYocPmTN89t4GncuPzWAduWZbUBL2ni7EaDKmY42NyoNUj+iV0hAO7+YyJiNPaiolV64aFRov
 jzyKWdm1SDTB0BNO73w==
X-Received: by 2002:a1c:2cc2:: with SMTP id s185mr984861wms.77.1604369895700; 
 Mon, 02 Nov 2020 18:18:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwhFPuiT+gVFPGa9j4dfWHFSgwNyIcohjaiyosSRuwjfQIy8LUY3Of1VcNoTrNXDTCIIiY/Pw==
X-Received: by 2002:a1c:2cc2:: with SMTP id s185mr984855wms.77.1604369895545; 
 Mon, 02 Nov 2020 18:18:15 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id t1sm23552014wrs.48.2020.11.02.18.18.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Nov 2020 18:18:14 -0800 (PST)
Subject: Re: [PATCH 5/6] plugins/loader: fix uninitialized variable warning in
 plugin_reset_uninstall()
To: Chen Qun <kuhn.chenqun@huawei.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 zhang.zhanghailiang@huawei.com, ganqixin@huawei.com,
 Euler Robot <euler.robot@huawei.com>
References: <20201103015228.2250547-1-kuhn.chenqun@huawei.com>
 <20201103015228.2250547-6-kuhn.chenqun@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b069ab47-8f3d-b4e9-77f6-567b1dcbd296@redhat.com>
Date: Tue, 3 Nov 2020 03:18:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201103015228.2250547-6-kuhn.chenqun@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/02 20:52:37
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
X-List-Received-Date: Tue, 03 Nov 2020 02:18:55 -0000

On 11/3/20 2:52 AM, Chen Qun wrote:
> After the WITH_QEMU_LOCK_GUARD macro is added, the compiler cannot identify
>  that the statements in the macro must be executed. As a result, some variables
>  assignment statements in the macro may be considered as unexecuted by the compiler.
> 
> The compiler showed warning:
> plugins/loader.c: In function ‘plugin_reset_uninstall’:
> plugins/loader.c:382:15: warning: ‘ctx’ may be used uninitialized in this function [-Wmaybe-uninitialized]

This shouldn't happen as the function returns before
(else there is a NULL deref).

>  382 |     data->ctx = ctx;
>      |     ~~~~~~~~~~^~~~~
> 
> Add a default value for 'expire_time' to prevented the warning.
> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
> ---
> Cc: "Alex Bennée" <alex.bennee@linaro.org>
> ---
>  plugins/loader.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/plugins/loader.c b/plugins/loader.c
> index 8ac5dbc20f..88593fe138 100644
> --- a/plugins/loader.c
> +++ b/plugins/loader.c
> @@ -367,7 +367,7 @@ void plugin_reset_uninstall(qemu_plugin_id_t id,
>                              bool reset)
>  {
>      struct qemu_plugin_reset_data *data;
> -    struct qemu_plugin_ctx *ctx;
> +    struct qemu_plugin_ctx *ctx = NULL;
>  
>      WITH_QEMU_LOCK_GUARD(&plugin.lock) {
>          ctx = plugin_id_to_ctx_locked(id);
> 


