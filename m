Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oQrw0-0005Fe-Mi
	for mharc-qemu-trivial@gnu.org; Wed, 24 Aug 2022 11:04:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oQrvv-0005FE-Vu
 for qemu-trivial@nongnu.org; Wed, 24 Aug 2022 11:04:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oQrvs-0002V7-Mm
 for qemu-trivial@nongnu.org; Wed, 24 Aug 2022 11:04:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661353479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DygX394yRU1lO1BRSuzjyUMyRq6T7dOHcsoaCycCb2o=;
 b=f51GdF9QHpRDSneSE1386QIoZU1NUYAQUS5zMHbCeLfw4w8PHjUflJD7OpBQA6W7IH/jtZ
 BoCP1pHymDM5YEtriRcEjMETqkxzb+GAkdpYVqVzo3/aOsT3/yULiF/Da0mCJ/xx1vrZSt
 WAffoebVNwM8fCh4k1FvQdzOFZehI4Y=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-627-RS3FLgKEMVOqyLy2G3I2bA-1; Wed, 24 Aug 2022 11:04:38 -0400
X-MC-Unique: RS3FLgKEMVOqyLy2G3I2bA-1
Received: by mail-ed1-f72.google.com with SMTP id
 t13-20020a056402524d00b0043db1fbefdeso11030118edd.2
 for <qemu-trivial@nongnu.org>; Wed, 24 Aug 2022 08:04:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=DygX394yRU1lO1BRSuzjyUMyRq6T7dOHcsoaCycCb2o=;
 b=YzpCQoClATN7dwkZayV2RJlnlj4NBOVNNI4ROIIYtEMJWU86HrRTiLE0n7tOXq6Y0H
 +2664SeOuWoI7gQL1YvnzxAjjGh5Aa+TmdG9qOy/yZrB+dx0QnM/O7SpCQBnOMwB17Lg
 sT+Tp/weFQi6cRaXkbCUq3EMxId//lBKxDeRM81rbRQzbeVFrXO9nRnSARlhJ1EXMAFU
 A6P3gGCNMOyS5dTYRva3zf0dKhO818F9B31Xq7jr6yOqnNs2egXOJMIiwKNzy9zhLSDw
 SaRijkWJFX4mkVsd2q+X1JmiC03nSwnW2BpFmyCFieKQs/ov2FVJ9NQ2MJlBOP77cnq0
 VQvA==
X-Gm-Message-State: ACgBeo3n/QfsmUpJ8Bx0OAMLPQZzd7ggRjM2PhpRls6p0c9otwZnXWXc
 6PQ7f2efF8Y839a4bUAa1+AQM11P8gzk6klYgfGI1tFd0MyL9ebpbqlQqXdtZCArhYAYUUAd4LF
 OSuR5KKhxpLXCnnh36A==
X-Received: by 2002:a17:907:3e03:b0:722:e694:438 with SMTP id
 hp3-20020a1709073e0300b00722e6940438mr3171506ejc.755.1661353476223; 
 Wed, 24 Aug 2022 08:04:36 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5sEOhXXFw1YwlrLX2BmNwWqLDFhoUazNlzYwgdyi8cvoB4Pp6aaPza5dQjOvJiJLUr83qAKg==
X-Received: by 2002:a17:907:3e03:b0:722:e694:438 with SMTP id
 hp3-20020a1709073e0300b00722e6940438mr3171480ejc.755.1661353475854; 
 Wed, 24 Aug 2022 08:04:35 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 u18-20020a1709061db200b007306d478c62sm1282147ejh.62.2022.08.24.08.04.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 08:04:35 -0700 (PDT)
Date: Wed, 24 Aug 2022 17:04:33 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Keqian Zhu <zhukeqian1@huawei.com>
Cc: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
 <qemu-trivial@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, Eric
 Auger <eric.auger@redhat.com>, Peter Xu <peterx@redhat.com>,
 <wanghaibin.wang@huawei.com>
