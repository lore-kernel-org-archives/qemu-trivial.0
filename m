Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gr2Wv-0005R4-6Q
	for mharc-qemu-trivial@gnu.org; Tue, 05 Feb 2019 10:20:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57695)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gr2Wr-0005PG-GL
	for qemu-trivial@nongnu.org; Tue, 05 Feb 2019 10:20:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gr2Wl-0000Vs-Rp
	for qemu-trivial@nongnu.org; Tue, 05 Feb 2019 10:20:49 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:39010)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gr2Wg-0000IQ-4j
	for qemu-trivial@nongnu.org; Tue, 05 Feb 2019 10:20:44 -0500
Received: by mail-wm1-f65.google.com with SMTP id y8so4070753wmi.4
	for <qemu-trivial@nongnu.org>; Tue, 05 Feb 2019 07:20:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=IgCgUqfcIL6tykBJzVoB4xJMcpc/GQJwdkWjadvk2UQ=;
	b=LmRANy18xUaD4JjZFYfHb5ViHLDyV22qpKLZ2vTa4dZr/p7Mhk0EADFxxFi0F2xUEO
	qyC4f91Pyh+msNsaEIRvYIh55YRRm5FSjrs7RirQPYD7+9UxCVVH1VcVSrRTJ2s8y/uI
	yC10C/JsxsBRrWmVGVae0J4RtiJaXat4tMcoEUtA1GDK5jG1UJJDv4xMwpSntas+jXzR
	38bu9y/wJcZfpsxH2UQCg8PkDYvd5Q0oLv83mclVFLl0r419jclOELContLC56lFyVTx
	SBugWcND/vOYDzC+Gx4JK1dInpueyuokBQuFAg2jTohlHsnTA83h2Cxr1fXfNsdCn5k7
	KJhA==
X-Gm-Message-State: AHQUAuYydwmXq9Xu3Q9foONjV/Nh8ZXU4dYUi6LpTZdh2HP/mFq55GGj
	+i4j6fh9mDUvtGxrw8L1Uy3izA==
X-Google-Smtp-Source: AHgI3IaHYa2HsQvOrGAkhl9JPxRblLdZkgzjDzyk6rzRs/I3aErBj/UAGQfcWNqGo6L6/D7c0DOIiA==
X-Received: by 2002:a1c:1b4f:: with SMTP id b76mr4158250wmb.147.1549380027274; 
	Tue, 05 Feb 2019 07:20:27 -0800 (PST)
Received: from [192.168.1.103] (10.red-83-35-153.dynamicip.rima-tde.net.
	[83.35.153.10]) by smtp.gmail.com with ESMTPSA id
	t4sm18647902wrb.64.2019.02.05.07.20.26
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Feb 2019 07:20:26 -0800 (PST)
To: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
	Luc Michel <luc.michel@greensocs.com>
References: <1549371525-29899-1-git-send-email-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <91c92519-2eb4-a769-7bff-9cd7b8b5c919@redhat.com>
Date: Tue, 5 Feb 2019 16:20:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <1549371525-29899-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.65
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/cpu/cluster: Mark the
 cpu-cluster device with user_creatable = false
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
X-List-Received-Date: Tue, 05 Feb 2019 15:20:56 -0000

On 2/5/19 1:58 PM, Thomas Huth wrote:
> The device can not be instantiated by the user and QEMU currently
> aborts when you try to use it:
> 
> $ x86_64-softmmu/qemu-system-x86_64 -device cpu-cluster
> qemu-system-x86_64: hw/cpu/cluster.c:73: cpu_cluster_realize:
>  Assertion `cbdata.cpu_count > 0' failed.
> Aborted (core dumped)
> 
> Since this is an internal device only, mark it with user_creatable = false.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  hw/cpu/cluster.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/hw/cpu/cluster.c b/hw/cpu/cluster.c
> index 25f9070..6f5f037 100644
> --- a/hw/cpu/cluster.c
> +++ b/hw/cpu/cluster.c
> @@ -79,6 +79,9 @@ static void cpu_cluster_class_init(ObjectClass *klass, void *data)
>  
>      dc->props = cpu_cluster_properties;
>      dc->realize = cpu_cluster_realize;
> +
> +    /* This is not directly for users, CPU children must be attached by code */
> +    dc->user_creatable = false;
>  }
>  
>  static const TypeInfo cpu_cluster_type_info = {
> 

