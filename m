Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TbuzA-0002iy-Gb
	for mharc-qemu-trivial@gnu.org; Fri, 23 Nov 2012 10:16:08 -0500
Received: from eggs.gnu.org ([208.118.235.92]:58637)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1Tbuz4-0002SM-Ra
	for qemu-trivial@nongnu.org; Fri, 23 Nov 2012 10:16:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1Tbuyy-0005KK-H1
	for qemu-trivial@nongnu.org; Fri, 23 Nov 2012 10:16:02 -0500
Received: from mail-ie0-f173.google.com ([209.85.223.173]:58910)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1Tbuyn-0005J2-Ph; Fri, 23 Nov 2012 10:15:45 -0500
Received: by mail-ie0-f173.google.com with SMTP id e13so3215191iej.4
	for <multiple recipients>; Fri, 23 Nov 2012 07:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=SPyO5u31rJKhSMcm2+QFpRxo8FvV1+wjgiaGyzcs7qc=;
	b=V0SYlXFx2JAkiH1vm4QeOnJ4KoLlqAhogyhUcKlsZONx+EKptlcb8C7iG0H1jiaV9h
	lVip2ob2X1yzcFRFBlQZnKMO3JjaHOzM+UbFbJyobZvsY9cOF46qG6okNLJaqdEi123g
	F2nL/CEbtGyO+EEei3mzMiiG6l8WynavQed/iR0xuV7zpd2DlnL2++5qcww9OL63IvBX
	bzP5ZNMdyzWvcd/byq60c4Yf6AgFB+wWI2JH3fxIpkwmjXUJUwk2D8elZjnzFjVYCk/z
	IO0qxQWyGxkeuCBn6cfEUK8E5HpSYN2q47zIsIieVrfZKKgyP7g/XQzSrnAVDkpet7JX
	3QAw==
Received: by 10.42.54.211 with SMTP id s19mr3353018icg.34.1353683745416;
	Fri, 23 Nov 2012 07:15:45 -0800 (PST)
Received: from yakj.usersys.redhat.com (93-34-169-1.ip50.fastwebnet.it.
	[93.34.169.1])
	by mx.google.com with ESMTPS id vq4sm4428786igb.10.2012.11.23.07.15.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Nov 2012 07:15:44 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <50AF931B.8080707@redhat.com>
Date: Fri, 23 Nov 2012 16:15:39 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121016 Thunderbird/16.0.1
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1353683570-30525-1-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1353683570-30525-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.223.173
Cc: qemu-trivial@nongnu.org, patches@linaro.org, qemu-devel@nongnu.org,
	Yurij Popov <oss@djphoenix.ru>
Subject: Re: [Qemu-trivial] [PATCH] qemu-timer: Don't use RDTSC on 386s and
	486s
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Nov 2012 15:16:07 -0000

Il 23/11/2012 16:12, Peter Maydell ha scritto:
> Adjust the conditional which guards the implementation of
> cpu_get_real_ticks() via RDTSC, so that we don't try to use it
> on x86 CPUs which don't implement RDTSC.  Instead we will fall
> back to the no-cycle-counter-available default implementation.
> 
> Reported-by: Yurij Popov <oss@djphoenix.ru>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  qemu-timer.h |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/qemu-timer.h b/qemu-timer.h
> index da7e97c..e35f163 100644
> --- a/qemu-timer.h
> +++ b/qemu-timer.h
> @@ -169,7 +169,7 @@ static inline int64_t cpu_get_real_ticks(void)
>      return retval;
>  }
>  
> -#elif defined(__i386__)
> +#elif defined(__i586__)
>  
>  static inline int64_t cpu_get_real_ticks(void)
>  {
> 

You should at least test __i686__ too:

$ gcc -m32 -dM -E -x c /dev/null |grep __i
#define __i686 1
#define __i686__ 1
#define __i386 1
#define __i386__ 1

Paolo

