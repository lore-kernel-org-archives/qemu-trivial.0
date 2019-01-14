Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gj2II-0005Gh-5V
	for mharc-qemu-trivial@gnu.org; Mon, 14 Jan 2019 08:28:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39665)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gj2IE-0005Fd-Uu
	for qemu-trivial@nongnu.org; Mon, 14 Jan 2019 08:28:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gj2IE-0000PE-6q
	for qemu-trivial@nongnu.org; Mon, 14 Jan 2019 08:28:42 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:44323)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gj2IE-0000OR-0W
	for qemu-trivial@nongnu.org; Mon, 14 Jan 2019 08:28:42 -0500
Received: by mail-wr1-f68.google.com with SMTP id z5so22815237wrt.11
	for <qemu-trivial@nongnu.org>; Mon, 14 Jan 2019 05:28:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=xMxULuo1bMe0GeJNpjX/haCnd1Iz2CXrBvKIsocsBZI=;
	b=CkDezDONUBgWgczMpZ1PPqrEpxZP/iLSL9/RnmOZFudJTkM0agcc+pL01TY9xIm1Hm
	6LQhTrzxTpmY0QmOUqzCYtpyL7EzknRGGopCFneAEzPVD//gO4PRZvIGOaoBY6Rif7Wp
	/IlWflgoMfEUBNbAhIR1raQwF/1E16HHvOUDl4iWpFdZ2ubtr+QZzq/oDRC48KoCGO54
	LDJLHyNhwzFOUqLS/cXfjrWtWvAWqsrsKWwocMLgmWJjyWvGgTP/5U0W1uOBVTix/Np/
	XQoTcSZ91ck1fbj8Y4R28B2yifsSnmExrN/b/NgYSTogowNmxmeDSngXqZnCXH2V/qKi
	o0mQ==
X-Gm-Message-State: AJcUukdkBusDT1NalESVWgNQ3xlt0Z2E5Cq5+9LHZLv486syUekJkt6O
	maPIhVolkU0avuy2Lp2Oy5b91w==
X-Google-Smtp-Source: ALg8bN4VfDwlsRR0j6lS7L7C74idLR46CNBgaQBHDFxR1N8xSNTdNQJ1uFLYgHxurgDXVyi5WuelrQ==
X-Received: by 2002:a5d:42ce:: with SMTP id t14mr24763744wrr.51.1547472520910; 
	Mon, 14 Jan 2019 05:28:40 -0800 (PST)
Received: from [192.168.1.33] (110.red-83-51-161.dynamicip.rima-tde.net.
	[83.51.161.110]) by smtp.gmail.com with ESMTPSA id
	l15sm59845669wrw.4.2019.01.14.05.28.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Jan 2019 05:28:40 -0800 (PST)
To: Fei Li <lifei1214@126.com>, QEMU Trivial <qemu-trivial@nongnu.org>
Cc: qemu-devel@nongnu.org, Jiri Slaby <jslaby@suse.cz>, shirley17fei@gmail.com
References: <20190114131015.52967-1-lifei1214@126.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <ac0015a7-5fcf-f5f6-a1a5-6c3846459b8c@redhat.com>
Date: Mon, 14 Jan 2019 14:28:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20190114131015.52967-1-lifei1214@126.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.68
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] hw/misc/edu: add
 msi_uninit() for pci_edu_uninit()
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
X-List-Received-Date: Mon, 14 Jan 2019 13:28:44 -0000

Cc'ing qemu-trivial

On 1/14/19 2:10 PM, Fei Li wrote:
> From: Fei Li <shirley17fei@gmail.com>
> 
> Let's supplement the msi_uninit() when failing to realize
> the pci edu device.
> 
> Reported-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Fei Li <shirley17fei@gmail.com>
> Reviewed-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Reviewed-by: Peter Xu <peterx@redhat.com>
> ---
>  hw/misc/edu.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/misc/edu.c b/hw/misc/edu.c
> index cdcf550dd7..ceaf688bfb 100644
> --- a/hw/misc/edu.c
> +++ b/hw/misc/edu.c
> @@ -377,6 +377,7 @@ static void pci_edu_uninit(PCIDevice *pdev)
>      qemu_mutex_destroy(&edu->thr_mutex);
>  
>      timer_del(&edu->dma_timer);
> +    msi_uninit(pdev);
>  }
>  
>  static void edu_obj_uint64(Object *obj, Visitor *v, const char *name,
> 

