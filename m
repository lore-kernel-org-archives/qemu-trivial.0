Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kxtLo-0007gf-9G
	for mharc-qemu-trivial@gnu.org; Fri, 08 Jan 2021 10:06:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1kxtLk-0007fS-RQ
 for qemu-trivial@nongnu.org; Fri, 08 Jan 2021 10:06:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1kxtLh-0000kL-SS
 for qemu-trivial@nongnu.org; Fri, 08 Jan 2021 10:06:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610118404;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7wBwsG56Bsxex18dbtXK0XZybqGGh77JwLxho0q30kU=;
 b=TQLGB7AycS0hJLQH10ii0MQd2heKNcU9iDZuqENXTBUs0OINB7Agrg040rf62dOiuKsNL/
 H9nF6Tra95yNt3XYwT5IUy0Vyv777cCaekpT7u9p1hMHh6JCVFmrZ21qQA+w7wpfK1zpu9
 a+7pogNWIMA2gbP/d4cjbHiKQdDA+F0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-583-qHh5rPRUPY-JW1FT_py6Bg-1; Fri, 08 Jan 2021 10:06:43 -0500
X-MC-Unique: qHh5rPRUPY-JW1FT_py6Bg-1
Received: by mail-wm1-f71.google.com with SMTP id k67so3324058wmk.5
 for <qemu-trivial@nongnu.org>; Fri, 08 Jan 2021 07:06:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=7wBwsG56Bsxex18dbtXK0XZybqGGh77JwLxho0q30kU=;
 b=WUSdp0ZxADGJrGeGfmyCSVj4zWlMc4G2liiQVdNtQ3yMbF6nfA6Z5w2GdytW37MUct
 PKx2uLS69uRiySU/8Q8fhLv7DkBRmTI/RGLoTFu4itEhlt5echJNDwCcNjAvapAkrPBS
 a32mcgtKWZhyJP38fADKWO01zABM95sGs0fft3Gyqtka90ltp7BiT6BNl616faCSFxSp
 TPQeOFo+/7XNXP/NxLAw8NlDm8+IGZa+0p4EAK/qsGV1Dr4c/X8p76qjxoxCauWkQyNi
 rm2zGIF7GxyEmw7Ho+2rkfc5cynjwuWxnHX6LmcaJ6SAPzUT68zpDMDuumuPIkj2YAq9
 FxcQ==
X-Gm-Message-State: AOAM5339uRMcTEVlnVcxSN3TYGYK1nbtK7m2geSh7HAVZV2Tgz+u/O4T
 Hu3DKY2fY63xh+pYCz4+4esDUhJNIh6USbQsMfm5JR4/+1xei10cyzedMdFBDXVJEphsjNFmBsK
 NsO/DCRYSizvmE2oQZA==
X-Received: by 2002:a05:600c:255:: with SMTP id
 21mr3398868wmj.69.1610118401945; 
 Fri, 08 Jan 2021 07:06:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyUeWRJX1r0y9VjEADh5VGcoDvFcBVgX8mTsN/VfcHJXXgT7mVhg/KHuM/q/z1NS7z292Kv+Q==
X-Received: by 2002:a05:600c:255:: with SMTP id
 21mr3398842wmj.69.1610118401685; 
 Fri, 08 Jan 2021 07:06:41 -0800 (PST)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id a62sm12347646wmf.7.2021.01.08.07.06.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 07:06:40 -0800 (PST)
Date: Fri, 8 Jan 2021 16:06:38 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] hw/virtio-pci: Replace error_report() by
 qemu_log_mask(GUEST_ERROR)
Message-ID: <20210108150638.pzc4mu5knw37ejsv@steredhat>
References: <20201210172834.178052-1-philmd@redhat.com>
 <20210108120243.zgajoyust5n56l5m@steredhat>
 <990898ff-a225-0548-690a-f7bab039ca08@redhat.com>
MIME-Version: 1.0
In-Reply-To: <990898ff-a225-0548-690a-f7bab039ca08@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.247,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 08 Jan 2021 15:06:49 -0000

On Fri, Jan 08, 2021 at 04:00:21PM +0100, Philippe Mathieu-Daudé wrote:
>On 1/8/21 1:02 PM, Stefano Garzarella wrote:
>> On Thu, Dec 10, 2020 at 06:28:34PM +0100, Philippe Mathieu-DaudÃƒÂ© wrote:
>>> Replace I/O write error reported with error_report() by
>>> qemu_log_mask(GUEST_ERROR) which allow filtering.
>>>
>>> Signed-off-by: Philippe Mathieu-DaudÃƒÂ© <philmd@redhat.com>
>>> ---
>>> hw/virtio/virtio-pci.c | 6 ++++--
>>> 1 file changed, 4 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
>>> index f863f69ede4..094c36aa3ea 100644
>>> --- a/hw/virtio/virtio-pci.c
>>> +++ b/hw/virtio/virtio-pci.c
>>> @@ -27,6 +27,7 @@
>>> #include "hw/qdev-properties.h"
>>> #include "qapi/error.h"
>>> #include "qemu/error-report.h"
>>             ^
>> Just a little thing, could we remove this inclusion since we are not
>> using error_report() anymore in this file?
>
>We can't because virtio_pci_device_plugged() calls
>warn_report() twice :/

Of course you are right :-)

Stefano

>
>> Anyway the patch LGTM:
>>
>> Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
>
>Thanks!
>
>Phil.
>


