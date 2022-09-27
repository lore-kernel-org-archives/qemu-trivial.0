Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1odAGf-00006m-El
	for mharc-qemu-trivial@gnu.org; Tue, 27 Sep 2022 09:04:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1odAGa-0008T6-SL
 for qemu-trivial@nongnu.org; Tue, 27 Sep 2022 09:04:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1odAGW-0002Yg-MY
 for qemu-trivial@nongnu.org; Tue, 27 Sep 2022 09:04:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664283887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R/nDiVQA20P7VZph7pRT+g/FUfk+b1+o+fvuh1NkUZU=;
 b=XPs8kOHfgWUZOOGNwHcSfaahG6a43wlg+lFuyetwpHx/xxCrmR6Xl4qaQzrP1eH47wST/V
 bGS1VehTbbFSdrFylpQMCzIM6P5YeHjiuSM0zwWWOZttcfqTuKcvkZE9AJdRoFscqCcu3p
 VtAG5V+z2yTSQHqO4PoHe3bFsnGqZ3s=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-73-rjSrjAtHM2WNfZNDbJcWLA-1; Tue, 27 Sep 2022 09:04:46 -0400
X-MC-Unique: rjSrjAtHM2WNfZNDbJcWLA-1
Received: by mail-oi1-f198.google.com with SMTP id
 q11-20020a0568080a8b00b0034fbbc585f3so3185326oij.4
 for <qemu-trivial@nongnu.org>; Tue, 27 Sep 2022 06:04:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=R/nDiVQA20P7VZph7pRT+g/FUfk+b1+o+fvuh1NkUZU=;
 b=2jx4LnYnLQGYm+ggVI0oKDFmYkwGpURvu8IO3TdnOHqnx9HtDlPsJTJaOthQfFv9Ij
 ZjicxTMiEUA3zfzhzBBr6V06HRwrtDyIpt+s4BlAdFKC+tpEySJoe3M+DOnkuPOEin3R
 5KhPcnYBr2TYj1XnSL0rL/t4l+N8O7UNWMbEag+O3xNAq8xFeemcBz4ppOPDxw00j16V
 QwdkV/hxyV+T2fCg1SSQP+hOw+Q+3FC+CpkxxvHwyUyPEjInAdNMDXHCA/tQG4r/8GYx
 g9kIpEraIcZlFO4Nxghih8ox+e45VFXiA/xG/rApeAQWojyeC/EKjUlT56Vl8IGe3xyv
 teeg==
X-Gm-Message-State: ACrzQf1g5z5uB7IUojOWOYnrwaRBxuBXp1pgxoZXoa2j9DO7Y4W5g524
 FPvFCc/Qq9R5d5m9LnlXF2rBnkiqxTAOC5EDo1AttXtkD53Qz+aQaMhGhx1EqjXIgI0JvWndXQU
 tX80kBqOzUHCz9M4ioJqB718WDzf68BxcCQ==
X-Received: by 2002:a05:6870:c1d4:b0:127:ad2c:3d74 with SMTP id
 i20-20020a056870c1d400b00127ad2c3d74mr2179703oad.205.1664283885575; 
 Tue, 27 Sep 2022 06:04:45 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7/ShVe25SRmO5ykQrSsj7gAY8paC+y17VY0v2t55rBEdMDajlg1A638949DsgnyZ+SCcgLgUaxxvyfDUQaJzo=
X-Received: by 2002:a05:6870:c1d4:b0:127:ad2c:3d74 with SMTP id
 i20-20020a056870c1d400b00127ad2c3d74mr2179688oad.205.1664283885302; Tue, 27
 Sep 2022 06:04:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220927122146.2787854-1-stefanb@linux.ibm.com>
In-Reply-To: <20220927122146.2787854-1-stefanb@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 27 Sep 2022 17:04:33 +0400
Message-ID: <CAMxuvayyxizLFdHgYtjJZ412wUD4hq57NXKxUSHuJMKVGr4EQA@mail.gmail.com>
Subject: Re: [PATCH] docs: Update TPM documentation for usage of a TPM 2
To: Stefan Berger <stefanb@linux.ibm.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Tue, 27 Sep 2022 13:04:55 -0000

