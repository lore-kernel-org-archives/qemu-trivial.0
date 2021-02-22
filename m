Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lE6YD-0000w8-2n
	for mharc-qemu-trivial@gnu.org; Mon, 22 Feb 2021 03:26:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lE6Y4-0000uR-IT
 for qemu-trivial@nongnu.org; Mon, 22 Feb 2021 03:26:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lE6Xy-00062V-43
 for qemu-trivial@nongnu.org; Mon, 22 Feb 2021 03:26:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613982383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kn6yn48zB1vOQFeES5SZdkSApSJl5+RMCNgA3zLHnuw=;
 b=iQQiiw6gYJnQOlRjUURpXHXWb1owAOq2q4nguNPveYsZKZU1Yi3XEJn7ksELnfzIr7x3SO
 sS5zOl1dkSvsbIUPI4v3mBBMYb3JjLPv7jSU5eCYfv5UQ9N47cja4IvqHyehRPvTtSRFqW
 3+MO7dvgov5pdaPvVmTQvEL9RtIaka0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-rPWr3yYAOQiS_Dsd9UZxsw-1; Mon, 22 Feb 2021 03:26:21 -0500
X-MC-Unique: rPWr3yYAOQiS_Dsd9UZxsw-1
Received: by mail-wr1-f69.google.com with SMTP id q5so5745467wrs.20
 for <qemu-trivial@nongnu.org>; Mon, 22 Feb 2021 00:26:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Kn6yn48zB1vOQFeES5SZdkSApSJl5+RMCNgA3zLHnuw=;
 b=C567n4DYW9HqJ9WoNMiqLWUsC/jzKMmqR3Ht8ghGy9gE5p43bEN+sRYmsHNk5cc/Qb
 KlsIPtthuL1n6fnQj2A+4ukjvKcz9jeaFUQ2cPKFgn2yCjLL35AZkhYjvq0jd6nj9NMD
 YfnZNbNP3+7gc12eGU1kNHXB7+fhITGkDXtbGam7XDleP/tsqbbU+CCOVM012TNvz6qF
 dQY7WCQjQVuI1v44g7CMXYF2SzWbhiskGNyfEeSzLpE0JXwVVGwS9xphXgfo7EPvvNov
 RoB5v5IxsA0yHXGaBw3gmL4RcpS0/kOvSb3iUU5pQ8HzLnVpJaVunhStLSs8J3ZkxHZM
 o89A==
X-Gm-Message-State: AOAM5301jdVvSY8hw3NRaY4MxKNUsN46AJ7b9VwWBA82Lnr3egm2R8U5
 B4FDnjxuAvhkfnAioC10iDT7REZP1E8Y44wXaGNVXLDnsf8NxjJnff6Siaiy5AFpgCpIqiCmhkJ
 xtEF8FmKF9fE7Bv4Wa4qzB6Gm7zJyUD5Nb09IMZLpElE5JJOJUhiIt0PZTZxbxo1PzNs=
X-Received: by 2002:a05:600c:d4:: with SMTP id
 u20mr18974987wmm.163.1613982380259; 
 Mon, 22 Feb 2021 00:26:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw02yWGWLPakMzYAfA65qbX2Fs1SN/lUX60amisy99BNFbWcNfJfEozn2iN1cLBJs97lCSRIw==
X-Received: by 2002:a05:600c:d4:: with SMTP id
 u20mr18974975wmm.163.1613982380090; 
 Mon, 22 Feb 2021 00:26:20 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id 6sm34893198wra.63.2021.02.22.00.26.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Feb 2021 00:26:19 -0800 (PST)
Subject: Re: [PATCH] MAINTAINERS: Cover docs/igd-assign.txt in VFIO section
To: qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>, qemu-trivial@nongnu.org
References: <20210202155611.998424-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <da2393b7-c0a8-8f59-5ee5-4a5569f9853c@redhat.com>
Date: Mon, 22 Feb 2021 09:26:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210202155611.998424-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 22 Feb 2021 08:26:34 -0000

ping?

On 2/2/21 4:56 PM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index bcd88668bcd..838d0f14a59 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1768,6 +1768,7 @@ M: Alex Williamson <alex.williamson@redhat.com>
>  S: Supported
>  F: hw/vfio/*
>  F: include/hw/vfio/
> +F: docs/igd-assign.txt
>  
>  vfio-ccw
>  M: Cornelia Huck <cohuck@redhat.com>
> 


