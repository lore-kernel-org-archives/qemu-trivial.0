Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jdc43-0006Zu-D2
	for mharc-qemu-trivial@gnu.org; Tue, 26 May 2020 12:04:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <th.huth@gmail.com>)
 id 1jdc41-0006Vd-3R; Tue, 26 May 2020 12:04:25 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:33718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <th.huth@gmail.com>)
 id 1jdc3y-0005GW-EK; Tue, 26 May 2020 12:04:24 -0400
Received: by mail-wm1-f67.google.com with SMTP id j198so315105wmj.0;
 Tue, 26 May 2020 09:04:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Oup9OvPZI88PbTh2vNNYQeJPSoFJ13JYSMC/2Zn3D2A=;
 b=D1bnNi78U0zyuaD1DJT402FuCG3lVDTNG+5MrDEbVdPzSixLbqvclV0gRbUY2Xdyuc
 ont0FyUuGXwOaRWSYHySrwuhYTQdh2mUEMEd5KtCG8WVKuTkJC9K+L7+WRNGZrIzEvhY
 Nr/wglgv2+iM5M4vyh5YzwILpCnbXESbfv4w6Q5jxn9e/5CKCYOfSyk0hYb3x/lHDrl2
 Fb3VcUffYD54cGxvbdCTJx39bZ4qrYvbABpQAUHI3HLk+9VjZPeVj1NsbrCL3wcFzMbn
 duvvQK6zPT5lpZLDwXfGOEEqF/caf3pWw2znPPj+3BDNelH8DuCmLeBtuHn+ijV4qqRR
 8yNQ==
X-Gm-Message-State: AOAM532rKpYtTY2bHoTv7NlK193xtnL3hlFaH3tVsBZ1cEjX7mUGf+IG
 1wKRH3UygKSAbsPXow2koDQ=
X-Google-Smtp-Source: ABdhPJwfC0XTrCqh+pacFLPv1HhD/AFHhQ5ZLofqCK5i9DglRcJRZ97iuYIEmQQEdRYPbOYAZEoBrA==
X-Received: by 2002:a7b:c046:: with SMTP id u6mr1918554wmc.57.1590509060427;
 Tue, 26 May 2020 09:04:20 -0700 (PDT)
Received: from thl530 (x590feeb5.dyn.telefonica.de. [89.15.238.181])
 by smtp.gmail.com with ESMTPSA id s7sm261900wrr.60.2020.05.26.09.04.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2020 09:04:19 -0700 (PDT)
Date: Tue, 26 May 2020 18:04:16 +0200
From: Thomas Huth <huth@tuxfamily.org>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, Jason Wang
 <jasowang@redhat.com>
Subject: Re: [PATCH v3 2/2] hw/m68k/mcf52xx: Replace hw_error() by
 qemu_log_mask()
Message-ID: <20200526180416.4f151f81@thl530>
In-Reply-To: <20200526094052.1723-3-f4bug@amsat.org>
References: <20200526094052.1723-1-f4bug@amsat.org>
 <20200526094052.1723-3-f4bug@amsat.org>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.128.67; envelope-from=th.huth@gmail.com;
 helo=mail-wm1-f67.google.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/26 12:04:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Tue, 26 May 2020 16:04:25 -0000

Am Tue, 26 May 2020 11:40:52 +0200
schrieb Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>:

> hw_error() calls exit(). This a bit overkill when we can log
> the accesses as unimplemented or guest error.
>=20
> When fuzzing the devices, we don't want the whole process to
> exit. Replace some hw_error() calls by qemu_log_mask().
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
[...]
> diff --git a/hw/m68k/mcf5208.c b/hw/m68k/mcf5208.c
> index b84c152ce3..108623b4ad 100644
> --- a/hw/m68k/mcf5208.c
> +++ b/hw/m68k/mcf5208.c
> @@ -9,10 +9,10 @@
>  #include "qemu/osdep.h"
>  #include "qemu/units.h"
>  #include "qemu/error-report.h"
> +#include "qemu/log.h"
>  #include "qapi/error.h"
>  #include "qemu-common.h"
>  #include "cpu.h"
> -#include "hw/hw.h"
>  #include "hw/irq.h"
>  #include "hw/m68k/mcf.h"
>  #include "hw/m68k/mcf_fec.h"
> @@ -111,8 +111,9 @@ static void m5208_timer_write(void *opaque,
> hwaddr offset, case 4:
>          break;
>      default:
> -        hw_error("m5208_timer_write: Bad offset 0x%x\n",
> (int)offset);
> -        break;
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" PRIx64
> "\n",

That likely should be HWADDR_PRIX, too? ... could be fixed up while
applying the patch.

With that:
Reviewed-by: Thomas Huth <huth@tuxfamily.org>


> +                      __func__, offset);
> +        return;
>      }
>      m5208_timer_update(s);
>  }
> @@ -136,7 +137,8 @@ static uint64_t m5208_timer_read(void *opaque,
> hwaddr addr, case 4:
>          return ptimer_get_count(s->timer);
>      default:
> -        hw_error("m5208_timer_read: Bad offset 0x%x\n", (int)addr);
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%"
> HWADDR_PRIX "\n",
> +                      __func__, addr);
>          return 0;
>      }
>  }
> @@ -164,7 +166,8 @@ static uint64_t m5208_sys_read(void *opaque,
> hwaddr addr, return 0;
> =20
>      default:
> -        hw_error("m5208_sys_read: Bad offset 0x%x\n", (int)addr);
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%"
> HWADDR_PRIX "\n",
> +                      __func__, addr);
>          return 0;
>      }
>  }
> @@ -172,7 +175,8 @@ static uint64_t m5208_sys_read(void *opaque,
> hwaddr addr, static void m5208_sys_write(void *opaque, hwaddr addr,
>                              uint64_t value, unsigned size)
>  {
> -    hw_error("m5208_sys_write: Bad offset 0x%x\n", (int)addr);
> +    qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIX
> "\n",
> +                  __func__, addr);
>  }

