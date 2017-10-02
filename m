Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dz5pb-0004Ep-SB
	for mharc-qemu-trivial@gnu.org; Mon, 02 Oct 2017 14:52:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40653)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dz5pZ-0004DW-Q2
	for qemu-trivial@nongnu.org; Mon, 02 Oct 2017 14:52:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dz5pV-0000vH-PL
	for qemu-trivial@nongnu.org; Mon, 02 Oct 2017 14:52:41 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:43636)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dz5pV-0000uj-Jy; Mon, 02 Oct 2017 14:52:37 -0400
Received: by mail-qt0-x243.google.com with SMTP id a43so2774877qta.0;
	Mon, 02 Oct 2017 11:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=gILqjzPjlMPDiQHWVevBoetR/IF4SvWgkkuMt1/NWag=;
	b=CzLAug7pCbOINbb43JkRoSZRJO4Xg4O0l2q37kFS23bCrZdQKp+Q4JdtIoU1tTAcJo
	2qJSmTw6XvucgTaOdLF6st/GjqQ5T+1/kZbnA1NfI9tBtkovykXAge5uwrfafgV9ZGcb
	w+kGPV62NaT0sn58a7l8gRUEK+/Zw9GO1fUdzUDBNo1yZEGt6J4qq7PM1CD29Yotrk2e
	JJPIs/84PEgK7t/lOFsTTc9W1i4KeWumXuYqIr/L4BBOLvsJlGFM6CtUCHLkFnGCxB72
	CHx8hVmiDdU+zXiecWWJMT8MSVhJJ0vWPTS7S9QlNovMG/w+pXXKPIxXVj1yNc/Vb2hq
	ZJcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=gILqjzPjlMPDiQHWVevBoetR/IF4SvWgkkuMt1/NWag=;
	b=h3WSlql39e9ZHlZdsBcd9GCwMOdCDtkzm3hRiwGFEISFO9t8pBV+8BLD94bp8qz3tT
	EiOZ/VTTa1k+Dl8MwX1Nn5/b6J1qJ/00iIYJ1e/xxg3NgNsWsTzdVb4BmSfXTNFujgYj
	13dnFxvWUCnMAv+MF5NRj+J9GzXIB34Hla3W6VxUbeoF1uRhk1kgKSJnycQeUgNbkIX3
	mmmso1VqyBW1pgGW4DnX+BiZamr23Ihv/5SLobWw8nKoyyRQ0SwqSNXtFe0B9mwp957t
	CrfhPVYcQ8h60h3qI/5Qnbb9NAhZJYKjdNr6ZUqaNPJp5owimokTmIemwobWhY3u0e4O
	sRmg==
X-Gm-Message-State: AMCzsaXkngUd3mlBHzwWAb0WyjnCZjcvghTZtg2OroVjmFtfGa3nZ3mz
	mdmhTsYCVm1RYjCyDqQ5ABkMt9+u
X-Google-Smtp-Source: AOwi7QAKIrJ1lMgH86wNmDStR+pGYVxdb5YGChspx4htksQyDkrswe7ADdnK0JFfciS+tPGSbKZhuQ==
X-Received: by 10.200.37.157 with SMTP id e29mr18819684qte.271.1506970356794; 
	Mon, 02 Oct 2017 11:52:36 -0700 (PDT)
Received: from [192.168.1.240] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	u51sm7454523qth.67.2017.10.02.11.52.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Oct 2017 11:52:35 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Thomas Huth <thuth@redhat.com>, Richard Henderson <rth@twiddle.net>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
References: <20170922154014.29350-1-f4bug@amsat.org>
	<20170922160111.31885-11-f4bug@amsat.org>
	<f5f9272f-e425-6a09-8571-a4454977100e@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <13c0af58-7c9e-c0b5-a1c2-62e638146b34@amsat.org>
Date: Mon, 2 Oct 2017 15:52:33 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <f5f9272f-e425-6a09-8571-a4454977100e@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: Re: [Qemu-trivial] [PATCH 33/34] hw/alpha: remove old i386
 dependency
X-BeenThere: qemu-trivial@gnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.gnu.org>
List-Unsubscribe: <https://lists.gnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@gnu.org?subject=unsubscribe>
List-Archive: <http://lists.gnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@gnu.org>
List-Help: <mailto:qemu-trivial-request@gnu.org?subject=help>
List-Subscribe: <https://lists.gnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@gnu.org?subject=subscribe>
X-List-Received-Date: Mon, 02 Oct 2017 18:52:42 -0000

Hi Thomas,

On 09/25/2017 02:38 AM, Thomas Huth wrote:
> On 22.09.2017 18:01, Philippe Mathieu-Daudé wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   hw/alpha/alpha_sys.h | 2 --
>>   hw/alpha/pci.c       | 2 ++
>>   hw/alpha/typhoon.c   | 2 +-
>>   3 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/alpha/alpha_sys.h b/hw/alpha/alpha_sys.h
>> index b6d8369ed7..ac685c1c46 100644
>> --- a/hw/alpha/alpha_sys.h
>> +++ b/hw/alpha/alpha_sys.h
>> @@ -5,8 +5,6 @@
>>   
>>   #include "target/alpha/cpu-qom.h"
>>   #include "hw/pci/pci.h"
>> -#include "hw/pci/pci_host.h"
>> -#include "hw/ide.h"
>>   #include "hw/i386/pc.h"
> 
> Didn't you want to remove that pc.h line according to the patch description?

Not yet :( This include is still needed for the i8259 PIC. This change 
is done in the part 2 (following series).

That said, I should improve the patch description :)

