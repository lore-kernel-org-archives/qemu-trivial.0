Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lFOLz-00077T-AZ
	for mharc-qemu-trivial@gnu.org; Thu, 25 Feb 2021 16:39:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lFOLy-00077I-Ky
 for qemu-trivial@nongnu.org; Thu, 25 Feb 2021 16:39:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lFOLw-0002xn-8E
 for qemu-trivial@nongnu.org; Thu, 25 Feb 2021 16:39:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614289158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Px1rgjKouKSfmPrCMXS/5pmEIwrBqkgO0d0DMAkV2Zo=;
 b=Lg7MS8nNalpDhkGUEZC36gvHhAqCuD6PvYmlhqLEKReyshn4TYtSUlKdZrdb4m6YNm4qTo
 eG8/tN75+2Pq1vm6xdtwp/m3vR4ax6UiB3oimKeDufCF/ecSvgnhoMXKJxRbWMggcWY7TD
 uDdy2OK2M+mZIKqCVai+9KDAITj0PPM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-Nn1mc6ojPaOHM8eTbNnRcA-1; Thu, 25 Feb 2021 16:39:15 -0500
X-MC-Unique: Nn1mc6ojPaOHM8eTbNnRcA-1
Received: by mail-ej1-f72.google.com with SMTP id m4so3132077ejc.14
 for <qemu-trivial@nongnu.org>; Thu, 25 Feb 2021 13:39:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Px1rgjKouKSfmPrCMXS/5pmEIwrBqkgO0d0DMAkV2Zo=;
 b=GXV+K8dzM/6+JyPutWElDxbc9yrAwF5obg0WMZ3OOx7Y/BXQz0wbp2EUSoTwa+f+RY
 JgXnCo6cJ/JPAnTsdUve6qUNdq+8UAmMhhObQUP04MzcP6+9Q4ci+++teuk+libhDulS
 bxVOXEkdcszjuEon99v80QxgtZuajf74w0UAa1ez75+tS6X9NPZ2Ti113xnl0t2DfTRF
 cV1tirRX+M1MJ/2pf8dCfRtl+vs+4NStou2Mmza9fos2V2eqQVwlPNmDMCHBAP/deG2p
 /DQKlRJKgMHawqhy2kF/d12PwGKa4HB5FYnzwB4MvKe5obqCsdpa16PYM7975DK7S8LI
 Fiaw==
X-Gm-Message-State: AOAM532u6E/dV7wpYgGTuaeT7Z5CEZo2G7qe1hIAdHUa5uSV3TJCBEjl
 xLIkAK0VE7nZS7rB0Tl6yRFs9ZEhPJGF7Odn1aiJd+5J3hpgnPlzCPOfHNo1EtLcZhZKGHLqqoH
 aL6JHauVenyW1izCuPw==
X-Received: by 2002:a17:907:20e4:: with SMTP id
 rh4mr4753608ejb.369.1614289154516; 
 Thu, 25 Feb 2021 13:39:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwwvT81+6Q2YSOd2KTinRNbOG7ndch0MYWEvQBnhFPYM1w2kXTLMFcJ/3AkvNGQieIW0ngVsg==
X-Received: by 2002:a17:907:20e4:: with SMTP id
 rh4mr4753586ejb.369.1614289154278; 
 Thu, 25 Feb 2021 13:39:14 -0800 (PST)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id d5sm4335785edu.12.2021.02.25.13.39.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 13:39:13 -0800 (PST)
Date: Thu, 25 Feb 2021 22:39:11 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Subject: Re: [PATCH] hw/elf_ops: Fix a typo
Message-ID: <20210225213911.5vnawz7nweuoatyk@steredhat>
References: <20210225181344.3623720-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210225181344.3623720-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 25 Feb 2021 21:39:22 -0000

On Thu, Feb 25, 2021 at 07:13:44PM +0100, Philippe Mathieu-Daudé wrote:
>g_mapped_file_new_from_fd()'s parameter is named 'writable'.
>
>Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>---
> include/hw/elf_ops.h | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/include/hw/elf_ops.h b/include/hw/elf_ops.h
>index 8e8436831d2..304f266bf3b 100644
>--- a/include/hw/elf_ops.h
>+++ b/include/hw/elf_ops.h
>@@ -417,7 +417,7 @@ static int glue(load_elf, SZ)(const char *name, int fd,
>
>     /*
>      * Since we want to be able to modify the mapped buffer, we set the
>-     * 'writeble' parameter to 'true'. Modifications to the buffer are not
>+     * 'writable' parameter to 'true'. Modifications to the buffer are not

Oooops :-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


