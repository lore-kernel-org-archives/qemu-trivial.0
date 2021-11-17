Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mnRqJ-0006YG-Gu
	for mharc-qemu-trivial@gnu.org; Wed, 17 Nov 2021 15:47:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mnRqH-0006Uy-Lt
 for qemu-trivial@nongnu.org; Wed, 17 Nov 2021 15:47:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mnRqG-0000BZ-2p
 for qemu-trivial@nongnu.org; Wed, 17 Nov 2021 15:47:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637182059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8xPK7inuc0m+8E4ZawGGLzBZSifgSSRfvoqvOLY4cCo=;
 b=JSIo+WsiyNcPNtq308VuJvZ1vSpqY6ngLgiuwXeD8nE8HsM/v7+NH+7SpGDnRoKj8w5zJg
 xem85t4gtucaGuQPRBqDWmIrBDMRq4Of9qS/jYArR33rVek4w/8G0UY5PQaDBygNGi/Rw7
 xsAW6toD4F8miM1Zj5saqrwPyHIzJXs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-HPRNaK90P3ONLdzcdGIADw-1; Wed, 17 Nov 2021 15:47:36 -0500
X-MC-Unique: HPRNaK90P3ONLdzcdGIADw-1
Received: by mail-wm1-f72.google.com with SMTP id
 205-20020a1c00d6000000b003335d1384f1so3328908wma.3
 for <qemu-trivial@nongnu.org>; Wed, 17 Nov 2021 12:47:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8xPK7inuc0m+8E4ZawGGLzBZSifgSSRfvoqvOLY4cCo=;
 b=UG2h0hmzleC5sNfCqfo04JTGnhLAedpYiLGJYlr3imkq1i2EvQloe3qAEK51/Eo9r0
 l91Wavwh8zdFINUVCrBvYffzID+99wwugnK44P/OFyKRdsOLtCUGS8HFOGTa0/JZudFO
 +ME43C6QSN1SPLuRarpZESflV50Z3MuGKDrZpVd4RYv5+S7aPM98GpM8WCPDZCTe2hwd
 n9dsFzcrUT7S+nVlL7BFWLRMEQ2xL9U11Ae1a3RT7c45bCIepRoDn6LCZh+T69QJLTfB
 /Q71/V/xHGKkd0x731ou0+jt3rvipvySLyNINmTg7S00lOudXiM6Gkzjw8iBZMqrYzEK
 WmLg==
X-Gm-Message-State: AOAM533s2eiw4wcVa/PDbE6fw2Xsu2zsxehxAIoDA7ya/NsKvuq2ZF/H
 LEtWFi+ZZ1hlEvRSQknWkNVMs1kyrakUNaLelbjbLOjoSdOttDHNO2xK+4nIIqdpytGiCNFoyJE
 w3q0kZIEJtrQEy47TjA==
X-Received: by 2002:a05:6000:1289:: with SMTP id
 f9mr25057129wrx.329.1637182055461; 
 Wed, 17 Nov 2021 12:47:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxv94VPq+CobwJbK10kWE6PJLwfvewfrNMy5Ukb8e81/RIycHexNP5rqE47fcc6WcC0im9iXQ==
X-Received: by 2002:a05:6000:1289:: with SMTP id
 f9mr25057089wrx.329.1637182055156; 
 Wed, 17 Nov 2021 12:47:35 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id u6sm130261wmc.29.2021.11.17.12.47.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Nov 2021 12:47:34 -0800 (PST)
Message-ID: <ec5dbaeb-beee-feda-9441-92a39075e05a@redhat.com>
Date: Wed, 17 Nov 2021 21:47:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2] Fix typo in comment.
To: lagarcia@linux.ibm.com, qemu-trivial@nongnu.org
Cc: Leonardo Garcia <lagarcia@br.ibm.com>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
References: <c30019abaca0ca1a9f636671a8a2552a0bb17a71.1637180729.git.lagarcia@br.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <c30019abaca0ca1a9f636671a8a2552a0bb17a71.1637180729.git.lagarcia@br.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.009, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 17 Nov 2021 20:47:41 -0000

Hi Leonardo,

On 11/17/21 21:26, lagarcia@linux.ibm.com wrote:
> From: Leonardo Garcia <lagarcia@br.ibm.com>
> 
> Signed-off-by: Leonardo Garcia <lagarcia@br.ibm.com>
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> ---
>  hw/virtio/vhost.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Better if you prefix the patch subject with "hw/virtio/vhost: ",
anyway:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Thanks,

Phil.