On Tue, Sep 27, 2022 at 4:21 PM Stefan Berger <stefanb@linux.ibm.com> wrote=
:
>
> Update the TPM documentation for usage of a TPM 2 rather than a TPM 1.2.
> Adjust the command lines and expected outputs inside the VM accordingly.
> Update the command line to start a TPM 2 with swtpm.
>
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  docs/specs/tpm.rst | 44 ++++++++++++++++++++++++--------------------
>  1 file changed, 24 insertions(+), 20 deletions(-)
>
> diff --git a/docs/specs/tpm.rst b/docs/specs/tpm.rst
> index 3be190343a..535912a92b 100644
> --- a/docs/specs/tpm.rst
> +++ b/docs/specs/tpm.rst
> @@ -250,24 +250,25 @@ hardware TPM ``/dev/tpm0``:
>
>  The following commands should result in similar output inside the VM
>  with a Linux kernel that either has the TPM TIS driver built-in or
> -available as a module:
> +available as a module (assuming a TPM 2 is passed through):
>
>  .. code-block:: console
>
>    # dmesg | grep -i tpm
> -  [    0.711310] tpm_tis 00:06: 1.2 TPM (device=3Did 0x1, rev-id 1)
> -
> -  # dmesg | grep TCPA
> -  [    0.000000] ACPI: TCPA 0x0000000003FFD191C 000032 (v02 BOCHS  \
> -      BXPCTCPA 0000001 BXPC 00000001)
> +  [    0.012560] ACPI: TPM2 0x000000000BFFD1900 00004C (v04 BOCHS  \
> +      BXPC     0000001 BXPC 00000001)
>
>    # ls -l /dev/tpm*
> -  crw-------. 1 root root 10, 224 Jul 11 10:11 /dev/tpm0
> +  crw-rw----. 1 tss root  10,   224 Sep  6 12:36 /dev/tpm0
> +  crw-rw----. 1 tss rss  253, 65536 Sep  6 12:36 /dev/tpmrm0
>
> -  # find /sys/devices/ | grep pcrs$ | xargs cat
> -  PCR-00: 35 4E 3B CE 23 9F 38 59 ...
> +  Starting with Linux 5.12 there are PCR entries for TPM 2 in sysfs:
> +  # find /sys/devices/ -type f | grep pcr-sha
> +  ...
> +  /sys/devices/LNXSYSTEM:00/LNXSYBUS:00/MSFT0101:00/tpm/tpm0/pcr-sha256/=
1
> +  ...
> +  /sys/devices/LNXSYSTEM:00/LNXSYBUS:00/MSFT0101:00/tpm/tpm0/pcr-sha256/=
9
>    ...
> -  PCR-23: 00 00 00 00 00 00 00 00 ...
>
>  The QEMU TPM emulator device
>  ----------------------------
> @@ -304,6 +305,7 @@ a socket interface. They do not need to be run as roo=
t.
>    mkdir /tmp/mytpm1
>    swtpm socket --tpmstate dir=3D/tmp/mytpm1 \
>      --ctrl type=3Dunixio,path=3D/tmp/mytpm1/swtpm-sock \
> +    --tpm2 \
>      --log level=3D20
>
>  Command line to start QEMU with the TPM emulator device communicating
> @@ -365,19 +367,20 @@ available as a module:
>  .. code-block:: console
>
>    # dmesg | grep -i tpm
> -  [    0.711310] tpm_tis 00:06: 1.2 TPM (device=3Did 0x1, rev-id 1)
> -
> -  # dmesg | grep TCPA
> -  [    0.000000] ACPI: TCPA 0x0000000003FFD191C 000032 (v02 BOCHS  \
> -      BXPCTCPA 0000001 BXPC 00000001)
> +  [    0.012560] ACPI: TPM2 0x000000000BFFD1900 00004C (v04 BOCHS  \
> +      BXPC     0000001 BXPC 00000001)
>
>    # ls -l /dev/tpm*
> -  crw-------. 1 root root 10, 224 Jul 11 10:11 /dev/tpm0
> +  crw-rw----. 1 tss root  10,   224 Sep  6 12:36 /dev/tpm0
> +  crw-rw----. 1 tss rss  253, 65536 Sep  6 12:36 /dev/tpmrm0
>
> -  # find /sys/devices/ | grep pcrs$ | xargs cat
> -  PCR-00: 35 4E 3B CE 23 9F 38 59 ...
> +  Starting with Linux 5.12 there are PCR entries for TPM 2 in sysfs:
> +  # find /sys/devices/ -type f | grep pcr-sha
> +  ...
> +  /sys/devices/LNXSYSTEM:00/LNXSYBUS:00/MSFT0101:00/tpm/tpm0/pcr-sha256/=
1
> +  ...
> +  /sys/devices/LNXSYSTEM:00/LNXSYBUS:00/MSFT0101:00/tpm/tpm0/pcr-sha256/=
9
>    ...
> -  PCR-23: 00 00 00 00 00 00 00 00 ...
>
>  Migration with the TPM emulator
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> @@ -398,7 +401,8 @@ In a 1st terminal start an instance of a swtpm using =
the following command:
>    mkdir /tmp/mytpm1
>    swtpm socket --tpmstate dir=3D/tmp/mytpm1 \
>      --ctrl type=3Dunixio,path=3D/tmp/mytpm1/swtpm-sock \
> -    --log level=3D20 --tpm2
> +    --tpm2 \
> +    --log level=3D20
>
>  In a 2nd terminal start the VM:
>
> --
> 2.37.2
>


