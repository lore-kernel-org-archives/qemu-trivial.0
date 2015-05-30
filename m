Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yye6F-00062Q-IE
	for mharc-qemu-trivial@gnu.org; Sat, 30 May 2015 06:34:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53791)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1Yye6C-00061v-Ov
	for qemu-trivial@nongnu.org; Sat, 30 May 2015 06:34:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1Yye68-0004Jr-PR
	for qemu-trivial@nongnu.org; Sat, 30 May 2015 06:34:40 -0400
Received: from mail-wg0-x230.google.com ([2a00:1450:400c:c00::230]:33250)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1Yye68-0004Jl-Iu; Sat, 30 May 2015 06:34:36 -0400
Received: by wgez8 with SMTP id z8so80314268wge.0;
	Sat, 30 May 2015 03:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=j6RssYEzeRQHfz7NNstwzEhlilBXv6iScMAyqQ8gjbQ=;
	b=fOmZ2PwlDLS6q/28betYFIfohs0tK4XSAzQbq+yQQGtwA2Z3JsPrdVLdbeKulOnAca
	PsKEff0qO7G6VBUfDIi3DZy4SIC9vhTdrGTivY/H1P4YRPq98g9ADEmDoHnZiK1iAm4B
	kzbnC5fftmvHn7cScF1lIxhKz9swrYhxXcPq4xUc/vXmxR06h4RziVNRO1wbZIEdC3gh
	uz0IPEpZMA5gF4vEQ+K8SVATIyDnWedfRjwt/CiQ1jpx7MhN4FBxUXHdDT5scjM3I14p
	379JLVeNfmDy72VXbe1EzB6QrBnLzEw6CgBzh3owQYMT93pbHu3H/+bwsIIkriGjwc0N
	7+gA==
X-Received: by 10.180.91.76 with SMTP id cc12mr3891108wib.67.1432982075997;
	Sat, 30 May 2015 03:34:35 -0700 (PDT)
Received: from [192.168.10.165] (dynamic-adsl-94-39-199-114.clienti.tiscali.it.
	[94.39.199.114])
	by mx.google.com with ESMTPSA id fb3sm6977410wib.21.2015.05.30.03.34.33
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 30 May 2015 03:34:34 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <55699237.7070702@redhat.com>
Date: Sat, 30 May 2015 12:34:31 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Shannon Zhao <zhaoshenglong@huawei.com>, qemu-devel@nongnu.org
References: <1432814932-12608-1-git-send-email-zhaoshenglong@huawei.com>
	<1432814932-12608-30-git-send-email-zhaoshenglong@huawei.com>
In-Reply-To: <1432814932-12608-30-git-send-email-zhaoshenglong@huawei.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c00::230
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, mjt@tls.msk.ru,
	shannon.zhao@linaro.org
Subject: Re: [Qemu-trivial] [PATCH 29/29] hw/s390x/sclpcpu.c: Fix memory
 leak spotted by valgrind
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
X-List-Received-Date: Sat, 30 May 2015 10:34:41 -0000



On 28/05/2015 14:08, Shannon Zhao wrote:
> -static qemu_irq *irq_cpu_hotplug; /* Only used in this file */
> +static qemu_irq irq_cpu_hotplug; /* Only used in this file */
>  
>  #define EVENT_QUAL_CPU_CHANGE  1
>  
>  void raise_irq_cpu_hotplug(void)
>  {
> -    qemu_irq_raise(*irq_cpu_hotplug);
> +    qemu_irq_raise(irq_cpu_hotplug);
>  }
>  
>  static unsigned int send_mask(void)
> @@ -81,7 +81,10 @@ static void trigger_signal(void *opaque, int n, int level)
>  
>  static int irq_cpu_hotplug_init(SCLPEvent *event)
>  {
> -    irq_cpu_hotplug = qemu_allocate_irqs(trigger_signal, event, 1);
> +    qemu_irq irq = qemu_allocate_irq(trigger_signal, event, 0);
> +
> +    irq_cpu_hotplug = irq;
> +    qemu_free_irq(irq);
>      return 0;

This is wrong, you cannot free the IRQ after you have stored it in
irq_cpu_hotplug.

Paolo

