Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n6oMQ-0007x7-5G
	for mharc-qemu-trivial@gnu.org; Mon, 10 Jan 2022 01:40:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n6oM3-0007pM-Cc; Mon, 10 Jan 2022 01:40:33 -0500
Received: from [2607:f8b0:4864:20::d34] (port=42502
 helo=mail-io1-xd34.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n6oLn-0005MU-IJ; Mon, 10 Jan 2022 01:40:17 -0500
Received: by mail-io1-xd34.google.com with SMTP id o7so16164055ioo.9;
 Sun, 09 Jan 2022 22:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=gqVMJaUBivD10g/gyFwe0c9eCn5awuYbTFhPKLVR0VM=;
 b=n0TTQKwqkYZUkWg6JhyB0kvZJ8K1eKeF7f1Qk3DPPOdcjn1wfJQ1mMT1dylot+VUDS
 +LR6fd10HpWkqNOZX5NWJO1o+irAjHjVMxEphGvvpsKlIHtHfFTLO/8dE84hOaWyuTSS
 VE5vqQW8jO9RHnLvmCICDb5CkSloQc0cI4l4VEFOrDUJqq0jt8+UchkdVqVIfZ0+eKx3
 2+SaDqWpOVFQhR0cSJadFLhnc1mketC05DorfUq/3DcW6yWkPxpDaVxX4BN4EEFOXTxL
 R6IXo8PYLdy/qxNTMSIhbBMfDg4/BhjnOxbnZjbvpgOXk+BZmoAgvE4eVNnv4JXAGEew
 M5/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gqVMJaUBivD10g/gyFwe0c9eCn5awuYbTFhPKLVR0VM=;
 b=KZ4VDJ7rUldzijAQG+yJZ9aFKg+rqE0bIo3+0eYnrkug2EOWj4WqmqvoEJlT86wR99
 fxZ9TSU7fS14j2JRTVwK5L827iILhT8vbc8e+ynYMiJ/zJiydDv+uqyTQ7tzhGojs4i+
 zlZo29kqX/ZyZkSOyqHUS9eZqkUPUBRBsnUE17bo9SeBDIekXnC0pjmjDgKoJkFnX6Zw
 SUeL7SZwKamPHimoW8r8iOEGHEE808t+dNPmE71qs4E97Ewj8T84d6AGaeVoJwYgQx0c
 eqR5Z7KVICmPnrUVzaQWWNFTvy3JW9JkS2BHi85ZHYTaZVLa/sG5+7pmwHjDuUcNBhqr
 2y+Q==
X-Gm-Message-State: AOAM533VhH+uYdO9sQKlp0mbhoAe8eHBgEBeeZWwHFviU+RHjA6VTUKo
 EaEww/FaAYpDUqSPj1CM7tRX6DA/LrAaRjfxvmc=
X-Google-Smtp-Source: ABdhPJxcJiqE7pW7JujW6vZnc3SaWA0XNMZu8Mn5GKm/g+cHJakVEQWuRsz/4D+5ee68cyXu4LvRgTnm5a2K2SwG6QM=
X-Received: by 2002:a5d:8a0a:: with SMTP id w10mr35040162iod.90.1641796813700; 
 Sun, 09 Jan 2022 22:40:13 -0800 (PST)
MIME-Version: 1.0
References: <20220107133844.145039-1-thuth@redhat.com>
In-Reply-To: <20220107133844.145039-1-thuth@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 10 Jan 2022 16:39:47 +1000
Message-ID: <CAKmqyKOAs4zoACwqROv=XY1WdqC84u3_4X_t-JYOjg=EV2ZFQg@mail.gmail.com>
Subject: Re: [PATCH] softmmu/device_tree: Silence compiler warning with
 --enable-sanitizers
To: Thomas Huth <thuth@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Yanan Wang <wangyanan55@huawei.com>, QEMU Trivial <qemu-trivial@nongnu.org>, 
 Andrew Jones <drjones@redhat.com>, David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d34
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d34;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd34.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 10 Jan 2022 06:40:38 -0000

On Fri, Jan 7, 2022 at 11:41 PM Thomas Huth <thuth@redhat.com> wrote:
>
> If I configure my build with --enable-sanitizers, my GCC (v8.5.0)
> complains:
>
> .../softmmu/device_tree.c: In function =E2=80=98qemu_fdt_add_path=E2=80=
=99:
> .../softmmu/device_tree.c:560:18: error: =E2=80=98retval=E2=80=99 may be =
used uninitialized
>  in this function [-Werror=3Dmaybe-uninitialized]
>      int namelen, retval;
>                   ^~~~~~
>
> It's a false warning since the while loop is always executed at least
> once (p has to be non-NULL, otherwise the derefence in the if-statement
> earlier will crash). Thus let's switch to a do-while loop here instead
> to make the compiler happy in all cases.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Thanks!

Applied to riscv-to-apply.next

If anyone else (trivial maybe?) wants to take this feel free to as
well, otherwise I'll just take this via the RISC-V tree.

Alistair

> ---
>  softmmu/device_tree.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
> index 3965c834ca..9e96f5ecd5 100644
> --- a/softmmu/device_tree.c
> +++ b/softmmu/device_tree.c
> @@ -564,7 +564,7 @@ int qemu_fdt_add_path(void *fdt, const char *path)
>          return -1;
>      }
>
> -    while (p) {
> +    do {
>          name =3D p + 1;
>          p =3D strchr(name, '/');
>          namelen =3D p !=3D NULL ? p - name : strlen(name);
> @@ -584,7 +584,7 @@ int qemu_fdt_add_path(void *fdt, const char *path)
>          }
>
>          parent =3D retval;
> -    }
> +    } while (p);
>
>      return retval;
>  }
> --
> 2.27.0
>
>

