Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d7tSE-000842-1G
	for mharc-qemu-trivial@gnu.org; Mon, 08 May 2017 20:56:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36269)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d7tSB-00083k-12
	for qemu-trivial@nongnu.org; Mon, 08 May 2017 20:56:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d7tS7-0003FZ-VX
	for qemu-trivial@nongnu.org; Mon, 08 May 2017 20:56:39 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:35800)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d7tS7-0003Ej-Qo; Mon, 08 May 2017 20:56:35 -0400
Received: by mail-qt0-x242.google.com with SMTP id r58so11841976qtb.2;
	Mon, 08 May 2017 17:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=z5uOiawWAfedATTOYe9unFo44Qab1PCDUR0fX0Zn0Io=;
	b=Za8r+K2GEpUMgMBxgT+hkggF+Aoy+J4a9V53ahTlEoGZuTvTAG7TS+asYvA7+Moucu
	eYD3nVUZBYBDyIz1XMMLX6QqnC6GvvH/psSKB0M21LNU+ZNt9cAkwB+R8LhDqdSJxHh9
	vVeGvss1BBcHrlqImP+ywC/kr8QW6GBtkIp6TjX1Yobs2/Nc2sMp6oYuTaTNNxPYXKrB
	lIWY1j6gxXTvSjZ+rg4yjrrMdWtCT5EsrHXO8EHhow5k8qflvpJK/KIB3xBj1e89W0x5
	UfGmpNaI+4JBtEJevpJOB4nri9fZtiWgbh8uGOZRqW16U3Pp1MwqNMH5LWezs+Mi+zqF
	GUxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=z5uOiawWAfedATTOYe9unFo44Qab1PCDUR0fX0Zn0Io=;
	b=GmAV0Wf+rlcbtlD0d84qoUadFhm/pzO7dQWif8ZXlvxxEZcgJz216zJhffpxDJS1uP
	wb6G4cTUbqapZwsJ4Nt08xSJTYonbDiMnasFnbeOigd9bG2xh4CWNLY3zN/tdWfPKywO
	lbO+OdZ+f5sYHeWbTEcM+YBcrxxHjTUbjnHTUac3iIkgvZ+GV4tMU28RbS7xkyaVz00G
	eWZy4gKLxLwYnVwXiRREHTe3daafa50KugjCy8d9/k8UZeKN17O20+S+pvY/fum+uYAH
	e9oJH1pwJDX8+1kuDxqihK/VUdEGR2pjmFnVw6bw8I5heWKj93h/Iw7RGTttNYhTqu+2
	McCw==
X-Gm-Message-State: AN3rC/7GsZ/LNxo3ZlY9eXcsHnScbDbeFGwbhtjbDZNptm+eK9cqafib
	KEKk0Pg+Dnjgog==
X-Received: by 10.200.1.26 with SMTP id e26mr31364068qtg.75.1494291395208;
	Mon, 08 May 2017 17:56:35 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id c5sm2506788qkf.14.2017.05.08.17.56.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 May 2017 17:56:34 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20170508233918.9043-1-f4bug@amsat.org>
	<20170508233918.9043-4-f4bug@amsat.org>
	<2ad7eaf6-3691-f9f1-4d09-204444adbd19@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <5b9ad5c0-0bcf-2167-57ba-446d1253cdd1@amsat.org>
Date: Mon, 8 May 2017 21:56:32 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <2ad7eaf6-3691-f9f1-4d09-204444adbd19@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 03/11] hw/misc: add missing
 includes
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
X-List-Received-Date: Tue, 09 May 2017 00:56:40 -0000

On 05/08/2017 08:56 PM, Eric Blake wrote:
> On 05/08/2017 06:39 PM, Philippe Mathieu-Daudé wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  include/hw/misc/unimp.h | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/include/hw/misc/unimp.h b/include/hw/misc/unimp.h
>> index 3462d85836..353ee19abf 100644
>> --- a/include/hw/misc/unimp.h
>> +++ b/include/hw/misc/unimp.h
>> @@ -8,6 +8,9 @@
>>  #ifndef HW_MISC_UNIMP_H
>>  #define HW_MISC_UNIMP_H
>>
>> +#include "qemu/osdep.h"
>
> NACK. .h files should not include osdep.h, because the .c file that is
> using the .h file should have already done so.  This is mentioned in
> HACKING.

Ok! Indeed my .c doesn't include osdep.h, sorry for the noise.

