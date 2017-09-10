Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dr5bi-00089f-UD
	for mharc-qemu-trivial@gnu.org; Sun, 10 Sep 2017 13:01:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51232)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dr5bg-00089N-1E
	for qemu-trivial@nongnu.org; Sun, 10 Sep 2017 13:01:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dr5bc-00036z-W3
	for qemu-trivial@nongnu.org; Sun, 10 Sep 2017 13:01:16 -0400
Received: from mail-qt0-x229.google.com ([2607:f8b0:400d:c0d::229]:35037)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dr5bc-00036Q-Qt; Sun, 10 Sep 2017 13:01:12 -0400
Received: by mail-qt0-x229.google.com with SMTP id k2so15212898qte.2;
	Sun, 10 Sep 2017 10:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=vKsLWS+h0QnAkhe0yKYoocPVjAbCx4xX/m9vDv/erKk=;
	b=CreSl/inYMlv+g6dWx8YffZ67KfWt+TbUb6sSt39obZkweRlO6FNxUoedY8jVugbdD
	4CtwvBLjd3zFnwZLJ5apwSPnNzpohVHrVDyiwvwsl09JkGCEu477udX7+cB4S664OquX
	p/nK/zg5rmllDwXRrnNTObZIBjX+KWLA7r8phvGF0NOABX173YlEsYHvMCNSkS57scCy
	waD9Tn+pm6k45TiyyipIF1TjK1TpMXry2vBii6FalcbGdXhr0iCO3FzbT3Zarx3K8C4i
	9eV6nvLVAqdQxpxV38eXahJdwDwIsGMWBaEG404J0LUXAw1rl5Iz6pz2XRCs49bFcjK6
	Qh2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=vKsLWS+h0QnAkhe0yKYoocPVjAbCx4xX/m9vDv/erKk=;
	b=n2CLLwbmHqRi8FZ4JMfAEdziIegPQiFmZVpMFQjSKYSC0vfrjBb1jOu0une9T7M0or
	IJ8RdWHzFL75ukebjdUelg350BJE/ZlRzNHcXsuRvTbldD2kodfVvq4dRahrgVPMNDwJ
	vxh1teYWdgBCh14YI1NszL9fglke+Gj/DkUjRD4GI9tr1Ookqnf+1ckZfrM88xd7YIrL
	gMacUCqwdXJQQY+e4eHJHgqNOrVzIdB5SUNvQwu2vC3ugha10aUtiyKo4ELI3WV5YTPz
	YsdCKLLwdgHUMeV+NGA5jDxjbr+FYGDmXA+guXtPDzPJLC3ZLEy9SEFWRrDTD/ItYKNd
	6ZqA==
X-Gm-Message-State: AHPjjUjhOJwjywTvEzNsDRAK/fScIakRl5C5t5EkXi7q8qxOZlOl9j86
	nhMhFE6lWNpLWg==
X-Google-Smtp-Source: AOwi7QCa47uI4EbLgw1Tf5MJE7/DVQGFAmcEwy7ySGSbBVNFrv4vw/YB2KONcdsQk5UVMctNWtYEvw==
X-Received: by 10.200.45.73 with SMTP id o9mr12271668qta.292.1505062870957;
	Sun, 10 Sep 2017 10:01:10 -0700 (PDT)
Received: from [192.168.1.10] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	z50sm5145011qta.19.2017.09.10.10.01.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Sep 2017 10:01:09 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, 
	QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	Laurent Vivier <lvivier@redhat.com>, 
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
References: <1504100343-26607-1-git-send-email-thuth@redhat.com>
	<b98a4c56-f386-f827-5aa7-9a00e6fdf790@amsat.org>
	<CAFEAcA8O5T5cX8XqBVZqXLt5MPvF7qEcJK8Az2GBei07P0dZGQ@mail.gmail.com>
	<20170910032413.GB2735@umbus.fritz.box>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b6346abb-2dc8-1c0a-0a7e-870cb7402b9b@amsat.org>
Date: Sun, 10 Sep 2017 14:01:05 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170910032413.GB2735@umbus.fritz.box>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::229
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.11] hw/misc/ivshmem:
 Fix ivshmem_recv_msg() to also work on big endian systems
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
X-List-Received-Date: Sun, 10 Sep 2017 17:01:16 -0000

On 09/10/2017 12:24 AM, David Gibson wrote:
> I'm not what makes sense for staging this fix.  I could take it
> through my tree, but it's not an obvious match, since this isn't
> really related to ppc at all.

Paolo's misc? :D

