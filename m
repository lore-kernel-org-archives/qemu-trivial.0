Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jRtIe-0001Yo-3m
	for mharc-qemu-trivial@gnu.org; Fri, 24 Apr 2020 04:03:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56144)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <sgarzare@redhat.com>) id 1jRtIZ-0001Tu-7W
 for qemu-trivial@nongnu.org; Fri, 24 Apr 2020 04:03:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <sgarzare@redhat.com>) id 1jRtIU-0004oj-V5
 for qemu-trivial@nongnu.org; Fri, 24 Apr 2020 04:02:58 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:44165
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1jRtIU-0004jQ-Ek
 for qemu-trivial@nongnu.org; Fri, 24 Apr 2020 04:02:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587715373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dbgYanLLwwglleg12BWjhG+qKbHxC2VxBwlFdlOgqkU=;
 b=L2UJl8HXpRyVpWMTjwUoqWp3YwGoO7tTW0k7kc75fz8pyiD6J79e+g3WHDlyYzDMcD0F2l
 10YCNnddIQNKsx/RMiKrNGBeuxW1FyH9GL+hrPkZcgaZKgkJq5X2bbOtobZ+CU02rlRB/J
 pkC+bAQN+PoERWIcmu29a5Acsj1ESLM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-328-MM6pQT3QMIaOuU4Rz8Ww4Q-1; Fri, 24 Apr 2020 04:02:51 -0400
X-MC-Unique: MM6pQT3QMIaOuU4Rz8Ww4Q-1
Received: by mail-wm1-f72.google.com with SMTP id 71so3849469wmb.8
 for <qemu-trivial@nongnu.org>; Fri, 24 Apr 2020 01:02:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=A+3aAMTf+vkTiLcHgLUV+t/6fgE2FIUpNF1647W+5mE=;
 b=pPZescOYWJWG0SkM36IEYYvJj7z+DTl1zyxBJSt37SXlw9NH+cremtE7XsO4XZNORF
 +Eh/HcFbjBmKIyy4am9pOPETQPB5EEF8m2Gb5ui4qyJolKF7JSEhNfPgzE7fn070gwBc
 h/uvmHgk6Z/cQ4KP23e+aA6XzgOUXPNebY5NOutmT+Havm912rci0l58cegIVyS1cSxr
 xxSD0eIUA1Y+pTIOGwbFAT2u3T3PyLG+qiNMwW9ooaff+5+u/fhCg0K7Mbg5fjI30ifH
 di3wd/Xos/FbSPIIyGHG/w1sb66j/cN5lYaUkV5yKVe1OudaYer1OZyvkZvnezH1n0zD
 IPqw==
X-Gm-Message-State: AGi0PuYnGg/tS0ymoT+Lx+LRmGpoe0HVSjUV+dwONRWfBFXYKABD1boz
 rYsIPMUiaOqIXjWMitVHU6r54RNdX8V5IEuR2x8dF5hpPClxoKzBLPEWCjmUmpYOgNFA0effbcr
 kCjX7u1Hbx+DIQXAUrw==
X-Received: by 2002:a1c:41d7:: with SMTP id o206mr8714455wma.89.1587715370411; 
 Fri, 24 Apr 2020 01:02:50 -0700 (PDT)
X-Google-Smtp-Source: APiQypImT4jzw9pIbk2S5XLz2ol770pnZzVKuMrI4VNtTwrl6ep7qreBomqri7lvcjWMUChmlmi0Ig==
X-Received: by 2002:a1c:41d7:: with SMTP id o206mr8714420wma.89.1587715370080; 
 Fri, 24 Apr 2020 01:02:50 -0700 (PDT)
Received: from steredhat (host108-207-dynamic.49-79-r.retail.telecomitalia.it.
 [79.49.207.108])
 by smtp.gmail.com with ESMTPSA id l4sm7164935wrw.25.2020.04.24.01.02.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2020 01:02:49 -0700 (PDT)
Date: Fri, 24 Apr 2020 10:02:47 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Randy Yates <yates@ieee.org>
Subject: Re: [PATCH] elf_ops: Don't try to g_mapped_file_unref(NULL)
Message-ID: <20200424080247.iqpjfnzrera7uvy6@steredhat>
References: <20200423202011.32686-1-peter.maydell@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20200423202011.32686-1-peter.maydell@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/24 03:54:07
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
X-List-Received-Date: Fri, 24 Apr 2020 08:03:03 -0000

On Thu, Apr 23, 2020 at 09:20:11PM +0100, Peter Maydell wrote:
> Calling g_mapped_file_unref() on a NULL pointer is not valid, and
> glib will assert if you try it.
>=20
> $ qemu-system-arm -M virt -display none -device loader,file=3D/tmp/bad.el=
f
> qemu-system-arm: -device loader,file=3D/tmp/bad.elf: GLib: g_mapped_file_=
unref: assertion 'file !=3D NULL' failed
>=20
> (One way to produce an ELF file that fails like this is to copy just
> the first 16 bytes of a valid ELF file; this is sufficient to fool
> the code in load_elf_ram_sym() into thinking it's an ELF file and
> calling load_elf32() or load_elf64().)
>=20
> The failure-exit path in load_elf can be reached from various points
> in execution, and for some of those we haven't yet called
> g_mapped_file_new_from_fd().  Add a condition to the unref call so we
> only call it if we successfully created the GMappedFile to start with.
>=20
> This will fix the assertion; for the specific case of the generic
> loader it will then fall back from "guess this is an ELF file" to
> "maybe it's a uImage or a hex file" and eventually to "just load as
> a raw data file".
>=20
> Reported-by: Randy Yates <yates@ieee.org>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/elf_ops.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/include/hw/elf_ops.h b/include/hw/elf_ops.h
> index e0bb47bb678..398a4a2c85b 100644
> --- a/include/hw/elf_ops.h
> +++ b/include/hw/elf_ops.h
> @@ -606,7 +606,9 @@ static int glue(load_elf, SZ)(const char *name, int f=
d,
>          *highaddr =3D (uint64_t)(elf_sword)high;
>      ret =3D total_size;
>   fail:
> -    g_mapped_file_unref(mapped_file);
> +    if (mapped_file) {
> +        g_mapped_file_unref(mapped_file);
> +    }
>      g_free(phdr);
>      return ret;
>  }

Oooops, my fault :-(

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

Maybe we can add:
Fixes: 816b9fe450 ("elf-ops.h: Map into memory the ELF to load")

Thanks,
Stefano


