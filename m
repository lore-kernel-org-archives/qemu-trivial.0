Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mzaPE-0000tM-5c
	for mharc-qemu-trivial@gnu.org; Tue, 21 Dec 2021 03:21:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mzaPB-0000lp-4E
 for qemu-trivial@nongnu.org; Tue, 21 Dec 2021 03:21:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mzaP8-0002yK-0t
 for qemu-trivial@nongnu.org; Tue, 21 Dec 2021 03:21:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640074909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=07GhwGn7j4ae+u7hh5YvN2Jnt2naPhaMay1KTTkLNlo=;
 b=eUqe3EieB1RagKvVgIGfpU9q7aepcwmbXhV/bnGel9aey+qxwLUyDLDWYKo9RPeKA+IBNN
 9I86ZTp3P4isLqV4q7pHScSu8wqevm/MtKHWSrVqR6+VX94AQ3zolweooue8oOfwDb6qgI
 Rr1QGnu7Jq5PasRy2EspwE+aCCKZMCs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-k8LeUfEUO7e4u6O4x3O7kw-1; Tue, 21 Dec 2021 03:21:47 -0500
X-MC-Unique: k8LeUfEUO7e4u6O4x3O7kw-1
Received: by mail-wr1-f70.google.com with SMTP id
 p1-20020adfba81000000b001a25b07ff53so4113362wrg.22
 for <qemu-trivial@nongnu.org>; Tue, 21 Dec 2021 00:21:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=07GhwGn7j4ae+u7hh5YvN2Jnt2naPhaMay1KTTkLNlo=;
 b=qbc1OeH9QUOI/4n1gA3A9LpxrQGXcXnl6DAIVRHsYmGxfrzvXVWuAWjBtZK8iSrAcI
 7or1QkiBCijnGt+MQVEW3VU+tAin8lcqMuO2dJ8JiJq1uhH3kOuVo7SqzzPFTOsEA4sr
 yrsOFT282oXHb+wVBSCQnk5UeAhp0doJgBA1AOI4CmnHqc3YWq3P5BKaKjgZ5aShE/Th
 RHK7LGZ9EU/dxoSo0HCRpH5rO1mMyeZmYzlDSYpJ1MB+TUnTLKnzd+kIUto7LmNBIaEa
 3uIrXfJcxlWh/PE5fmswIUdszUlDnmOGEHgSXQV/TtNYIShB46FLzAhng7ML9OymDiSm
 TuCA==
X-Gm-Message-State: AOAM530hrpkuQi6K6spmtwP6zJ9PUAFLki4Auvr7F/Xpj7QOpvJdfCG/
 zXymfksWSJ/flubhQHzmtg1cQWxfOJcNm6UYZ8tCrUpaDDz7R866TLilVDXytA5J7kFkdcy7QPr
 20VQQQbZs0zexU4DF5Q==
X-Received: by 2002:a5d:5912:: with SMTP id v18mr1636237wrd.144.1640074905706; 
 Tue, 21 Dec 2021 00:21:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzsw8xESniN3p3Vyc1PzD4kh0dNPuoImepIKvhuaZX4PTGmS0Dy+FADGqYmZicWvPkz5mGibw==
X-Received: by 2002:a5d:5912:: with SMTP id v18mr1636217wrd.144.1640074905440; 
 Tue, 21 Dec 2021 00:21:45 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id l4sm4268562wrm.62.2021.12.21.00.21.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Dec 2021 00:21:45 -0800 (PST)
Message-ID: <424a4ea1-b6db-c0c9-fcd8-5d567ce03195@redhat.com>
Date: Tue, 21 Dec 2021 09:21:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] MAINTAINERS: Update COLO Proxy section
To: Zhang Chen <chen.zhang@intel.com>, Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-dev <qemu-devel@nongnu.org>
Cc: Li Zhijian <lizhijian@cn.fujitsu.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20211221080400.1492980-1-chen.zhang@intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211221080400.1492980-1-chen.zhang@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.012, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 21 Dec 2021 08:21:53 -0000

Cc'ing qemu-trivial@

On 12/21/21 09:04, Zhang Chen wrote:
> Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1de6ce6e44..5479b9376e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2983,6 +2983,7 @@ F: docs/colo-proxy.txt
>  F: net/colo*
>  F: net/filter-rewriter.c
>  F: net/filter-mirror.c
> +F: tests/qtest/test-filter*

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


