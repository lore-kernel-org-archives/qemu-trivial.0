Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qo1Xu-0001Qk-8l
	for mharc-qemu-trivial@gnu.org; Wed, 04 Oct 2023 09:04:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qo1Xl-0001O0-UH
 for qemu-trivial@nongnu.org; Wed, 04 Oct 2023 09:04:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qo1Xk-0005WY-91
 for qemu-trivial@nongnu.org; Wed, 04 Oct 2023 09:04:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696424638;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D1EiTpLeGcKJPVJ8XPKLqPNau5gg28GmfPqDjf9inu4=;
 b=JTbn/Gyans3RZI/cPhPE3yOEKLuI8oNZL48LJ0a019xUr7C/tNeooUPmJFS3c9BJ4x01AX
 31XRgo2mABLT0LYfu225ZMwLoAGEyLe+Mp6RGQWkf6YpDFpUE1Wb5GeFI+i6aIho3+51Sz
 RlpkZlWf1TFZ+a5GfwetbOkbaUlzAPw=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-320-NGw4m0KBPLKGLI9D27FftQ-1; Wed, 04 Oct 2023 09:03:56 -0400
X-MC-Unique: NGw4m0KBPLKGLI9D27FftQ-1
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6607a88a186so21340596d6.1
 for <qemu-trivial@nongnu.org>; Wed, 04 Oct 2023 06:03:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696424636; x=1697029436;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=D1EiTpLeGcKJPVJ8XPKLqPNau5gg28GmfPqDjf9inu4=;
 b=QFIuVtQytq+jIT85+ZT4ZGD1to87O3YTLgZr9JEBP0Qwf/Zvv8N5iEo+gdLgzOE2jK
 E+pJqGHQvHylcB10VKXyixMO9kt1KLTDS+KwelcsM9ah4rhXVMAtthS+yNJG+q6k6uDU
 R3+2VpJLKUTd0dqYNep9GAOzuScuvsszq5bLAzEb/R97RG6XklRClXxs61QHqDuvZGyv
 MKkLlSdY/Q26NABrxVJ7tIU4MDBzYf5MEQ60KdH2FFndiZJucL22f5soOJ97hbbpMtiE
 ln9nFX3gLf6HCr57e6cp1nc+LXj7Wa6FuVc6ck7QqZ1AIPB9DRV7Y0HnXVssV+1OTNIL
 0Msg==
X-Gm-Message-State: AOJu0YzlSh+TRiOz1FBHHBypPCe/KpUBEnAlPgdx17OyH5OQWNyn0+8E
 YvqIORWKyClSbZvSYlr2/ucjHK3pTGOrWsJV5QUvSIj46kt04I6Ql2PFhDlKcpPWMCM4ehJLAAJ
 y47KqLLBowdiBEaLqyw==
X-Received: by 2002:a05:6214:16d1:b0:658:9cd9:ec64 with SMTP id
 d17-20020a05621416d100b006589cd9ec64mr2123239qvz.54.1696424636094; 
 Wed, 04 Oct 2023 06:03:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqvIczrR/NwleOKhY8HVZDAnbHUKS1NIbUoX1IQ9Qj+AEybyZ6W0KUIrB58TtTYg7odLpX2A==
X-Received: by 2002:a05:6214:16d1:b0:658:9cd9:ec64 with SMTP id
 d17-20020a05621416d100b006589cd9ec64mr2123220qvz.54.1696424635834; 
 Wed, 04 Oct 2023 06:03:55 -0700 (PDT)
Received: from [10.33.192.181] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 u12-20020a0cdd0c000000b0062ffbf23c22sm1301416qvk.131.2023.10.04.06.03.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Oct 2023 06:03:55 -0700 (PDT)
Message-ID: <8cc80be6-4bf3-e5fd-9b2c-c2961905cdef@redhat.com>
Date: Wed, 4 Oct 2023 15:03:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] hw/usb: Silence compiler warnings in USB code when
 compiling with -Wshadow
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-trivial@nongnu.org
References: <20231004093620.97906-1-thuth@redhat.com>
 <8734yqfw85.fsf@pond.sub.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <8734yqfw85.fsf@pond.sub.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.528, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
X-List-Received-Date: Wed, 04 Oct 2023 13:04:08 -0000

On 04/10/2023 13.44, Markus Armbruster wrote:
> I got one more:
> 
> ../hw/usb/host-libusb.c: In function ‘usb_host_open’:
> ../hw/usb/host-libusb.c:1013:13: warning: declaration of ‘rc’ shadows a previous local [-Wshadow=compatible-local]
>   1013 |         int rc = ioctl(hostfd, USBDEVFS_GET_SPEED, NULL);
>        |             ^~
> ../hw/usb/host-libusb.c:954:9: note: shadowed declaration is here
>    954 |     int rc;
>        |         ^~
> 

Drat, I missed that indeed. I'll send a v2.

  Thomas


