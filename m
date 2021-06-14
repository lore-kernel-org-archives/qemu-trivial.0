Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lsrnB-0007Pc-UZ
	for mharc-qemu-trivial@gnu.org; Mon, 14 Jun 2021 14:58:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lsrnB-0007Mv-1Q
 for qemu-trivial@nongnu.org; Mon, 14 Jun 2021 14:58:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lsrn8-0000RV-1D
 for qemu-trivial@nongnu.org; Mon, 14 Jun 2021 14:58:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623697113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mgsgITJ2FDnxJMUfC5CNvti1i/dOG1OAwpipUT260ZA=;
 b=O1doG681oU1yH+DFrBRNOMI6nNQAecqjb+KxsY+0gRDllQ3caYAnLay3X+vfFayQhcmBKU
 EhqUmVwfl65tUCBax/Ihc8wGrrhaCae3K8VCQxY8AeSU2+w1dQsz/EBVQIIG4ZRJkrUUr4
 Odg3VURBAgSa8VWj+6jZft8EQSXweV4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-134-cfv3OxCsMGaHIt_zfOCaHA-1; Mon, 14 Jun 2021 14:58:31 -0400
X-MC-Unique: cfv3OxCsMGaHIt_zfOCaHA-1
Received: by mail-wr1-f71.google.com with SMTP id
 x9-20020adfffc90000b02901178add5f60so7463130wrs.5
 for <qemu-trivial@nongnu.org>; Mon, 14 Jun 2021 11:58:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mgsgITJ2FDnxJMUfC5CNvti1i/dOG1OAwpipUT260ZA=;
 b=q0nMIPYxU1coI+FpsKe0/Cn9o5mSQ+f92mg9iPvz/ace7kiVyzskR+bLI2FG7j1xNe
 5aWQO7kLWpRwu1SaTg13BmcOIS3lSA5p/geI6rzr5yi6TGqCRjHgzV84De0H5I0K95jt
 XxxsSvRO/nvGlG+KGmxxTLXaltQxI8tNvYz6julFNS3HyWZz6S+Xjq3OXUM+YHH6MzNY
 9ifU70+gRzo1PyXd+F1VJigXkFDWkug3kA/leflVockZ6FaDnv9/rf2EW0OFqZKErEVO
 kNshpRojlKHnl1MK+OkS55OrJIalKVjXTytaV8AL1Ju6R5O7xYFR9aME91gqM+7EiI7X
 qqfQ==
X-Gm-Message-State: AOAM533iEMclvRFCZLSwylxJuX5MqCBfyuTyROh7r9RoS9OjZNhbYSr3
 EHlOmRfRXL1wMllaV0xa53+iEJui/0q7uXDokDgIqfpHJywn8YtKu46e+exo/WMcvLnJhPgeL/n
 o41GtcAKBiLeoyt90JA==
X-Received: by 2002:adf:f54a:: with SMTP id j10mr19810803wrp.383.1623697110525; 
 Mon, 14 Jun 2021 11:58:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyc6YLxS/6Z0X6wlbAqjhxjWfh6HAVT6NrIpeeMZB/EAcWSxC/rdtfCWZ3QgG6/PgP+jSr7FA==
X-Received: by 2002:adf:f54a:: with SMTP id j10mr19810782wrp.383.1623697110227; 
 Mon, 14 Jun 2021 11:58:30 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id q5sm17523542wrm.15.2021.06.14.11.58.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 11:58:29 -0700 (PDT)
Subject: Re: [PATCH] net: Replace TAB indentations with spaces
To: Ahmed Abouzied <email@aabouzied.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, thuth@redhat.com
References: <20210614183849.20622-1-email@aabouzied.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <35dd9f29-0cd4-f418-2e40-ea784ede05f3@redhat.com>
Date: Mon, 14 Jun 2021 20:58:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210614183849.20622-1-email@aabouzied.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.489, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
X-List-Received-Date: Mon, 14 Jun 2021 18:58:37 -0000

On 6/14/21 8:38 PM, Ahmed Abouzied wrote:
> Replaces TABs with spaces, making sure to have a consistent coding style
> of 4 space indentations in the net subsystem.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/377
> Signed-off-by: Ahmed Abouzied <email@aabouzied.com>
> ---
>  hw/net/can/ctu_can_fd_frame.h |  180 ++---
>  hw/net/can/ctu_can_fd_regs.h  | 1260 ++++++++++++++++-----------------
>  hw/net/e1000_regs.h           |   30 +-
>  hw/net/mcf_fec.c              |    8 +-
>  hw/net/ne2000.c               |  138 ++--
>  hw/net/pcnet.c                |  136 ++--
>  hw/net/pcnet.h                |    4 +-
>  net/tap-linux.h               |   10 +-
>  8 files changed, 883 insertions(+), 883 deletions(-)

Looking at this change with 'git show --ignore-all-space'
I see no difference, thus:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


