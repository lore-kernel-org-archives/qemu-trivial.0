Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbHZ0-0000Wj-Lf
	for mharc-qemu-trivial@gnu.org; Fri, 15 Oct 2021 03:23:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mbHYx-0000W3-9q
 for qemu-trivial@nongnu.org; Fri, 15 Oct 2021 03:23:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mbHYu-0000MT-RX
 for qemu-trivial@nongnu.org; Fri, 15 Oct 2021 03:23:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634282605;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8w3hLQ3U0yuSbQTfOJUBp7nL8dLGwRx51haQLk5FUW0=;
 b=fCXxD87ESt3GyQfHEZHYuM6HU1X/Trw1zufu2P+VMSTegEIwjI6xz/o46YIjbkbhqku4NF
 yd3MOcjoqIAWSLpVh1cCMYFLp8ml1ZBmRO7SVUMJenCVnNmYm/7se/TalMmM5wgmHHhLZL
 3+GYQcr5fVTu8uFv0w3vvZ/tYQUuO04=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-Iw1mn41UOgC5wuNuP3_8GQ-1; Fri, 15 Oct 2021 03:23:24 -0400
X-MC-Unique: Iw1mn41UOgC5wuNuP3_8GQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 x5-20020a50f185000000b003db0f796903so7398162edl.18
 for <qemu-trivial@nongnu.org>; Fri, 15 Oct 2021 00:23:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=8w3hLQ3U0yuSbQTfOJUBp7nL8dLGwRx51haQLk5FUW0=;
 b=z0eo/0nljVzJgCRug6eMAbcNSC/eFaEXLOkKTYSHT4X10j6zERzFz+U2m07bHS2KrP
 /qtINix0GMwjImizGrz5WoGj4bvXu96NNJJR/iRhAmo6EerySjNyMSK/KSVguZvAFHlt
 W5ZLq/Tt7zu0c08TUEuSr0YpQGNWbX1TDwWH8KlPsQlQjAxbcL0F5JfnB/FqgQmGqHfV
 hZjxfmEmLpcdw9Jw7iSVnMMkzKREbwCTreEnIWQRO1sywwvo1g9Klqf8kjaQCzac05Tz
 opE/pWxKhr10OBZScq+N25hiuJQaKkpRC2sqocZdctMrN2RLY6Qiz5l1Y9hgMnOwIhbj
 yijw==
X-Gm-Message-State: AOAM532SsPYOezdijOFK4OzRg8tjymKskIr63otINL3vFu0zqIqp9GNE
 j90APzbalIVAhr8PcQlreA3paBBkmmIO2Yh46+FOu2sUItnbls5XuYi8dsCDhHInH6grwnKEq5L
 jBC+7ESgzfnSEDVL0PA==
X-Received: by 2002:a17:906:a3c4:: with SMTP id
 ca4mr4673981ejb.529.1634282603494; 
 Fri, 15 Oct 2021 00:23:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7o+aog4/f6XryFDXyMtPqbjup/I/ghyzaMWYE5PQGQ9ikDAmpJ4BrKc8JJtsx9m0m5okTfw==
X-Received: by 2002:a17:906:a3c4:: with SMTP id
 ca4mr4673957ejb.529.1634282603222; 
 Fri, 15 Oct 2021 00:23:23 -0700 (PDT)
Received: from steredhat (host-79-34-250-211.business.telecomitalia.it.
 [79.34.250.211])
 by smtp.gmail.com with ESMTPSA id w8sm3879240edx.25.2021.10.15.00.23.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 00:23:22 -0700 (PDT)
Date: Fri, 15 Oct 2021 09:23:20 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Luc Michel <lmichel@kalray.eu>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-trivial@nongnu.org
Subject: Re: [PATCH v2] hw/elf_ops.h: switch to ssize_t for elf loader return
 type
Message-ID: <20211015072320.roy3er3g6uxa6hry@steredhat>
References: <20211014194325.19917-1-lmichel@kalray.eu>
MIME-Version: 1.0
In-Reply-To: <20211014194325.19917-1-lmichel@kalray.eu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 15 Oct 2021 07:23:31 -0000

On Thu, Oct 14, 2021 at 09:43:25PM +0200, Luc Michel wrote:
>Until now, int was used as the return type for all the ELF
>loader related functions. The returned value is the sum of all loaded
>program headers "MemSize" fields.
>
>Because of the overflow check in elf_ops.h, trying to load an ELF bigger
>than INT_MAX will fail. Switch to ssize_t to remove this limitation.
>
>Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>Signed-off-by: Luc Michel <lmichel@kalray.eu>
>---
>v2:
>  - Turn load_elf ret local variable to ssize_t [Stefano]
>  - Add Phil's R-B
>---
> include/hw/elf_ops.h | 27 ++++++++++----------
> include/hw/loader.h  | 60 ++++++++++++++++++++++----------------------
> hw/core/loader.c     | 60 +++++++++++++++++++++++---------------------
> 3 files changed, 75 insertions(+), 72 deletions(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


