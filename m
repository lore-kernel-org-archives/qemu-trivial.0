Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1grmSz-0004bF-97
	for mharc-qemu-trivial@gnu.org; Thu, 07 Feb 2019 11:23:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36406)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1grmSw-0004Y8-1c
	for qemu-trivial@nongnu.org; Thu, 07 Feb 2019 11:23:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1grmSs-0002W1-Qp
	for qemu-trivial@nongnu.org; Thu, 07 Feb 2019 11:23:52 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:36224)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1grmSr-0002Rk-By
	for qemu-trivial@nongnu.org; Thu, 07 Feb 2019 11:23:50 -0500
Received: by mail-wr1-f65.google.com with SMTP id z3so498124wrv.3
	for <qemu-trivial@nongnu.org>; Thu, 07 Feb 2019 08:23:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=kNbFW84B5HrzIYW02EhOLYGaG5VbuJ8YyToRBctbONs=;
	b=UkLo5Gecygwa8EvDwIZfGIelcXE2bgjPzJds02fH27KGgL1a6dhxMsI4d7vCn1OEyK
	yhcJG4Vr0/HpLkmBj2dob4Lgn/W+lq3WtlTII2tI5deiF2HBSZLSgTfBC8553rqukLVp
	LwSQRrQnw6zPD1cmnTXtUd0/fZce/pyVrnL7yrci1HGl+iyN/VMacdNc6AZKp02+tUnE
	46sNA5zyY2kQYspV6+fd6Nzl500pwxxTKcNPenv37e0KPTP+NxCjbS1+KSSng56Bc7K5
	YOoLj9K0pwOSGj2/zT9L4kv/c0PH5hSPr08PbL/DnC9erluvzwb+fdYXfOk90Mkh8mYj
	2CcA==
X-Gm-Message-State: AHQUAuawAsigBYH6+oe5lTsUAGvJY377mFRxjuHaHZ3KR7J0gIiq8lzR
	sHM2BsxwCWnWUc7QCwTzeW46b3pCSQk=
X-Google-Smtp-Source: AHgI3IZtiP/CuCRfcaCnbQuGn4UmeFrc+f1Ct4C/nb5hY8wQDIPLSRBxjiVZ+CN4JK+HtF/N78Te5w==
X-Received: by 2002:adf:90e5:: with SMTP id i92mr12355063wri.210.1549556622152;
	Thu, 07 Feb 2019 08:23:42 -0800 (PST)
Received: from [192.168.1.103] (10.red-83-35-153.dynamicip.rima-tde.net.
	[83.35.153.10]) by smtp.gmail.com with ESMTPSA id
	r200sm43995187wmb.36.2019.02.07.08.23.41
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Feb 2019 08:23:41 -0800 (PST)
To: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <1549545296-18903-1-git-send-email-thuth@redhat.com>
	<1549545296-18903-3-git-send-email-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <34660833-04f1-b3e8-6e78-8fc4665a1f11@redhat.com>
Date: Thu, 7 Feb 2019 17:23:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <1549545296-18903-3-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.65
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/2] qemu-options: Remove
 deprecated option -clock
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Feb 2019 16:23:55 -0000

On 2/7/19 2:14 PM, Thomas Huth wrote:
> The option is only a dummy since a long time. We've finally deprecated
> it in QEMU v3.0, so it's time to remove it now.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  qemu-deprecated.texi | 5 -----
>  qemu-options.hx      | 3 ---
>  vl.c                 | 6 ------
>  3 files changed, 14 deletions(-)
> 
> diff --git a/qemu-deprecated.texi b/qemu-deprecated.texi
> index 90e5860..fe90555 100644
> --- a/qemu-deprecated.texi
> +++ b/qemu-deprecated.texi
> @@ -37,11 +37,6 @@ would automatically enable USB support on the machine type.
>  If using the new syntax, USB support must be explicitly
>  enabled via the ``-machine usb=on'' argument.
>  
> -@subsection -clock (since 3.0.0)
> -
> -The @code{-clock} option is ignored since QEMU version 1.7.0. There is no
> -replacement since it is not needed anymore.
> -
>  @subsection -drive file=json:@{...@{'driver':'file'@}@} (since 3.0)
>  
>  The 'file' driver for drives is no longer appropriate for character or host
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 06ef1a7..77bd98e 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -3444,9 +3444,6 @@ Load the contents of @var{file} as an option ROM.
>  This option is useful to load things like EtherBoot.
>  ETEXI
>  
> -HXCOMM Silently ignored for compatibility
> -DEF("clock", HAS_ARG, QEMU_OPTION_clock, "", QEMU_ARCH_ALL)
> -
>  DEF("rtc", HAS_ARG, QEMU_OPTION_rtc, \
>      "-rtc [base=utc|localtime|<datetime>][,clock=host|rt|vm][,driftfix=none|slew]\n" \
>      "                set the RTC base and clock, enable drift fix for clock ticks (x86 only)\n",
> diff --git a/vl.c b/vl.c
> index 9e4dba7..90ff233 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -3735,12 +3735,6 @@ int main(int argc, char **argv, char **envp)
>              case QEMU_OPTION_old_param:
>                  old_param = 1;
>                  break;
> -            case QEMU_OPTION_clock:
> -                /* Clock options no longer exist.  Keep this option for
> -                 * backward compatibility.
> -                 */
> -                warn_report("This option is ignored and will be removed soon");
> -                break;
>              case QEMU_OPTION_rtc:
>                  opts = qemu_opts_parse_noisily(qemu_find_opts("rtc"), optarg,
>                                                 false);
> 

