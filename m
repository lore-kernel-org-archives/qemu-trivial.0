Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ipW7m-0000VC-IE
	for mharc-qemu-trivial@gnu.org; Thu, 09 Jan 2020 06:37:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41306)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1ipW7j-0000Qw-HT
 for qemu-trivial@nongnu.org; Thu, 09 Jan 2020 06:37:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1ipW7f-0000Wm-7K
 for qemu-trivial@nongnu.org; Thu, 09 Jan 2020 06:37:11 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:48253
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1ipW7d-0000Sv-8l
 for qemu-trivial@nongnu.org; Thu, 09 Jan 2020 06:37:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578569824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0SDNXG5Yi/btrLMOlEi7BNUjLCnWv8a1bpV6Xjevjjg=;
 b=YlJQBlwaSzUNjnmO7cZVurSzm5JWiZdEkQ4D1i6Ryy1VGi1HcQX0+YIpFgkcpD7Asv+rxS
 SByyKA9bW3EBPwT6sCjPMknhIYXH/Bm3/1BcfwDBkWGtmoje7HzRWkDC8Rf3OznaaFvvVo
 0Iizl4DlTiyK52ssKAC4jOsFhC1KeFc=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-Jn3ygjzhP9qYh2Smgnx7mA-1; Thu, 09 Jan 2020 06:37:02 -0500
Received: by mail-qv1-f69.google.com with SMTP id e14so3946354qvr.6
 for <qemu-trivial@nongnu.org>; Thu, 09 Jan 2020 03:37:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=V8wsSytS5VzLMRvoBhbSD6l1trukDJP3qnoOhdNNEMI=;
 b=evOpWnb9P4DlaVBYn3uCzmyklCr9Ssj0oEl8eSfGXX4auXjpFkURKkgfchKfF76UIJ
 oZLqOI24xKUcIBOZnLD3Xf83m1vMEdk/KdGMceIuUgPo2UBPIuTjiOc5mJDJv6zACVCD
 cpMeO+qeTW8sMLvrKEatNiYSJMLNypkQ65lv8co5Iy3ScUOqx4pcyFbfjwBHLZpTYyy6
 Tn7U2cfl7IJz1/78qhXSMGDn31ad4ohDoLO2m33Rfs50TgHGPuZXc9VVrUrxe/bagCTN
 CgJDuorUamTVYnlL3tRf5PqBqMqhgUgTlKInLHnZgGivGti19msvjUrmrZXX6PbyDmo1
 9w6Q==
X-Gm-Message-State: APjAAAWI2BeM4Z1efg9Bx8cxOcCHPl8UQDmhh7jTtLB6hMbaeNIO2kh7
 0cP6p6wd4ssEKE14djgpxBiMzRPV/ZR6dAqtk7LZcItBLxCQ/xBakkGSAL7pVYTOSFQbSlLyqYN
 rWdAljoipNkpl+TuMRw==
X-Received: by 2002:a37:490d:: with SMTP id w13mr8467980qka.221.1578569821597; 
 Thu, 09 Jan 2020 03:37:01 -0800 (PST)
X-Google-Smtp-Source: APXvYqyLBAHZYd2fj7Qvov3ZhRHufVOdT5hWC2YnekJvTWDjsp6Bj166cUj2XW7w10uwZxdfB2Q8oQ==
X-Received: by 2002:a37:490d:: with SMTP id w13mr8467952qka.221.1578569821159; 
 Thu, 09 Jan 2020 03:37:01 -0800 (PST)
Received: from redhat.com (bzq-79-183-34-164.red.bezeqint.net. [79.183.34.164])
 by smtp.gmail.com with ESMTPSA id r37sm3123789qtj.44.2020.01.09.03.36.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2020 03:37:00 -0800 (PST)
Date: Thu, 9 Jan 2020 06:36:56 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 qemu-trivial@nongnu.org
Subject: Re: [PATCH] hw/smbios/smbios: Remove unused include
Message-ID: <20200109063646-mutt-send-email-mst@kernel.org>
References: <20200109112504.32622-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200109112504.32622-1-philmd@redhat.com>
X-MC-Unique: Jn3ygjzhP9qYh2Smgnx7mA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
X-List-Received-Date: Thu, 09 Jan 2020 11:37:12 -0000

On Thu, Jan 09, 2020 at 12:25:04PM +0100, Philippe Mathieu-Daud=E9 wrote:
> Nothing from "sysemu/cpus.h" is used by smbios.c, remove the include.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>



> ---
>  hw/smbios/smbios.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
> index ded5f1f4e2..1a0f461541 100644
> --- a/hw/smbios/smbios.c
> +++ b/hw/smbios/smbios.c
> @@ -24,7 +24,6 @@
>  #include "qemu/option.h"
>  #include "sysemu/sysemu.h"
>  #include "qemu/uuid.h"
> -#include "sysemu/cpus.h"
>  #include "hw/firmware/smbios.h"
>  #include "hw/loader.h"
>  #include "hw/boards.h"
> --=20
> 2.21.1


