Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pCg2w-0006hN-G4
	for mharc-qemu-trivial@gnu.org; Tue, 03 Jan 2023 07:05:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pCg2l-0006bi-C6
 for qemu-trivial@nongnu.org; Tue, 03 Jan 2023 07:05:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pCg2j-0006dV-MK
 for qemu-trivial@nongnu.org; Tue, 03 Jan 2023 07:05:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672747520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KunRRQUaMrs4fxxOeg85c8Ty+qkUePbiYBVbHpgULag=;
 b=MpolhWN1paM2An0RDme77fLvdY3Y0tsSII+8ihyWsTz7JveMnkiC3XIsA1Lwe1ZIvu1Ebg
 je2ZrrcczcXsu/c1emI1higiStPrAvGgINKpuadRdyQpNwxWh1eSDFKjg6DWh8lfK/3+E8
 xOV0nqElvPZpDa8nqAJF6+y6/Nbp1U4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-668-WKQUpRhsMYGTZKrZmUFimg-1; Tue, 03 Jan 2023 07:05:19 -0500
X-MC-Unique: WKQUpRhsMYGTZKrZmUFimg-1
Received: by mail-wr1-f72.google.com with SMTP id
 q16-20020adfab10000000b00271460582b6so3526891wrc.5
 for <qemu-trivial@nongnu.org>; Tue, 03 Jan 2023 04:05:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KunRRQUaMrs4fxxOeg85c8Ty+qkUePbiYBVbHpgULag=;
 b=ZkkBceT5ytVmrQIt45aXajPiqCCmvMyJt84gz2zJnd0dE4NFRTx1a77KecU9lCom8X
 1sQpHkR1iEqgLhA4YiT0XRsnyy/UwhTy+c05zmJryvhWCaV8OBFCgjj8pY8NmrMKCB04
 k13OV43QPQ8N0XlqGvw/V9T6e6d41LDyY6lx8GYy4A1u8BFXYfpg/S4jF+hEpd8rmZII
 IZ5YHy+qmjvo/SQbWanjJFFJzbLUDO+JpWInqSfJ66ht1EX9MN2oHiBiJArk4r6uLtkH
 9/Pb8YGEP4+8pT2u3zOhljd1MmF9KG3Dq2gGpOpWAcNXWUBn1vsg30MNTNOjdetEXlM0
 fgWg==
X-Gm-Message-State: AFqh2koUUJXilhXIR6RTCuzDYkbZdydKWvoMmChvl/AkUcbowvrKIOwZ
 s6+euBuxM9ziGA3vCgYE1IIFApOf7jMMEE2HyRxliJPiaxJYRF2ymguntq5x7gh7bueC7L2U/e1
 hjt+Nvj+z5iEn9aX2lw==
X-Received: by 2002:a05:600c:6016:b0:3d3:3c93:af5e with SMTP id
 az22-20020a05600c601600b003d33c93af5emr31066938wmb.35.1672747518595; 
 Tue, 03 Jan 2023 04:05:18 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvIgd57MuoPYxOEzwNhVdGEv3hv1wd14QinGgfv0CGV9NsSPBNZ72+zU3bCJcZSRHbnzH0d2w==
X-Received: by 2002:a05:600c:6016:b0:3d3:3c93:af5e with SMTP id
 az22-20020a05600c601600b003d33c93af5emr31066910wmb.35.1672747518312; 
 Tue, 03 Jan 2023 04:05:18 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-177-55.web.vodafone.de.
 [109.43.177.55]) by smtp.gmail.com with ESMTPSA id
 j34-20020a05600c1c2200b003d98438a43asm32889533wms.34.2023.01.03.04.05.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Jan 2023 04:05:16 -0800 (PST)
Message-ID: <acd0951b-c1ee-78ae-0de5-235c97186932@redhat.com>
Date: Tue, 3 Jan 2023 13:05:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 01/10] ccid-card-emulated: fix cast warning/error
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Eric Blake <eblake@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20230103110814.3726795-1-marcandre.lureau@redhat.com>
 <20230103110814.3726795-2-marcandre.lureau@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230103110814.3726795-2-marcandre.lureau@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.103, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Tue, 03 Jan 2023 12:05:31 -0000

On 03/01/2023 12.08, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> ../hw/usb/ccid-card-emulated.c: In function 'handle_apdu_thread':
> ../hw/usb/ccid-card-emulated.c:251:24: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
>    251 |                 assert((unsigned long)event > 1000);
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   hw/usb/ccid-card-emulated.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/usb/ccid-card-emulated.c b/hw/usb/ccid-card-emulated.c
> index ee41a81801..c328660075 100644
> --- a/hw/usb/ccid-card-emulated.c
> +++ b/hw/usb/ccid-card-emulated.c
> @@ -248,7 +248,7 @@ static void *handle_apdu_thread(void* arg)
>           WITH_QEMU_LOCK_GUARD(&card->vreader_mutex) {
>               while (!QSIMPLEQ_EMPTY(&card->guest_apdu_list)) {
>                   event = QSIMPLEQ_FIRST(&card->guest_apdu_list);
> -                assert((unsigned long)event > 1000);
> +                assert(event != NULL);
>                   QSIMPLEQ_REMOVE_HEAD(&card->guest_apdu_list, entry);
>                   if (event->p.data.type != EMUL_GUEST_APDU) {
>                       DPRINTF(card, 1, "unexpected message in handle_apdu_thread\n");

Reviewed-by: Thomas Huth <thuth@redhat.com>


