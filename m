Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dvSNA-0008GR-4a
	for mharc-qemu-trivial@gnu.org; Fri, 22 Sep 2017 14:08:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49525)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvSN7-0008De-F0
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 14:08:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvSN6-0002Bx-Fk
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 14:08:17 -0400
Received: from mail-qt0-x22d.google.com ([2607:f8b0:400d:c0d::22d]:51285)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvSN0-00029X-5j; Fri, 22 Sep 2017 14:08:10 -0400
Received: by mail-qt0-x22d.google.com with SMTP id q4so1859298qtq.8;
	Fri, 22 Sep 2017 11:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=buf8XkEjo4bJvr4sTW/j5c+A0luNS/qCa0pw4eINE9Q=;
	b=kPeheBZn/32lZOvFmYNUpmKzvTywGzJjQ6/cowi0k2DwfQmC728hov8gRMW6UrqGH3
	/7GGPoOy81SB+s5yOVV2whc7G6oJCoZc/1HdTMhtuiBfKNrtVI8vTI1bgddSR9p4lF5D
	+hAWOUYJb6Citm5dTh1qCqJrS8oqu+YVMEGuWmikRyoGCW3gn/BmayPNlG9EH504hJMb
	SkAqLiU0vyOarNGuS+ux2dxL4EdLd7LrtYDR/RocV2PHb/T90lUpASe1U462M5V/DblT
	Y3ouRhCFWucuBSNe+RjGL1Gq/WhjvSUhrkpQY4X07fmyqs8xozHbpQq1D9Oby8uvZ/6I
	D6gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=buf8XkEjo4bJvr4sTW/j5c+A0luNS/qCa0pw4eINE9Q=;
	b=BMqc0IKSs8Wbvx2EK6QClOEUpVA+Thd2H+p9tjnFpT1/3iS+5wmeHa4cIlhmyak7sS
	hewpgPXUH+Hl/5i+ItgjLhsG07lbWDm0iyxSNWMmeoK3ZH5qUb2Z43a9e0SqLlqoxs8X
	Db89VVaZRgNBuPPS/sTue9tLTGAdBv5djTP/QGMWatAAgw/nW3FOtHyqAxILscXKWki6
	hWBNCI6GPsUPTPTSfrs3FVVMyip5kVPWl5sdX1UcNUPLhuhbZp3/R7SNShnhrBWw86LL
	BZUn3j5GSARwGBjSYrtQaFDhc4faCSGc+rixgxnduHiJAhekDBKDhBHJ/DRxWim0yLpP
	V92Q==
X-Gm-Message-State: AHPjjUikcl8jRYIK5J/1FSYQ7GPMuEhWt2PHxvoQnQNhcoK9fU8/Jjey
	QL4mvbQ6tUKF9zJe/Jq5gg3wHUQ/PGU=
X-Google-Smtp-Source: AOwi7QBqShh9eqKibTamFvorBG4eZSe7HIP+T1NVrrygR3Kc5PD0HS8QETGbTZMKpycICDxD19dT3Q==
X-Received: by 10.237.35.238 with SMTP id k43mr38481qtc.214.1506103689507;
	Fri, 22 Sep 2017 11:08:09 -0700 (PDT)
Received: from [192.168.1.10] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id p23sm334441qtg.2.2017.09.22.11.08.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Sep 2017 11:08:08 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
	Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, 
	Aurelien Jarno <aurelien@aurel32.net>,
	Yongbok Kim <yongbok.kim@imgtec.com>, Richard Henderson <rth@twiddle.net>,
	David Gibson <david@gibson.dropbear.id.au>,
	Alexander Graf <agraf@suse.de>, 
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	"Eduardo Otubo\"" <otubo@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
References: <20170922154014.29350-1-f4bug@amsat.org>
	<20170922160111.31885-1-f4bug@amsat.org>
	<a6bedac0-0e58-8709-f549-a602914c9077@reactos.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <400dde93-d110-ee49-b2a0-76ea633b4abe@amsat.org>
Date: Fri, 22 Sep 2017 15:08:03 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <a6bedac0-0e58-8709-f549-a602914c9077@reactos.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22d
Subject: Re: [Qemu-trivial] [PATCH 23/34] hw/dma/i8257: rename DMA_init() to
 i8257_dma_init()
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
X-List-Received-Date: Fri, 22 Sep 2017 18:08:18 -0000

On 09/22/2017 02:43 PM, Hervé Poussineau wrote:
> Le 22/09/2017 à 18:01, Philippe Mathieu-Daudé a écrit :
[...]
>> +void i8257_dma_init(ISABus *bus, int high_page_enable);
>> +
> 
> As you're changing the DMA_init prototype, can you add an Error **errp 
> parameter, and pass &error_abort in each caller?
> 
> See http://lists.gnu.org/archive/html/qemu-devel/2017-09/msg00262.html 
> for more details

If Eduardo doesn't have a patch ready I can do it.

