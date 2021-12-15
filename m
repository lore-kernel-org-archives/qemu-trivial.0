Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mxXXi-0003Ju-3Y
	for mharc-qemu-trivial@gnu.org; Wed, 15 Dec 2021 11:54:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxXXg-00038Y-A1
 for qemu-trivial@nongnu.org; Wed, 15 Dec 2021 11:54:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxXXd-0002jQ-Pr
 for qemu-trivial@nongnu.org; Wed, 15 Dec 2021 11:54:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639587249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BLtJrCZcQqOeInQ2K4AukauYCruYIyRO70+OV26bvCo=;
 b=g3H3HklgkbPdlV8zjGRMPqYEPTnskYh41421Yu9L8ZbwgKGWa3ex9gCG/c6f5j7W3Vu/lK
 SpeX3854Z6qaZSdlHWcsOBDmNEJ0sb/QAqeg/XMcWKnE6O7LDNny4slbWmlHYOeKFgFuY+
 DQ1Mk0dlgWuasqfvkYq8QaOfh5QkbjY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-595-HmC_MDo4NVyd29Ev8tHjzA-1; Wed, 15 Dec 2021 11:54:07 -0500
X-MC-Unique: HmC_MDo4NVyd29Ev8tHjzA-1
Received: by mail-wm1-f70.google.com with SMTP id
 i15-20020a05600c354f00b0034566ac865bso1038112wmq.6
 for <qemu-trivial@nongnu.org>; Wed, 15 Dec 2021 08:54:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BLtJrCZcQqOeInQ2K4AukauYCruYIyRO70+OV26bvCo=;
 b=6vmOiBioPcOxsM+ztschUu3xfGrURb/B/uARJzAk/tSOod9/kyv7jQOIOaVIS7WVOw
 ipPC8fZ8Mm6HaLaw9FIkn8dwQslsbIwP7sXnTeFhQUpEeV/c0yt9j0IkkUohEZz1YJgn
 kvZGwwTEEZcpUWOTlxeWG7Dy7kE5gf7tIQ/a+6J5yI/656JRyQW0Ge/6PuafdmfMYzu5
 mDl3OkR0yUCl387Epxrv33MlJDlm8mfLx8OmifIfZlZ+N6CMiSv0wT6iu+NITJg4wXxE
 gYTvN1uXw9c6IhsxtcnMbvSTSikGFXQd+3fYIRfzOZ8Y43dlFb5mk3E8pY68o6SEE29I
 1kiA==
X-Gm-Message-State: AOAM531kRL3PGBAOxy3Q5UEuT59Vom9pH/CWuuroh2BkYJYFDkrNdaSN
 nEQHpduMLzLAtSpNhKFj+yUET3J7fVjL39coBgZbS8NFSnnTioyCnw/1njryHU7+f9KsFmpe0b5
 rImz9oAsgrv8uixgl5Q==
X-Received: by 2002:a05:6000:2ac:: with SMTP id
 l12mr2922510wry.72.1639587246697; 
 Wed, 15 Dec 2021 08:54:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw5QP7MhMqInb5DgABgsa2EPArTJizZ3GkYW1VUxkoLuSUx8YDf5Tk+w1yQpDo9A6IqlXABSQ==
X-Received: by 2002:a05:6000:2ac:: with SMTP id
 l12mr2922471wry.72.1639587246493; 
 Wed, 15 Dec 2021 08:54:06 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id v8sm2393630wrd.84.2021.12.15.08.54.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 08:54:05 -0800 (PST)
Message-ID: <697323f3-0d82-2c7f-3c54-a0f38d93615f@redhat.com>
Date: Wed, 15 Dec 2021 17:54:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v3 00/28] glib: Replace g_memdup() by g_memdup2()
To: qemu-devel@nongnu.org, QEMU Trivial <qemu-trivial@nongnu.org>
Cc: Laurent Vivier <lvivier@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 David Hildenbrand <david@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Eric Blake <eblake@redhat.com>, John Snow <jsnow@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, qemu-ppc@nongnu.org,
 "Daniel P . Berrange" <berrange@redhat.com>
References: <20210903174510.751630-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20210903174510.751630-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.64, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
X-List-Received-Date: Wed, 15 Dec 2021 16:54:12 -0000

Hi Laurent,

On 9/3/21 19:44, Philippe Mathieu-Daudé wrote:

> This series provides the safely equivalent g_memdup2() wrapper,
> and replace all g_memdup() calls by it.

> Philippe Mathieu-Daudé (28):
>   hw/hyperv/vmbus: Remove unused vmbus_load/save_req()
>   glib-compat: Introduce g_memdup2() wrapper
>   qapi: Replace g_memdup() by g_memdup2()
>   accel/tcg: Replace g_memdup() by g_memdup2()
>   block/qcow2-bitmap: Replace g_memdup() by g_memdup2()
>   softmmu: Replace g_memdup() by g_memdup2()
>   hw/9pfs: Replace g_memdup() by g_memdup2()
>   hw/acpi: Avoid truncating acpi_data_len() to 32-bit
>   hw/acpi: Replace g_memdup() by g_memdup2()
>   hw/core/machine: Replace g_memdup() by g_memdup2()
>   hw/hppa/machine: Replace g_memdup() by g_memdup2()
>   hw/i386/multiboot: Replace g_memdup() by g_memdup2()
>   hw/net/eepro100: Replace g_memdup() by g_memdup2()
>   hw/nvram/fw_cfg: Replace g_memdup() by g_memdup2()
>   hw/scsi/mptsas: Replace g_memdup() by g_memdup2()
>   hw/ppc/spapr_pci: Replace g_memdup() by g_memdup2()
>   hw/rdma: Replace g_memdup() by g_memdup2()
>   hw/vfio/pci: Replace g_memdup() by g_memdup2()
>   hw/virtio: Replace g_memdup() by g_memdup2()
>   net/colo: Replace g_memdup() by g_memdup2()
>   ui/clipboard: Replace g_memdup() by g_memdup2()
>   linux-user: Replace g_memdup() by g_memdup2()
>   tests/unit: Replace g_memdup() by g_memdup2()
>   tests/qtest: Replace g_memdup() by g_memdup2()
>   target/arm: Replace g_memdup() by g_memdup2()
>   target/ppc: Replace g_memdup() by g_memdup2()
>   contrib: Replace g_memdup() by g_memdup2()
>   checkpatch: Do not allow deprecated g_memdup(
Is it possible to take the reviewed patches 2, 24 and 28
via qemu-trivial, so the rest can be merged slowly by
each submaintainer?


