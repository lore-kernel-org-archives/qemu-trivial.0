Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dVsA3-0000Wp-F0
	for mharc-qemu-trivial@gnu.org; Fri, 14 Jul 2017 00:25:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53294)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dVsA0-0000Uo-PK
	for qemu-trivial@nongnu.org; Fri, 14 Jul 2017 00:25:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dVs9x-0002pQ-LB
	for qemu-trivial@nongnu.org; Fri, 14 Jul 2017 00:25:00 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:35851)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dVs9x-0002pG-GZ; Fri, 14 Jul 2017 00:24:57 -0400
Received: by mail-qk0-x243.google.com with SMTP id v17so8482244qka.3;
	Thu, 13 Jul 2017 21:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=1MpibwpmqGy02VulG2ZRe1PAzWqcQkz39AAJfxuzA+I=;
	b=RB0Ollsg5wFKXucyTpo67kJNDWTfDMnpiPu5M1pi6mDYYOFJCkelXneDfxsNPiKN2e
	xm227t5cR6ZciXtGp8B7L0CWBgDG6ooXTeusx5KcJwDrWql7kknFrPqMhM4XUxRG7Sdt
	5a8rV0Okqn7sd930X2BMXE6XmymTv0tsMDYg6p/OShaYvyQTHEMJ7GpOa4yCXONmEFTf
	QduNOPIaOQuoavIt8C/QHJBegHZL8k3FCxUD9PNAezhUJpwa8a2Ec3HwLbC2UxpxHpBG
	zJd/CnAhN83cnZ/6f8LpU17A+2nJjAip9g0eW/9Tg5f/aBAcxjj2G+N3cpBfZdnpmpUC
	siDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=1MpibwpmqGy02VulG2ZRe1PAzWqcQkz39AAJfxuzA+I=;
	b=pOBnrESpPocjR68V8l7V3rPdoNzqQlaoBd9iUdR3/Hnw5vrZbAaJrnxlHxjKOxY3ph
	IjmStazR8x6ylpLmN079lcpYqRtY7wOtxLl/uRJSTjDhO1z888GadntE4D/IWbLa0zM6
	Mwu215IpKDCamrC58Qdl2QihxcV5Ayga3dneEY20Yz1rXnA2Ey+cdiFgkU4oJGI+cCYN
	ifiNUuko9blQMhxR07e7fwbYkZl1wURl0YE/dCwZIlnVVWHR/7kDmHUeszRTokVmxF+R
	DxFoWMek0KWMn1SQuFrhPFOx0FTJv9Mjof6AbL75OnF6YNRnBsMKjvYpXUmTtzzIErPi
	zg2g==
X-Gm-Message-State: AIVw1109G9RIh/CjgmSa1z8n9PLl3f5tkB0HIA+QgvyRSeHCZkUIUksv
	VOlGQMvOVCCYUA==
X-Received: by 10.55.92.130 with SMTP id q124mr8682033qkb.205.1500006296988;
	Thu, 13 Jul 2017 21:24:56 -0700 (PDT)
Received: from [192.168.1.240] ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	d14sm5878276qtc.58.2017.07.13.21.24.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Jul 2017 21:24:56 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org,
	"Michael S. Tsirkin" <mst@redhat.com>, Marcel Apfelbaum <marcel@redhat.com>
References: <20170713163219.9024-1-marcandre.lureau@redhat.com>
	<20170713163219.9024-22-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <913419f4-d2b9-be51-34ce-1644c48278fa@amsat.org>
Date: Fri, 14 Jul 2017 01:24:53 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170713163219.9024-22-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: Re: [Qemu-trivial] [PATCH v2 21/29] msix: use DIV_ROUND_UP
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
X-List-Received-Date: Fri, 14 Jul 2017 04:25:02 -0000

On 07/13/2017 01:32 PM, Marc-André Lureau wrote:
> I used the clang-tidy qemu-round check to generate the fix:
> https://github.com/elmarco/clang-tools-extra
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>   hw/pci/msix.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/pci/msix.c b/hw/pci/msix.c
> index 5078d3dd19..c944c02135 100644
> --- a/hw/pci/msix.c
> +++ b/hw/pci/msix.c
> @@ -438,7 +438,7 @@ void msix_save(PCIDevice *dev, QEMUFile *f)
>       }
>   
>       qemu_put_buffer(f, dev->msix_table, n * PCI_MSIX_ENTRY_SIZE);
> -    qemu_put_buffer(f, dev->msix_pba, (n + 7) / 8);
> +    qemu_put_buffer(f, dev->msix_pba, DIV_ROUND_UP(n, 8));
>   }
>   
>   /* Should be called after restoring the config space. */
> @@ -453,7 +453,7 @@ void msix_load(PCIDevice *dev, QEMUFile *f)
>   
>       msix_clear_all_vectors(dev);
>       qemu_get_buffer(f, dev->msix_table, n * PCI_MSIX_ENTRY_SIZE);
> -    qemu_get_buffer(f, dev->msix_pba, (n + 7) / 8);
> +    qemu_get_buffer(f, dev->msix_pba, DIV_ROUND_UP(n, 8));
>       msix_update_function_masked(dev);
>   
>       for (vector = 0; vector < n; vector++) {
> 

