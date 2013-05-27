Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UgywJ-0004Go-3u
	for mharc-qemu-trivial@gnu.org; Mon, 27 May 2013 11:02:23 -0400
Received: from eggs.gnu.org ([208.118.235.92]:38183)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1UgywC-00049V-Mr
	for qemu-trivial@nongnu.org; Mon, 27 May 2013 11:02:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1Ugyw7-0005pj-98
	for qemu-trivial@nongnu.org; Mon, 27 May 2013 11:02:16 -0400
Received: from mail-qe0-f47.google.com ([209.85.128.47]:57226)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1Ugyw7-0005pe-56; Mon, 27 May 2013 11:02:11 -0400
Received: by mail-qe0-f47.google.com with SMTP id f6so2836650qej.6
	for <multiple recipients>; Mon, 27 May 2013 08:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=PACCcfyTUB/1rfIF0aqjA2bXVYHNayMBzCD/jvVNbF8=;
	b=jbfKEQAVhqLVpxzxCwTiu4c/J9HFQLMwP539UeZUx8SVUs84x4PBMdHbXExjBY99PM
	5GUSfNuZTyGwvrnXGqZATKwP39B0QANg2yoo1+r1YyAHvgTiaFGze/GclT2q5LDVu90g
	wKvYKZjILuA3h81+sWaagNr4VHyaPZ8kY+8MaB+xC9QyRCDhgA2LHE7wbom7UkRhnH2V
	4DbLkw+kJiF8hxnhYkv5yWvpjb6ICS9eLltchAN9y6ql32oMQcTizHJ73y5Av6qBP39H
	MpO8jLGklqhqIFnNmNCq5TPjGvWZ71wvcUg2JMjKs03hHShszSP8cgU3kOuNtS5UARkg
	wZiw==
X-Received: by 10.229.195.2 with SMTP id ea2mr7616572qcb.120.1369666930660;
	Mon, 27 May 2013 08:02:10 -0700 (PDT)
Received: from yakj.usersys.redhat.com
	(net-37-117-138-128.cust.dsl.vodafone.it. [37.117.138.128])
	by mx.google.com with ESMTPSA id j2sm6285515qer.1.2013.05.27.08.02.08
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 27 May 2013 08:02:09 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <51A37568.1060705@redhat.com>
Date: Mon, 27 May 2013 17:02:00 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Alexey Kardashevskiy <aik@ozlabs.ru>
References: <51A36976.80608@ozlabs.ru>
	<1369663979-25613-1-git-send-email-aik@ozlabs.ru>
In-Reply-To: <1369663979-25613-1-git-send-email-aik@ozlabs.ru>
X-Enigmail-Version: 1.5.1
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.47
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] qemu: fix out of tree cross compile
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
X-List-Received-Date: Mon, 27 May 2013 15:02:22 -0000

Il 27/05/2013 16:12, Alexey Kardashevskiy ha scritto:
> The symlink to platform linux headers is made in the build tree by
> the configure script but gcc is not told to look for them there.
> The patch fixes this.
> 
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
>  configure |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configure b/configure
> index 5ae7e4a..5ba691a 100755
> --- a/configure
> +++ b/configure
> @@ -547,7 +547,7 @@ Haiku)
>    if [ "$cpu" = "i386" -o "$cpu" = "x86_64" ] ; then
>      audio_possible_drivers="$audio_possible_drivers fmod"
>    fi
> -  QEMU_INCLUDES="-I\$(SRC_PATH)/linux-headers $QEMU_INCLUDES"
> +  QEMU_INCLUDES="-I$(pwd)/linux-headers $QEMU_INCLUDES"

You need to have both directories.  Files other than asm/*.h will be
found in the source path.

Paolo


