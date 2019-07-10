Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hl8sB-0002YX-SR
	for mharc-qemu-trivial@gnu.org; Wed, 10 Jul 2019 05:26:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48321)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hl8s8-0002US-NY
 for qemu-trivial@nongnu.org; Wed, 10 Jul 2019 05:26:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hl8s2-0002rp-Tz
 for qemu-trivial@nongnu.org; Wed, 10 Jul 2019 05:26:42 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:37544)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hl8s2-0002nZ-NH
 for qemu-trivial@nongnu.org; Wed, 10 Jul 2019 05:26:38 -0400
Received: by mail-wm1-f65.google.com with SMTP id f17so1483735wme.2
 for <qemu-trivial@nongnu.org>; Wed, 10 Jul 2019 02:26:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dNd9IqHwvKh2lczcoe8k89Usd+GyWaShWWIlbeyQ7Rw=;
 b=M6kk8QL8MV/q/SlwiC4d2Y7eu8KibeN6+G0Z4094SfthpKcNQ6zzMCeA1kA885hvLP
 /ZUnRt/QWsExKfV3sY8Jsl6NBbZKNXLyDv0NEMLalmbdR5BO030SWfDDpBiv5mC7sllP
 oa0Bj7ThZPt4MgG1v69M2ickEoGfWiaoWMVqV+uNypotnVdq3cZ/7QCHzQnF6YR3C1zC
 Q1xLZiQKZas7JnducNQIqB8NSUSj7F79lTgqiaZ9Hc23xl8a69xlAbtTePJWILE55yil
 tmlKxCfYt8CluqSsUwcpa1SKpKtFtZtooRwOXiPB+AYAbNaBrttC7QC9NsvJk/aWATua
 +7ug==
X-Gm-Message-State: APjAAAWq8EBqAXCANgGJW/K1WcvnvhzOv2yiu2lndMSp0U97+T9TrIio
 4KzYRBw4AvRNOCrOWc2M2Zd4xw==
X-Google-Smtp-Source: APXvYqyNfAy9jbFiScn1zBPjpr2zi04cdJTlGY9NJjOtYKEGmocacI233J9lF1to+N5JSRvD44665w==
X-Received: by 2002:a05:600c:218d:: with SMTP id
 e13mr4394626wme.29.1562750795008; 
 Wed, 10 Jul 2019 02:26:35 -0700 (PDT)
Received: from [10.32.224.100] (red-hat-inc.vlan560.asr1.mad1.gblx.net.
 [159.63.51.90])
 by smtp.gmail.com with ESMTPSA id v18sm1689965wrs.80.2019.07.10.02.26.34
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Jul 2019 02:26:34 -0700 (PDT)
To: =?UTF-8?Q?Carlo_Marcelo_Arenas_Bel=c3=b3n?= <carenas@gmail.com>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, rth@twiddle.net
References: <20190709234330.89699-1-carenas@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <dee323d7-ac1c-2aee-915b-2889ea72e3fe@redhat.com>
Date: Wed, 10 Jul 2019 11:26:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190709234330.89699-1-carenas@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.65
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: remove obsoleted
 $sparc_cpu variable
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
X-List-Received-Date: Wed, 10 Jul 2019 09:26:45 -0000

On 7/10/19 1:43 AM, Carlo Marcelo Arenas Belón wrote:
> 9b9c37c364 ("tcg-sparc: Assume v9 cpu always, i.e. force v8plus in
> 32-bit mode.", 2012-09-21) removed the need for this variable and
> most of the references to it, but this one.
> 
> Remove defunct code, no effect or functionality change expected.
> 
> Signed-off-by: Carlo Marcelo Arenas Belón <carenas@gmail.com>
> ---
>  configure | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/configure b/configure
> index 4983c8b533..7518f201ab 100755
> --- a/configure
> +++ b/configure
> @@ -6378,9 +6378,6 @@ if test "$vnc" = "yes" ; then
>      echo "VNC JPEG support  $vnc_jpeg"
>      echo "VNC PNG support   $vnc_png"
>  fi
> -if test -n "$sparc_cpu"; then
> -    echo "Target Sparc Arch $sparc_cpu"
> -fi
>  echo "xen support       $xen"
>  if test "$xen" = "yes" ; then
>    echo "xen ctrl version  $xen_ctrl_version"
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>

