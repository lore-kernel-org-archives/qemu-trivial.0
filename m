Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZLA3w-0005cs-5e
	for mharc-qemu-trivial@gnu.org; Fri, 31 Jul 2015 09:09:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51426)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1ZLA3t-0005Zv-5n
	for qemu-trivial@nongnu.org; Fri, 31 Jul 2015 09:09:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1ZLA3n-0002f4-6K
	for qemu-trivial@nongnu.org; Fri, 31 Jul 2015 09:09:21 -0400
Received: from mail-wi0-x22b.google.com ([2a00:1450:400c:c05::22b]:37038)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1ZLA3m-0002eP-VG; Fri, 31 Jul 2015 09:09:15 -0400
Received: by wibud3 with SMTP id ud3so31397955wib.0;
	Fri, 31 Jul 2015 06:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=FAoddnK02ZdpLKvVSqtoZzCjXO7fFy/Tzqlh//4uw2M=;
	b=Dv7GKgwNv90GvyK255J1W8baj6nGx8QUHw2PssVRbOG8Zeo0pKpzvVvbts6XUL3loy
	r5m0PWf8gRqiq/n759MC9Xz6QFHGE97aPWy2Fdme9bqLpJiDQ4JVptFeoMHvgX1LRydV
	iZ/eVKbHH+oAu0mpHIOigTfCr/Y9Xh10ukdmyPUjRajfdSgzAIFaNArPt6Vk1xrFy3CN
	jKpbzOwVjkXG/JvXoivyYY+l/LsVmFaVMKfpIO0kR2FouP+WLV4tE+jvC0iTyvbz8+1z
	fE9pyePZbVijGh7VoToqnQ47mh4gdDeGVAP4ORZiUBF+rRX9j2KqeIuwOwEZj9TDrMK8
	vmwA==
X-Received: by 10.194.120.230 with SMTP id lf6mr6326714wjb.41.1438348154314;
	Fri, 31 Jul 2015 06:09:14 -0700 (PDT)
Received: from [192.168.10.165] (dynamic-adsl-94-39-151-29.clienti.tiscali.it.
	[94.39.151.29]) by smtp.googlemail.com with ESMTPSA id
	bq7sm7129152wjc.31.2015.07.31.06.09.12
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Jul 2015 06:09:13 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
To: "Daniel P. Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org
References: <1438345403-32467-1-git-send-email-berrange@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <55BB7377.2010109@redhat.com>
Date: Fri, 31 Jul 2015 15:09:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <1438345403-32467-1-git-send-email-berrange@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::22b
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] configure: only add CONFIG_RDMA to
	config-host.h once
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
X-List-Received-Date: Fri, 31 Jul 2015 13:09:22 -0000



On 31/07/2015 14:23, Daniel P. Berrange wrote:
> For unknown reasons (probably a git rebase merge mistake)
> 
>   commit 2da776db4846eadcb808598a5d3484d149773c05
>   Author: Michael R. Hines <mrhines@us.ibm.com>
>   Date:   Mon Jul 22 10:01:54 2013 -0400
> 
>     rdma: core logic
> 
> Adds CONFIG_RDMA to config-host.h twice, as can be seen
> in the generated file:
> 
>  $ grep CONFIG_RDMA config-host.h
>  #define CONFIG_RDMA 1
>  #define CONFIG_RDMA 1
> 
> Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
> ---
>  configure | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/configure b/configure
> index a14dc44..8f35400b 100755
> --- a/configure
> +++ b/configure
> @@ -5635,10 +5635,6 @@ if [ "$pixman" = "internal" ]; then
>    echo "config-host.h: subdir-pixman" >> $config_host_mak
>  fi
>  
> -if test "$rdma" = "yes" ; then
> -echo "CONFIG_RDMA=y" >> $config_host_mak
> -fi
> -
>  if [ "$dtc_internal" = "yes" ]; then
>    echo "config-host.h: subdir-dtc" >> $config_host_mak
>  fi
> 

Picked up for 2.5, thanks.

Paolo

