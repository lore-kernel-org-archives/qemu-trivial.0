Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iT2lv-00048g-WB
	for mharc-qemu-trivial@gnu.org; Fri, 08 Nov 2019 06:49:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36620)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iT2lt-00046a-4D
 for qemu-trivial@nongnu.org; Fri, 08 Nov 2019 06:49:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iT2lr-0000hC-Hx
 for qemu-trivial@nongnu.org; Fri, 08 Nov 2019 06:49:44 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58192)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iT2lr-0000g5-9r
 for qemu-trivial@nongnu.org; Fri, 08 Nov 2019 06:49:43 -0500
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D5F564E832
 for <qemu-trivial@nongnu.org>; Fri,  8 Nov 2019 11:49:41 +0000 (UTC)
Received: by mail-wr1-f70.google.com with SMTP id l3so3031869wrx.21
 for <qemu-trivial@nongnu.org>; Fri, 08 Nov 2019 03:49:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Khm/MucwVUPrqO0140sB3/az0X7po32ryKnCUVR/JyM=;
 b=Drg8nCOg2lZVTeicChtClChe9ru/Tp37H7+xNdrlkLoU0lUMlqe2zrNHh/oz7Xt3c/
 8MFoXwUpnRBIHS+cForq07OfffhZQxnk2ku6zzrMSxvf0jK9xbz+sV30ewu1THJ8TS4W
 ++W3w41F7C575+6VA5aEP6P7Kf1xwoLGrw+LdVyXetFvlGxiRyO0VTzVE/YEYFnB8+A3
 4mcO4IlnAScoL+j2vtk8V1v22kfj2uAglniphh6o//EzjgO7f8dd44XbECUhevZ7I6h+
 iiSVBWj3LDCeuU5dOS9Y4b0EU+Emen/naGbObh2uticgF5+FE7SP+zQq/njw7Ud5XtT8
 YqSQ==
X-Gm-Message-State: APjAAAXYf9Ig8bu7KRtnr+yVFY2Qq1cancw1tDk45EBbUvWBCYzClc8K
 AMVZ5A7XFHnd4SNvA2n/VjyQFxBJFtdnT78rEWESaVxgv8AwJVY9OMsJmng9s0ztxZ42OGe0Y3Y
 rEGRpunz6u13qf7tXjA==
X-Received: by 2002:adf:e449:: with SMTP id t9mr8306472wrm.196.1573213780230; 
 Fri, 08 Nov 2019 03:49:40 -0800 (PST)
X-Google-Smtp-Source: APXvYqx8EZIXX6gx0b6vo4liWlAwVnDbj2DNQ8acDXIjIw3Ae8RvjCgefZL1VWdvLmrynPO2JWlPFw==
X-Received: by 2002:adf:e449:: with SMTP id t9mr8306458wrm.196.1573213780036; 
 Fri, 08 Nov 2019 03:49:40 -0800 (PST)
Received: from [192.168.1.33] (62.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.62])
 by smtp.gmail.com with ESMTPSA id v10sm8040484wmg.48.2019.11.08.03.49.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Nov 2019 03:49:39 -0800 (PST)
Subject: Re: [PATCH v2 1/2] configure: Only decompress EDK2 blobs for X86/ARM
 targets
To: qemu-devel@nongnu.org, Laszlo Ersek <lersek@redhat.com>
Cc: "Daniel P . Berrange" <berrange@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org
References: <20191108114531.21518-1-philmd@redhat.com>
 <20191108114531.21518-2-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <97a31e52-8961-8fd5-60bc-be2eb62a942f@redhat.com>
Date: Fri, 8 Nov 2019 12:49:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191108114531.21518-2-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
X-List-Received-Date: Fri, 08 Nov 2019 11:49:46 -0000

On 11/8/19 12:45 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> The EDK2 firmware blobs only target the X86/ARM architectures.
> Define the DECOMPRESS_EDK2_BLOBS variable and only decompress
> the blobs when the variable exists.
>=20
> Fixes: 536d2173b2b
> Suggested-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> v2: new
> ---
>   Makefile  |  2 ++
>   configure | 13 +++++++++++++

Oops sorry, new workspace, I hadn't installed scripts/git.orderfile.

>   2 files changed, 15 insertions(+)
>=20
> diff --git a/Makefile b/Makefile
> index aa9d1a42aa..3430eca532 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -480,7 +480,9 @@ $(SOFTMMU_ALL_RULES): $(chardev-obj-y)
>   $(SOFTMMU_ALL_RULES): $(crypto-obj-y)
>   $(SOFTMMU_ALL_RULES): $(io-obj-y)
>   $(SOFTMMU_ALL_RULES): config-all-devices.mak
> +ifdef DECOMPRESS_EDK2_BLOBS
>   $(SOFTMMU_ALL_RULES): $(edk2-decompressed)
> +endif
>  =20
>   .PHONY: $(TARGET_DIRS_RULES)
>   # The $(TARGET_DIRS_RULES) are of the form SUBDIR/GOAL, so that
> diff --git a/configure b/configure
> index efe165edf9..9b322284c3 100755
> --- a/configure
> +++ b/configure
> @@ -427,6 +427,7 @@ softmmu=3D"yes"
>   linux_user=3D"no"
>   bsd_user=3D"no"
>   blobs=3D"yes"
> +edk2_blobs=3D"no"
>   pkgversion=3D""
>   pie=3D""
>   qom_cast_debug=3D"yes"
> @@ -2146,6 +2147,14 @@ case " $target_list " in
>     ;;
>   esac
>  =20
> +for target in $target_list; do
> +  case "$target" in
> +    arm-softmmu | aarch64-softmmu | i386-softmmu | x86_64-softmmu)
> +      edk2_blobs=3D"yes"
> +      ;;
> +  esac
> +done
> +
>   feature_not_found() {
>     feature=3D$1
>     remedy=3D$2
> @@ -7526,6 +7535,10 @@ if test "$libudev" !=3D "no"; then
>       echo "LIBUDEV_LIBS=3D$libudev_libs" >> $config_host_mak
>   fi
>  =20
> +if test "$edk2_blobs" =3D "yes" ; then
> +  echo "DECOMPRESS_EDK2_BLOBS=3Dy" >> $config_host_mak
> +fi
> +
>   # use included Linux headers
>   if test "$linux" =3D "yes" ; then
>     mkdir -p linux-headers
>=20

