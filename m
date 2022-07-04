Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o8NVo-0000pq-PX
	for mharc-qemu-trivial@gnu.org; Mon, 04 Jul 2022 10:57:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8NVn-0000l1-93
 for qemu-trivial@nongnu.org; Mon, 04 Jul 2022 10:57:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8NVl-0004BA-KC
 for qemu-trivial@nongnu.org; Mon, 04 Jul 2022 10:57:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656946636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K0HpCdtzTpGXhK/kquXhelQ1UwsfeZHupvkHgn0+wPg=;
 b=OemeynYlUxxJaTTira5i0IKhDBi0Bg38iAIUpClmgp1OLgiUcNqDyfvqimxMORxBo6lk0J
 nuNdZVjTQy9p/3h4eeFYh7eP+oUf4qeM+fKrNGIDBzrVijoceuBzTP35TX1KtNHC715FyM
 Le9FnGZVzpRumlPqNOXPfMybRqvcDGQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-569-a8DfL7hFP3iUYOxhwoVLhw-1; Mon, 04 Jul 2022 10:57:10 -0400
X-MC-Unique: a8DfL7hFP3iUYOxhwoVLhw-1
Received: by mail-wm1-f71.google.com with SMTP id
 be8-20020a05600c1e8800b003a069fe18ffso7479714wmb.9
 for <qemu-trivial@nongnu.org>; Mon, 04 Jul 2022 07:57:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:cc:from:in-reply-to
 :content-transfer-encoding;
 bh=K0HpCdtzTpGXhK/kquXhelQ1UwsfeZHupvkHgn0+wPg=;
 b=mk/Qv6sueIqo4l0WQzNE/d+c84Bl/Tj1tJv+hOC4o1eV3sgjkwfVrDad5xbbwJbwsL
 j4KGRZDPUnUIFNoyPMYYJWNcal9uEOCWhURsvfJTEEbTTqxhj2PFSr5cU2zbRpeVaqYl
 a5DEftxaxwfeKHSECYKZLJyNmgKXFpBG+TfcLzOrUPVi/sjRrOpiELh2cPI7IM8TloYb
 z7R6M9tZUJlj29RcyYy5BOLqc7sJAICYEZ2lFBtQSEDYa6eTyyo2psVm9rFiX2LH1prx
 yiX1UmSHdd/Pbnw80BhoiU/sk+LB9att50sLmoYF06vEivA4o9sEZ7XRMfzfjdkNe1kZ
 REGg==
X-Gm-Message-State: AJIora8x51vaZqEE0B7xOAjpv3C6Y9ePpYrFovqVVqGxsaHEn8rLNsel
 gTv8jNaqTRpui/9ZKnySCe+SucAd6ZMGIGmMeTg8IbU3OGIVmsWvZinc07gq7Vt42D1r8KD0lQ1
 cgsIXdDT1hk04XTGpHw==
X-Received: by 2002:a05:600c:2313:b0:3a1:8ed2:4322 with SMTP id
 19-20020a05600c231300b003a18ed24322mr18180917wmo.166.1656946629071; 
 Mon, 04 Jul 2022 07:57:09 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vQ8W2jAwGtXd92kYccHG5p6nHPOJnjL+TC8IzAco5siDSSESSvPTY5mvELubfB4yd4Xs1adg==
X-Received: by 2002:a05:600c:2313:b0:3a1:8ed2:4322 with SMTP id
 19-20020a05600c231300b003a18ed24322mr18180899wmo.166.1656946628887; 
 Mon, 04 Jul 2022 07:57:08 -0700 (PDT)
Received: from [192.168.8.104] (tmo-098-39.customers.d1-online.com.
 [80.187.98.39]) by smtp.gmail.com with ESMTPSA id
 bi18-20020a05600c3d9200b0039c4506bd25sm18409034wmb.14.2022.07.04.07.57.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jul 2022 07:57:08 -0700 (PDT)
Message-ID: <821dc8c9-9ef0-c55c-eb78-fc776deedb98@redhat.com>
Date: Mon, 4 Jul 2022 16:57:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] po: add ukrainian translation
To: Andrij Mizyk <andmizyk@gmail.com>, qemu-devel@nongnu.org,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20220613123758.13280-1-andmizyk@gmail.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220613123758.13280-1-andmizyk@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 04 Jul 2022 14:57:19 -0000

On 13/06/2022 14.37, Andrij Mizyk wrote:
> Signed-off-by: Andrij Mizyk <andmizyk@gmail.com>
> ---
>   po/LINGUAS |  1 +
>   po/uk.po   | 75 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 76 insertions(+)
>   create mode 100644 po/uk.po

Thanks!

Unfortunately, it seems like we currently don't have a maintainer for the 
.po files anymore ... so maybe this patch can go via the trivial tree (now 
in CC:), or I'll add it to my next pull request if I don't forget it...

  Thomas


