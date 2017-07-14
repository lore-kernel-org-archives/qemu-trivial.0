Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dVsiS-0005M4-Mu
	for mharc-qemu-trivial@gnu.org; Fri, 14 Jul 2017 01:00:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58641)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dVsiP-0005Lw-VN
	for qemu-trivial@nongnu.org; Fri, 14 Jul 2017 01:00:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dVsiL-0006hl-U1
	for qemu-trivial@nongnu.org; Fri, 14 Jul 2017 01:00:34 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:36536)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dVsiL-0006hO-O0; Fri, 14 Jul 2017 01:00:29 -0400
Received: by mail-qk0-x244.google.com with SMTP id v17so8544887qka.3;
	Thu, 13 Jul 2017 22:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=hzliEMeQriTB9/5IDY2+0y0iFPfqsEp7VV+OBP5/Yso=;
	b=kfp/5fxw3NhHi0wySxdVzZ+uG6kaTMTzpRQybJcpYC/NqaIgRq2RINmiGaFm6ZQJzW
	3CLj+3K7sjp+wXvihFH1zdIWlB6YwuFJzLDpJmMu6JUgoT/yk+b2iPvEL5pMR0k7AVNN
	AE2E5Q2YwUTmL4WQ5dn86Par2KzlDZj+tcTmXFOvUdraA/IFNyZLLXdPnC6Co+jXkFpc
	BKbiZFn5EjlAwXJiEWw9ip5ju/A5wvkkEFpBdcyT3clRKiYGQk5pa8r4nssqGZxTVh8y
	2Pap2tVT457ebNVF7gNtt4YQfQHKlyDC1jvXzpD9nt4zDfyUMKhb5VQOKxWU0+3kA6cD
	rjSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=hzliEMeQriTB9/5IDY2+0y0iFPfqsEp7VV+OBP5/Yso=;
	b=UrnyWjuhwv9vWuDc3+D+7qoE83xVcylppPNwmo10wZX8uAQ+e7283LPfC8KnIq8gEV
	BHbrlEMWIhkAL1hQ8mlT4uLkn+Oxl+4GeVQejO+SET0PjS5r9575s0Ua62xFvnVyPUN1
	I/GAZy7+Zov3G14m4TCzO+kfJns/8nva5/KQYE9P4k93xD0nyQ6nNDMeoOUMxRHSJWlW
	f2hYDXX4siXgL935uPXj5d1m6Ioa5LFJZmoGuCFkDwxhtgdeUhZCVb3HKeySp0rL9SGZ
	LoTiYcu8pcNIEEeyB0mDCbvVcBXVGGcqjtH3cVLMopV/JrWiqFhL0oyBRssr01ymMPkJ
	W2vA==
X-Gm-Message-State: AIVw113yIEytzqDVIffXMv30SV4lRyXWFPMMgHc5W731Utd+OameK3HS
	Ivy5g63yeBSthbJs8GQ=
X-Received: by 10.55.105.130 with SMTP id e124mr8781942qkc.117.1500008428980; 
	Thu, 13 Jul 2017 22:00:28 -0700 (PDT)
Received: from [192.168.1.240] ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	h68sm5365390qke.48.2017.07.13.22.00.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Jul 2017 22:00:28 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: patches@linaro.org
References: <1499958932-23839-1-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <06fb1fbf-3aa0-435e-df4a-e1e9e47f8dd9@amsat.org>
Date: Fri, 14 Jul 2017 02:00:25 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1499958932-23839-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: Re: [Qemu-trivial] [PATCH] configure: Never use 'uname' to identify
 target OS
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
X-List-Received-Date: Fri, 14 Jul 2017 05:00:35 -0000

On 07/13/2017 12:15 PM, Peter Maydell wrote:
> For a very long time we have used 'uname -s' as our fallback if
> we don't identify the target OS using a compiler #define. This
> obviously doesn't work for cross-compilation, and we've had
> a comment suggesting we fix this in configure for a long time.
> Since we now have an exhaustive list of which OSes we can run
> on (thanks to commit 898be3e0415 making an unrecognized OS
> be a fatal error), we know which ones we're missing.
> 
> Add check_define tests for the remaining OSes we support.  The
> defines checked are based on ones we already use in the codebase for
> identifying the host OS (with the exception of GNU/kFreeBSD).
> We can now set bogus_os immediately rather than doing it later.
> 
> We leave the comment about uname being bad untouched, since
> there is still a use of it for the fallback for unrecognized
> host CPU type.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> 
> All of these OSes except OSX are on the "not actually supported"
> list, so I don't care very much if we break them.  I did sanity check
> FreeBSD and NetBSD which are the two most plausible ones to
> get back into supported status.
> 
>   configure | 26 ++++++++++++++++++--------
>   1 file changed, 18 insertions(+), 8 deletions(-)
> 
> diff --git a/configure b/configure
> index 5096cbc..d733a05 100755
> --- a/configure
> +++ b/configure
> @@ -536,8 +536,24 @@ elif check_define __sun__ ; then
>     targetos='SunOS'
>   elif check_define __HAIKU__ ; then
>     targetos='Haiku'
> +elif check_define __FreeBSD__ ; then
> +  targetos='FreeBSD'
> +elif check_define __FreeBSD_kernel__ && check_define __GLIBC__; then
> +  targetos='GNU/kFreeBSD'

My first thought was "this check should go _before_ FreeBSD" then 
verified, can sound odd but indeed GNU/kFreeBSD does not define __FreeBSD__.

> +elif check_define __DragonFly__ ; then
> +  targetos='DragonFly'
> +elif check_define __NetBSD__; then
> +  targetos='NetBSD'
> +elif check_define __APPLE__; then

I guess Mac OS 9 MPW crippled C compiler also defined this, but 
hopefully even Apple lost the last verbatim copy, so this assumption is 
pretty safe :)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> +  targetos='Darwin'
> +elif check_define _AIX; then
> +  targetos='AIX'
>   else
> -  targetos=$(uname -s)
> +  # This is a fatal error, but don't report it yet, because we
> +  # might be going to just print the --help text, or it might
> +  # be the result of a missing compiler.
> +  targetos='bogus'
> +  bogus_os='yes'
>   fi
>   
>   # Some host OSes need non-standard checks for which CPU to use.
> @@ -781,12 +797,6 @@ Linux)
>     QEMU_INCLUDES="-I\$(SRC_PATH)/linux-headers -I$(pwd)/linux-headers $QEMU_INCLUDES"
>     supported_os="yes"
>   ;;
> -*)
> -  # This is a fatal error, but don't report it yet, because we
> -  # might be going to just print the --help text, or it might
> -  # be the result of a missing compiler.
> -  bogus_os="yes"
> -;;
>   esac
>   
>   if [ "$bsd" = "yes" ] ; then
> @@ -1576,7 +1586,7 @@ if test "$bogus_os" = "yes"; then
>       # the compiler works (so the results of the check_defines we used
>       # to identify the OS are reliable), if we didn't recognize the
>       # host OS we should stop now.
> -    error_exit "Unrecognized host OS $targetos"
> +    error_exit "Unrecognized host OS (uname -s reports '$(uname -s)')"
>   fi
>   
>   gcc_flags="-Wold-style-declaration -Wold-style-definition -Wtype-limits"
> 

