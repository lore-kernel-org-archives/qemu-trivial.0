Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ot37O-0006CD-LB
	for mharc-qemu-trivial@gnu.org; Thu, 10 Nov 2022 03:41:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ot371-00065A-Lk
 for qemu-trivial@nongnu.org; Thu, 10 Nov 2022 03:40:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ot370-0002OY-6f
 for qemu-trivial@nongnu.org; Thu, 10 Nov 2022 03:40:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668069636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+LNe6IR2yt8w7VLI/K/uzfjuOwS4WZNb6EcrK/fyJzo=;
 b=O0MbQfbOHHtVUDHtr0fnx9WOE3fcxDFV9EYMkepEY1DYcf3/1ki8TmLa3A39P5IhjiF5SQ
 mMMxXAv1iam9hm6ypa89Lk37QH4/xS0nWp2B3/Gb8xXPjU9u8XZ8/jtHiPmZYXJu4BiC7T
 R5qgM5iJjfdjZ+JGv59dai4sJ//rSZc=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-290-noVrBLtRNG2S1UjYTG0ibA-1; Thu, 10 Nov 2022 03:40:32 -0500
X-MC-Unique: noVrBLtRNG2S1UjYTG0ibA-1
Received: by mail-pl1-f200.google.com with SMTP id
 q10-20020a170902f34a00b00186c5448b01so975807ple.4
 for <qemu-trivial@nongnu.org>; Thu, 10 Nov 2022 00:40:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+LNe6IR2yt8w7VLI/K/uzfjuOwS4WZNb6EcrK/fyJzo=;
 b=WXSsO2InOhtF149BO4jyNHnPiY1LCQhmWXSpyazMmLECMeNFcfMhoMrQpon4+9HCFe
 QzvqPz6GkIiW2VfmTSPR59OKp0TWHox1gWATIy0EAm7QAy0hTF8dDtu2RuOSx8Vus1zK
 ayX1KDPoGPO9toiYINlbUlnJY70lSJ/6NoA+oljnSnvdtaM6kjsGEa5gxw5E3nX0qAfu
 7RUSzQsT3kz6NiK2lMMrRC4Ewf00eHdf+oArTABjxwr0ac0y+aL1Q3a5aqQmFBt4jSCH
 Hb48r65zi+HCDctcG1h2biA/bTVuoYvQdPY8iA0QJqefbuM7I2Jfd8RacdH7l+qFRSVr
 q5TA==
X-Gm-Message-State: ACrzQf21sUM3ktyRj/bnCq+ievEeuhCd2e9h5C75TDFUAqOopJvLVW+m
 n5MoHFB9syark1/CIdklM57ASsiDelqEPIjD00pdSyIeY/RWdFEeKRrX6EvSXe4HxEgTVUHMICQ
 6i7ngE0wj4B/0tYc3oQ==
X-Received: by 2002:a17:902:7283:b0:188:612b:1d31 with SMTP id
 d3-20020a170902728300b00188612b1d31mr33668109pll.81.1668069631657; 
 Thu, 10 Nov 2022 00:40:31 -0800 (PST)
X-Google-Smtp-Source: AMsMyM798lz+pGjmGtM3mWxeM1gWjciXK81f5vKAkgcAi1IIM5N1Cm8c9fRNxTvedrEQqjlkaoeuZw==
X-Received: by 2002:a17:902:7283:b0:188:612b:1d31 with SMTP id
 d3-20020a170902728300b00188612b1d31mr33668089pll.81.1668069631352; 
 Thu, 10 Nov 2022 00:40:31 -0800 (PST)
Received: from [10.33.192.232] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 x4-20020a170902a38400b00186cf82717fsm10634228pla.165.2022.11.10.00.40.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Nov 2022 00:40:30 -0800 (PST)
Message-ID: <034e43ec-614e-28cb-36fd-2ebd4d6a09c8@redhat.com>
Date: Thu, 10 Nov 2022 09:40:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/4] rtl8139: Remove unused variable
To: mrezanin@redhat.com, qemu-devel@nongnu.org
References: <cover.1668009030.git.mrezanin@redhat.com>
 <15a32dd06c492216cbf27cd3ddcbe1e9afb8d8f5.1668009030.git.mrezanin@redhat.com>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Jason Wang <jasowang@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <15a32dd06c492216cbf27cd3ddcbe1e9afb8d8f5.1668009030.git.mrezanin@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 10 Nov 2022 08:40:50 -0000

On 09/11/2022 16.57, mrezanin@redhat.com wrote:
> From: Miroslav Rezanina <mrezanin@redhat.com>
> 
> Variable send_count used in rtl8139_cplus_transmit_one function is only
> incremented but never read. This causes 'Unused but set variable' warning
> on Clang 15.0.1 compiler.
> 
> Removing the variable to prevent the warning.
> 
> Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
> ---
>   hw/net/rtl8139.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/hw/net/rtl8139.c b/hw/net/rtl8139.c
> index 6b65823b4b..e6643e3c9d 100644
> --- a/hw/net/rtl8139.c
> +++ b/hw/net/rtl8139.c
> @@ -2156,7 +2156,6 @@ static int rtl8139_cplus_transmit_one(RTL8139State *s)
>                       ip_data_len, saved_size - ETH_HLEN, large_send_mss);
>   
>                   int tcp_send_offset = 0;
> -                int send_count = 0;
>   
>                   /* maximum IP header length is 60 bytes */
>                   uint8_t saved_ip_header[60];
> @@ -2261,7 +2260,6 @@ static int rtl8139_cplus_transmit_one(RTL8139State *s)
>                       /* add transferred count to TCP sequence number */
>                       stl_be_p(&p_tcp_hdr->th_seq,
>                                chunk_size + ldl_be_p(&p_tcp_hdr->th_seq));
> -                    ++send_count;
>                   }
>   
>                   /* Stop sending this frame */

Reviewed-by: Thomas Huth <thuth@redhat.com>