Subject: Re: [PATCH v2] hw/acpi: Add ospm_status hook implementation for
 acpi-ged
Message-ID: <20220824170433.7ba675ca@redhat.com>
In-Reply-To: <20220816094957.31700-1-zhukeqian1@huawei.com>
References: <20220816094957.31700-1-zhukeqian1@huawei.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Wed, 24 Aug 2022 15:04:44 -0000

On Tue, 16 Aug 2022 17:49:57 +0800
Keqian Zhu <zhukeqian1@huawei.com> wrote:

> Setup an ARM virtual machine of machine virt and execute qmp "query-acpi-ospm-status"
> causes segmentation fault with following dumpstack:
>  #1  0x0000aaaaab64235c in qmp_query_acpi_ospm_status (errp=errp@entry=0xfffffffff030) at ../monitor/qmp-cmds.c:312
>  #2  0x0000aaaaabfc4e20 in qmp_marshal_query_acpi_ospm_status (args=<optimized out>, ret=0xffffea4ffe90, errp=0xffffea4ffe88) at qapi/qapi-commands-acpi.c:63
>  #3  0x0000aaaaabff8ba0 in do_qmp_dispatch_bh (opaque=0xffffea4ffe98) at ../qapi/qmp-dispatch.c:128
>  #4  0x0000aaaaac02e594 in aio_bh_call (bh=0xffffe0004d80) at ../util/async.c:150
>  #5  aio_bh_poll (ctx=ctx@entry=0xaaaaad0f6040) at ../util/async.c:178
>  #6  0x0000aaaaac00bd40 in aio_dispatch (ctx=ctx@entry=0xaaaaad0f6040) at ../util/aio-posix.c:421
>  #7  0x0000aaaaac02e010 in aio_ctx_dispatch (source=0xaaaaad0f6040, callback=<optimized out>, user_data=<optimized out>) at ../util/async.c:320
>  #8  0x0000fffff76f6884 in g_main_context_dispatch () at /usr/lib64/libglib-2.0.so.0
>  #9  0x0000aaaaac0452d4 in glib_pollfds_poll () at ../util/main-loop.c:297
>  #10 os_host_main_loop_wait (timeout=0) at ../util/main-loop.c:320
>  #11 main_loop_wait (nonblocking=nonblocking@entry=0) at ../util/main-loop.c:596
>  #12 0x0000aaaaab5c9e50 in qemu_main_loop () at ../softmmu/runstate.c:734
>  #13 0x0000aaaaab185370 in qemu_main (argc=argc@entry=47, argv=argv@entry=0xfffffffff518, envp=envp@entry=0x0) at ../softmmu/main.c:38
>  #14 0x0000aaaaab16f99c in main (argc=47, argv=0xfffffffff518) at ../softmmu/main.c:47
> 
> Fixes: ebb62075021a ("hw/acpi: Add ACPI Generic Event Device Support")
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/acpi/generic_event_device.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
> index e28457a7d1..a3d31631fe 100644
> --- a/hw/acpi/generic_event_device.c
> +++ b/hw/acpi/generic_event_device.c
> @@ -267,6 +267,13 @@ static void acpi_ged_unplug_cb(HotplugHandler *hotplug_dev,
>      }
>  }
>  
> +static void acpi_ged_ospm_status(AcpiDeviceIf *adev, ACPIOSTInfoList ***list)
> +{
> +    AcpiGedState *s = ACPI_GED(adev);
> +
> +    acpi_memory_ospm_status(&s->memhp_state, list);
> +}
> +
>  static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
>  {
>      AcpiGedState *s = ACPI_GED(adev);
> @@ -409,6 +416,7 @@ static void acpi_ged_class_init(ObjectClass *class, void *data)
>      hc->unplug_request = acpi_ged_unplug_request_cb;
>      hc->unplug = acpi_ged_unplug_cb;
>  
> +    adevc->ospm_status = acpi_ged_ospm_status;
>      adevc->send_event = acpi_ged_send_event;
>  }
>  


