Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oiyIl-00080U-V5
	for mharc-qemu-trivial@gnu.org; Thu, 13 Oct 2022 09:31:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oiyIj-0007uU-Vt
 for qemu-trivial@nongnu.org; Thu, 13 Oct 2022 09:31:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oiyIf-0005Yh-8I
 for qemu-trivial@nongnu.org; Thu, 13 Oct 2022 09:31:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665667860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fr3eXh9HRRKbJhOiH0DcmglOLRwlWrsicQg9qT5gOwo=;
 b=ffF2rW3ps5pwZD+ma7esEhab+mLeH0nPv11N9NZoUk8m5r429k2t5pT2HSndob1GB21GrL
 hfJkHazVrYnHzuRVhcU0g3aiome/gz9pw6/GtW/QCX8XkgdpDvRZ9hGO0nOOgfjqTP8HFj
 NaePbcXD01UhsCgfBLOCPfw7d2iu7nQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-127-BY3pIBheM7aw3zTjGSb7mg-1; Thu, 13 Oct 2022 09:30:58 -0400
X-MC-Unique: BY3pIBheM7aw3zTjGSb7mg-1
Received: by mail-wm1-f71.google.com with SMTP id
 v125-20020a1cac83000000b003bd44dc5242so2880919wme.7
 for <qemu-trivial@nongnu.org>; Thu, 13 Oct 2022 06:30:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fr3eXh9HRRKbJhOiH0DcmglOLRwlWrsicQg9qT5gOwo=;
 b=UxWXEKOc/td7NMi3oOm4t972a8J8yM0xCuKaSt0tt/fqwB16FUbYRobessSK2/JCGV
 aYObkBQDn6qy+dTDEa+AAp/pNw78wpiFP1c6a6GSKG/3InaLm5FvOLGqupP5ZBWT00Ww
 TUNnpojkbR4qMhQBkfp91zhjEjST8JyyhEBgDiIh8zIdg2KHgXWe/KlkCzs5iTd08EY/
 9RvxQPYOXYsrwM3Ry/oelVNvEN8Mquyy/HV/oMIQ3bl2Iza5CHSe/hCynWpkV9WJ4Oim
 QZWKg1cJA0IuSNQEVinb8Ci2I2ojLZ6ArG993OTiFQqntLENOlaR/YkDQY90KKcAJ3t8
 Hbcg==
X-Gm-Message-State: ACrzQf2tUw+EHnDUkO/ZpJuqwP2krIx6pj6zG2r0AgBJoeiNi9Pl3QO6
 U5PebCejuUI4TLLEWtkfbNqMtoVhiIyNH7wfD8m5gBMkVligi9CopsOEFpZCElQglxw2Zc0VN2T
 QzQCq/Vjm77Sd3uLvnA==
X-Received: by 2002:a5d:64aa:0:b0:230:71e5:c540 with SMTP id
 m10-20020a5d64aa000000b0023071e5c540mr13700275wrp.625.1665667857895; 
 Thu, 13 Oct 2022 06:30:57 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7tehBeYSYOg6YyFGLmT3pyhCbxq+gtuTiN9upXUb/dKPY8SouYpOCNHul0mKOkjcIUG3MUYA==
X-Received: by 2002:a5d:64aa:0:b0:230:71e5:c540 with SMTP id
 m10-20020a5d64aa000000b0023071e5c540mr13700253wrp.625.1665667857639; 
 Thu, 13 Oct 2022 06:30:57 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-38.web.vodafone.de.
 [109.43.176.38]) by smtp.gmail.com with ESMTPSA id
 x1-20020a1c7c01000000b003c6c5a5a651sm4290779wmc.28.2022.10.13.06.30.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Oct 2022 06:30:56 -0700 (PDT)
Message-ID: <6a8d3ac5-38b2-6bd9-6b6a-92078de58776@redhat.com>
Date: Thu, 13 Oct 2022 15:30:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] include/hw/scsi/scsi.h: Remove unused
 scsi_legacy_handle_cmdline() prototype
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <20221013130500.967432-1-peter.maydell@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221013130500.967432-1-peter.maydell@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.25, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 13 Oct 2022 13:31:06 -0000

On 13/10/2022 15.05, Peter Maydell wrote:
> In commit 1454509726719e0933c80 we removed the function
> scsi_legacy_handle_cmdline() and all of its callers, but forgot to
> delete the prototype from the header function.  Delete the prototype
> too.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   include/hw/scsi/scsi.h | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/include/hw/scsi/scsi.h b/include/hw/scsi/scsi.h
> index 001103488c2..9ad86b25bb4 100644
> --- a/include/hw/scsi/scsi.h
> +++ b/include/hw/scsi/scsi.h
> @@ -187,7 +187,6 @@ SCSIDevice *scsi_bus_legacy_add_drive(SCSIBus *bus, BlockBackend *blk,
>                                         BlockdevOnError werror,
>                                         const char *serial, Error **errp);
>   void scsi_bus_legacy_handle_cmdline(SCSIBus *bus);
> -void scsi_legacy_handle_cmdline(void);
>   
>   SCSIRequest *scsi_req_alloc(const SCSIReqOps *reqops, SCSIDevice *d,
>                               uint32_t tag, uint32_t lun, void *hba_private);

Reviewed-by: Thomas Huth <thuth@redhat.com>


