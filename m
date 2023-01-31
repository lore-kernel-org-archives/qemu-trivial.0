Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pMqr3-0003Ds-9j
	for mharc-qemu-trivial@gnu.org; Tue, 31 Jan 2023 08:39:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMqr2-0003Di-Hj
 for qemu-trivial@nongnu.org; Tue, 31 Jan 2023 08:39:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMqr1-0005Qx-6l
 for qemu-trivial@nongnu.org; Tue, 31 Jan 2023 08:39:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675172358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3pHzi2ikX4eA/lkQIQOwNzJXy6L0fFPe0iV7D6VvW0M=;
 b=NOK2gQ+0uCWiEqcvFWoFD47ZSDDxT5FdvTzv4o/bN+rNxRhcvYM7tkuB2MzdEROfRUF2UR
 yc8f69SSa/Ee48er8tyK+Qu1iBkPXBy2VR+lZLPFvZ2pZuK6O2Jqvh4T8PIJlNh8hSN4Qt
 rhibREeOCry7zqW9APuu18brihk2PIQ=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-557-2mSOzKHuO4a9-wXqXFqCuA-1; Tue, 31 Jan 2023 08:38:09 -0500
X-MC-Unique: 2mSOzKHuO4a9-wXqXFqCuA-1
Received: by mail-ua1-f71.google.com with SMTP id
 bs42-20020a056130102a00b00662eb7179aeso2540588uab.0
 for <qemu-trivial@nongnu.org>; Tue, 31 Jan 2023 05:38:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3pHzi2ikX4eA/lkQIQOwNzJXy6L0fFPe0iV7D6VvW0M=;
 b=V9R/Pucm5oi9v6SYtiRD+0580Abburzn3AISMAfOkBNh+L49krPxJHfQeLvNMUlfO3
 E5SP70ZgDncLCbV6FeSeMDWRScPhb07fdfy3dB8AaiDyNSQI3chP9SfladZfGixGAzCJ
 MdCYFj2DaUCH3QfNkb2aQQtO0RRdiPO21/znxUjf2Lzn7qJ9SRHdONS1o7u9n/UcfIKF
 lJywG3IzJZivQuTYIskDaxw9WlLrVxDERtq8K6V9MnWE0Jvd2JzanRTcLpZHlaGQd5+V
 yCHuAPTxZ+fplOZmhXef1r2EzcfkXaEp6A4YNY3aHxavB7dpvdXFzlgcIFly5sTEXHNQ
 aYbQ==
X-Gm-Message-State: AO0yUKX/hvQAG9ELOWqhBThwkAo+8JuZXbyqqXqJESYYrmBVZtuqT+e3
 xOKvfkG95/Eb64JyZOHJMf5hwjX7ybJy7c4ZdDjzDCYRyYYPQDaqU9vGz7xCkWrdQuu3/3rMMbR
 HHM6DR2rd9HZgsxiapQ==
X-Received: by 2002:a05:6102:109c:b0:3f8:bbb2:941e with SMTP id
 s28-20020a056102109c00b003f8bbb2941emr3361366vsr.5.1675172289222; 
 Tue, 31 Jan 2023 05:38:09 -0800 (PST)
X-Google-Smtp-Source: AK7set9e36IcXXodJOjJmIs81xqVvVEwzL/lrhs3UNjusoCVGAtwUX9m+iHIdajBZLrSt+vcDrkgBw==
X-Received: by 2002:a05:6102:109c:b0:3f8:bbb2:941e with SMTP id
 s28-20020a056102109c00b003f8bbb2941emr3361093vsr.5.1675172284077; 
 Tue, 31 Jan 2023 05:38:04 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-155.web.vodafone.de.
 [109.43.176.155]) by smtp.gmail.com with ESMTPSA id
 pe27-20020a05620a851b00b0071883954df4sm8423557qkn.103.2023.01.31.05.38.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Jan 2023 05:38:03 -0800 (PST)
Message-ID: <e6d8b6af-a390-39c5-8f0f-d9b7365341d9@redhat.com>
Date: Tue, 31 Jan 2023 14:38:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 01/20] hw/pci-host/i440fx: Inline sysbus_add_io()
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Ani Sinha
 <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Laurent Vivier <lvivier@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, qemu-trivial@nongnu.org
References: <20230131115326.12454-1-shentey@gmail.com>
 <20230131115326.12454-2-shentey@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230131115326.12454-2-shentey@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 31 Jan 2023 13:39:20 -0000

On 31/01/2023 12.53, Bernhard Beschow wrote:
> sysbus_add_io() just wraps memory_region_add_subregion() while also
> obscuring where the memory is attached. So use
> memory_region_add_subregion() directly and attach it to the existing
> memory region s->bus->address_space_io which is set as an alias to
> get_system_io() by the pc machine.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/pci-host/i440fx.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


